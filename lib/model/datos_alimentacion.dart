// sexo, edad, item

enum Genero {
  femenino,
  masculino,
}

enum Edad {
  cincoAocho,
  nueveAtrece,
  catorceAdieciocho,
}

enum Items {
  vegetalesVerdes,
  vegetalesRojos,
  legumbres,
  tuberculos,
  otrosVegetales,
  frutas,
  pan,
  pastasIntegrales,
  pastasRefinadas,
  lacteos,
  quesos,
  carnes,
  pescados,
  semillas,
  aceites,
}

List<String> titulo = [
  "Vegetales verdes",
  "Vegetales rojos/naranjas",
  "Legumbres",
  "Tubérculos (papa, batata, mandioca)",
  "Otros vegetales",
  "Frutas",
  "Pan",
  "Pastas y masas integrales: masa: pizza, tarta, empanada, canelon, masa de taco.",
  "Pastas y masas refinadas (No integrales)",
  "Lácteos (leche, yogur) parcialmente descremados",
  "Quesos semidescremados untables o semisólidos (port salut, muzzarella)",
  "Carnes rojas, ave y huevo por día",
  "Pescados",
  "Frutos secos y semillas",
  "Aceites"
];

List<List<List<List<String>>>> opciones = [
  // femenino
  [
    // Cinco a ocho
    [
      // vegetales verdes
      [
        '1 plato por semana',
        '1/2 plato por semana',
        '< 1/2 plato por semana',
      ],
      [
        '3 platos por semana o 1 unidad chica diaria',
        '1 platos por semana',
        '< 1 platos por semana',
      ],
      [
        '1/2 plato por semana o 2 medallones chicos por semana',
        '1/4 plato por semana o 1 medallón chico por semana',
        '< 1/4 plato por semana o < 1 medallón chico por semana',
      ],
      [
        '1/2 unidad chica diaria o 1/4 plato diario o 3 unidades chicas por semana',
        '1 unidad chica diaria o 1/2 plato diario o 3 unidades medianas por semana',
        '> 1 unidad chica diaria o > 1/2 plato diario o > 3 unidades medianas por semana',
      ],
      [
        '3 unidades medianas semanales o 1/3 plato crudo diario o 1/4 plato cocido diario',
        '1 unidad mediana semanal o 1/4 plato crudo diario o 1/4 plato cocido 4 veces/sem',
        '< 1 unidad mediana semanal o  < 1/4 plato crudo diario o < 1/4 plato cocido 4 veces/sem',
      ],
      [
        '1 unidad mediana diaria o 2 unidades chicas diaria',
        '1 unidad chica diaria',
        '< 1 unidad chia diaria',
      ],
      [
        '1 rodaja de pan o 1 mignon chico o 3 galletitas de agua',
        '2 rodajas de pan de molde o 2 mignones chicos o 6 galletitas de agua',
        '> 2 rodajas de pan de molde o > 2 mignones chicos o > 6 galletitas de agua',
      ],
      [
        '1/4 plato diario o 1 porción de masa diario',
        '1/2 plato diario o 2 porciones de masa diario',
        '> 1/2 plato diario o > 2 porciones de masa diario',
      ],
      [
        '1/4 plato diario o 1 porción de masa diario',
        '1/2 plato al día o 2 porciones de masa',
        '> 1/2 plato al día  o > 2 porciones de masa al día',
      ],
      [
        '3/4 tz tipo desayuno diario o 2 tazas tipo té diario',
        '1/2 taza tipo desayuno diario o 1 taza tipo té diario',
        '< 1/2 taza tipo desayuno diario o < 1 taza tipo té diario',
      ],
      [
        '1 porción tamaño cajita de fósforo chica o tamaño 1/2 tarjeta SUBE o 2 cdas tipo soperas',
        '1/2 porción tamaño cajita de fósforo chica o 1 dado o 1 cda sopera',
        '< 1/2 porción tamaño cajita de fósforo chica o < 1 dado o < 1 cda sopera',
      ],
      [
        '1/2 bife mediano por día o 1 y 1/2 huevo diario o 1 emincé mediano',
        '1 bife mediano diario o hasta 2 unidades de huevo diario o 1 porción tamaño rodaja de peceto + 1 huevo diario',
        '> 1 bife mediano diario o > 2 unidades de huevo diario o > 1 porción tamaño rodaja de peceto + 1 huevo diario',
      ],
      [
        '1 porción mediana por semana o 1 lata por semana',
        '1 porción chica por semana o 1/2 lata por semana',
        '< 1 porción chica por semana o < 1/2 lata por semana',
      ],
      [
        '4 mariposas nueces u 8 almendras o 1 cda sopera de semillas o maníes en forma diaria',
        '2 mariposas o 4 almendras o 1 cdta tipo té de semillas o maníes en forma diaria',
        '< 2 mariposas o < 4 almendras o < 1 cdta tipo té de semillas o maníes en forma diaria',
      ],
      [
        '2 cdas tipo postre diaria',
        '1 cda tipo postre diaria',
        '< 1 cda tipo postre diaria',
      ],
    ], // Fin 5 a 8 años
    // 9 a 13 años
    [
      [
        '1 y 1/2 plato por semana',
        '1 plato por semana',
        '< 1 plato por semana',
      ],
      [
        '4  platos por semana',
        '2 platos por semana',
        '< de 2 platos por semana',
      ],
      [
        '1  plato por semana o 1/2 plato + 1 medallón por semana',
        '1/2 plato por semana o 1/4 plato + 1 medallón por semana',
        '< 1/2 plato por semana o 1/4 plato + 1 medallón por semana',
      ],
      [
        '1/3 plato diario o hasta 3 unidades medianas/sem',
        '1/2 plato o hasta 5 unidades chicas por semana',
        '> 1/2 plato o > 5 unidades chicas por semana',
      ],
      [
        '4 unidades medianas por semana o 1/2 plato crudo diario o 1/4 plato cocido diario',
        '2  unidades medianas por semana o 1/4 plato diario',
        '< 2  unidades medianas por semana o 1/4 plato diario',
      ],
      [
        '1 1/2 unidad grande por día o 2 unidades medianas por día',
        '1 unidad mediana por día',
        '< 1 unidad mediana por día',
      ],
      [
        'hasta 2 rodajas pan de molde al día o 2 mignones chicos o 6 galletitas de agua',
        '3 rodajas pan de molde al día o 3 mignones chicos o 9 galletitas de agua',
        '> 3 rodajas de pan de molde al día o > 3 mignones chicos o > 9 galletitas de agua',
      ],
      [
        '1/4 plato al día de pasta integral  o 1 porción de masa',
        '1/2 plato al día o 2 porciones de masa',
        '> 1/2 plato al día  o 2  porcion de masa',
      ],
      [
        '1/4 plato al día de pasta integral  o 1 porción de masa',
        '1/2 plato al día o 2 porciones de masa',
        '> 1/2 plato al día  ó > 2 porciones de masa al día',
      ],
      [
        '2 tazas tipo té',
        '1 taza tipo té diario',
        '< 1 taza tipo té diario',
      ],
      [
        '1 porción tamaño caja de fósforos chica o tamaño 1/2 tarjeta SUBE o 2 cdas soperas diaria',
        '1 porción tamaño dado o 1 cda sopera diaria',
        '< 1 porción tamaño dado o < 1 cda sopera diaria',
      ],
      [
        '1 porción chica sin desecho diario o hasta 2 unidades de huevo diario o 1 porción tamaño rodaja de peceto + 1 huevo diario',
        '2 porciones chicas sin desechos diario o hasta 4 unidades de huevo diario o 1 porción chica + 2 unidades de huevo',
        '> 2 porciones chicas sin desechos diario o > 4 unidades huevo diario o > 1 porción chica + 2 unidades de huevo',
      ],
      [
        '2 porciones medianas o 2 latas /semana',
        '1 porción mediana o 1 lata/semana',
        '< 1 porción mediana o 1 lata/semana',
      ],
      [
        '8 mariposas nueces o 15 almendras o 2 cdas postre al día de semillas o maníes',
        '4 mariposas nueces o 8 almendras o 1 cda sopera al día de semillas o maníes',
        '< 4 mariposas nueces o < 8 almendras o < 1 cda sopera al día de semillas o maníes',
      ],
      [
        '2 cucharadas soperas al día',
        '1 cucharada sopera al día',
        '< 1 cucharada sopera al día',
      ],
    ],
    // 14 a 18 años
    [
      [
        '1 y 1/2 plato por semana',
        '1 plato por semana',
        '< 1 plato por semana',
      ],
      [
        '5 platos por semana',
        '3 platos por semana',
        '< de 3 platos por semana',
      ],
      [
        '1 1/2 plato por semana o 1 plato + 1 medallón por semana',
        '1 plato por semana o 1/2 plato + 1 medallón por semana',
        '< 1 plato por semana o 1/2 plato + 1 medallón por semana',
      ],
      [
        '1/2 plato diario o hasta 5 unidades chicas /sem',
        '3/4 plato diario o unidad chica todos los dias',
        '> 3/4 plato diario o unidad chica todos los dias',
      ],
      [
        '5 unidades medianas por semana o 1/2 plato crudo diario o 1/4 plato cocido diario',
        '2 1/2 unidades medianas por semana o 1/3 plato crudo diario o 1/4 plato cocido',
        '< 2 1/2 unidades medianas por semana o 1/3 plato crudo diario o 1/4 plato cocido',
      ],
      [
        '1 1/2 unidad grande por día o 2 unidades medianas por día',
        '1 unidad mediana por día',
        '< 1 unidad mediana por día',
      ],
      [
        'hasta 2 rodajas de pan de molde al día o 2 mignones chicos o 6 galletitas de agua',
        '3 rodajas de pan de molde al día o 3 mignones chicos o 9 galletitas de agua',
        '> 3 rodajas pan de molde al díao > 3 mignones chicos o > 9 galletitas de agua',
      ],
      [
        '1/2 plato al día de pasta  o 2 porciones de masa al día',
        '3/4 plato al día o 2 porciones de masa al día',
        '> 3/4 plato al día o > 2 porciones al día',
      ],
      [
        '1/2 plato al día o 2 porciones de masa al día',
        '3/4 plato al día o 3 porciones de masa al día',
        '> 3/4 plato al día o > 3 porciones de masa al día',
      ],
      [
        '2 tazas tipo desayuno diario',
        '1 taza tipo desayuno diario',
        '< 1 taza tipo desayuno diario',
      ],
      [
        '1 porción tamaño cajita de fósforos chica o tamaño 1/2 tarjeta SUBE o 2 cdas soperas diaria',
        '1 porción tamaño dado o 1 cda sopera diaria',
        '< 1 porción tamaño dado o < 1 cda sopera diaria',
      ],
      [
        '1 porción chica sin desecho diario o hasta 2 unidades de huevo o 1/2 porción chica + 1 huevo',
        '2 porciones chicas sin desechos diario o hasta 4 unidades de huevo diario o 1 porción chica + 2 unidades de huevo',
        '> 2 porciones chicas sin desechos diario o > 4 unidades huevo diario o > 1 porción chica + 2 unidades de huevo',
      ],
      [
        '2 porciones medianas o 2 latas /semana',
        '1 porción mediana o 1 lata/semana',
        '< 1 porción mediana o 1 lata/semana',
      ],
      [
        '10 mariposas nueces o 20 almendras o 2 cdas soperas al día de semillas o maníes',
        '5 mariposas nueces o 10 almendras o 1 cda sopera al día de semillas o maníes',
        '< 5 mariposas nueces o < 10 almendras o < 1 cda sopera al día de semillas o maníes',
      ],
      [
        '2 cucharadas soperas al día',
        '1 cucharada sopera al día',
        '< 1 cucharada sopera al día',
      ],
    ], // fin 14 a 18 años',
  ], // Fin femenino
  // Masculino
  [
    // De 5 a 8 años
    [
      [
        '1 plato por semana',
        '1/2 plato por semana',
        '< 1/2 plato por semana',
      ],
      [
        '3 platos por semana o 1 unidad chica diaria',
        '1 y 1/2 platos por semana o 1 unidda chica dia por medio',
        '< de 1 y 1/2 platos por semana o < 1 unidad chica día por medio',
      ],
      [
        '1/2 plato por semana  o 1/4 plato + 1 medallón por semana',
        '1/4 plato por semana o 1 medallón chico por semana',
        '< 1/4 plato por semana o < 1 medallón chico por semana',
      ],
      [
        '1/2 unidad chica diaria o 1/4 plato diario o 3 unidades chicas por semana',
        '1 unidad chica diaria o 1/2 plato diario o 3 unidades medianas por semana',
        '> 1 unidad chica diaria o > 1/2 plato diario o > 3 unidades medianas por semana',
      ],
      [
        '3 unidades medianas semanales o 1/3 plato crudo o 1/4 plato cocido',
        '1  unidad mediana por semana o 1/4 plato crudo diario o 1/4 plato 4 veces/sem.',
        '< 1 unidad medians por semana o 1/4 plato crudo diario o 1/4 plato 4 veces/sem.',
      ],
      [
        '2 unidades medianas por día',
        '1 unidad mediana por día',
        '< 1 unidad mediana por día',
      ],
      [
        'hasta 1 rodaja tipo molde por día o 1 mignon chico por día',
        '2 rodajas al día o 2 mignones chicos por día',
        '> 2 rodajas al día o > 2 mignones chicos por día',
      ],
      [
        '1/4 plato al día de pasta integral  o 1 porción de masa diario',
        '1/2 plato al día o 2 porciones de masa diario',
        '> 1/2 plato al día  o > 2 porciones diario',
      ],
      [
        '1/4 plato al día de pasta integral  o 1 porción de masa diario',
        '1/2 plato al día o 2 porciones de masa diario',
        '> 1/2 plato al día  o > 2 porciones de masa diario',
      ],
      [
        '3/4 tz tipo desayuno diario o 2 tazas tipo té diario',
        '1/2 taza tipo desayuno o 1 taza tipo té diario',
        '< 1/2 taza tipo desayuno o < 1 taza tipo té',
      ],
      [
        '1 porción tamaño cajita de fósforos chica o 1/2 tarjeta SUBE o 2 cdas tipo soperas',
        '1 porción tamaño dado',
        '< 1 porción tamaño dado',
      ],
      [
        '1 porción chica sin desecho 5 veces/sem o  1/2 porción chica + 1/2 huevo diario',
        '1 porcion mediana sin desechos diario o  1 porción chica + 1 unidades de huevo diario',
        '> 1 porcion mediana sin desechos diario o  1 porción chica + 1 unidades de huevo diario',
      ],
      [
        '2 porciones chicas por semana o 1 y 1/2 latas /semana',
        '1 porción chica por semana o 1 lata/semana',
        '< 1 porción chica por semana o 1 lata/semana',
      ],
      [
        '6 mariposas nueces o 10 almendras o 1 cdas soperas al día de semillas o maníes',
        '3 mariposas nueces o 5 almendras o 1/2 cda sopera al día de semillas o maníes',
        '< 3 mariposas nueces o 5 almendras o 1/2 cda sopera al día de semillas o maníes',
      ],
      [
        '2 cucharadas de postre al día',
        '1 cucharada de postre al día',
        '< 1 cucharada de postre al día',
      ],
    ], // Fin de 5 a 8 años
    // De 9 a 14 años
    [
      [
        '1 y 1/2 plato por semana',
        '1 plato por semana',
        '< 1 plato por semana',
      ],
      [
        '5 1/2 platos por semana o 1 unidad mediana por día o 3/4 plato por día',
        '3 platos por semana o 1 unidad chica por día o 1/3 plato por día',
        '< de 3 platos por semana o < 1 unidad diaria o < 1/3 plato por día',
      ],
      [
        '1 1/2 plato por semana o 1/2 plato 3 veces por semana o 1 medallón por día',
        '1 plato por semana o 1/2 plato por semana o 1 medallón 3 veces por semana',
        '< 1 plato por semana o < 1/2 plato por semana o < 1 medallón 3 veces por semana',
      ],
      [
        '1 unidad chica diaria o 3 unidades medianas por semana o 1/3 plato diario',
        '1 unidad mediana diaria o 3 unidades grandes por semana o 3/4 plato diaria',
        '> 1 unidad mediana diaria o > 3 unidades grandes por semana o > 3/4 plato diaria',
      ],
      [
        '5 unidades medianas por semana o 1/2 plato crudo diario o 1/4 plato cocido diario',
        '2  1/2 unidades medianas por semana o 1/3 plato crudo diario o 1/4 plato cocido',
        '< 2  1/2 unidades medianas por semana o < 1/3 plato crudo diario o < 1/4 plato cocido',
      ],
      [
        '1  1/2 unidad grande por día o 2 unidades medianas por día o 3 unidades chicas',
        '1 unidad mediana por día o 2 unidades chicas',
        '< 1 unidad mediana por día o < 2 unidades chicas por día',
      ],
      [
        'hasta 2 rodajas tipo molde al día o 2 mignones chicos al día',
        '3 rodajas tipo molde al día o 3 mignones chicos al día',
        '> 3 rodajas tipo molde al día o > 3 mignones chicos al día',
      ],
      [
        '1/4 plato al día de pasta integral  o 1 porción de masa',
        '1/2 plato al día o 2 porciones de masa',
        '> 1/2 plato al día  o > 2 porciones al día ',
      ],
      [
        '1/4 plato al día de pasta integral  o 1 porción de masa',
        '1/2 plato al día o 2 porciones de masa',
        '> 1/2 plato al día  o > 2 porciones al día ',
      ],
      [
        '2 tazas tipo desayuno',
        '1 taza tipo desayuno',
        '< 1 taza tipo desayuno',
      ],
      [
        '1 porción tamaño cajita de fósforos chica o 1/2 tarjeta SUBE o 2 cdas soperas diaria',
        '1 porción tamaño dado o 1 cda sopera diaria',
        '< 1 porción tamaño dado o < 1 cda sopera diaria',
      ],
      [
        '1 porción chica sin desecho diario o hasta 2 unidades de huevo diario o 1porción tamaño rodaja  peceto + 1 huevo diario',
        '2 porciones chicas sin desechos diario o hasta 4 unidades de huevo diario o 1 porción chica + 2 unidades de huevo diario',
        '> 2 porciones chicas sin desechos diario o > 4 unidades huevo diario o > 1 porción chica + 2 unidades de huevo diario',
      ],
      [
        '2 porciones medianas o 2 latas /semana',
        '1 porción mediana o 1 lata/semana',
        '< 1 porción mediana o 1 lata/semana',
      ],
      [
        '10 mariposas nueces o 20 almendras o 2 cdas soperas al día de semillas o maníes',
        '5 mariposas nueces o 10 almendras o 1 cda sopera al día de semillas o maníes',
        '< 5 mariposas nueces o 10 almendras o 1 cda sopera al día de semillas o maníes',
      ],
      [
        '2 cucharadas soperas al día',
        '1 cucharada sopera al día',
        '< 1 cucharada sopera alday',
      ]
    ], // Fin de 9 a 14 años
    // De 15 a 18 años
    [
      [
        '2 plato por semana',
        '1 plato por semana',
        '< 1 plato por semana',
      ],
      [
        '1/2 plato diario cocido por día o 3/4 plato crudo por día o 6 unidades medianas por semana',
        '1/4 plato cocido por día o 1/2 plato crudo por día o 3 unidades medianas por semana',
        '< 1/4 plato cocido por día o < 1/2 plato crudo por día o < 3 unidades medianas por semana',
      ],
      [
        '2 platos por semana o 1 plato + 2 medallones por semana',
        '1 plato por semana o 1/2 plato + 1 medallón por semana',
        '< 1 plato por semana o < 1/2 plato + 1 medallón por semana',
      ],
      [
        'hasta 6 unidades chicas /sem o 3 unidades grandes/sem o 1/2 plato diario',
        'hasta 9 unidades/sem o 5 unidades grandes/sem o 1 plato diario',
        '>  9 unidades/sem o > 5 unidades grandes/sem o > 1 plato diario',
      ],
      [
        '1 unidad mediana diaria o 3/4 plato crudo diario o 1/2 plato cocido diario',
        '1 unidad chica diaria o 1/2 plato crudo diario o 1/4 plato cocido diario',
        '< 1 unidad chica diaria o 1/2 plato crudo diario o 1/4 plato cocido diario',
      ],
      [
        '2 unidades grandes por día o 4 unidades chicas  por día',
        '1 unidad grande por día o 2 unidades chicas por día',
        '< 1 unidad grande por día o 2 unidades chicas por día',
      ],
      [
        '3 rodajas al día o 2 mignones chicos',
        '6 rodajas al día o 4 mignones chico o 2 flautas chicas',
        '> 6 rodajas al día o > 4 mignones chicos o > 2 flautas chicas',
      ],
      [
        '1/2 plato al día de pasta integral  o 1 y 1/2 porciones de masa diaria',
        '1 plato al día o 3 porciones de masa diaria',
        '> 1 plato al día o > 3 porciones de masa diaria',
      ],
      [
        '1/2 plato al día de pasta integral  o 1 y 1/2 porciones de masa diaria',
        '1 plato al día o 3 porciones de masa diaria',
        '> 1 plato al día o > 3 porciones de masa diaria',
      ],
      [
        '2 tazas tipo desayuno',
        '1 taza tipo desayuno',
        '< 1 taza tipo desayuno',
      ],
      [
        '1 porción tamaño cajita de fósforos chica o 1/2 tarjeta SUBE o 2 cdas soperas',
        '1 porción tamaño dado o 1 cda sopera',
        '< 1 porción tamaño dado o < 1 cda sopera',
      ],
      [
        '1 porción mediana sin desecho diaria o hasta 3 unidades de huevo diario o 1 porción chica + 2 huevos diarios',
        '2 porciones chicas sin desechos diario o hasta 4 unidades de huevo o 1 porción mediana + 2 unidades de huevo',
        '> 2 porciones chicas sin desechos diario o hasta 4 unidades de huevo diario o 1 porción mediana + 2 unidades de huevo',
      ],
      [
        '2 porciones grandes por semana o 2 latas /semana o 1/3 plato pescados enlatados por semana',
        '1 porción mediana por semana o 1 lata/semana o 1/4 plato por semana',
        '< 1 porción mediana por semana o 1 lata/semana o 1/4 plato por semana',
      ],
      [
        '10 mariposas nueces al día o 20 almendras al día o 2 cdas soperas al día de semillas o maníes',
        '5 mariposas nueces al día o 10 almendras al día o 1 cda sopera al día de semillas o maníes',
        '< 5 mariposas nueces al día o 10 almendras al día o 1 cda sopera al día de semillas o maníes',
      ],
      [
        '3 cucharadas soperas al día',
        '1 cucharada sopera al día',
        '< 1 cucharada sopera al día',
      ],
    ],
  ]
];
