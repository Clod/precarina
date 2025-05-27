// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Spanish Castilian (`es`).
class AppLocalizationsEs extends AppLocalizations {
  AppLocalizationsEs([String locale = 'es']) : super(locale);

  @override
  String get txtReadCarefully =>
      'Por favor, lea cuidadosamente antes de usar esta aplicación';

  @override
  String get txtAppPurpose =>
      'Esta aplicación calcula el puntaje estimado de salud cardiovascular según lo definido por la';

  @override
  String get txtFundamentalsLocation =>
      'El sistema de puntuación y los criterios se explican detalladamente en:';

  @override
  String get txtLifeEssentialEightObjective =>
      'Life\'s Essential 8: Actualización y Mejora del Constructo de Salud Cardiovascular de la Asociación Americana del Corazón: Un Aviso Presidencial de la Asociación Americana del Corazón';

  @override
  String get txtPaperAuthors =>
      'Publicado por: Donald M. Lloyd-Jones, MD, ScM, FAHA, presidente; Norrina B. Allen, PhD, MPH, FAHA; Cheryl A.M. Anderson, PhD, MPH, MS, FAHA; Terrie Black, DNP, MBA, CRRN, FAHA; LaPrincess C. Brewer, MD, MPH; Randi E. Foraker, PhD, MA, FAHA; Michael A. Grandner, PhD, MTR, FAHA; Helen Lavretsky, MD, MS; Amanda Marma Perak, MD, MS, FAHA; Garima Sharma, MD; Wayne Rosamond, PhD, MS, FAHA; en representación de la Asociación Americana del Corazón';

  @override
  String get txtFundamentalsLocationMainWindow =>
      'Click aquí para leer los fundamentos';

  @override
  String get txtButtonAcceptTandC => 'Aceptar';

  @override
  String get txtButtonRejectTandC => 'Salir';

  @override
  String get txtButtonWarnings => 'Aceptar';

  @override
  String get txtButtonAccept => 'Aceptar';

  @override
  String get txtButtonCancel => 'Cancelar';

  @override
  String get txtCancelModalTitle => 'Se perderán los cambios';

  @override
  String get txtCancelModalText => '¿Desea descartarlos?';

  @override
  String get txtCancelModalDiscard => 'Descartar';

  @override
  String get txtCancelModalVolver => 'Volver';

  @override
  String get txtDietButton => 'Dieta';

  @override
  String get txtDietDialog =>
      'Cuantiles de adherencia al estilo de dieta DASH (MEPA). Edades 2-19 a.';

  @override
  String get txtDietDialogOptions =>
      '9-10 puntos MEPA |7-8 puntos MEPA |5-6 puntos MEPA |3-4 puntos MEPA |0-2 puntos MEPA ';

  @override
  String get txtDietHelp =>
      '**Cuantiles de adherencia a la dieta estilo DASH (MEPA)** se refiere a un método de análisis estadístico utilizado para evaluar la adherencia a la dieta estilo DASH (DASH: Enfoques Dietéticos para Detener la Hipertensión del Inglés Dietary Approaches to Stop Hypertension), que es un patrón dietético que enfatiza el consumo de frutas, verduras, cereales integrales, proteínas magras y productos lácteos bajos en grasas, mientras se limita la ingesta de sodio, azúcares añadidos y grasas saturadas. \n\n**MEPA** es el Patrón de Alimentación Mediterránea para los Estadounidenses (Mediterranean Eating Pattern for Americans). \n\nLos *cuantiles* se refieren a dividir un conjunto de datos en partes o intervalos iguales, basados en la distribución de una variable particular (en este caso, la adherencia a la dieta estilo DASH), para analizar los datos y comparar diferentes grupos de individuos. El uso de cuantiles en este contexto permite la identificación de niveles específicos de adherencia a la dieta estilo DASH.';

  @override
  String get txtDietWarning => '';

  @override
  String get txtPhysicalActivityButton => 'Actividad Física';

  @override
  String get txtPhysicalActivityDialog =>
      'Minutos semanales de actividad física moderada o intensa. Edades: 6 a 9';

  @override
  String get txtPhysicalActivityDialogOptions =>
      '≥ 420 minutos|360 - 419 minutos|300 - 359 minutos|240 - 299 minutos|120 - 239 minutos|1 - 119 minutos|Sin actividad';

  @override
  String get txtPhysicalActivityHelp => '';

  @override
  String get txtBodyMassIndexButton => 'IMC';

  @override
  String get txtBodyMassIndexDialog =>
      'Percentiles de IMC por edad y sexo, desde la infancia.';

  @override
  String get txtBodyMassIndexDialogOptions =>
      '5to - < percentil 85|85 - < percentil 95|percentil 95 - < 120% del percentil 95|120% del percentil 95 - < 140% del percentil 95|≥ 140% del percentil 95';

  @override
  String get txtBodyMassIndextHelp =>
      '**IMC** significa Índice de Masa Corporal, que es una medida de la grasa corporal basada en la altura y el peso de un individuo. Se calcula dividiendo el peso de un individuo en kilogramos por su altura en metros al cuadrado *(IMC = kg/m²)*. \n\n Es importante tener en cuenta que el BMI no es una medida directa de la grasa corporal y no tiene en cuenta factores como la masa muscular o la composición corporal. Por lo tanto, puede no reflejar con precisión el estado de salud de personas con alta masa muscular, como atletas, o aquellas con baja masa muscular, como adultos mayores. Sin embargo, para la mayoría de las personas, el BMI es una herramienta útil para evaluar su estado de peso y los posibles riesgos de salud asociados con el sobrepeso u obesidad.';

  @override
  String get txtBodyMassIndexWarning => '';

  @override
  String get txtSleepButton => 'Sueño';

  @override
  String get txtSleepDialog =>
      'Horas promedio de sueño por noche (o por 24 h para edad ≤ 5)';

  @override
  String get txtSleepDialogOptions =>
      'Rango óptimo apropiado para la edad|< 1h por encima del rango óptimo|< 1h por debajo del rango óptimo|1 - < 2h por debajo o ≥1h por encima del rango óptimo|2 - < 3h por debajo del rango óptimo|≥ 3h por debajo del rango óptimo';

  @override
  String get txtSleepWarning => '';

  @override
  String get txtSmokeExposureButton => 'Exposición al humo';

  @override
  String get txtSmokeExposureDialog =>
      'Uso de tabaco combustible o uso de NDS inhalado a cualquier edad (a discreción del médico); o exposición al humo pasiva.';

  @override
  String get txtSmokeExposureDialogOptions =>
      'Nunca lo ha probado |Nunca lo ha probado, pero vive con un fumador en casa |Ha probado algún producto con nicotina, pero hace más de 30 días|Ha probado algún producto con nicotina, pero hace más de 30 días y vive con un fumador en casa |Actualmente usa NDS inhalado |Actualmente usa NDS inhalado y vive con un fumador en casa |Uso actual de tabaco combustible (cualquier tipo en los últimos 30 días)';

  @override
  String get txtSmokeExposureHelp =>
      '**NDS (del Inglés: nicotine-delivery system)** significa sistema de suministro de nicotina, que es un término utilizado para describir cualquier dispositivo o producto que suministra nicotina al cuerpo, incluyendo cigarrillos, cigarrillos electrónicos, dispositivos de vapeo y otros productos de tabaco.';

  @override
  String get txtSmokeExposureWarning => '';

  @override
  String get txtDiabetesButton => 'Diabetes';

  @override
  String get txtDiabetesDialog =>
      'Detección basada en síntomas de FBG (mg/dL) o HbA1c (%) a cualquier edad, o detección basada en riesgo a partir de los 10 años de edad o el inicio de la pubertad a discreción del clínico';

  @override
  String get txtDiabetesDialogOptions =>
      'Sin antecedentes de diabetes y FBG<100 (o HbA1c < 5.7) |Sin diabetes y FBG 100 - 125 (o HbA1c 5.7 - 6.4) (prediabetes) |Diabetes con HbA1c < 7.0 |Diabetes con HbA1c 7.0 - 7.9 |Diabetes con HbA1c 8.0 - 8.9 |Diabetes con HbA1c 9.0 - 9.9 |Diabetes con HbA1c ≥ 10';

  @override
  String get txtDiabetesHelp =>
      '**FBG (del Ingés Fasting Blood Glucose)** significa Glucemia en ayunas. Esta es una prueba que mide el nivel de glucosa en la sangre después de ayunar por un cierto período de tiempo. \n\n**HbA1c** significa Hemoglobina Glucosilada y es una prueba de sangre que mide los niveles promedio de glucosa en la sangre durante los últimos 2-3 meses. La hemoglobina es una proteína en los glóbulos rojos que transporta oxígeno por todo el cuerpo. Cuando la glucosa en la sangre se une a la hemoglobina, el resultado es hemoglobina glucosilada o HbA1c.\"';

  @override
  String get txtDiabetesWarning => '';

  @override
  String get txtBloodPressureButton => 'Presión arterial';

  @override
  String get txtBloodPressureDialog =>
      'Percentilos de presión arterial (PA) sistólica y diastólica (mmHg) para la edad, sexo y talla hasta los 16 añOs. Para edad mayor de 16 años usar las tablas de adultos.';

  @override
  String get txtBloodPressureDialogOptions =>
      'ÓPTIMO (menor a percentilo 90 o para adolescentes mayores de 16 años PA sistólica < 130 mmHg y diastólica < 85 mmHg) |ÓPTIMO (menor a percentilo 90 o para adolescentes mayores de 16 años PA sistólica < 130 mmHg y diastólica < 85 mmHg) (BAJO TRATAMIENTO HIPERTENSIVO) |ELEVADO o PREHIPERTENSIÓN (PA sistólica y/o diastólica ≥PC90 y < P95 para edad, sexo y talla ó para adolescentes mayores de 16 años PA sistólica entre 130-139 mmHg y/o diastólica entre 85-89 mmHg) |ELEVADO o PREHIPERTENSIÓN (PA sistólica y/o diastólica ≥PC90 y < P95 para edad, sexo y talla ó para adolescentes mayores de 16 años PA sistólica entre 130-139 mmHg y/o diastólica entre 85-89 mmHg) (BAJO TRATAMIENTO HIPERTENSIVO) |HIPERTENSIÓN ESTADIO 1 (PA sistólica y/o diastólica ≥ PC 95 y < PC 95 + 12mmHg para edad, sexo y talla ó para adolescentes mayores de 16 años PA sistólica entre 140-159 mmHg y/o diastólica entre 90-99 mmHg) |HIPERTENSIÓN ESTADIO 1 (PA sistólica y/o diastólica ≥ PC 95 y < PC 95 + 12mmHg para edad, sexo y talla ó para adolescentes mayores de 16 años PA sistólica entre 140-159 mmHg y/o diastólica entre 90-99 mmHg) (BAJO TRATAMIENTO HIPERTENSIVO) |HIPERTENSIÓN ESTADIO 2 (≥ PC 95 + 12 mmHg para edad, sexo y talla ó para adolescentes mayores de 16 años PA sistólica entre 160-179 mmHg y/o diastólica entre 100-109 mmHg) |HIPERTENSIÓN ESTADIO 2 (≥ PC 95 + 12 mmHg para edad, sexo y talla ó para adolescentes mayores de 16 años PA sistólica entre 160-179 mmHg y/o diastólica entre 100-109 mmHg) (BAJO TRATAMIENTO HIPERTENSIVO) |Para adolescentes mayores de 16 años PA sistólica ≥ 180 y/o diastólica ≥ 110 mmHg.';

  @override
  String get txtBloodPressureHelp =>
      'Las variables se basan en las guías de Interpretación y uso de las nuevas tablas de referencia de presión arterial para niños, niñas y adolescentes del PROGRAMA NACIONAL DE SALUD ESCOLAR (PROSANE) Ministerio de Salud de la Nación Argentina (Enero 2020), en el Consenso de prevención cardiovascular en la infancia y la adolescencia conjunto de la Sociedad Argentina de Cardiología y de la Sociedad Argentina de Pediatría y en el consenso de Hipertensión arterial conjunto de la Sociedad Argentina de Cardiología, la Federación Argentina de Cardiología y Sociedad Argentina de Hipertensión Arterial\n\nLos puntajes para cada variable se realizaron manteniendo la opinión de expertos de AHA en el articulo Life’s Essential 8: Updating and Enhancing the American Heart Association’s Construct Cardiovascular Health: A Presidential Advisory From the American Heart Association';

  @override
  String get txtBloodPressureWarning =>
      '<p><h3 style=\"text-align:center;\">TÉCNICA CORRECTA DE MEDICIÓN DE LA PRESIÓN ARTERIAL EN PEDIATRÍA</h3></p><p>Con el paciente en reposo y tranquilo se debe realizar la medición con un brazalete adecuado al tamaño del niño, con una vejiga inflable del brazalete que cubra los 2/3 del diámetro del brazo y los 2/3 del largo. Se deben realizar 3 tomas y promediarlas. En caso de registrar valores mayores de percentilo 90 se deben confirmar los registros con técnica auscultatoria.</p><p><span style=\"color:red\">Para el correcto uso de la app en caso de tener registros mayores de percentilo 90 los valores a ingresar deben ser 3 promedios realizados en consultas diferentes, con 3 tomas por consulta.</span></p>';

  @override
  String get txtCholesterolButton => 'Colesterol';

  @override
  String get txtCholesterolDialog =>
      'Colesterol no-HDL (mg/dL), iniciando a más tardar a los 9-11 años y antes, a discreción del médico.';

  @override
  String get txtCholesterolDialogOptions =>
      '<100 |<100 (medicado) |100 - 119 |120 - 144 |145 - 189 |≥ 190';

  @override
  String get txtCholesterolWarning => '';

  @override
  String get txtCholesterolHelp => '';

  @override
  String get txtLongPressGauge =>
      'Mantén presionado el indicador para resetear todos los valores';

  @override
  String get txtGlossary => 'Glosario';

  @override
  String get txtAbout =>
      'Esta app ha sido desarrollada a partir del conocimiento científico y médico de un equipo de pediatras del Hospital de Niños Dr. Ricardo Gutiérrez de la ciudad de Buenos Aires, integrado por:<br/><strong>Ángela Sardella</strong> - Médica Pediatra y Cardióloga Pediatra. <br/><strong>Marina Vaccari</strong> - Médica Pediatra y Cardióloga Infantil certificada en hipertensión arterial. <br/><strong>Maria Sol Elorriaga</strong> - Médica Pediatra, Cardióloga infantil y Deportóloga., <br/><strong>Miriam Tonietti</strong> - Médica Pediatra especialista en Nutrición y Diabetes.</strong> <br/><strong>Patricia Palenque</strong> - Licenciada en Nutrición y Docente adscripta de la U.B.A.<br/><strong>Claudio Morós</strong> - Médico Cirujano y Cardiólogo de Cardiopatía Congénita.<br/><strong>Bárbara Wagmaister</strong> - Médica Pediatra y Cardióloga.<span style=\"color:red\"><p>Sugerimos que esta app sea considerada principalmente como una herramienta para evaluar y promover un estilo de vida saludable para la práctica clínica pediátrica y especialmente las edades más jóvenes. \n La puntuación formal es opcional y los médicos deben enfatizar los conceptos y el bienestar de por vida y no el puntaje específico, dada la escasez de datos para respaldar un marco de puntuación.<br></br>La salud cardiovascular debe valorarse desde la infancia. Numerosos estudios han demostrado que existen alteraciones en edades pediátricas y se asocia con ECV subclínica en la mediana edad.</p></span><br></br> <p>Los resultados de salud a corto y mediano plazo (incluido el seguimiento de las métricas en adolescencia y edad adulta) son lo suficientemente sólidos como para que la dieta, la actividad física (tiempo de pantalla y jugar), el sueño, la exposición al humo de segunda mano, el peso corporal y la presión arterial, sean objeto de atención y consejo  en visitas rutinarias de niño sano.</p>';

  @override
  String get txtVegetalesVerdes => 'Vegetales verdes';

  @override
  String get txtVegetalesRojosNaranjas => 'Vegetales rojos o naranjas';

  @override
  String get txtLegumbres => 'Legumbres';

  @override
  String get txtTuberculosPapaBatataMandioca =>
      'Tubérculos (papa, batata, mandioca)';

  @override
  String get txtOtrosVegetales => 'Otros vegetales';

  @override
  String get txtFrutas => 'Frutas';

  @override
  String get txtPan => 'Pan';

  @override
  String get txtPastasYMasaIntegrales =>
      'Pastas y masas integrales: masa: pizza, tarta, empanada, canelon, masa de taco.';

  @override
  String get txtPastasYMasaRefinadasNoIntegrales =>
      'Pastas y masas refinadas (No integrales)';

  @override
  String get txtLacteosLecheYogurParcialmenteDescremados =>
      'Lácteos (leche, yogur) parcialmente descremados';

  @override
  String get txtQuesosSemidescremadosUntablesOSemiSolidos =>
      'Quesos semidescremados untables o semisólidos (port salut, muzzarella)';

  @override
  String get txtCarnesRojasAveYHuevoPorDia =>
      'Carnes rojas, ave y huevo por día';

  @override
  String get txtPescados => 'Pescados';

  @override
  String get txtFrutosSecosYSemillas => 'Frutos secos y semillas';

  @override
  String get txtAceites => 'Aceites';

  @override
  String get txtOnePlatePerWeek => '1 pl por sem';

  @override
  String get txtHalfPlatePerWeek => '1/2 pl por sem';

  @override
  String get txtLessThanHalfPlatePerWeek => 'MENOS DE 1/2 pl por sem';

  @override
  String get txtThreePlatesPerWeekOrOneSmallUnitDaily =>
      '3 pls por sem o 1 unid pqña por día';

  @override
  String get txtLessThanOnePlatePerWeek => 'MENOS DE 1 pl por sem';

  @override
  String get txtHalfPlatePerWeekOrTwoSmallMedallionsPerWeek =>
      '1/2 pl por sem o 2 medallones pqños por sem';

  @override
  String get txtQuarterPlatePerWeekOrOneSmallMedallionPerWeek =>
      '1/4 pl por sem o 1 medallón pqño por sem';

  @override
  String get txtLessThanQuarterPlatePerWeekOrLessThanOneSmallMedallionPerWeek =>
      'MENOS DE 1/4 pl por sem o MENOS DE 1 medallón pqño por sem';

  @override
  String get txtHalfSmallUnitDailyOrQuarterPlateDailyOrThreeSmallUnitsPerWeek =>
      '1/2 unid pqña por día o 1/4 pl por día o 3 unids pqñas por sem';

  @override
  String get txtOneSmallUnitDailyOrHalfPlateDailyOrThreeMediumUnitsPerWeek =>
      '1 unid pqña por día o 1/2 pl por día o 3 unids med por sem';

  @override
  String get txtMoreThanOneSmallUnitDailyOrMoreThanHalfPlateDailyOrMoreThanThreeMediumUnitsPerWeek =>
      'MÁS DE 1 unid pqña por día o MÁS DE 1/2 pl por día o MÁS DE 3 unids med por sem';

  @override
  String
      get txtThreeMediumUnitsPerWeekOrOneThirdRawPlateDailyOrOneFourthCookedPlateDaily =>
          '3 unids med por sem o 1/3 pl crudo por día o 1/4 pl cocido por día';

  @override
  String
      get txtOneMediumUnitPerWeekOrOneFourthRawPlateDailyOrOneFourthCookedPlateFourTimesPerWeek =>
          '1 unid med por sem o 1/4 pl crudo por día o 1/4 pl cocido 4 veces/sem';

  @override
  String get txtLessThanOneMediumUnitPerWeekOrLessThanOneFourthRawPlateDailyOrLessThanOneFourthCookedPlateFourTimesPerWeek =>
      'MENOS DE 1 unid med por sem o MENOS DE 1/4 pl crudo por día o MENOS DE 1/4 pl cocido 4 veces/sem';

  @override
  String get txtOneMediumUnitDailyOrTwoSmallUnitsDaily =>
      '1 unid med por día o 2 unids pqñas por día';

  @override
  String get txtOneSmallUnitDaily => '1 unid pqña por día';

  @override
  String get txtLessThanOneSmallUnitDaily => 'MENOS DE 1 unid pqña por día';

  @override
  String get txtOneSliceOfBreadOrOneSmallMignonOrThreeWaterCrackers =>
      '1 rebanada de pan o 1 mignon pqño o 3 galletas de agua';

  @override
  String get txtTwoSlicesOfSandBreadOrTwoSmallMignonsOrSixWaterCrackers =>
      '2 rebanadas de pan de sándwich o 2 mignons pqños o 6 galletas de agua';

  @override
  String get txtMoreThanTwoSlicesOfSandBreadOrMoreThanTwoSmallMignonsOrMoreThanSixWaterCrackers =>
      'MÁS DE 2 rebanadas de pan de sándwich o MÁS DE 2 mignons pqños o MÁS DE 6 galletas de agua';

  @override
  String get txtQuarterPlateDailyOrOneServingOfDoughDaily =>
      '1/4 pl por día o 1 porción de masa por día';

  @override
  String get txtHalfPlateDailyOrTwoServingsOfDoughDaily =>
      '1/2 pl por día o 2 porciones de masa por día';

  @override
  String get txtMoreThanHalfPlateDailyOrMoreThanTwoServingsOfDoughDaily =>
      'MÁS DE 1/2 pl por día o MÁS DE 2 porciones de masa por día';

  @override
  String get txtHalfPlatePerDayOrTwoServingsOfDough =>
      '1/2 pl por día o 2 porciones de masa';

  @override
  String get txtMoreThanHalfPlatePerDayOrMoreThanTwoServingsOfDoughPerDay =>
      'MÁS DE 1/2 pl por día o MÁS DE 2 porciones de masa por día';

  @override
  String get txtThreeQuartersCupBreakfastTypeDailyOrTwoCupsTeaTypeDaily =>
      '3/4 taza tipo desayuno por día o 2 tazas tipo té por día';

  @override
  String get txtHalfCupBreakfastTypeDailyOrOneCupTeaTypeDaily =>
      '1/2 taza tipo desayuno por día o 1 taza tipo té por día';

  @override
  String get txtLessThanHalfCupBreakfastTypeDailyOrLessThanOneCupTeaTypeDaily =>
      'MENOS DE 1/2 taza tipo desayuno por día o MENOS DE 1 taza tipo té por día';

  @override
  String get txtOneServingTheSizeOfSmallMatchboxOrSizeOfHalfSUBECardOrTwoTableSpoons =>
      '1 porción del tamaño de una caja de fósforos pqña o el tamaño de 1/2 tarjeta SUBE o 2 cdas soperas';

  @override
  String get txtHalfServingTheSizeOfSmallMatchboxOrOneDieOrOneTableSpoon =>
      '1/2 porción del tamaño de una caja de fósforos pqña o 1 dado o 1 cda sopera';

  @override
  String get txtLessThanHalfServingTheSizeOfSmallMatchboxOrLessThanOneDieOrLessThanOneTableSpoon =>
      'MENOS DE 1/2 porción del tamaño de una caja de fósforos pqña o MENOS DE 1 dado o MENOS DE 1 cda sopera';

  @override
  String
      get txtHalfMediumSteakPerDayOrOneAndHalfEggsDailyOrOneMediumMincedMeat =>
          '1/2 bife med por día o 1 y 1/2 huevos por día o 1 carne picada med';

  @override
  String get txtOneMediumSteakDailyOrUpToTwoEggUnitsDailyOrOneServingTheSizeOfSliceOfVealPlusOneEggDaily =>
      '1 bife med por día o hasta 2 unids de huevo por día o 1 porción del tamaño de una rodaja de ternera + 1 huevo por día';

  @override
  String get txtMoreThanOneMediumSteakDailyOrMoreThanTwoEggUnitsDailyOrMoreThanOneServingTheSizeOfSliceOfVealPlusOneEggDaily =>
      'MÁS DE 1 bife med por día o MÁS DE 2 unids de huevo por día o MÁS DE 1 porción del tamaño de una rodaja de ternera + 1 huevo por día';

  @override
  String get txtOneMediumServingPerWeekOrOneCanPerWeek =>
      '1 porción med por sem o 1 lata por sem';

  @override
  String get txtOneSmallServingPerWeekOrHalfCanPerWeek =>
      '1 porción pqña por sem o 1/2 lata por sem';

  @override
  String get txtLessThanOneSmallServingPerWeekOrLessThanHalfCanPerWeek =>
      'MENOS DE 1 porción pqña por sem o MENOS DE 1/2 lata por sem';

  @override
  String get txtFourWalnutHalvesOrEightAlmondsOrOneTableSpoonOfSeedsOrPeanutsDaily =>
      '4 mitades de nuez o 8 almendras o 1 cda sopera de semillas o cacahuetes por día';

  @override
  String get txtTwoWalnutHalvesOrFourAlmondsOrOneTeaspoonOfSeedsOrPeanutsDaily =>
      '2 mitades de nuez o 4 almendras o 1 cdta de semillas o cacahuetes por día';

  @override
  String get txtLessThanTwoWalnutHalvesOrLessThanFourAlmondsOrLessThanOneTeaspoonOfSeedsOrPeanutsDaily =>
      'MENOS DE 2 mitades de nuez o MENOS DE 4 almendras o MENOS DE 1 cdta de semillas o cacahuetes por día';

  @override
  String get txtTwoTableSpoonsDessertTypeDaily =>
      '2 cdas soperas tipo postre por día';

  @override
  String get txtOneTableSpoonDessertTypeDaily =>
      '1 cda sopera tipo postre por día';

  @override
  String get txtLessThanOneTableSpoonDessertTypeDaily =>
      'MENOS DE 1 cda sopera tipo postre por día';

  @override
  String get txtOneAndHalfPlatePerWeek => '1 y 1/2 pl por sem';

  @override
  String get txtFourPlatesPerWeek => '4 pls por sem';

  @override
  String get txtTwoPlatesPerWeek => '2 pls por sem';

  @override
  String get txtLessThanTwoPlatesPerWeek => 'MENOS DE 2 pls por sem';

  @override
  String get txtOnePlatePerWeekOrHalfPlatePlusOneMedallionPerWeek =>
      '1 pl por sem o 1/2 pl + 1 medallón por sem';

  @override
  String get txtHalfPlatePerWeekOrQuarterPlatePlusOneMedallionPerWeek =>
      '1/2 pl por sem o 1/4 pl + 1 medallón por sem';

  @override
  String get txtLessThanHalfPlatePerWeekOrQuarterPlatePlusOneMedallionPerWeek =>
      'MENOS DE 1/2 pl por sem o 1/4 pl + 1 medallón por sem';

  @override
  String get txtOneThirdPlateDailyOrUpToThreeMediumUnitsPerWeek =>
      '1/3 pl por día o hasta 3 unids med por sem';

  @override
  String get txtHalfPlateOrUpToFiveSmallUnitsPerWeek =>
      '1/2 pl o hasta 5 unids pqñas por sem';

  @override
  String get txtMoreThanHalfPlateOrMoreThanFiveSmallUnitsPerWeek =>
      'MÁS DE 1/2 pl o MÁS DE 5 unids pqñas por sem';

  @override
  String
      get txtFourMediumUnitsPerWeekOrHalfRawPlateDailyOrQuarterCookedPlateDaily =>
          '4 unids med por sem o 1/2 pl crudo por día o 1/4 pl cocido por día';

  @override
  String get txtTwoMediumUnitsPerWeekOrQuarterPlateDaily =>
      '2 unids med por sem o 1/4 pl por día';

  @override
  String get txtLessThanTwoMediumUnitsPerWeekOrQuarterPlateDaily =>
      'MENOS DE 2 unids med por sem o 1/4 pl por día';

  @override
  String get txtOneAndHalfLargeUnitPerDayOrTwoMediumUnitsPerDay =>
      '1 y 1/2 unid grande por día o 2 unids med por día';

  @override
  String get txtOneMediumUnitPerDay => '1 unid med por día';

  @override
  String get txtLessThanOneMediumUnitPerDay => 'MENOS DE 1 unid med por día';

  @override
  String get txtUpToTwoSlicesOfBreadPerDayOrTwoSmallMignonsOrSixWaterBiscuits =>
      'hasta 2 rebanadas de pan por día o 2 mignons pqños o 6 galletas de agua';

  @override
  String
      get txtThreeSlicesOfBreadPerDayOrThreeSmallMignonsOrNineWaterBiscuits =>
          '3 rebanadas de pan por día o 3 mignons pqños o 9 galletas de agua';

  @override
  String get txtMoreThanThreeSlicesOfBreadPerDayOrMoreThanThreeSmallMignonsOrMoreThanNineWaterBiscuits =>
      'MÁS DE 3 rebanadas de pan por día o MÁS DE 3 mignons pqños o MÁS DE 9 galletas de agua';

  @override
  String get txtQuarterPlateOfWholeWheatPastaPerDayOrOnePortionOfDough =>
      '1/4 pl de pasta integral por día o 1 porción de masa';

  @override
  String get txtHalfPlatePerDayOrTwoPortionsOfDough =>
      '1/2 pl por día o 2 porciones de masa';

  @override
  String get txtMoreThanHalfPlatePerDayOrTwoPortionsOfDough =>
      'MÁS DE 1/2 pl por día o 2 porciones de masa';

  @override
  String get txtMoreThanHalfPlatePerDayOrMoreThanTwoPortionsOfDoughPerDay =>
      'MÁS DE 1/2 pl por día o MÁS DE 2 porciones de masa por día';

  @override
  String get txtTwoTeacups => '2 tazas de té';

  @override
  String get txtOneTeacupDaily => '1 taza de té por día';

  @override
  String get txtLessThanOneTeacupDaily => 'MENOS DE 1 taza de té por día';

  @override
  String get txtOnePortionTheSizeOfSmallMatchboxOrHalfTheSizeOfSUBECardOrTwoTableSpoonsDaily =>
      '1 porción del tamaño de una caja de fósforos pqña o la mitad del tamaño de una tarjeta SUBE o 2 cdas soperas por día';

  @override
  String get txtOnePortionTheSizeOfDiceOrOneTableSpoonDaily =>
      '1 porción, del tamaño de un dado o 1 cda sopera por día';

  @override
  String get txtLessThanOnePortionTheSizeOfSmallMatchboxOrLessThanOneDieOrLessThanOneTableSpoon =>
      'MENOS DE 1 porción del tamaño de una caja de fósforos pqña o MENOS DE 1 dado o MENOS DE 1 cda sopera';

  @override
  String get txtOneSmallPortionWithoutWasteDailyOrUpToTwoEggUnitsDailyOrOnePortionTheSizeOfSliceOfVealPlusOneEggDaily =>
      '1 porción pqña sin desperdicio por día o hasta 2 unids de huevo por día o 1 porción del tamaño de una rodaja de ternera + 1 huevo por día';

  @override
  String get txtTwoSmallPortionsWithoutWasteDailyOrUpToFourEggUnitsDailyOrOneSmallPortionPlusTwoEggUnits =>
      '2 porciones pqñas sin desperdicio por día o hasta 4 unids de huevo por día o 1 porción pqña + 2 unids de huevo';

  @override
  String get txtMoreThanTwoSmallPortionsWithoutWasteDailyOrMoreThanFourEggUnitsDailyOrMoreThanOneSmallPortionPlusTwoEggUnits =>
      'MÁS DE 2 porciones pqñas sin desperdicio por día o MÁS DE 4 unids de huevo por día o MÁS DE 1 porción pqña + 2 unids de huevo';

  @override
  String get txtTwoMediumPortionsOrTwoCansPerWeek =>
      '2 porciones med o 2 latas por sem';

  @override
  String get txtOneMediumPortionOrOneCanPerWeek =>
      '1 porción med o 1 lata por sem';

  @override
  String get txtLessThanOneMediumPortionOrLessThanOneCanPerWeek =>
      'MENOS DE 1 porción med o 1 lata por sem';

  @override
  String get txtEightWalnutHalvesOrFifteenAlmondsOrTwoDessertTableSpoonsOfSeedsOrPeanutsPerDay =>
      '8 mitades de nuez o 15 almendras o 2 cdas de postre de semillas o cacahuetes por día';

  @override
  String get txtFourWalnutHalvesOrEightAlmondsOrOneTableSpoonDailyOfSeedsOrPeanuts =>
      '4 mitades de nuez o 8 almendras o 1 cda sopera por día de semillas o cacahuetes';

  @override
  String get txtLessThanFourWalnutHalvesOrLessThanEightAlmondsOrLessThanOneTableSpoonDailyOfSeedsOrPeanuts =>
      'MENOS DE 4 mitades de nuez o MENOS DE 8 almendras o MENOS DE 1 cda sopera por día de semillas o cacahuetes';

  @override
  String get txtTwoTableSpoonsDaily => '2 cdas soperas por día';

  @override
  String get txtOneTableSpoonDaily => '1 cda sopera por día';

  @override
  String get txtLessThanOneTableSpoonDaily => 'MENOS DE 1 cda sopera por día';

  @override
  String get txtOneAndHalfDishPerWeek => '1 y 1/2 plato por sem';

  @override
  String get txtOneDishPerWeek => '1 plato por sem';

  @override
  String get txtLessThanOneDishPerWeek => 'MENOS DE 1 plato por sem';

  @override
  String get txtFiveDishesPerWeek => '5 platos por sem';

  @override
  String get txtThreeDishesPerWeek => '3 platos por sem';

  @override
  String get txtLessThanThreeDishesPerWeek => 'MENOS DE 3 platos por sem';

  @override
  String get txtOneAndHalfDishPerWeekOrOneDishPlusOneMedallionPerWeek =>
      '1 y 1/2 plato por sem o 1 plato + 1 medallón por sem';

  @override
  String get txtOneDishPerWeekOrHalfDishPlusOneMedallionPerWeek =>
      '1 plato por sem o 1/2 plato + 1 medallón por sem';

  @override
  String get txtLessThanOneDishPerWeekOrHalfDishPlusOneMedallionPerWeek =>
      'MENOS DE 1 plato por sem o 1/2 plato + 1 medallón por sem';

  @override
  String get txtHalfDishDailyOrUpToFiveSmallUnitsPerWeek =>
      '1/2 plato por día o hasta 5 unids pqñas por sem';

  @override
  String get txtThreeQuartersDishDailyOrSmallUnitEveryDay =>
      '3/4 plato por día o unid pqña todos los días';

  @override
  String get txtMoreThanThreeQuartersDishDailyOrSmallUnitEveryDay =>
      'MÁS DE 3/4 plato por día o unid pqña todos los días';

  @override
  String get txtFiveMediumUnitsPerWeekOrHalfRawDishDailyOrQuarterCookedDishDaily =>
      '5 unids med por sem o 1/2 plato crudo por día o 1/4 plato cocido por día';

  @override
  String get txtTwoAndHalfMediumUnitsPerWeekOrOneThirdRawDishDailyOrQuarterCookedDish =>
      '2 y 1/2 unids med por sem o 1/3 plato crudo por día o 1/4 plato cocido';

  @override
  String get txtLessThanTwoAndHalfMediumUnitsPerWeekOrLessThanOneThirdRawDishDailyOrLessThanQuarterCookedDish =>
      'MENOS DE 2 y 1/2 unids med por sem o 1/3 plato crudo por día o 1/4 plato cocido';

  @override
  String get txtHalfDishOfPastaPerDayOrTwoServingsOfDoughPerDay =>
      '1/2 plato de pasta por día o 2 porciones de masa por día';

  @override
  String get txtThreeQuartersDishPerDayOrTwoServingsOfDoughPerDay =>
      '3/4 plato por día o 2 porciones de masa por día';

  @override
  String get txtMoreThanThreeQuartersDishPerDayOrMoreThanTwoServingsPerDay =>
      'MÁS DE 3/4 plato por día o MÁS DE 2 porciones por día';

  @override
  String get txtHalfDishPerDayOrTwoServingsOfDoughPerDay =>
      '1/2 plato por día o 2 porciones de masa por día';

  @override
  String get txtThreeQuartersDishPerDayOrThreeServingsOfDoughPerDay =>
      '3/4 plato por día o 3 porciones de masa por día';

  @override
  String
      get txtMoreThanThreeQuartersDishPerDayOrMoreThanThreeServingsOfDoughPerDay =>
          'MÁS DE 3/4 plato por día o MÁS DE 3 porciones de masa por día';

  @override
  String get txtTwoBreakfastCupSizeDaily => '2 tazas tamaño desayuno por día';

  @override
  String get txtOneBreakfastCupSizeDaily => '1 taza tamaño desayuno por día';

  @override
  String get txtLessThanOneBreakfastCupSizeDaily =>
      'MENOS DE 1 taza tamaño desayuno por día';

  @override
  String get txtOnePortionTheSizeOfSmallMatchboxOrHalfSUBECardOrTwoTableSpoonsDaily =>
      '1 porción, del tamaño de una caja de fósforos pqña o 1/2 tarjeta SUBE o 2 cdas soperas por día';

  @override
  String get txtOneSmallPortionWithoutWasteDailyOrUpToTwoEggUnitsOrHalfSmallPortionPlusOneEgg =>
      '1 porción pqña sin desperdicio por día o hasta 2 unids de huevo o 1/2 porción pqña + 1 huevo';

  @override
  String get txtTenWalnutHalvesOrTwentyAlmondsOrTwoDessertTableSpoonsOfSeedsOrPeanutsPerDay =>
      '10 mitades de nuez o 20 almendras o 2 cdas de postre por día de semillas o cacahuetes';

  @override
  String get txtFiveWalnutHalvesOrTenAlmondsOrOneTableSpoonDailyOfSeedsOrPeanuts =>
      '5 mitades de nuez o 10 almendras o 1 cda sopera por día de semillas o cacahuetes';

  @override
  String get txtLessThanFiveWalnutHalvesOrLessThanTenAlmondsOrLessThanOneTableSpoonDailyOfSeedsOrPeanuts =>
      'MENOS DE 5 mitades de nuez o MENOS DE 10 almendras o MENOS DE 1 cda sopera por día de semillas o cacahuetes';

  @override
  String get txtTwoTableSpoonsPerDay => '2 cdas soperas por día';

  @override
  String get txtOneTableSpoonPerDay => '1 cda sopera por día';

  @override
  String get txtLessThanOneTableSpoonPerDay => 'MENOS DE 1 cda sopera por día';

  @override
  String get txtThreePlatesPerWeekOrOneSmallUnitPerDay =>
      '3 pls por sem o 1 unid pqña por día';

  @override
  String get txtOneAndHalfPlatesPerWeekOrOneSmallUnitEveryOtherDay =>
      '1 y 1/2 pls por sem o 1 unid pqña día por medio';

  @override
  String
      get txtLessThanOneAndHalfPlatesPerWeekOrLessThanOneSmallUnitEveryOtherDay =>
          'MENOS DE 1 y 1/2 pls por sem o MENOS DE 1 unid pqña día por medio';

  @override
  String
      get txtHalfSmallUnitPerDayOrQuarterPlatePerDayOrThreeSmallUnitsPerWeek =>
          '1/2 unid pqña por día o 1/4 pl por día o 3 unids pqñas por sem';

  @override
  String get txtOneSmallUnitPerDayOrHalfPlatePerDayOrThreeMediumUnitsPerWeek =>
      '1 unid pqña por día o 1/2 pl por día o 3 unids med por sem';

  @override
  String get txtMoreThanOneSmallUnitPerDayOrMoreThanHalfPlatePerDayOrMoreThanThreeMediumUnitsPerWeek =>
      'MÁS DE 1 unid pqña por día o MÁS DE 1/2 pl por día o MÁS DE 3 unids med por sem';

  @override
  String get txtThreeMediumUnitsPerWeekOrOneThirdRawPlateOrQuarterCookedPlate =>
      '3 unids med por sem o 1/3 pl crudo o 1/4 pl cocido';

  @override
  String
      get txtOneMediumUnitPerWeekOrQuarterRawPlatePerDayOrQuarterPlateFourTimesPerWeek =>
          '1 unid med por sem o 1/4 pl crudo por día o 1/4 pl 4 veces/sem';

  @override
  String get txtLessThanOneMediumUnitPerWeekOrQuarterRawPlatePerDayOrQuarterPlateFourTimesPerWeek =>
      'MENOS DE 1 unid med por sem o 1/4 pl crudo por día o 1/4 pl 4 veces/sem';

  @override
  String get txtTwoMediumUnitsPerDay => '2 unids med por día';

  @override
  String get txtUpToOneSlicePerDayOrOneSmallMignonPerDay =>
      'hasta 1 rebanada por día o 1 mignon pqño por día';

  @override
  String get txtTwoSlicesPerDayOrTwoSmallMignonsPerDay =>
      '2 rebanadas por día o 2 mignons pqños por día';

  @override
  String get txtMoreThanTwoSlicesPerDayOrMoreThanTwoSmallMignonsPerDay =>
      'MÁS DE 2 rebanadas por día o MÁS DE 2 mignons pqños por día';

  @override
  String get txtQuarterPlatePerDayOfWholeWheatPastaOrOneServingOfDoughPerDay =>
      '1/4 pl por día de pasta integral o 1 porción de masa por día';

  @override
  String get txtHalfPlatePerDayOrTwoServingsOfDoughPerDay =>
      '1/2 pl por día o 2 porciones de masa por día';

  @override
  String get txtMoreThanHalfPlatePerDayOrMoreThanTwoServingsPerDay =>
      'MÁS DE 1/2 pl por día o MÁS DE 2 porciones por día';

  @override
  String get txtThreeQuartersCupForBreakfastDailyOrTwoTeaCupsDaily =>
      '3/4 taza para desayuno por día o 2 tazas de té por día';

  @override
  String get txtHalfCupForBreakfastOrOneTeaCupDaily =>
      '1/2 taza para desayuno o 1 taza de té por día';

  @override
  String get txtLessThanHalfCupForBreakfastOrLessThanOneTeaCup =>
      'MENOS DE 1/2 taza para desayuno o MENOS DE 1 taza de té';

  @override
  String get txtOnePortionTheSizeOfSmallMatchboxOrHalfSUBECardOrTwoTableSpoons =>
      '1 porción del tamaño de una caja de fósforos pqña o 1/2 tarjeta SUBE o 2 cdas soperas';

  @override
  String get txtOnePortionTheSizeOfADie => '1 porción del tamaño de un dado';

  @override
  String get txtLessThanOnePortionTheSizeOfADie =>
      'MENOS DE 1 porción del tamaño de un dado';

  @override
  String get txtOneSmallPortionWithoutWasteFiveTimesPerWeekOrHalfSmallPortionPlusOneEggDaily =>
      '1 porción pqña sin desperdicio 5 veces/sem o 1/2 porción pqña + 1 huevo por día';

  @override
  String get txtOneMediumPortionWithoutWasteDailyOrOneSmallPortionPlusOneEggDaily =>
      '1 porción med sin desperdicio por día o 1 porción pqña + 1 huevo por día';

  @override
  String get txtMoreThanOneMediumPortionWithoutWasteDailyOrMoreThanOneSmallPortionPlusOneEggDaily =>
      'MÁS DE 1 porción med sin desperdicio por día o MÁS DE 1 porción pqña + 1 huevo por día';

  @override
  String get txtTwoSmallPortionsPerWeekOrOneAndHalfCansPerWeek =>
      '2 porciones pqñas por sem o 1 y 1/2 latas/sem';

  @override
  String get txtOneSmallPortionPerWeekOrOneCanPerWeek =>
      '1 porción pqña por sem o 1 lata/sem';

  @override
  String get txtLessThanOneSmallPortionPerWeekOrLessThanOneCanPerWeek =>
      'MENOS DE 1 porción pqña por sem o 1 lata/sem';

  @override
  String get txtSixWalnutHalvesOrTenAlmondsOrOneTableSpoonDailyOfSeedsOrPeanuts =>
      '6 mitades de nuez o 10 almendras o 1 cda sopera por día de semillas o cacahuetes';

  @override
  String get txtThreeWalnutHalvesOrFiveAlmondsOrHalfTableSpoonDailyOfSeedsOrPeanuts =>
      '3 mitades de nuez o 5 almendras o 1/2 cda sopera por día de semillas o cacahuetes';

  @override
  String get txtLessThanThreeWalnutHalvesOrLessThanFiveAlmondsOrLessThanHalfTableSpoonDailyOfSeedsOrPeanuts =>
      'MENOS DE 3 mitades de nuez o MENOS DE 5 almendras o MENOS DE 1/2 cda sopera por día de semillas o cacahuetes';

  @override
  String get txtTwoDessertSpoonsPerDay => '2 cdas de postre por día';

  @override
  String get txtOneDessertSpoonPerDay => '1 cda de postre por día';

  @override
  String get txtLessThanOneDessertSpoonPerDay =>
      'MENOS DE 1 cda de postre por día';

  @override
  String get txtOneAndHalfPlatesPerWeek => '1 y 1/2 pls por sem';

  @override
  String
      get txtFiveAndHalfPlatesPerWeekOrOneMediumUnitPerDayOrThreeQuartersPlatePerDay =>
          '5 y 1/2 pls por sem o 1 unid med por día o 3/4 pl por día';

  @override
  String get txtThreePlatesPerWeekOrOneSmallUnitPerDayOrOneThirdPlatePerDay =>
      '3 pls por sem o 1 unid pqña por día o 1/3 pl por día';

  @override
  String get txtLessThanThreePlatesPerWeekOrLessThanOneDailyUnitOrLessThanOneThirdPlatePerDay =>
      'MENOS DE 3 pls por sem o MENOS DE 1 unid diaria o MENOS DE 1/3 pl por día';

  @override
  String
      get txtOneAndHalfPlatesPerWeekOrHalfPlateThreeTimesPerWeekOrOneMedallionPerDay =>
          '1 y 1/2 pls por sem o 1/2 pl 3 veces por sem o 1 medallón por día';

  @override
  String
      get txtOnePlatePerWeekOrHalfPlatePerWeekOrOneMedallionThreeTimesPerWeek =>
          '1 pl por sem o 1/2 pl por sem o 1 medallón 3 veces por sem';

  @override
  String get txtLessThanOnePlatePerWeekOrLessThanHalfPlatePerWeekOrLessThanOneMedallionThreeTimesPerWeek =>
      'MENOS DE 1 pl por sem o MENOS DE 1/2 pl por sem o MENOS DE 1 medallón 3 veces por sem';

  @override
  String
      get txtOneSmallUnitPerDayOrThreeMediumUnitsPerWeekOrOneThirdPlatePerDay =>
          '1 unid pqña por día o 3 unids med por sem o 1/3 pl por día';

  @override
  String
      get txtOneMediumUnitPerDayOrThreeLargeUnitsPerWeekOrThreeQuartersPlatePerDay =>
          '1 unid med por día o 3 unids grandes por sem o 3/4 pl por día';

  @override
  String get txtMoreThanOneMediumUnitPerDayOrMoreThanThreeLargeUnitsPerWeekOrMoreThanThreeQuartersPlatePerDay =>
      'MÁS DE 1 unid med por día o MÁS DE 3 unids grandes por sem o MÁS DE 3/4 pl por día';

  @override
  String
      get txtFiveMediumUnitsPerWeekOrHalfRawPlateDailyOrQuarterCookedPlateDaily =>
          '5 unids med por sem o 1/2 pl crudo por día o 1/4 pl cocido por día';

  @override
  String
      get txtTwoAndHalfMediumUnitsPerWeekOrOneThirdRawPlateDailyOrQuarterCookedPlate =>
          '2 1/2 unids med por sem o 1/3 pl crudo por día o 1/4 pl cocido';

  @override
  String get txtLessThanTwoAndHalfMediumUnitsPerWeekOrLessThanOneThirdRawPlateDailyOrLessThanQuarterCookedPlate =>
      'MENOS DE 2 1/2 unids med por sem o MENOS DE 1/3 pl crudo por día o MENOS DE 1/4 pl cocido';

  @override
  String
      get txtOneAndHalfLargeUnitPerDayOrTwoMediumUnitsPerDayOrThreeSmallUnits =>
          '1 1/2 unid grande por día o 2 unids med por día o 3 unids pqñas';

  @override
  String get txtOneMediumUnitPerDayOrTwoSmallUnits =>
      '1 unid med por día o 2 unids pqñas';

  @override
  String get txtLessThanOneMediumUnitPerDayOrLessThanTwoSmallUnitsPerDay =>
      'MENOS DE 1 unid med por día o MENOS DE 2 unids pqñas por día';

  @override
  String get txtUpToTwoMoldTypeSlicesPerDayOrTwoSmallMignonsPerDay =>
      'hasta 2 rebanadas tipo molde por día o 2 mignons pqños por día';

  @override
  String get txtThreeMoldTypeSlicesPerDayOrThreeSmallMignonsPerDay =>
      '3 rebanadas tipo molde por día o 3 mignons pqños por día';

  @override
  String get txtMoreThanThreeMoldTypeSlicesPerDayOrMoreThanThreeSmallMignonsPerDay =>
      'MÁS DE 3 rebanadas tipo molde por día o MÁS DE 3 mignons pqños por día';

  @override
  String get txtQuarterPlateOfWholeWheatPastaPerDayOrOneServingOfDough =>
      '1/4 pl de pasta integral por día o 1 porción de masa';

  @override
  String get txtTwoBreakfastTypeCups => '2 tazas tipo desayuno';

  @override
  String get txtOneBreakfastTypeCup => '1 taza tipo desayuno';

  @override
  String get txtLessThanOneBreakfastTypeCup => 'MENOS DE 1 taza tipo desayuno';

  @override
  String get txtOneSmallMatchboxSizePortionOrHalfSUBECardOrTwoTableSpoonsDaily =>
      '1 porción tamaño caja de fósforos pqña o 1/2 tarjeta SUBE o 2 cdas soperas por día';

  @override
  String get txtOneDiceSizePortionOrOneTableSpoonDaily =>
      '1 porción tamaño dado o 1 cda sopera por día';

  @override
  String get txtLessThanOneDiceSizePortionOrLessThanOneTableSpoonDaily =>
      'MENOS DE 1 porción tamaño dado o MENOS DE 1 cda sopera por día';

  @override
  String get txtOneSmallPortionWithoutWasteDailyOrUpToTwoEggUnitsDailyOrOneSliceSizePortionOfPecetoPlusOneEggDaily =>
      '1 porción pqña sin desperdicio por día o hasta 2 unids de huevo por día o 1 porción tamaño rodaja de peceto + 1 huevo por día';

  @override
  String get txtTwoSmallPortionsWithoutWasteDailyOrUpToFourEggUnitsDailyOrOneSmallPortionPlusTwoEggUnitsDaily =>
      '2 porciones pqñas sin desperdicio por día o hasta 4 unids de huevo por día o 1 porción pqña + 2 unids de huevo por día';

  @override
  String get txtMoreThanTwoSmallPortionsWithoutWasteDailyOrMoreThanFourEggUnitsDailyOrMoreThanOneSmallPortionPlusTwoEggUnitsDaily =>
      'MÁS DE 2 porciones pqñas sin desperdicio por día o MÁS DE 4 unids de huevo por día o MÁS DE 1 porción pqña + 2 unids de huevo por día';

  @override
  String get txtTenWalnutHalvesOrTwentyAlmondsOrTwoTableSpoonsDailyOfSeedsOrPeanuts =>
      '10 mitades de nuez o 20 almendras o 2 cdas soperas por día de semillas o cacahuetes';

  @override
  String
      get txtHalfPlateCookedDailyOrThreeQuartersPlateRawDailyOrSixMediumUnitsPerWeek =>
          '1/2 pl cocido por día o 3/4 pl crudo por día o 6 unids med por sem';

  @override
  String
      get txtQuarterPlateCookedDailyOrHalfPlateRawDailyOrThreeMediumUnitsPerWeek =>
          '1/4 pl cocido por día o 1/2 pl crudo por día o 3 unids med por sem';

  @override
  String get txtLessThanQuarterPlateCookedDailyOrLessThanHalfPlateRawDailyOrLessThanThreeMediumUnitsPerWeek =>
      'MENOS DE 1/4 pl cocido por día o MENOS DE 1/2 pl crudo por día o MENOS DE 3 unids med por sem';

  @override
  String get txtTwoPlatesPerWeekOrOnePlatePlusTwoMedallionsPerWeek =>
      '2 pls por sem o 1 pl + 2 medallones por sem';

  @override
  String
      get txtLessThanOnePlatePerWeekOrLessThanHalfPlatePlusOneMedallionPerWeek =>
          'MENOS DE 1 pl por sem o MENOS DE 1/2 pl + 1 medallón por sem';

  @override
  String
      get txtUpToSixSmallUnitsPerWeekOrThreeLargeUnitsPerWeekOrHalfPlateDaily =>
          'hasta 6 unids pqñas/sem o 3 unids grandes/sem o 1/2 pl por día';

  @override
  String get txtUpToNineUnitsPerWeekOrFiveLargeUnitsPerWeekOrOnePlateDaily =>
      'hasta 9 unids/sem o 5 unids grandes/sem o 1 pl por día';

  @override
  String
      get txtMoreThanNineUnitsPerWeekOrMoreThanFiveLargeUnitsPerWeekOrMoreThanOnePlateDaily =>
          'MÁS DE 9 unids/sem o MÁS DE 5 unids grandes/sem o MÁS DE 1 pl por día';

  @override
  String
      get txtOneMediumUnitDailyOrThreeQuartersPlateRawDailyOrHalfPlateCookedDaily =>
          '1 unid med por día o 3/4 pl crudo por día o 1/2 pl cocido por día';

  @override
  String get txtOneSmallUnitDailyOrHalfPlateRawDailyOrQuarterPlateCookedDaily =>
      '1 unid pqña por día o 1/2 pl crudo por día o 1/4 pl cocido por día';

  @override
  String get txtLessThanOneSmallUnitDailyOrLessThanHalfPlateRawDailyOrLessThanQuarterPlateCookedDaily =>
      'MENOS DE 1 unid pqña por día o 1/2 pl crudo por día o 1/4 pl cocido por día';

  @override
  String get txtTwoLargeUnitsPerDayOrFourSmallUnitsPerDay =>
      '2 unids grandes por día o 4 unids pqñas por día';

  @override
  String get txtOneLargeUnitPerDayOrTwoSmallUnitsPerDay =>
      '1 unid grande por día o 2 unids pqñas por día';

  @override
  String get txtLessThanOneLargeUnitPerDayOrLessThanTwoSmallUnitsPerDay =>
      'MENOS DE 1 unid grande por día o 2 unids pqñas por día';

  @override
  String get txtThreeSlicesPerDayOrTwoSmallMedallions =>
      '3 rebanadas por día o 2 medallones pqños';

  @override
  String get txtSixSlicesPerDayOrFourSmallMedallionsOrTwoSmallFlutes =>
      '6 rebanadas por día o 4 medallones pqños o 2 flautas pqñas';

  @override
  String get txtMoreThanSixSlicesPerDayOrMoreThanFourSmallMedallionsOrMoreThanTwoSmallFlutes =>
      'MÁS DE 6 rebanadas por día o MÁS DE 4 medallones pqños o MÁS DE 2 flautas pqñas';

  @override
  String
      get txtHalfPlateOfWholeWheatPastaPerDayOrOneAndHalfPortionOfDoughPerDay =>
          '1/2 pl de pasta integral por día o 1 y 1/2 porción de masa por día';

  @override
  String get txtOnePlatePerDayOrThreePortionsOfDoughPerDay =>
      '1 pl por día o 3 porciones de masa por día';

  @override
  String get txtMoreThanOnePlatePerDayOrMoreThanThreePortionsOfDoughPerDay =>
      'MÁS DE 1 pl por día o MÁS DE 3 porciones de masa por día';

  @override
  String get txtTwoBreakfastCups => '2 tazas de desayuno';

  @override
  String get txtOneBreakfastCup => '1 taza de desayuno';

  @override
  String get txtLessThanOneBreakfastCup => 'MENOS DE 1 taza de desayuno';

  @override
  String get txtOnePortionTheSizeOfADiceOrOneTableSpoon =>
      '1 porción del tamaño de un dado o 1 cda sopera';

  @override
  String get txtLessThanOnePortionTheSizeOfADiceOrLessThanOneTableSpoon =>
      'MENOS DE 1 porción del tamaño de un dado o MENOS DE 1 cda sopera';

  @override
  String get txtOneMediumPortionWithoutWasteDailyOrUpToThreeEggsDailyOrOneSmallPortionPlusTwoEggsDaily =>
      '1 porción med sin desperdicio por día o hasta 3 huevos por día o 1 porción pqña + 2 huevos por día';

  @override
  String get txtTwoSmallPortionsWithoutWasteDailyOrUpToFourEggsOrOneMediumPortionPlusTwoEggs =>
      '2 porciones pqñas sin desperdicio por día o hasta 4 huevos o 1 porción med + 2 huevos';

  @override
  String get txtMoreThanTwoSmallPortionsWithoutWasteDailyOrUpToFourEggsDailyOrMoreThanOneMediumPortionPlusTwoEggs =>
      'MÁS DE 2 porciones pqñas sin desperdicio por día o hasta 4 huevos por día o 1 porción med + 2 huevos';

  @override
  String get txtTwoLargePortionsPerWeekOrTwoCansPerWeekOrOneThirdPlateOfCannedFishPerWeek =>
      '2 porciones grandes por sem o 2 latas/sem o 1/3 pl de pescado enlatado por sem';

  @override
  String get txtOneMediumPortionPerWeekOrOneCanPerWeekOrQuarterPlatePerWeek =>
      '1 porción med por sem o 1 lata/sem o 1/4 pl por sem';

  @override
  String
      get txtLessThanOneMediumPortionPerWeekOrLessThanOneCanPerWeekOrLessThanQuarterPlatePerWeek =>
          'MENOS DE 1 porción med por sem o 1 lata/sem o 1/4 pl por sem';

  @override
  String get txtTenWalnutHalvesPerDayOrTwentyAlmondsPerDayOrTwoTableSpoonsPerDayOfSeedsOrPeanuts =>
      '10 mitades de nuez por día o 20 almendras por día o 2 cdas soperas por día de semillas o cacahuetes';

  @override
  String get txtFiveWalnutHalvesPerDayOrTenAlmondsPerDayOrOneTableSpoonPerDayOfSeedsOrPeanuts =>
      '5 mitades de nuez por día o 10 almendras por día o 1 cda sopera por día de semillas o cacahuetes';

  @override
  String get txtLessThanFiveWalnutHalvesPerDayOrLessThanTenAlmondsPerDayOrLessThanOneTableSpoonPerDayOfSeedsOrPeanuts =>
      'MENOS DE 5 mitades de nuez por día o MENOS DE 10 almendras por día o MENOS DE 1 cda sopera por día de semillas o cacahuetes';

  @override
  String get txtThreeTableSpoonsPerDay => '3 cdas soperas por día';

  @override
  String get txtLessThanOnePortionSizeDiceOrLessThanOneTbspDaily =>
      'MENOS DE 1 porción del tamaño de un dado o MENOS DE 1 cda sopera por día';

  @override
  String get txtOneSmallPortionWithoutWasteBeefPlusEggDaily =>
      '1 porción pqña sin desperdicio por día o hasta 2 unids de huevo por día o 1 porción del tamaño de una rodaja de ternera + 1 huevo por día';

  @override
  String get txtTwoAndHalfMedUnitsWkThirdRawFourthCookedPlateDS =>
      '2 1/2 unids med por sem o 1/3 pl crudo por día o 1/4 pl cocido';

  @override
  String get txtLessThanTwoAndHalfMedUnitsWkThirdRawFourthCookedPlateDS =>
      'MENOS DE 2 1/2 unids med por sem o MENOS DE 1/3 pl crudo por día o MENOS DE 1/4 pl cocido';

  @override
  String get txtMoreThanNineUnitsWkFiveLargeOnePlateDailyDS =>
      'MÁS DE 9 unids/sem o MÁS DE 5 unids grandes/sem o MÁS DE 1 pl por día';

  @override
  String get txtImportantNotice => 'AVISO IMPORTANTE';

  @override
  String get txtAppleWarning =>
      '<p style=\"text-align:center\"><span style=\"font-size:16px\"><strong><span style=\"color:#ffffff\">IMPORTANTE</span></strong></span></p>\n\n<p style=\"text-align:center\"><span style=\"font-size:14px\"><span style=\"color:#ffffff\">Luego de cargar toda la información se mostrará el score. El mismo es sólo orientativo y</span></span></p>\n\n<p style=\"text-align:center\"><span style=\"font-size:14px\"><span style=\"color:#ffffff\"><u>NO PUEDE REEMPLAZAR EL CONTROL PERIÓDICO DE UN MÉDICO</u></span></span></p>\n';

  @override
  String get patientsDataInputTitle => 'Ingrese los datos del paciente';

  @override
  String get txtSex => 'Sexo: ';

  @override
  String get txtAge => 'Edad: ';

  @override
  String get txtWeight => 'Peso: ';

  @override
  String get txtHeight => 'Estatura: ';

  @override
  String get inputSex => 'Escoja el sexo';

  @override
  String get sexFemale => 'Mujer';

  @override
  String get sexMale => 'Varón';

  @override
  String get inputHeight => 'Ingrese la altura';

  @override
  String get inputWeight => 'Ingrese el peso';

  @override
  String get hintWeightKilos => 'Ej.: 42';

  @override
  String get hintWeightGramos => 'Ej.: 300';

  @override
  String get hintHeight => 'Ej.: 123,5';

  @override
  String get inputBirthDate => 'Ingrese fecha de nacimiento o edad';

  @override
  String get birthDate => 'Fecha de\n nacimiento';

  @override
  String get labelYears => 'Años';

  @override
  String get labelMonths => 'Meses';

  @override
  String get suffixAno => ' año';

  @override
  String get suffixAnos => ' años';

  @override
  String get suffixMes => ' mes';

  @override
  String get suffixMeses => ' meses';

  @override
  String get btnResetFields => 'LImpiar';

  @override
  String get btnContinue => 'Continuar';

  @override
  String get physicalActivityQ1 =>
      'P1. ¿Cuántos días por semana práctica deportes, juegos, ejercicios físicos, danza u otra actividad física?';

  @override
  String get physicalActivityQ1Note =>
      '(Considerar sólo actividades practicadas fuera del ámbito escolar)';

  @override
  String get physicalActivityQ1Opt1 => 'Ninguno (pasar a P3)';

  @override
  String get physicalActivityQ1Opt2 => '1 día por semana';

  @override
  String get physicalActivityQ1Opt3 => '2 días por semana';

  @override
  String get physicalActivityQ1Opt4 => '3 días por semana';

  @override
  String get physicalActivityQ1Opt5 => '4 días por semana';

  @override
  String get physicalActivityQ1Opt6 => '5 días por semana';

  @override
  String get physicalActivityQ1Opt7 => '6 días por semana';

  @override
  String get physicalActivityQ1Opt8 => 'Todos los días';

  @override
  String get physicalActivityQ2 =>
      'P2. ¿Cuánto tiempo semanal total dedica HABITUALMENTE en esos días a realizar deportes, juegos, ejercicios físicos, danza u otra actividad física?';

  @override
  String get physicalActivityQ3 =>
      'P3. ¿Habitualmente cómo suele transportarse a la escuela?';

  @override
  String get physicalActivityQ3Opt1 => 'Caminado';

  @override
  String get physicalActivityQ3Opt2 => 'Bicicleta';

  @override
  String get physicalActivityQ3Opt3 =>
      'Transporte motorizado (auto, moto, colectivo, subte, pre-metro, tren)';

  @override
  String get physicalActivityQ4 =>
      'P4. ¿A cuántas cuadras de su casa queda la escuela o el colegio al que asiste?';

  @override
  String get physicalActivityBlocks => ' cuadras';

  @override
  String get physicalActivityQ5 =>
      'P5. ¿Cuántas veces por semana tiene clases de Educación Física en la escuela?';

  @override
  String get physicalActivityQ5Opt0 => 'No tiene';

  @override
  String get physicalActivityQ5Opt1 => '1 vez por semana';

  @override
  String get physicalActivityQ5Opt2 => '2 veces por semana';

  @override
  String get physicalActivityQ5Opt3 => '3 veces por semana';

  @override
  String get physicalActivityQ5Opt4 => '4 veces por semana';

  @override
  String get physicalActivityQ5Opt5 => '5 veces por semana';

  @override
  String get physicalActivityQ5Opt6 => '6 veces por semana';

  @override
  String get physicalActivityQ6 =>
      'P6. ¿Cuántos minutos por día, en promedio, pasa frente a una pantalla de computadora, tablet, celular o televisor?';

  @override
  String get physicalActivityMinutes => '  minutos diarios';

  @override
  String get physicalActivitySedentaryWarning =>
      ' pero se considera SEDENTARIO por igualar o superar las DOS horas de pantalla diarias.';

  @override
  String get txtBMI => 'Índice de masa corporal: ';

  @override
  String get txtPercentile => 'Percentilo: ';

  @override
  String get txtDiagnose => 'Diagnóstico: ';

  @override
  String get txtPressCalc => 'Presione \"Calcular\"';

  @override
  String get txtTradNotLaded =>
      'No se cargó el traductor \n Por favor \n Avise al desarrollador';

  @override
  String get txtDone => 'Listo';

  @override
  String get txtSevereObesity => 'Obesidad severa';

  @override
  String get txtObesity => 'Obesidad';

  @override
  String get txtOverWeight => 'Sobrepeso';

  @override
  String get txtNormalWeight => 'Peso normal';

  @override
  String get txtTotalSleepTime =>
      'Total de horas diarias de sueño\nincluyendo siestas regulares.';

  @override
  String get txtImportant => 'IMPORTANTE\n¡LEER ATENTAMENTE!';

  @override
  String get txtExamplePAS => 'Ej.: 120';

  @override
  String get txtExamplePAD => 'Ej.: 80';

  @override
  String get txtPAS => 'PA Sistólica:   ';

  @override
  String get txtPAD => 'PA Diastólica:  ';

  @override
  String get txtReceivesMedication => 'Recibe medicación';

  @override
  String get txtRequired => ' Requerido';

  @override
  String get txtCalculate => 'Calcular';

  @override
  String get txtOK => 'OK';

  @override
  String get txtCancel => 'Cancelar';

  @override
  String get txtAccept => 'Aceptar';

  @override
  String get txtPatientNormal => 'Paciente normotenso';

  @override
  String get txtPatHT => 'Paciente prehipertenso';

  @override
  String get txtPatHt1 => 'Paciente hipertenso leve';

  @override
  String get txtPatHt2 => 'Paciente hipertenso severo';

  @override
  String get txtYes => 'S';

  @override
  String get txtNo => 'N';

  @override
  String get txtScore => 'Score: ';

  @override
  String get resultAgeOver16 =>
      'A partir de los 16 años no se evalúan percentilos sino los valores de presión.';

  @override
  String get resultPasUnder_50 =>
      'El percentilo de PAS determinado es menor a percentilo 50\n';

  @override
  String get resultPasEqual_50 =>
      'El percentilo de PAS determinado es igual a 50\n';

  @override
  String get resultPas_50to90 =>
      'El percentilo de PAS determinado está entre 50 y 90\n';

  @override
  String get resultPas_90to95 =>
      'El percentilo de PAS determinado está entre 90 y 95\n';

  @override
  String get resultPas_95to95plus12 =>
      'El percentilo de PAS determinado está entre 95 y 95 + 12 mmHg\n';

  @override
  String get resultPasAbove_95plus12 =>
      'El percentilo de PAS determinado está por encima de percentilo 95 + 12 mmHg\n';

  @override
  String get resultPadUnder_50 =>
      'El percentilo de PAD determinado es menor a percentilo 50\n';

  @override
  String get resultPadEqual_50 =>
      'El percentilo de PAD determinado es igual a 50\n';

  @override
  String get resultPad_50to90 =>
      'El percentilo de PAD determinado está entre 50 y 90\n';

  @override
  String get resultPad_90to95 =>
      'El percentilo de PAD determinado está entre 90 y 95\n';

  @override
  String get resultPad_95to95plus12 =>
      'El percentilo de PAD determinado está entre 95 y 95 + 12 mmHg\n';

  @override
  String get resultPadAbove_95plus12 =>
      'El percentilo de PAD determinado está por encima de percentilo 95 + 12 mmHg\n';

  @override
  String get patientDiagnoseHT3 => 'Paciente con hipertensión estadio 3';

  @override
  String get patientDiagnoseHT2 => 'Paciente con hipertensión estadio 2';

  @override
  String get patientDiagnoseHT1 => 'Paciente con hipertensión estadio 1';

  @override
  String get patientDiagnoseHT => 'Paciente prehipertenso';

  @override
  String get patientDiagnoseNorm => 'Paciente normotenso';

  @override
  String get txtApplicationLegalese =>
      'Esta aplicación es gratuita y de código abierto y su única finalidad es promover la salud cardiovascular desde la infancia.\n\n';

  @override
  String get txtAboutApp => 'Información sobre PRECARINA';

  @override
  String get txtHelpFood =>
      '<p>El entorno alimentario actual se caracteriza por una elevada oferta y accesibilidad de alimentos de alta densidad energética y baja calidad nutricional, con gran contenido de sal, azúcares y grasas, que han reemplazado el consumo de alimentos naturales que aportan fibra, vitaminas y otros minerales entre otros nutrientes beneficiosos para la salud. Esta modificación en los patrones de consumo constituyen un importante riesgo para la salud cardiovascular.</p>\n<p>Se recomienda incorporar a diario alimentos de todos los grupos y realizar al menos 30 minutos de actividad física; tomar a diario 8 vasos de agua segura; consumir a diario 5 porciones de frutas y verduras en variedad de tipo y colores, y reducir el uso de sal y el consumo de alimentos con alto contenido de sodio. Limitar el consumo de bebidas azucaradas y de alimentos con elevado contenido de grasas, azucares y sal; consumir diariamente leche, yogur o quesos, preferentemente descremados; consumir carnes magras, aumentar el consumo de pescado e incluir huevo en la alimentación; consumir legumbres; consumir aceite crudo como condimento, frutos secos o semillas y limitar el consumo de bebidas alcohólicas.</p>\n<h2 id=\"bibliograf%C3%ADa\">Bibliografía</h2>\n<ol>\n<li><a href=\"https://www.argentina.gob.ar/alimentacion-saludable/comer-sano\">Manual para la aplicación de la Guías alimentarias para la población argentina.</a></li><li>Dietary Guidelines for Americans 2020-25. t DietaryGuidelines.gov</li></ol>\n';

  @override
  String get txtBmiHelp =>
      'The body mass index (BMI) is the most commonly used criterion to measure body mass in relation to height. It is a practical and universally applicable indicator, cheap, and non-invasive to identify overweight and obesity.</p><p lang=\"es-ES\">In children and adolescents, percentile charts are used to define overweight (> 85th percentile and < 95th percentile), obesity (> 95th percentile), and severe obesity (> 99th percentile). Therefore, for the PRECARINA application, we trained a Machine Learning model using data from the World Health Organization (WHO) and the National Health Center to estimate the BMI percentile.</p><h2 lang=\"es-ES\" class=\"western\">Bibliography</h2><p><span lang=\"es-ES\">Manual de Obesidad en Pediatría. Editorial Lugo</span>nes. 2023</p><p><br/><br/></p>';

  @override
  String get txtPrivacyPolicy => 'Política de privacidad';
}
