import re
import os

def check_xcode_build_setting(project_pbxproj_path, target_name, config_names, setting_key, expected_value):
    """
    Checks if a specific build setting has the expected value for given configurations
    of a target in an Xcode project.pbxproj file.

    Args:
        project_pbxproj_path (str): The full path to the project.pbxproj file.
        target_name (str): The name of the Xcode target (e.g., "Runner").
        config_names (list): A list of configuration names to check (e.g., ["Release", "Profile"]).
        setting_key (str): The build setting key to check (e.g., "STRIP_STYLE").
        expected_value (str): The expected value for the build setting (e.g., '"non-global"').

    Returns:
        bool: True if all specified settings are correct, False otherwise.
    """
    if not os.path.exists(project_pbxproj_path):
        print(f"Error: File not found at {project_pbxproj_path}")
        return False

    with open(project_pbxproj_path, 'r') as f:
        content = f.read()

    all_settings_correct = True

    # 1. Find the PBXNativeTarget for the given target_name
    # This regex captures the object ID of the target and its buildConfigurationList ID.
    # This is a more robust regex that doesn't depend on the order of keys within the target block.
    target_pattern = re.compile(
        rf'(\w+) /\* {target_name} \*/ = {{\s*isa = PBXNativeTarget;.*?buildConfigurationList = (\w+) /\* Build configuration list for PBXNativeTarget "{target_name}" \*/;.*?name = {target_name};.*?}};',
        re.DOTALL
    )
    target_match = target_pattern.search(content)

    if not target_match:
        print(f"Error: Could not find PBXNativeTarget for '{target_name}'.")
        return False

    config_list_id = target_match.group(2)

    # 2. Find the XCConfigurationList object using config_list_id
    # This regex captures the content of the buildConfigurations array.
    config_list_pattern = re.compile(
        rf'{config_list_id} /\* Build configuration list for PBXNativeTarget "{target_name}" \*/ = {{\s*isa = XCConfigurationList;.*?buildConfigurations = \((.*?)\);',
        re.DOTALL
    )
    config_list_match = config_list_pattern.search(content)

    if not config_list_match:
        print(f"Error: Could not find XCConfigurationList for target '{target_name}' (ID: {config_list_id}).")
        return False

    build_configs_str = config_list_match.group(1)
    # Extract individual configuration IDs and names from the list
    config_entry_pattern = re.compile(r'(\w+) /\* (.*?) \*/')
    found_configs = config_entry_pattern.findall(build_configs_str)

    config_ids_to_check = {}
    for config_id, name in found_configs:
        if name in config_names:
            config_ids_to_check[config_id] = name

    if not config_ids_to_check:
        print(f"Error: No matching build configurations ({', '.join(config_names)}) found for target '{target_name}'.")
        return False

    # 3. For each relevant configuration, find its block and check the setting
    for config_id, current_config_name in config_ids_to_check.items():
        # Regex to find the specific XCBuildConfiguration block and capture its buildSettings.
        config_block_pattern = re.compile(
            # This non-greedy regex isolates the buildSettings block, regardless of its position inside the configuration block.
            rf"{config_id} /\* {current_config_name} \*/ = {{\s*isa = XCBuildConfiguration;.*?buildSettings = {{(.*?)}};", re.DOTALL
        )
        config_block_match = config_block_pattern.search(content)

        if config_block_match:
            build_settings_content = config_block_match.group(1)
            expected_line = f'{setting_key} = {expected_value};'
            # Search for the exact line within the buildSettings block
            if expected_line in build_settings_content:
                print(f"✅ '{setting_key}' is correctly set to {expected_value} for target '{target_name}' configuration '{current_config_name}'.")
            else:
                print(f"❌ '{setting_key}' is NOT set to {expected_value} for target '{target_name}' configuration '{current_config_name}'.")
                all_settings_correct = False
        else:
            print(f"⚠️ Could not find build configuration block for target '{target_name}' configuration '{current_config_name}' (ID: {config_id}).")
            all_settings_correct = False

    return all_settings_correct

if __name__ == "__main__":
    # Assuming the script is run from the Flutter project root
    project_root = os.getcwd()
    pbxproj_path = os.path.join(project_root, 'ios', 'Runner.xcodeproj', 'project.pbxproj')

    target_to_check = "Runner"
    # User mentioned ad-hoc releases, which typically map to the 'Profile' configuration.
    # 'Release' is also crucial for App Store submissions.
    configurations_to_check = ["Debug", "Release", "Profile"]
    setting_key_to_check = "STRIP_STYLE"
    expected_setting_value = '"non-global"' # Note the quotes around "non-global" as it appears in the pbxproj

    print(f"Checking '{setting_key_to_check}' in {pbxproj_path} for target '{target_to_check}' configurations {configurations_to_check}...")
    if check_xcode_build_setting(pbxproj_path, target_to_check, configurations_to_check, setting_key_to_check, expected_setting_value):
        print(f"\nAll required '{setting_key_to_check}' settings are correct.")
    else:
        print(f"\nSome '{setting_key_to_check}' settings are incorrect or missing. Please check Xcode.")
        # You can uncomment the line below to make your CI/CD pipeline fail if the setting is incorrect.
        # import sys
        # sys.exit(1)
