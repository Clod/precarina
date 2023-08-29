import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:precarina/help_pages/sleep_help_texts.dart';

class SleepHelp extends StatelessWidget {
  const SleepHelp({
    Key? key,
    required this.title,
    required this.content,
  }) : super(key: key);

  final String title;
  final String content;

/*
  var data = "## Horas recomendadas de sueño según edad  \n"
      "#  \n"
      "- 4-12 meses de vida: 12-16 hs/ dia incluyendo siestas regulares.\n"
      "- 1-2 años: 11 -14 hs / dia incluyendo siestas regulares.\n"
      "- 3-5 años: 10-13 hs/días incluyendo siestas regulares.\n"
      "- 6-12 años: 9-12 hs/día\n"
      "- 13-18 años: 8-10 hs/dia\n"
      "#  \n"
      "#  \n"
      "| Edad | Apropiado | Inapropiado |\n"
      "|------|-----------|------------------|\n"
      "| 3-5 años | 10-13 hs/día | < 10 ó > 14 hs/día |\n"
      "| 6-12 años | 9-12 hs/día |  < 9 ó > 13 hs/día |\n"
      "| 13-18 años | 8-10 hs/día | < 8 ó > 10 hs/día |  \n"
      "#  \n"
      "#  \n"
      "### Bibliografía\n"
      "- Paruthi S, Brooks LJ, D'Ambrosio C, Hall WA, Kotagal S, Lloyd RM, Malow BA, Maski K, Nichols C, Quan SF, Rosen CL, Troester MM, Wise MS. Consensus Statement of the American Academy of Sleep Medicine on the Recommended Amount of Sleep for Healthy Children: Methodology and Discussion. J Clin Sleep Med. 2016 Nov 15;12(11):1549-1561. doi: 10.5664/jcsm.6288. PMID: 27707447; PMCID: PMC5078711.\n"
      "- Galland BC, Taylor BJ, Elder DE, Herbison P. Normal sleep patterns in infants and children: a systematic review of observational studies. Sleep Med Rev. 2012 Jun;16(3):213-22. doi: 10.1016/j.smrv.2011.06.001. Epub 2011 Jul 23. PMID: 21784676.\n"
      "- Eaton DK, McKnight-Eily LR, Lowry R, Perry GS, Presley-Cantrell L, Croft JB. Prevalence of insufficient, borderline, and optimal hours of sleep among high school students - United States, 2007. J Adolesc Health. 2010 Apr;46(4):399-401. doi: 10.1016/j.jadohealth.2009.10.011. Epub 2010 Jan 3. PMID: 20307832.\n"
      "- Meltzer LJ, Williamson AA, Mindell JA. Pediatric sleep health: It matters, and so does how we define it. Sleep Med Rev. 2021 Jun;57:101425. doi: 10.1016/j.smrv.2021.101425. Epub 2021 Jan 19. PMID: 33601324; PMCID: PMC9067252\n";
*/

//  final data = "## Horas recomendadas de sueño según edad  \n#  \n- 4-12 meses de vida: 12-16 hs/ dia incluyendo siestas regulares.\n- 1-2 años: 11 -14 hs / dia incluyendo siestas regulares.\n- 3-5 años: 10-13 hs/días incluyendo siestas regulares.\n- 6-12 años: 9-12 hs/día\n- 13-18 años: 8-10 hs/dia\n#  \n#  \n| Edad | Apropiado | Inapropiado |\n|------|-----------|------------------|\n| 3-5 años | 10-13 hs/día | < 10 ó > 14 hs/día |\n| 6-12 años | 9-12 hs/día |  < 9 ó > 13 hs/día |\n| 13-18 años | 8-10 hs/día | < 8 ó > 10 hs/día |  \n#  \n#  \n### Bibliografía\n- Paruthi S, Brooks LJ, D'Ambrosio C, Hall WA, Kotagal S, Lloyd RM, Malow BA, Maski K, Nichols C, Quan SF, Rosen CL, Troester MM, Wise MS. Consensus Statement of the American Academy of Sleep Medicine on the Recommended Amount of Sleep for Healthy Children: Methodology and Discussion. J Clin Sleep Med. 2016 Nov 15;12(11):1549-1561. doi: 10.5664/jcsm.6288. PMID: 27707447; PMCID: PMC5078711.\n- Galland BC, Taylor BJ, Elder DE, Herbison P. Normal sleep patterns in infants and children: a systematic review of observational studies. Sleep Med Rev. 2012 Jun;16(3):213-22. doi: 10.1016/j.smrv.2011.06.001. Epub 2011 Jul 23. PMID: 21784676.\n- Eaton DK, McKnight-Eily LR, Lowry R, Perry GS, Presley-Cantrell L, Croft JB. Prevalence of insufficient, borderline, and optimal hours of sleep among high school students - United States, 2007. J Adolesc Health. 2010 Apr;46(4):399-401. doi: 10.1016/j.jadohealth.2009.10.011. Epub 2010 Jan 3. PMID: 20307832.\n- Meltzer LJ, Williamson AA, Mindell JA. Pediatric sleep health: It matters, and so does how we define it. Sleep Med Rev. 2021 Jun;57:101425. doi: 10.1016/j.smrv.2021.101425. Epub 2021 Jan 19. PMID: 33601324; PMCID: PMC9067252\n";

  @override
  Widget build(BuildContext context) {

    final locale = Localizations.localeOf(context);

    final localizedValues = <String, Map<String, String>>{
      'en': {
        'title': englishText,
      },
      'es': {
        'title': spanishText,
      },
    };

    return Scaffold(
      appBar: AppBar(
        title: Text(
          title,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: HtmlWidget(localizedValues[locale.languageCode]!['title']!
              //htmlData,
              //"txtCholesterolHelp".i18n(),
            ),
          ),
        ),
      ),
    );
  }
}
