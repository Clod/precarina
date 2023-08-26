import 'package:localization/localization.dart';
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
  "Vegetales verdes".i18n(),
  "Vegetales rojos/naranjas".i18n(),
  "Legumbres".i18n(),
  "Tubérculos (papa, batata, mandioca)".i18n(),
  "Otros vegetales".i18n(),
  "Frutas".i18n(),
  "Pan".i18n(),
  "Pastas y masas integrales: masa: pizza, tarta, empanada, canelon, masa de taco.".i18n(),
  "Pastas y masas refinadas (No integrales)".i18n(),
  "Lácteos (leche, yogur) parcialmente descremados".i18n(),
  "Quesos semidescremados untables o semisólidos (port salut, muzzarella)".i18n(),
  "Carnes rojas, ave y huevo por día".i18n(),
  "Pescados".i18n(),
  "Frutos secos y semillas".i18n(),
  "Aceites".i18n()
];

List<List<List<List<String>>>> opciones = [
// femenino
  [
// Cinco a ocho
    [
// green vegetables
      [
        "1 pl per wk".i18n(),
        "1/2 pl per wk".i18n(),
        "LT 1/2 pl per wk".i18n(),
      ],
      [
        "3 pls per wk or 1 sm u dy".i18n(),
        "1 pl per wk".i18n(),
        "LT 1 pl per wk".i18n(),
      ],
      [
        "1/2 pl per wk or 2 sm medallions per wk".i18n(),
        "1/4 pl per wk or 1 sm medallion per wk".i18n(),
        "LT 1/4 pl per wk or LT 1 sm medallion per wk".i18n(),
      ],
      [
        "1/2 sm u dy or 1/4 pl dy or 3 sm us per wk".i18n(),
        "1 sm u dy or 1/2 pl dy or 3 med us per wk".i18n(),
        "MT 1 sm u dy or MT 1/2 pl dy or MT 3 med us per wk".i18n(),
      ],
      [
        "3 med us per wk or 1/3 raw pl dy or 1/4 cooked pl dy".i18n(),
        "1 med u per wk or 1/4 raw pl dy or 1/4 cooked pl 4 times/wk".i18n(),
        "LT 1 med u per wk or LT 1/4 raw pl dy or LT 1/4 cooked pl 4 times/wk".i18n(),
      ],
      [
        "1 med u dy or 2 sm us dy".i18n(),
        "1 sm u dy".i18n(),
        "LT 1 sm u dy".i18n(),
      ],
      [
        "1 slice of bread or 1 sm mignon or 3 water crackers".i18n(),
        "2 slices of sand bread or 2 sm mignons or 6 water crackers".i18n(),
        "MT 2 slices of sand bread or MT 2 sm mignons or MT 6 water crackers".i18n(),
      ],
      [
        "1/4 pl dy or 1 serv of dough dy".i18n(),
        "1/2 pl dy or 2 servs of dough dy".i18n(),
        "MT 1/2 pl dy or MT 2 servs of dough dy".i18n(),
      ],
      [
        "1/4 pl dy or 1 serv of dough dy".i18n(),
        "1/2 pl per day or 2 servs of dough".i18n(),
        "MT 1/2 pl per day or MT 2 servs of dough per day".i18n(),
      ],
      [
        "3/4 cup breakfast type dy or 2 cups tea type dy".i18n(),
        "1/2 cup breakfast type dy or 1 cup tea type dy".i18n(),
        "LT 1/2 cup breakfast type dy or LT 1 cup tea type dy".i18n(),
      ],
      [
        "1 serv the sz of a sm matchbox or sz of 1/2 SUBE card or 2 tbsp".i18n(),
        "1/2 serv the sz of a sm matchbox or 1 die or 1 tbsp".i18n(),
        "LT 1/2 serv the sz of a sm matchbox or LT 1 die or LT 1 tbsp".i18n(),
      ],
      [
        "1/2 med steak per day or 1 and 1/2 eggs dy or 1 med minced meat".i18n(),
        "1 med steak dy or up to 2 egg us dy or 1 serv the sz of a slice of veal + 1 egg dy".i18n(),
        "MT 1 med steak dy or MT 2 egg us dy or MT 1 serv the sz of a slice of veal + 1 egg dy".i18n(),
      ],
      [
        "1 med serv per wk or 1 can per wk".i18n(),
        "1 sm serv per wk or 1/2 can per wk".i18n(),
        "LT 1 sm serv per wk or LT 1/2 can per wk".i18n(),
      ],
      [
        "4 walnut halves or 8 almonds or 1 tbsp of seeds or peanuts dy".i18n(),
        "2 walnut halves or 4 almonds or 1 teaspoon of seeds or peanuts dy".i18n(),
        "LT 2 walnut halves or LT 4 almonds or LT 1 teaspoon of seeds or peanuts dy".i18n(),
      ],
      [
        "2 tbsp dessert type dy".i18n(),
        "1 tbsp dessert type dy".i18n(),
        "LT 1 tbsp dessert type dy".i18n(),
      ],
    ], //Fin 5 a 8 años
// 9 a 13 años
    [
      [
        "1 and 1/2 pl per wk".i18n(),
        "1 pl per wk".i18n(),
        "LT 1 pl per wk".i18n(),
      ],
      [
        "4 pls per wk".i18n(),
        "2 pls per wk".i18n(),
        "LT 2 pls per wk".i18n(),
      ],
      [
        "1 pl per wk or 1/2 pl + 1 medallion per wk".i18n(),
        "1/2 pl per wk or 1/4 pl + 1 medallion per wk".i18n(),
        "LT 1/2 pl per wk or 1/4 pl + 1 medallion per wk".i18n(),
      ],
      [
        "1/3 pl dy or up to 3 med us per wk".i18n(),
        "1/2 pl or up to 5 sm us per wk".i18n(),
        "MT 1/2 pl or MT 5 sm us per wk".i18n(),
      ],
      [
        "4 med us per wk or 1/2 raw pl dy or 1/4 cooked pl dy".i18n(),
        "2 med us per wk or 1/4 pl dy".i18n(),
        "LT 2 med us per wk or 1/4 pl dy".i18n(),
      ],
      [
        "1 and 1/2 large u per day or 2 med us per day".i18n(),
        "1 med u per day".i18n(),
        "LT 1 med u per day".i18n(),
      ],
      [
        "up to 2 slices of bread per day or 2 sm mignons or 6 water biscuits".i18n(),
        "3 slices of bread per day or 3 sm mignons or 9 water biscuits".i18n(),
        "MT 3 slices of bread per day or MT 3 sm mignons or MT 9 water biscuits".i18n(),
      ],
      [
        "1/4 pl of whole wheat pasta per day or 1 portion of dough".i18n(),
        "1/2 pl per day or 2 port of dough".i18n(),
        "MT 1/2 pl per day or 2 port of dough".i18n(),
      ],
      [
        "1/4 pl of whole wheat pasta per day or 1 portion of dough".i18n(),
        "1/2 pl per day or 2 port of dough".i18n(),
        "MT 1/2 pl per day or MT 2 port of dough per day".i18n(),
      ],
      [
        "2 teacups".i18n(),
        "1 teacup dy".i18n(),
        "LT 1 teacup dy".i18n(),
      ],
      [
        "1 port the sz of a sm matchbox or half the sz of a SUBE card or 2 tbsp dy".i18n(),
        "1 port the sz of a dice or 1 tbsp dy".i18n(),
        "LT 1 port the sz of a dice or LT 1 tbsp dy".i18n(),
      ],
      [
        "1 sm port without waste dy or up to 2 egg us dy or 1 port the sz of a slice of beef + 1 egg dy".i18n(),
        "2 sm ports without waste dy or up to 4 egg us dy or 1 sm port + 2 egg us".i18n(),
        "MT 2 sm ports without waste dy or MT 4 egg us dy or MT 1 sm port + 2 egg us".i18n(),
      ],
      [
        "2 med port or 2 cans per wk".i18n(),
        "1 med portion or 1 can per wk".i18n(),
        "LT 1 med portion or 1 can per wk".i18n(),
      ],
      [
        "8 walnut halves or 15 almonds or 2 dessert tbsp of seeds or peanuts per day".i18n(),
        "4 walnut halves or 8 almonds or 1 tbsp dy of seeds or peanuts".i18n(),
        "LT 4 walnut halves or LT 8 almonds or LT 1 tbsp dy of seeds or peanuts".i18n(),
      ],
      [
        "2 tbsp dy".i18n(),
        "1 tbsp dy".i18n(),
        "LT 1 tbsp dy".i18n(),
      ],
    ],
// 14 a 18 años
    [
      [
        "1 and 1/2 dish per wk".i18n(),
        "1 dish per wk".i18n(),
        "LT 1 dish per wk".i18n(),
      ],
      [
        "5 dishes per wk".i18n(),
        "3 dishes per wk".i18n(),
        "LT 3 dishes per wk".i18n(),
      ],
      [
        "1 and 1/2 dish per wk or 1 dish + 1 medallion per wk".i18n(),
        "1 dish per wk or 1/2 dish + 1 medallion per wk".i18n(),
        "LT 1 dish per wk or 1/2 dish + 1 medallion per wk".i18n(),
      ],
      [
        "1/2 dish dy or up to 5 sm us per wk".i18n(),
        "3/4 dish dy or sm u every day".i18n(),
        "MT 3/4 dish dy or sm u every day".i18n(),
      ],
      [
        "5 med us per wk or 1/2 raw dish dy or 1/4 cooked dish dy".i18n(),
        "2 and 1/2 med us per wk or 1/3 raw dish dy or 1/4 cooked dish".i18n(),
        "LT 2 and 1/2 med us per wk or 1/3 raw dish dy or 1/4 cooked dish".i18n(),
      ],
      [
        "1 and 1/2 large u per day or 2 med us per day".i18n(),
        "1 med u per day".i18n(),
        "LT 1 med u per day".i18n(),
      ],
      [
        "up to 2 slices of bread per day or 2 sm mignons or 6 water biscuits".i18n(),
        "3 slices of bread per day or 3 sm mignons or 9 water biscuits".i18n(),
        "MT 3 slices of bread per day or MT 3 sm mignons or MT 9 water biscuits".i18n(),
      ],
      [
        "1/2 dish of pasta per day or 2 servs of dough per day".i18n(),
        "3/4 dish per day or 2 servs of dough per day".i18n(),
        "MT 3/4 dish per day or MT 2 servs per day".i18n(),
      ],
      [
        "1/2 dish per day or 2 servs of dough per day".i18n(),
        "3/4 dish per day or 3 servs of dough per day".i18n(),
        "MT 3/4 dish per day or MT 3 servs of dough per day".i18n(),
      ],
      [
        "2 breakfast cup sz dy".i18n(),
        "1 breakfast cup sz dy".i18n(),
        "LT 1 breakfast cup sz dy".i18n(),
      ],
      [
        "1 port, the sz of a sm matchbox or 1/2 SUBE card or 2 tbsp dy".i18n(),
        "1 port, the sz of a dice or 1 tbsp dy".i18n(),
        "LT 1 port, the sz of a dice or LT 1 tbsp dy"
      ],
      [
        "1 sm port without waste dy or up to 2 egg us or 1/2 sm port + 1 egg".i18n(),
        "2 sm ports without waste dy or up to 4 egg us dy or 1 sm port + 2 egg us".i18n(),
        "MT 2 sm ports without waste dy or MT 4 egg us dy or MT 1 sm port + 2 egg us".i18n(),
      ],
      [
        "2 med port or 2 cans per wk".i18n(),
        "1 med portion or 1 can per wk".i18n(),
        "LT 1 med portion or 1 can per wk".i18n(),
      ],
      [
        "10 walnut halves or 20 almonds or 2 tbsp per day of seeds or peanuts".i18n(),
        "5 walnut halves or 10 almonds or 1 tbsp per day of seeds or peanuts".i18n(),
        "LT 5 walnut halves or LT 10 almonds or LT 1 tbsp per day of seeds or peanuts".i18n(),
      ],
      [
        "2 tbsp per day".i18n(),
        "1 tbsp per day".i18n(),
        "LT 1 tbsp per day".i18n(),
      ],
    ],
  ], // Fin femenino
// Masculino
  [
// De 5 a 8 años
    [
      [
        "1 pl per wk".i18n(),
        "1/2 pl per wk".i18n(),
        "LT 1/2 pl per wk".i18n(),
      ],
      [
        "3 pls per wk or 1 sm u per day".i18n(),
        "1 and 1/2 pls per wk or 1 sm u every other day".i18n(),
        "LT 1 and 1/2 pls per wk or LT 1 sm u every other day".i18n(),
      ],
      [
        "1/2 pl per wk or 1/4 pl + 1 medallion per wk".i18n(),
        "1/4 pl per wk or 1 sm medallion per wk".i18n(),
        "LT 1/4 pl per wk or LT 1 sm medallion per wk".i18n(),
      ],
      [
        "1/2 sm u per day or 1/4 pl per day or 3 sm us per wk".i18n(),
        "1 sm u per day or 1/2 pl per day or 3 med us per wk".i18n(),
        "MT 1 sm u per day or MT 1/2 pl per day or MT 3 med us per wk".i18n(),
      ],
      [
        "3 med us per wk or 1/3 raw pl or 1/4 cooked pl".i18n(),
        "1 med u per wk or 1/4 raw pl per day or 1/4 pl 4 times/wk".i18n(),
        "LT 1 med u per wk or 1/4 raw pl per day or 1/4 pl 4 times/wk".i18n(),
      ],
      [
        "2 med us per day".i18n(),
        "1 med u per day".i18n(),
        "LT 1 med u per day".i18n(),
      ],
      [
        "up to 1 slice per day or 1 sm mignon per day".i18n(),
        "2 slices per day or 2 sm mignons per day".i18n(),
        "MT 2 slices per day or MT 2 sm mignons per day".i18n(),
      ],
      [
        "1/4 pl per day of whole wheat pasta or 1 serv of dough per day".i18n(),
        "1/2 pl per day or 2 servs of dough per day".i18n(),
        "MT 1/2 pl per day or MT 2 servs per day".i18n(),
      ],
      [
        "1/4 pl per day of whole wheat pasta or 1 serv of dough per day".i18n(),
        "1/2 pl per day or 2 servs of dough per day".i18n(),
        "MT 1/2 pl per day or MT 2 servs per day".i18n(),
      ],
      [
        "3/4 cup for breakfast dy or 2 tea cups dy".i18n(),
        "1/2 cup for breakfast or 1 tea cup dy".i18n(),
        "LT 1/2 cup for breakfast or LT 1 tea cup".i18n(),
      ],
      [
        "1 portion the sz of a sm matchbox or 1/2 SUBE card or 2 tbsp".i18n(),
        "1 portion the sz of a die".i18n(),
        "LT 1 portion the sz of a die".i18n(),
      ],
      [
        "1 sm port without waste 5 times/wk or 1/2 sm port + 1 egg dy".i18n(),
        "1 med port without waste dy or 1 sm port + 1 egg dy".i18n(),
        "MT 1 med port without waste dy or 1 sm port + 1 egg dy".i18n(),
      ],
      [
        "2 sm port per wk or 1 and 1/2 cans/wk".i18n(),
        "1 sm portion per wk or 1 can/wk".i18n(),
        "LT 1 sm portion per wk or 1 can/wk".i18n(),
      ],
      [
        "6 walnut halves or 10 almonds or 1 tbsp dy of seeds or peanuts".i18n(),
        "3 walnut halves or 5 almonds or 1/2 tbsp dy of seeds or peanuts".i18n(),
        "LT 3 walnut halves or 5 almonds or 1/2 tbsp dy of seeds or peanuts".i18n(),
      ],
      [
        "2 dessert spoons per day".i18n(),
        "1 dessert spoon per day".i18n(),
        "LT 1 dessert spoon per day".i18n(),
      ],
    ], // End of 5 to 8 years
// From 9 to 14 years
    [
      [
        "1 and 1/2 pls per wk".i18n(),
        "1 pl per wk".i18n(),
        "LT 1 pl per wk".i18n(),
      ],
      [
        "5 and 1/2 pls per wk or 1 med u per day or 3/4 pl per day".i18n(),
        "3 pls per wk or 1 sm u per day or 1/3 pl per day".i18n(),
        "LT 3 pls per wk or LT 1 dy u or LT 1/3 pl per day".i18n(),
      ],
      [
        "1 and 1/2 pls per wk or 1/2 pl 3 times per wk or 1 medallion per day".i18n(),
        "1 pl per wk or 1/2 pl per wk or 1 medallion 3 times per wk".i18n(),
        "LT 1 pl per wk or LT 1/2 pl per wk or LT 1 medallion 3 times per wk".i18n(),
      ],
      [
        "1 sm u per day or 3 med us per wk or 1/3 pl per day".i18n(),
        "1 med u per day or 3 large us per wk or 3/4 pl per day".i18n(),
        "MT 1 med u per day or MT 3 large us per wk or MT 3/4 pl per day".i18n(),
      ],
      [
        "5 med us per wk or 1/2 raw pl dy or 1/4 cooked pl dy".i18n(),
        "2  1/2 med us per wk or 1/3 raw pl dy or 1/4 cooked pl".i18n(),
        "LT 2  1/2 med us per wk or LT 1/3 raw pl dy or LT 1/4 cooked pl".i18n(),
      ],
      [
        "1  1/2 large u per day or 2 med us per day or 3 sm us".i18n(),
        "1 med u per day or 2 sm us".i18n(),
        "LT 1 med u per day or LT 2 sm us per day".i18n(),
      ],
      [
        "up to 2 mold type slices per day or 2 sm mignons per day".i18n(),
        "3 mold type slices per day or 3 sm mignons per day".i18n(),
        "MT 3 mold type slices per day or MT 3 sm mignons per day".i18n(),
      ],
      [
        "1/4 pl of whole wheat pasta per day or 1 serv of dough".i18n(),
        "1/2 pl per day or 2 servs of dough".i18n(),
        "MT 1/2 pl per day or MT 2 servs per day".i18n(),
      ],
      [
        "1/4 pl of whole wheat pasta per day or 1 serv of dough".i18n(),
        "1/2 pl per day or 2 servs of dough".i18n(),
        "MT 1/2 pl per day or MT 2 servs per day".i18n(),
      ],
      [
        "2 breakfast type cups".i18n(),
        "1 breakfast type cup".i18n(),
        "LT 1 breakfast type cup".i18n(),
      ],
      [
        "1 sm matchbox sz port or 1/2 SUBE card or 2 tbsp dy".i18n(),
        "1 dice sz port or 1 tbsp dy".i18n(),
        "LT 1 dice sz port or LT 1 tbsp dy".i18n(),
      ],
      [
        "1 sm port without waste dy or up to 2 egg us dy or 1 slice sz port of peceto + 1 egg dy".i18n(),
        "2 sm ports without waste dy or up to 4 egg us dy or 1 sm port + 2 egg us dy".i18n(),
        "MT 2 sm ports without waste dy or MT 4 egg us dy or MT 1 sm port + 2 egg us dy".i18n(),
      ],
      [
        "2 med port or 2 cans per wk".i18n(),
        "1 med portion or 1 can per wk".i18n(),
        "LT 1 med portion or 1 can per wk".i18n(),
      ],
      [
        "10 walnut halves or 20 almonds or 2 tbsp dy of seeds or peanuts".i18n(),
        "5 walnut halves or 10 almonds or 1 tbsp dy of seeds or peanuts".i18n(),
        "LT 5 walnut halves or 10 almonds or 1 tbsp dy of seeds or peanuts".i18n(),
      ],
      [
        "2 tbsp dy".i18n(),
        "1 tbsp dy".i18n(),
        "LT 1 tbsp dy".i18n(),
      ]
    ], // Fin de 9 a 14 años
// De 15 a 18 años
    [
      [
        "2 pls per wk".i18n(),
        "1 pl per wk".i18n(),
        "LT 1 pl per wk".i18n(),
      ],
      [
        "1/2 pl cooked dy or 3/4 pl raw dy or 6 med us per wk".i18n(),
        "1/4 pl cooked dy or 1/2 pl raw dy or 3 med us per wk".i18n(),
        "LT 1/4 pl cooked dy or LT 1/2 pl raw dy or LT 3 med us per wk".i18n(),
      ],
      [
        "2 pls per wk or 1 pl + 2 medallions per wk".i18n(),
        "1 pl per wk or 1/2 pl + 1 medallion per wk".i18n(),
        "LT 1 pl per wk or LT 1/2 pl + 1 medallion per wk".i18n(),
      ],
      [
        "up to 6 sm us/wk or 3 large us/wk or 1/2 pl dy".i18n(),
        "up to 9 us/wk or 5 large us/wk or 1 pl dy".i18n(),
        "MT  9 us/wk or MT 5 large us/wk or MT 1 pl dy".i18n(),
      ],
      [
        "1 med u dy or 3/4 pl raw dy or 1/2 pl cooked dy".i18n(),
        "1 sm u dy or 1/2 pl raw dy or 1/4 pl cooked dy".i18n(),
        "LT 1 sm u dy or 1/2 pl raw dy or 1/4 pl cooked dy".i18n(),
      ],
      [
        "2 large us per day or 4 sm us per day".i18n(),
        "1 large u per day or 2 sm us per day".i18n(),
        "LT 1 large u per day or 2 sm us per day".i18n(),
      ],
      [
        "3 slices per day or 2 sm medallions".i18n(),
        "6 slices per day or 4 sm medallions or 2 sm flutes".i18n(),
        "MT 6 slices per day or MT 4 sm medallions or MT 2 sm flutes".i18n(),
      ],
      [
        "1/2 pl of whole wheat pasta per day or 1 and 1/2 port of dough per day".i18n(),
        "1 pl per day or 3 port of dough per day".i18n(),
        "MT 1 pl per day or MT 3 port of dough per day".i18n(),
      ],
      [
        "1/2 pl of whole wheat pasta per day or 1 and 1/2 port of dough per day".i18n(),
        "1 pl per day or 3 port of dough per day".i18n(),
        "MT 1 pl per day or MT 3 port of dough per day".i18n(),
      ],
      [
        "2 breakfast cups".i18n(),
        "1 breakfast cup".i18n(),
        "LT 1 breakfast cup".i18n(),
      ],
      [
        "1 portion the sz of a sm matchbox or 1/2 SUBE card or 2 tbsp".i18n(),
        "1 portion the sz of a dice or 1 tbsp".i18n(),
        "LT 1 portion the sz of a dice or LT 1 tbsp".i18n(),
      ],
      [
        "1 med port without waste dy or up to 3 eggs dy or 1 sm port + 2 eggs dy".i18n(),
        "2 sm ports without waste dy or up to 4 eggs or 1 med port + 2 eggs".i18n(),
        "MT 2 sm ports without waste dy or up to 4 eggs dy or 1 med port + 2 eggs".i18n(),
      ],
      [
        "2 large port per wk or 2 cans/wk or 1/3 pl of canned fish per wk".i18n(),
        "1 med portion per wk or 1 can/wk or 1/4 pl per wk".i18n(),
        "LT 1 med portion per wk or 1 can/wk or 1/4 pl per wk".i18n(),
      ],
      [
        "10 walnut halves per day or 20 almonds per day or 2 tbsp per day of seeds or peanuts".i18n(),
        "5 walnut halves per day or 10 almonds per day or 1 tbsp per day of seeds or peanuts".i18n(),
        "LT 5 walnut halves per day or 10 almonds per day or 1 tbsp per day of seeds or peanuts".i18n(),
      ],
      [
        "3 tbsp per day".i18n(),
        "1 tbsp per day".i18n(),
        "LT 1 tbsp per day".i18n(),
      ]
    ],
  ]
];


/*
List<List<List<List<String>>>> opciones = [
  // femenino
  [
    // Cinco a ocho
    [
      // vegetales verdes
      [
        "1 plato por semana",
        "1/2 plato por semana",
        "< 1/2 plato por semana",
      ],
      [
        "3 platos por semana o 1 unidad chica diaria",
        "1 platos por semana",
        "< 1 platos por semana",
      ],
      [
        "1/2 plato por semana o 2 medallones chicos por semana",
        "1/4 plato por semana o 1 medallón chico por semana",
        "< 1/4 plato por semana o < 1 medallón chico por semana",
      ],
      [
        "1/2 unidad chica diaria o 1/4 plato diario o 3 unidades chicas por semana",
        "1 unidad chica diaria o 1/2 plato diario o 3 unidades medianas por semana",
        "> 1 unidad chica diaria o > 1/2 plato diario o > 3 unidades medianas por semana",
      ],
      [
        "3 unidades medianas semanales o 1/3 plato crudo diario o 1/4 plato cocido diario",
        "1 unidad mediana semanal o 1/4 plato crudo diario o 1/4 plato cocido 4 veces/sem",
        "< 1 unidad mediana semanal o  < 1/4 plato crudo diario o < 1/4 plato cocido 4 veces/sem",
      ],
      [
        "1 unidad mediana diaria o 2 unidades chicas diaria",
        "1 unidad chica diaria",
        "< 1 unidad chia diaria",
      ],
      [
        "1 rodaja de pan o 1 mignon chico o 3 galletitas de agua",
        "2 rodajas de pan de molde o 2 mignones chicos o 6 galletitas de agua",
        "> 2 rodajas de pan de molde o > 2 mignones chicos o > 6 galletitas de agua",
      ],
      [
        "1/4 plato diario o 1 porción de masa diario",
        "1/2 plato diario o 2 porciones de masa diario",
        "> 1/2 plato diario o > 2 porciones de masa diario",
      ],
      [
        "1/4 plato diario o 1 porción de masa diario",
        "1/2 plato al día o 2 porciones de masa",
        "> 1/2 plato al día  o > 2 porciones de masa al día",
      ],
      [
        "3/4 tz tipo desayuno diario o 2 tazas tipo té diario",
        "1/2 taza tipo desayuno diario o 1 taza tipo té diario",
        "< 1/2 taza tipo desayuno diario o < 1 taza tipo té diario",
      ],
      [
        "1 porción tamaño cajita de fósforo chica o tamaño 1/2 tarjeta SUBE o 2 cdas tipo soperas",
        "1/2 porción tamaño cajita de fósforo chica o 1 dado o 1 cda sopera",
        "< 1/2 porción tamaño cajita de fósforo chica o < 1 dado o < 1 cda sopera",
      ],
      [
        "1/2 bife mediano por día o 1 y 1/2 huevo diario o 1 emincé mediano",
        "1 bife mediano diario o hasta 2 unidades de huevo diario o 1 porción tamaño rodaja de peceto + 1 huevo diario",
        "> 1 bife mediano diario o > 2 unidades de huevo diario o > 1 porción tamaño rodaja de peceto + 1 huevo diario",
      ],
      [
        "1 porción mediana por semana o 1 lata por semana",
        "1 porción chica por semana o 1/2 lata por semana",
        "< 1 porción chica por semana o < 1/2 lata por semana",
      ],
      [
        "4 mariposas nueces u 8 almendras o 1 cda sopera de semillas o maníes en forma diaria",
        "2 mariposas o 4 almendras o 1 cdta tipo té de semillas o maníes en forma diaria",
        "< 2 mariposas o < 4 almendras o < 1 cdta tipo té de semillas o maníes en forma diaria",
      ],
      [
        "2 cdas tipo postre diaria",
        "1 cda tipo postre diaria",
        "< 1 cda tipo postre diaria",
      ],
    ], // Fin 5 a 8 años
    // 9 a 13 años
    [
      [
        "1 y 1/2 plato por semana",
        "1 plato por semana",
        "< 1 plato por semana",
      ],
      [
        "4  platos por semana",
        "2 platos por semana",
        "< de 2 platos por semana",
      ],
      [
        "1  plato por semana o 1/2 plato + 1 medallón por semana",
        "1/2 plato por semana o 1/4 plato + 1 medallón por semana",
        "< 1/2 plato por semana o 1/4 plato + 1 medallón por semana",
      ],
      [
        "1/3 plato diario o hasta 3 unidades medianas/sem",
        "1/2 plato o hasta 5 unidades chicas por semana",
        "> 1/2 plato o > 5 unidades chicas por semana",
      ],
      [
        "4 unidades medianas por semana o 1/2 plato crudo diario o 1/4 plato cocido diario",
        "2  unidades medianas por semana o 1/4 plato diario",
        "< 2  unidades medianas por semana o 1/4 plato diario",
      ],
      [
        "1 1/2 unidad grande por día o 2 unidades medianas por día",
        "1 unidad mediana por día",
        "< 1 unidad mediana por día",
      ],
      [
        "hasta 2 rodajas pan de molde al día o 2 mignones chicos o 6 galletitas de agua",
        "3 rodajas pan de molde al día o 3 mignones chicos o 9 galletitas de agua",
        "> 3 rodajas de pan de molde al día o > 3 mignones chicos o > 9 galletitas de agua",
      ],
      [
        "1/4 plato al día de pasta integral  o 1 porción de masa",
        "1/2 plato al día o 2 porciones de masa",
        "> 1/2 plato al día  o 2  porcion de masa",
      ],
      [
        "1/4 plato al día de pasta integral  o 1 porción de masa",
        "1/2 plato al día o 2 porciones de masa",
        "> 1/2 plato al día  ó > 2 porciones de masa al día",
      ],
      [
        "2 tazas tipo té",
        "1 taza tipo té diario",
        "< 1 taza tipo té diario",
      ],
      [
        "1 porción tamaño caja de fósforos chica o tamaño 1/2 tarjeta SUBE o 2 cdas soperas diaria",
        "1 porción tamaño dado o 1 cda sopera diaria",
        "< 1 porción tamaño dado o < 1 cda sopera diaria",
      ],
      [
        "1 porción chica sin desecho diario o hasta 2 unidades de huevo diario o 1 porción tamaño rodaja de peceto + 1 huevo diario",
        "2 porciones chicas sin desechos diario o hasta 4 unidades de huevo diario o 1 porción chica + 2 unidades de huevo",
        "> 2 porciones chicas sin desechos diario o > 4 unidades huevo diario o > 1 porción chica + 2 unidades de huevo",
      ],
      [
        "2 porciones medianas o 2 latas /semana",
        "1 porción mediana o 1 lata/semana",
        "< 1 porción mediana o 1 lata/semana",
      ],
      [
        "8 mariposas nueces o 15 almendras o 2 cdas postre al día de semillas o maníes",
        "4 mariposas nueces o 8 almendras o 1 cda sopera al día de semillas o maníes",
        "< 4 mariposas nueces o < 8 almendras o < 1 cda sopera al día de semillas o maníes",
      ],
      [
        "2 cucharadas soperas al día",
        "1 cucharada sopera al día",
        "< 1 cucharada sopera al día",
      ],
    ],
    // 14 a 18 años
    [
      [
        "1 y 1/2 plato por semana",
        "1 plato por semana",
        "< 1 plato por semana",
      ],
      [
        "5 platos por semana",
        "3 platos por semana",
        "< de 3 platos por semana",
      ],
      [
        "1 1/2 plato por semana o 1 plato + 1 medallón por semana",
        "1 plato por semana o 1/2 plato + 1 medallón por semana",
        "< 1 plato por semana o 1/2 plato + 1 medallón por semana",
      ],
      [
        "1/2 plato diario o hasta 5 unidades chicas /sem",
        "3/4 plato diario o unidad chica todos los dias",
        "> 3/4 plato diario o unidad chica todos los dias",
      ],
      [
        "5 unidades medianas por semana o 1/2 plato crudo diario o 1/4 plato cocido diario",
        "2 1/2 unidades medianas por semana o 1/3 plato crudo diario o 1/4 plato cocido",
        "< 2 1/2 unidades medianas por semana o 1/3 plato crudo diario o 1/4 plato cocido",
      ],
      [
        "1 1/2 unidad grande por día o 2 unidades medianas por día",
        "1 unidad mediana por día",
        "< 1 unidad mediana por día",
      ],
      [
        "hasta 2 rodajas de pan de molde al día o 2 mignones chicos o 6 galletitas de agua",
        "3 rodajas de pan de molde al día o 3 mignones chicos o 9 galletitas de agua",
        "> 3 rodajas pan de molde al díao > 3 mignones chicos o > 9 galletitas de agua",
      ],
      [
        "1/2 plato al día de pasta  o 2 porciones de masa al día",
        "3/4 plato al día o 2 porciones de masa al día",
        "> 3/4 plato al día o > 2 porciones al día",
      ],
      [
        "1/2 plato al día o 2 porciones de masa al día",
        "3/4 plato al día o 3 porciones de masa al día",
        "> 3/4 plato al día o > 3 porciones de masa al día",
      ],
      [
        "2 tazas tipo desayuno diario",
        "1 taza tipo desayuno diario",
        "< 1 taza tipo desayuno diario",
      ],
      [
        "1 porción tamaño cajita de fósforos chica o tamaño 1/2 tarjeta SUBE o 2 cdas soperas diaria",
        "1 porción tamaño dado o 1 cda sopera diaria",
        "< 1 porción tamaño dado o < 1 cda sopera diaria",
      ],
      [
        "1 porción chica sin desecho diario o hasta 2 unidades de huevo o 1/2 porción chica + 1 huevo",
        "2 porciones chicas sin desechos diario o hasta 4 unidades de huevo diario o 1 porción chica + 2 unidades de huevo",
        "> 2 porciones chicas sin desechos diario o > 4 unidades huevo diario o > 1 porción chica + 2 unidades de huevo",
      ],
      [
        "2 porciones medianas o 2 latas /semana",
        "1 porción mediana o 1 lata/semana",
        "< 1 porción mediana o 1 lata/semana",
      ],
      [
        "10 mariposas nueces o 20 almendras o 2 cdas soperas al día de semillas o maníes",
        "5 mariposas nueces o 10 almendras o 1 cda sopera al día de semillas o maníes",
        "< 5 mariposas nueces o < 10 almendras o < 1 cda sopera al día de semillas o maníes",
      ],
      [
        "2 cucharadas soperas al día",
        "1 cucharada sopera al día",
        "< 1 cucharada sopera al día",
      ],
    ], // fin 14 a 18 años",
  ], // Fin femenino
  // Masculino
  [
    // De 5 a 8 años
    [
      [
        "1 plato por semana",
        "1/2 plato por semana",
        "< 1/2 plato por semana",
      ],
      [
        "3 platos por semana o 1 unidad chica diaria",
        "1 y 1/2 platos por semana o 1 unidda chica dia por medio",
        "< de 1 y 1/2 platos por semana o < 1 unidad chica día por medio",
      ],
      [
        "1/2 plato por semana  o 1/4 plato + 1 medallón por semana",
        "1/4 plato por semana o 1 medallón chico por semana",
        "< 1/4 plato por semana o < 1 medallón chico por semana",
      ],
      [
        "1/2 unidad chica diaria o 1/4 plato diario o 3 unidades chicas por semana",
        "1 unidad chica diaria o 1/2 plato diario o 3 unidades medianas por semana",
        "> 1 unidad chica diaria o > 1/2 plato diario o > 3 unidades medianas por semana",
      ],
      [
        "3 unidades medianas semanales o 1/3 plato crudo o 1/4 plato cocido",
        "1  unidad mediana por semana o 1/4 plato crudo diario o 1/4 plato 4 veces/sem.",
        "< 1 unidad medians por semana o 1/4 plato crudo diario o 1/4 plato 4 veces/sem.",
      ],
      [
        "2 unidades medianas por día",
        "1 unidad mediana por día",
        "< 1 unidad mediana por día",
      ],
      [
        "hasta 1 rodaja tipo molde por día o 1 mignon chico por día",
        "2 rodajas al día o 2 mignones chicos por día",
        "> 2 rodajas al día o > 2 mignones chicos por día",
      ],
      [
        "1/4 plato al día de pasta integral  o 1 porción de masa diario",
        "1/2 plato al día o 2 porciones de masa diario",
        "> 1/2 plato al día  o > 2 porciones diario",
      ],
      [
        "1/4 plato al día de pasta integral  o 1 porción de masa diario",
        "1/2 plato al día o 2 porciones de masa diario",
        "> 1/2 plato al día  o > 2 porciones de masa diario",
      ],
      [
        "3/4 tz tipo desayuno diario o 2 tazas tipo té diario",
        "1/2 taza tipo desayuno o 1 taza tipo té diario",
        "< 1/2 taza tipo desayuno o < 1 taza tipo té",
      ],
      [
        "1 porción tamaño cajita de fósforos chica o 1/2 tarjeta SUBE o 2 cdas tipo soperas",
        "1 porción tamaño dado",
        "< 1 porción tamaño dado",
      ],
      [
        "1 porción chica sin desecho 5 veces/sem o  1/2 porción chica + 1/2 huevo diario",
        "1 porcion mediana sin desechos diario o  1 porción chica + 1 unidades de huevo diario",
        "> 1 porcion mediana sin desechos diario o  1 porción chica + 1 unidades de huevo diario",
      ],
      [
        "2 porciones chicas por semana o 1 y 1/2 latas /semana",
        "1 porción chica por semana o 1 lata/semana",
        "< 1 porción chica por semana o 1 lata/semana",
      ],
      [
        "6 mariposas nueces o 10 almendras o 1 cdas soperas al día de semillas o maníes",
        "3 mariposas nueces o 5 almendras o 1/2 cda sopera al día de semillas o maníes",
        "< 3 mariposas nueces o 5 almendras o 1/2 cda sopera al día de semillas o maníes",
      ],
      [
        "2 cucharadas de postre al día",
        "1 cucharada de postre al día",
        "< 1 cucharada de postre al día",
      ],
    ], // Fin de 5 a 8 años
    // De 9 a 14 años
    [
      [
        "1 y 1/2 plato por semana",
        "1 plato por semana",
        "< 1 plato por semana",
      ],
      [
        "5 1/2 platos por semana o 1 unidad mediana por día o 3/4 plato por día",
        "3 platos por semana o 1 unidad chica por día o 1/3 plato por día",
        "< de 3 platos por semana o < 1 unidad diaria o < 1/3 plato por día",
      ],
      [
        "1 1/2 plato por semana o 1/2 plato 3 veces por semana o 1 medallón por día",
        "1 plato por semana o 1/2 plato por semana o 1 medallón 3 veces por semana",
        "< 1 plato por semana o < 1/2 plato por semana o < 1 medallón 3 veces por semana",
      ],
      [
        "1 unidad chica diaria o 3 unidades medianas por semana o 1/3 plato diario",
        "1 unidad mediana diaria o 3 unidades grandes por semana o 3/4 plato diaria",
        "> 1 unidad mediana diaria o > 3 unidades grandes por semana o > 3/4 plato diaria",
      ],
      [
        "5 unidades medianas por semana o 1/2 plato crudo diario o 1/4 plato cocido diario",
        "2  1/2 unidades medianas por semana o 1/3 plato crudo diario o 1/4 plato cocido",
        "< 2  1/2 unidades medianas por semana o < 1/3 plato crudo diario o < 1/4 plato cocido",
      ],
      [
        "1  1/2 unidad grande por día o 2 unidades medianas por día o 3 unidades chicas",
        "1 unidad mediana por día o 2 unidades chicas",
        "< 1 unidad mediana por día o < 2 unidades chicas por día",
      ],
      [
        "hasta 2 rodajas tipo molde al día o 2 mignones chicos al día",
        "3 rodajas tipo molde al día o 3 mignones chicos al día",
        "> 3 rodajas tipo molde al día o > 3 mignones chicos al día",
      ],
      [
        "1/4 plato al día de pasta integral  o 1 porción de masa",
        "1/2 plato al día o 2 porciones de masa",
        "> 1/2 plato al día  o > 2 porciones al día ",
      ],
      [
        "1/4 plato al día de pasta integral  o 1 porción de masa",
        "1/2 plato al día o 2 porciones de masa",
        "> 1/2 plato al día  o > 2 porciones al día ",
      ],
      [
        "2 tazas tipo desayuno",
        "1 taza tipo desayuno",
        "< 1 taza tipo desayuno",
      ],
      [
        "1 porción tamaño cajita de fósforos chica o 1/2 tarjeta SUBE o 2 cdas soperas diaria",
        "1 porción tamaño dado o 1 cda sopera diaria",
        "< 1 porción tamaño dado o < 1 cda sopera diaria",
      ],
      [
        "1 porción chica sin desecho diario o hasta 2 unidades de huevo diario o 1porción tamaño rodaja  peceto + 1 huevo diario",
        "2 porciones chicas sin desechos diario o hasta 4 unidades de huevo diario o 1 porción chica + 2 unidades de huevo diario",
        "> 2 porciones chicas sin desechos diario o > 4 unidades huevo diario o > 1 porción chica + 2 unidades de huevo diario",
      ],
      [
        "2 porciones medianas o 2 latas /semana",
        "1 porción mediana o 1 lata/semana",
        "< 1 porción mediana o 1 lata/semana",
      ],
      [
        "10 mariposas nueces o 20 almendras o 2 cdas soperas al día de semillas o maníes",
        "5 mariposas nueces o 10 almendras o 1 cda sopera al día de semillas o maníes",
        "< 5 mariposas nueces o 10 almendras o 1 cda sopera al día de semillas o maníes",
      ],
      [
        "2 cucharadas soperas al día",
        "1 cucharada sopera al día",
        "< 1 cucharada sopera alday",
      ]
    ], // Fin de 9 a 14 años
    // De 15 a 18 años
    [
      [
        "2 plato por semana",
        "1 plato por semana",
        "< 1 plato por semana",
      ],
      [
        "1/2 plato diario cocido por día o 3/4 plato crudo por día o 6 unidades medianas por semana",
        "1/4 plato cocido por día o 1/2 plato crudo por día o 3 unidades medianas por semana",
        "< 1/4 plato cocido por día o < 1/2 plato crudo por día o < 3 unidades medianas por semana",
      ],
      [
        "2 platos por semana o 1 plato + 2 medallones por semana",
        "1 plato por semana o 1/2 plato + 1 medallón por semana",
        "< 1 plato por semana o < 1/2 plato + 1 medallón por semana",
      ],
      [
        "hasta 6 unidades chicas /sem o 3 unidades grandes/sem o 1/2 plato diario",
        "hasta 9 unidades/sem o 5 unidades grandes/sem o 1 plato diario",
        ">  9 unidades/sem o > 5 unidades grandes/sem o > 1 plato diario",
      ],
      [
        "1 unidad mediana diaria o 3/4 plato crudo diario o 1/2 plato cocido diario",
        "1 unidad chica diaria o 1/2 plato crudo diario o 1/4 plato cocido diario",
        "< 1 unidad chica diaria o 1/2 plato crudo diario o 1/4 plato cocido diario",
      ],
      [
        "2 unidades grandes por día o 4 unidades chicas  por día",
        "1 unidad grande por día o 2 unidades chicas por día",
        "< 1 unidad grande por día o 2 unidades chicas por día",
      ],
      [
        "3 rodajas al día o 2 mignones chicos",
        "6 rodajas al día o 4 mignones chico o 2 flautas chicas",
        "> 6 rodajas al día o > 4 mignones chicos o > 2 flautas chicas",
      ],
      [
        "1/2 plato al día de pasta integral  o 1 y 1/2 porciones de masa diaria",
        "1 plato al día o 3 porciones de masa diaria",
        "> 1 plato al día o > 3 porciones de masa diaria",
      ],
      [
        "1/2 plato al día de pasta integral  o 1 y 1/2 porciones de masa diaria",
        "1 plato al día o 3 porciones de masa diaria",
        "> 1 plato al día o > 3 porciones de masa diaria",
      ],
      [
        "2 tazas tipo desayuno",
        "1 taza tipo desayuno",
        "< 1 taza tipo desayuno",
      ],
      [
        "1 porción tamaño cajita de fósforos chica o 1/2 tarjeta SUBE o 2 cdas soperas",
        "1 porción tamaño dado o 1 cda sopera",
        "< 1 porción tamaño dado o < 1 cda sopera",
      ],
      [
        "1 porción mediana sin desecho diaria o hasta 3 unidades de huevo diario o 1 porción chica + 2 huevos diarios",
        "2 porciones chicas sin desechos diario o hasta 4 unidades de huevo o 1 porción mediana + 2 unidades de huevo",
        "> 2 porciones chicas sin desechos diario o hasta 4 unidades de huevo diario o 1 porción mediana + 2 unidades de huevo",
      ],
      [
        "2 porciones grandes por semana o 2 latas /semana o 1/3 plato pescados enlatados por semana",
        "1 porción mediana por semana o 1 lata/semana o 1/4 plato por semana",
        "< 1 porción mediana por semana o 1 lata/semana o 1/4 plato por semana",
      ],
      [
        "10 mariposas nueces al día o 20 almendras al día o 2 cdas soperas al día de semillas o maníes",
        "5 mariposas nueces al día o 10 almendras al día o 1 cda sopera al día de semillas o maníes",
        "< 5 mariposas nueces al día o 10 almendras al día o 1 cda sopera al día de semillas o maníes",
      ],
      [
        "3 cucharadas soperas al día",
        "1 cucharada sopera al día",
        "< 1 cucharada sopera al día",
      ],
    ],
  ]
];*/

/*List<List<List<List<String>>>> options = [
  // femenino
  [
    // Cinco a ocho
    [
      // green vegetables
      [
        "1 plate per week",
        "1/2 plate per week",
        "< 1/2 plate per week",
      ],
      [
        "3 plates per week or 1 small unit daily",
        "1 plate per week",
        "< 1 plate per week",
      ],
      [
        "1/2 plate per week or 2 small medallions per week",
        "1/4 plate per week or 1 small medallion per week",
        "< 1/4 plate per week or < 1 small medallion per week",
      ],
      [
        "1/2 small unit daily or 1/4 plate daily or 3 small units per week",
        "1 small unit daily or 1/2 plate daily or 3 medium units per week",
        "> 1 small unit daily or > 1/2 plate daily or > 3 medium units per week",
      ],
      [
        "3 medium units per week or 1/3 raw plate daily or 1/4 cooked plate daily",
        "1 medium unit per week or 1/4 raw plate daily or 1/4 cooked plate 4 times/week",
        "< 1 medium unit per week or < 1/4 raw plate daily or < 1/4 cooked plate 4 times/week",
      ],
      [
        "1 medium unit daily or 2 small units daily",
        "1 small unit daily",
        "< 1 small unit daily",
      ],
      [
        "1 slice of bread or 1 small mignon or 3 water crackers",
        "2 slices of sandwich bread or 2 small mignons or 6 water crackers",
        "> 2 slices of sandwich bread or > 2 small mignons or > 6 water crackers",
      ],
      [
        "1/4 plate daily or 1 serving of dough daily",
        "1/2 plate daily or 2 servings of dough daily",
        "> 1/2 plate daily or > 2 servings of dough daily",
      ],
      [
        "1/4 plate daily or 1 serving of dough daily",
        "1/2 plate per day or 2 servings of dough",
        "> 1/2 plate per day or > 2 servings of dough per day",
      ],
      [
        "3/4 cup breakfast type daily or 2 cups tea type daily",
        "1/2 cup breakfast type daily or 1 cup tea type daily",
        "< 1/2 cup breakfast type daily or < 1 cup tea type daily",
      ],
      [
        "1 serving the size of a small matchbox or size of 1/2 SUBE card or 2 tablespoons",
        "1/2 serving the size of a small matchbox or 1 die or 1 tablespoon",
        "< 1/2 serving the size of a small matchbox or < 1 die or < 1 tablespoon",
      ],
      [
        "1/2 medium steak per day or 1 and 1/2 eggs daily or 1 medium minced meat",
        "1 medium steak daily or up to 2 egg units daily or 1 serving the size of a slice of veal + 1 egg daily",
        "> 1 medium steak daily or > 2 egg units daily or > 1 serving the size of a slice of veal + 1 egg daily",
      ],
      [
        "1 medium serving per week or 1 can per week",
        "1 small serving per week or 1/2 can per week",
        "< 1 small serving per week or < 1/2 can per week",
      ],
      [
        "4 walnut halves or 8 almonds or 1 tablespoon of seeds or peanuts daily",
        "2 walnut halves or 4 almonds or 1 teaspoon of seeds or peanuts daily",
        "< 2 walnut halves or < 4 almonds or < 1 teaspoon of seeds or peanuts daily",
      ],
      [
        "2 tablespoons dessert type daily",
        "1 tablespoon dessert type daily",
        "< 1 tablespoon dessert type daily",
      ],
    ], //Fin 5 a 8 años
    // 9 a 13 años
    [
      [
        "1 and 1/2 plate per week",
        "1 plate per week",
        "< 1 plate per week",
      ],
      [
        "4 plates per week",
        "2 plates per week",
        "< 2 plates per week",
      ],
      [
        "1 plate per week or 1/2 plate + 1 medallion per week",
        "1/2 plate per week or 1/4 plate + 1 medallion per week",
        "< 1/2 plate per week or 1/4 plate + 1 medallion per week",
      ],
      [
        "1/3 plate daily or up to 3 medium units per week",
        "1/2 plate or up to 5 small units per week",
        "> 1/2 plate or > 5 small units per week",
      ],
      [
        "4 medium units per week or 1/2 raw plate daily or 1/4 cooked plate daily",
        "2 medium units per week or 1/4 plate daily",
        "< 2 medium units per week or 1/4 plate daily",
      ],
      [
        "1 and 1/2 large unit per day or 2 medium units per day",
        "1 medium unit per day",
        "< 1 medium unit per day",
      ],
      [
        "up to 2 slices of bread per day or 2 small mignons or 6 water biscuits",
        "3 slices of bread per day or 3 small mignons or 9 water biscuits",
        "> 3 slices of bread per day or > 3 small mignons or > 9 water biscuits",
      ],
      [
        "1/4 plate of whole wheat pasta per day or 1 portion of dough",
        "1/2 plate per day or 2 portions of dough",
        "> 1/2 plate per day or 2 portions of dough",
      ],
      [
        "1/4 plate of whole wheat pasta per day or 1 portion of dough",
        "1/2 plate per day or 2 portions of dough",
        "> 1/2 plate per day or > 2 portions of dough per day",
      ],
      [
        "2 teacups",
        "1 teacup daily",
        "< 1 teacup daily",
      ],
      [
        "1 portion the size of a small matchbox or half the size of a SUBE card or 2 tablespoons daily",
        "1 portion the size of a dice or 1 tablespoon daily",
        "< 1 portion the size of a dice or < 1 tablespoon daily",
      ],
      [
        "1 small portion without waste daily or up to 2 egg units daily or 1 portion the size of a slice of beef + 1 egg daily",
        "2 small portions without waste daily or up to 4 egg units daily or 1 small portion + 2 egg units",
        "> 2 small portions without waste daily or > 4 egg units daily or > 1 small portion + 2 egg units",
      ],
      [
        "2 medium portions or 2 cans per week",
        "1 medium portion or 1 can per week",
        "< 1 medium portion or 1 can per week",
      ],
      [
        "8 walnut halves or 15 almonds or 2 dessert tablespoons of seeds or peanuts per day",
        "4 walnut halves or 8 almonds or 1 tablespoon daily of seeds or peanuts",
        "< 4 walnut halves or < 8 almonds or < 1 tablespoon daily of seeds or peanuts",
      ],
      [
        "2 tablespoons daily",
        "1 tablespoon daily",
        "< 1 tablespoon daily",
      ],
    ],
    // 14 a 18 años
    [
      [
        "1 and 1/2 dish per week",
        "1 dish per week",
        "< 1 dish per week",
      ],
      [
        "5 dishes per week",
        "3 dishes per week",
        "< 3 dishes per week",
      ],
      [
        "1 and 1/2 dish per week or 1 dish + 1 medallion per week",
        "1 dish per week or 1/2 dish + 1 medallion per week",
        "< 1 dish per week or 1/2 dish + 1 medallion per week",
      ],
      [
        "1/2 dish daily or up to 5 small units per week",
        "3/4 dish daily or small unit every day",
        "> 3/4 dish daily or small unit every day",
      ],
      [
        "5 medium units per week or 1/2 raw dish daily or 1/4 cooked dish daily",
        "2 and 1/2 medium units per week or 1/3 raw dish daily or 1/4 cooked dish",
        "< 2 and 1/2 medium units per week or 1/3 raw dish daily or 1/4 cooked dish",
      ],
      [
        "1 and 1/2 large unit per day or 2 medium units per day",
        "1 medium unit per day",
        "< 1 medium unit per day",
      ],
      [
        "up to 2 slices of bread per day or 2 small mignons or 6 water biscuits",
        "3 slices of bread per day or 3 small mignons or 9 water biscuits",
        "> 3 slices of bread per day or > 3 small mignons or > 9 water biscuits",
      ],
      [
        "1/2 dish of pasta per day or 2 servings of dough per day",
        "3/4 dish per day or 2 servings of dough per day",
        "> 3/4 dish per day or > 2 servings per day",
      ],
      [
        "1/2 dish per day or 2 servings of dough per day",
        "3/4 dish per day or 3 servings of dough per day",
        "> 3/4 dish per day or > 3 servings of dough per day",
      ],
      [
        "2 breakfast cup size daily",
        "1 breakfast cup size daily",
        "< 1 breakfast cup size daily",
      ],
      [
        "1 small portion without waste daily or up to 2 egg units or 1/2 small portion + 1 egg",
        "2 small portions without waste daily or up to 4 egg units daily or 1 small portion + 2 egg units",
        "> 2 small portions without waste daily or > 4 egg units daily or > 1 small portion + 2 egg units",
      ],
      [
        "2 medium portions or 2 cans per week",
        "1 medium portion or 1 can per week",
        "< 1 medium portion or 1 can per week",
      ],
      [
        "10 walnut halves or 20 almonds or 2 tablespoons per day of seeds or peanuts",
        "5 walnut halves or 10 almonds or 1 tablespoon per day of seeds or peanuts",
        "< 5 walnut halves or < 10 almonds or < 1 tablespoon per day of seeds or peanuts",
      ],
      [
        "2 tablespoons per day",
        "1 tablespoon per day",
        "< 1 tablespoon per day",
      ],
    ],
  ], // Fin femenino
  // Masculino
  [
    // De 5 a 8 años
    [
      [
        "1 plate per week",
        "1/2 plate per week",
        "< 1/2 plate per week",
      ],
      [
        "3 plates per week or 1 small unit per day",
        "1 and 1/2 plates per week or 1 small unit every other day",
        "< 1 and 1/2 plates per week or < 1 small unit every other day",
      ],
      [
        "1/2 plate per week or 1/4 plate + 1 medallion per week",
        "1/4 plate per week or 1 small medallion per week",
        "< 1/4 plate per week or < 1 small medallion per week",
      ],
      [
        "1/2 small unit per day or 1/4 plate per day or 3 small units per week",
        "1 small unit per day or 1/2 plate per day or 3 medium units per week",
        "> 1 small unit per day or > 1/2 plate per day or > 3 medium units per week",
      ],
      [
        "3 medium units per week or 1/3 raw plate or 1/4 cooked plate",
        "1 medium unit per week or 1/4 raw plate per day or 1/4 plate 4 times/week",
        "< 1 medium unit per week or 1/4 raw plate per day or 1/4 plate 4 times/week",
      ],
      [
        "2 medium units per day",
        "1 medium unit per day",
        "< 1 medium unit per day",
      ],
      [
        "up to 1 slice per day or 1 small mignon per day",
        "2 slices per day or 2 small mignons per day",
        "> 2 slices per day or > 2 small mignons per day",
      ],
      [
        "1/4 plate per day of whole wheat pasta or 1 serving of dough per day",
        "1/2 plate per day or 2 servings of dough per day",
        "> 1/2 plate per day or > 2 servings per day",
      ],
      [
        "1/4 plate per day of whole wheat pasta or 1 serving of dough per day",
        "1/2 plate per day or 2 servings of dough per day",
        "> 1/2 plate per day or > 2 servings per day",
      ],
      [
        "3/4 cup for breakfast daily or 2 tea cups daily",
        "1/2 cup for breakfast or 1 tea cup daily",
        "< 1/2 cup for breakfast or < 1 tea cup",
      ],
      [
        "1 portion the size of a small matchbox or 1/2 SUBE card or 2 tablespoons",
        "1 portion the size of a die",
        "< 1 portion the size of a die",
      ],
      [
        "1 small portion without waste 5 times/week or 1/2 small portion + 1 egg daily",
        "1 medium portion without waste daily or 1 small portion + 1 egg daily",
        "> 1 medium portion without waste daily or 1 small portion + 1 egg daily",
      ],
      [
        "2 small portions per week or 1 and 1/2 cans/week",
        "1 small portion per week or 1 can/week",
        "< 1 small portion per week or 1 can/week",
      ],
      [
        "6 walnut halves or 10 almonds or 1 tablespoon daily of seeds or peanuts",
        "3 walnut halves or 5 almonds or 1/2 tablespoon daily of seeds or peanuts",
        "< 3 walnut halves or 5 almonds or 1/2 tablespoon daily of seeds or peanuts",
      ],
      [
        "2 dessert spoons per day",
        "1 dessert spoon per day",
        "< 1 dessert spoon per day",
      ],
    ], // End of 5 to 8 years
// From 9 to 14 years
    [
      [
        "1 and 1/2 plates per week",
        "1 plate per week",
        "< 1 plate per week",
      ],
      [
        "5 and 1/2 plates per week or 1 medium unit per day or 3/4 plate per day",
        "3 plates per week or 1 small unit per day or 1/3 plate per day",
        "< 3 plates per week or < 1 daily unit or < 1/3 plate per day",
      ],
      [
        "1 and 1/2 plates per week or 1/2 plate 3 times per week or 1 medallion per day",
        "1 plate per week or 1/2 plate per week or 1 medallion 3 times per week",
        "< 1 plate per week or < 1/2 plate per week or < 1 medallion 3 times per week",
      ],
      [
        "1 small unit per day or 3 medium units per week or 1/3 plate per day",
        "1 medium unit per day or 3 large units per week or 3/4 plate per day",
        "> 1 medium unit per day or > 3 large units per week or > 3/4 plate per day",
      ],
    ],
    [
      [
        "5 medium units per week or 1/2 raw plate daily or 1/4 cooked plate daily",
        "2  1/2 medium units per week or 1/3 raw plate daily or 1/4 cooked plate",
        "< 2  1/2 medium units per week or < 1/3 raw plate daily or < 1/4 cooked plate",
      ],
      [
        "1  1/2 large unit per day or 2 medium units per day or 3 small units",
        "1 medium unit per day or 2 small units",
        "< 1 medium unit per day or < 2 small units per day",
      ],
      [
        "up to 2 mold type slices per day or 2 small mignons per day",
        "3 mold type slices per day or 3 small mignons per day",
        "> 3 mold type slices per day or > 3 small mignons per day",
      ],
      [
        "1/4 plate of whole wheat pasta per day or 1 serving of dough",
        "1/2 plate per day or 2 servings of dough",
        "> 1/2 plate per day or > 2 servings per day",
      ],
      [
        "1/4 plate of whole wheat pasta per day or 1 serving of dough",
        "1/2 plate per day or 2 servings of dough",
        "> 1/2 plate per day or > 2 servings per day",
      ],
      [
        "2 breakfast type cups",
        "1 breakfast type cup",
        "< 1 breakfast type cup",
      ],
      [
        "1 small matchbox size portion or 1/2 SUBE card or 2 tablespoons daily",
        "1 dice size portion or 1 tablespoon daily",
        "< 1 dice size portion or < 1 tablespoon daily",
      ],
      [
        "1 small portion without waste daily or up to 2 egg units daily or 1 slice size portion of peceto + 1 egg daily",
        "2 small portions without waste daily or up to 4 egg units daily or 1 small portion + 2 egg units daily",
        "> 2 small portions without waste daily or > 4 egg units daily or > 1 small portion + 2 egg units daily",
      ],
      [
        "2 medium portions or 2 cans per week",
        "1 medium portion or 1 can per week",
        "< 1 medium portion or 1 can per week",
      ],
      [
        "10 walnut halves or 20 almonds or 2 tablespoons daily of seeds or peanuts",
        "5 walnut halves or 10 almonds or 1 tablespoon daily of seeds or peanuts",
        "< 5 walnut halves or 10 almonds or 1 tablespoon daily of seeds or peanuts",
      ],
      [
        "2 tablespoons daily",
        "1 tablespoon daily",
        "< 1 tablespoon daily",
      ]
    ], // Fin de 9 a 14 años
    // De 15 a 18 años
    [
      [
        "2 plates per week",
        "1 plate per week",
        "< 1 plate per week",
      ],
      [
        "1/2 plate cooked daily or 3/4 plate raw daily or 6 medium units per week",
        "1/4 plate cooked daily or 1/2 plate raw daily or 3 medium units per week",
        "< 1/4 plate cooked daily or < 1/2 plate raw daily or < 3 medium units per week",
      ],
      [
        "2 plates per week or 1 plate + 2 medallions per week",
        "1 plate per week or 1/2 plate + 1 medallion per week",
        "< 1 plate per week or < 1/2 plate + 1 medallion per week",
      ],
      [
        "up to 6 small units/week or 3 large units/week or 1/2 plate daily",
        "up to 9 units/week or 5 large units/week or 1 plate daily",
        ">  9 units/week or > 5 large units/week or > 1 plate daily",
      ],
      [
        "1 medium unit daily or 3/4 plate raw daily or 1/2 plate cooked daily",
        "1 small unit daily or 1/2 plate raw daily or 1/4 plate cooked daily",
        "< 1 small unit daily or 1/2 plate raw daily or 1/4 plate cooked daily",
      ],
      [
        "2 large units per day or 4 small units per day",
        "1 large unit per day or 2 small units per day",
        "< 1 large unit per day or 2 small units per day",
      ],
      [
        "3 slices per day or 2 small medallions",
        "6 slices per day or 4 small medallions or 2 small flutes",
        "> 6 slices per day or > 4 small medallions or > 2 small flutes",
      ],
      [
        "1/2 plate of whole wheat pasta per day or 1 and 1/2 portions of dough per day",
        "1 plate per day or 3 portions of dough per day",
        "> 1 plate per day or > 3 portions of dough per day",
      ],
      [
        "1/2 plate of whole wheat pasta per day or 1 and 1/2 portions of dough per day",
        "1 plate per day or 3 portions of dough per day",
        "> 1 plate per day or > 3 portions of dough per day",
      ],
      [
        "2 breakfast cups",
        "1 breakfast cup",
        "< 1 breakfast cup",
      ],
      [
        "1 portion the size of a small matchbox or 1/2 SUBE card or 2 tablespoons",
        "1 portion the size of a dice or 1 tablespoon",
        "< 1 portion the size of a dice or < 1 tablespoon",
      ],
      [
        "1 medium portion without waste daily or up to 3 eggs daily or 1 small portion + 2 eggs daily",
        "2 small portions without waste daily or up to 4 eggs or 1 medium portion + 2 eggs",
        "> 2 small portions without waste daily or up to 4 eggs daily or 1 medium portion + 2 eggs",
      ],
      [
        "2 large portions per week or 2 cans/week or 1/3 plate of canned fish per week",
        "1 medium portion per week or 1 can/week or 1/4 plate per week",
        "< 1 medium portion per week or 1 can/week or 1/4 plate per week",
      ],
      [
        "10 walnut halves per day or 20 almonds per day or 2 tablespoons per day of seeds or peanuts",
        "5 walnut halves per day or 10 almonds per day or 1 tablespoon per day of seeds or peanuts",
        "< 5 walnut halves per day or 10 almonds per day or 1 tablespoon per day of seeds or peanuts",
      ],
      [
        "3 tablespoons per day",
        "1 tablespoon per day",
        "< 1 tablespoon per day",
      ]
    ],
  ]
];*/

/*List<List<List<List<String>>>> options = [
// femenino
  [
// Cinco a ocho
    [
// green vegetables
      [
        "1 plate per week",
        "1/2 plate per week",
        "< 1/2 plate per week",
      ],
      [
        "3 plates per week or 1 small unit daily",
        "1 plate per week",
        "< 1 plate per week",
      ],
      [
        "1/2 plate per week or 2 small medallions per week",
        "1/4 plate per week or 1 small medallion per week",
        "< 1/4 plate per week or < 1 small medallion per week",
      ],
      [
        "1/2 small unit daily or 1/4 plate daily or 3 small units per week",
        "1 small unit daily or 1/2 plate daily or 3 medium units per week",
        "> 1 small unit daily or > 1/2 plate daily or > 3 medium units per week",
      ],
      [
        "3 medium units per week or 1/3 raw plate daily or 1/4 cooked plate daily",
        "1 medium unit per week or 1/4 raw plate daily or 1/4 cooked plate 4 times/week",
        "< 1 medium unit per week or < 1/4 raw plate daily or < 1/4 cooked plate 4 times/week",
      ],
      [
        "1 medium unit daily or 2 small units daily",
        "1 small unit daily",
        "< 1 small unit daily",
      ],
      [
        "1 slice of bread or 1 small mignon or 3 water crackers",
        "2 slices of sandwich bread or 2 small mignons or 6 water crackers",
        "> 2 slices of sandwich bread or > 2 small mignons or > 6 water crackers",
      ],
      [
        "1/4 plate daily or 1 serving of dough daily",
        "1/2 plate daily or 2 servings of dough daily",
        "> 1/2 plate daily or > 2 servings of dough daily",
      ],
      [
        "1/4 plate daily or 1 serving of dough daily",
        "1/2 plate per day or 2 servings of dough",
        "> 1/2 plate per day or > 2 servings of dough per day",
      ],
      [
        "3/4 cup breakfast type daily or 2 cups tea type daily",
        "1/2 cup breakfast type daily or 1 cup tea type daily",
        "< 1/2 cup breakfast type daily or < 1 cup tea type daily",
      ],
      [
        "1 serving the size of a small matchbox or size of 1/2 SUBE card or 2 tablespoons",
        "1/2 serving the size of a small matchbox or 1 die or 1 tablespoon",
        "< 1/2 serving the size of a small matchbox or < 1 die or < 1 tablespoon",
      ],
      [
        "1/2 medium steak per day or 1 and 1/2 eggs daily or 1 medium minced meat",
        "1 medium steak daily or up to 2 egg units daily or 1 serving the size of a slice of veal + 1 egg daily",
        "> 1 medium steak daily or > 2 egg units daily or > 1 serving the size of a slice of veal + 1 egg daily",
      ],
      [
        "1 medium serving per week or 1 can per week",
        "1 small serving per week or 1/2 can per week",
        "< 1 small serving per week or < 1/2 can per week",
      ],
      [
        "4 walnut halves or 8 almonds or 1 tablespoon of seeds or peanuts daily",
        "2 walnut halves or 4 almonds or 1 teaspoon of seeds or peanuts daily",
        "< 2 walnut halves or < 4 almonds or < 1 teaspoon of seeds or peanuts daily",
      ],
      [
        "2 tablespoons dessert type daily",
        "1 tablespoon dessert type daily",
        "< 1 tablespoon dessert type daily",
      ],
    ], //Fin 5 a 8 años
// 9 a 13 años
    [
      [
        "1 and 1/2 plate per week",
        "1 plate per week",
        "< 1 plate per week",
      ],
      [
        "4 plates per week",
        "2 plates per week",
        "< 2 plates per week",
      ],
      [
        "1 plate per week or 1/2 plate + 1 medallion per week",
        "1/2 plate per week or 1/4 plate + 1 medallion per week",
        "< 1/2 plate per week or 1/4 plate + 1 medallion per week",
      ],
      [
        "1/3 plate daily or up to 3 medium units per week",
        "1/2 plate or up to 5 small units per week",
        "> 1/2 plate or > 5 small units per week",
      ],
      [
        "4 medium units per week or 1/2 raw plate daily or 1/4 cooked plate daily",
        "2 medium units per week or 1/4 plate daily",
        "< 2 medium units per week or 1/4 plate daily",
      ],
      [
        "1 and 1/2 large unit per day or 2 medium units per day",
        "1 medium unit per day",
        "< 1 medium unit per day",
      ],
      [
        "up to 2 slices of bread per day or 2 small mignons or 6 water biscuits",
        "3 slices of bread per day or 3 small mignons or 9 water biscuits",
        "> 3 slices of bread per day or > 3 small mignons or > 9 water biscuits",
      ],
      [
        "1/4 plate of whole wheat pasta per day or 1 portion of dough",
        "1/2 plate per day or 2 portions of dough",
        "> 1/2 plate per day or 2 portions of dough",
      ],
      [
        "1/4 plate of whole wheat pasta per day or 1 portion of dough",
        "1/2 plate per day or 2 portions of dough",
        "> 1/2 plate per day or > 2 portions of dough per day",
      ],
      [
        "2 teacups",
        "1 teacup daily",
        "< 1 teacup daily",
      ],
      [
        "1 portion the size of a small matchbox or half the size of a SUBE card or 2 tablespoons daily",
        "1 portion the size of a dice or 1 tablespoon daily",
        "< 1 portion the size of a dice or < 1 tablespoon daily",
      ],
      [
        "1 small portion without waste daily or up to 2 egg units daily or 1 portion the size of a slice of beef + 1 egg daily",
        "2 small portions without waste daily or up to 4 egg units daily or 1 small portion + 2 egg units",
        "> 2 small portions without waste daily or > 4 egg units daily or > 1 small portion + 2 egg units",
      ],
      [
        "2 medium portions or 2 cans per week",
        "1 medium portion or 1 can per week",
        "< 1 medium portion or 1 can per week",
      ],
      [
        "8 walnut halves or 15 almonds or 2 dessert tablespoons of seeds or peanuts per day",
        "4 walnut halves or 8 almonds or 1 tablespoon daily of seeds or peanuts",
        "< 4 walnut halves or < 8 almonds or < 1 tablespoon daily of seeds or peanuts",
      ],
      [
        "2 tablespoons daily",
        "1 tablespoon daily",
        "< 1 tablespoon daily",
      ],
    ],
// 14 a 18 años
    [
      [
        "1 and 1/2 dish per week",
        "1 dish per week",
        "< 1 dish per week",
      ],
      [
        "5 dishes per week",
        "3 dishes per week",
        "< 3 dishes per week",
      ],
      [
        "1 and 1/2 dish per week or 1 dish + 1 medallion per week",
        "1 dish per week or 1/2 dish + 1 medallion per week",
        "< 1 dish per week or 1/2 dish + 1 medallion per week",
      ],
      [
        "1/2 dish daily or up to 5 small units per week",
        "3/4 dish daily or small unit every day",
        "> 3/4 dish daily or small unit every day",
      ],
      [
        "5 medium units per week or 1/2 raw dish daily or 1/4 cooked dish daily",
        "2 and 1/2 medium units per week or 1/3 raw dish daily or 1/4 cooked dish",
        "< 2 and 1/2 medium units per week or 1/3 raw dish daily or 1/4 cooked dish",
      ],
      [
        "1 and 1/2 large unit per day or 2 medium units per day",
        "1 medium unit per day",
        "< 1 medium unit per day",
      ],
      [
        "up to 2 slices of bread per day or 2 small mignons or 6 water biscuits",
        "3 slices of bread per day or 3 small mignons or 9 water biscuits",
        "> 3 slices of bread per day or > 3 small mignons or > 9 water biscuits",
      ],
      [
        "1/2 dish of pasta per day or 2 servings of dough per day",
        "3/4 dish per day or 2 servings of dough per day",
        "> 3/4 dish per day or > 2 servings per day",
      ],
      [
        "1/2 dish per day or 2 servings of dough per day",
        "3/4 dish per day or 3 servings of dough per day",
        "> 3/4 dish per day or > 3 servings of dough per day",
      ],
      [
        "2 breakfast cup size daily",
        "1 breakfast cup size daily",
        "< 1 breakfast cup size daily",
      ],
      [
        "1 portion, the size of a small matchbox or 1/2 SUBE card or 2 tablespoons daily",
        "1 portion, the size of a dice or 1 tablespoon daily",
        "< 1 portion, the size of a dice or < 1 tablespoon daily"
      ],
      [
        "1 small portion without waste daily or up to 2 egg units or 1/2 small portion + 1 egg",
        "2 small portions without waste daily or up to 4 egg units daily or 1 small portion + 2 egg units",
        "> 2 small portions without waste daily or > 4 egg units daily or > 1 small portion + 2 egg units",
      ],
      [
        "2 medium portions or 2 cans per week",
        "1 medium portion or 1 can per week",
        "< 1 medium portion or 1 can per week",
      ],
      [
        "10 walnut halves or 20 almonds or 2 tablespoons per day of seeds or peanuts",
        "5 walnut halves or 10 almonds or 1 tablespoon per day of seeds or peanuts",
        "< 5 walnut halves or < 10 almonds or < 1 tablespoon per day of seeds or peanuts",
      ],
      [
        "2 tablespoons per day",
        "1 tablespoon per day",
        "< 1 tablespoon per day",
      ],
    ],
  ], // Fin femenino
// Masculino
  [
// De 5 a 8 años
    [
      [
        "1 plate per week",
        "1/2 plate per week",
        "< 1/2 plate per week",
      ],
      [
        "3 plates per week or 1 small unit per day",
        "1 and 1/2 plates per week or 1 small unit every other day",
        "< 1 and 1/2 plates per week or < 1 small unit every other day",
      ],
      [
        "1/2 plate per week or 1/4 plate + 1 medallion per week",
        "1/4 plate per week or 1 small medallion per week",
        "< 1/4 plate per week or < 1 small medallion per week",
      ],
      [
        "1/2 small unit per day or 1/4 plate per day or 3 small units per week",
        "1 small unit per day or 1/2 plate per day or 3 medium units per week",
        "> 1 small unit per day or > 1/2 plate per day or > 3 medium units per week",
      ],
      [
        "3 medium units per week or 1/3 raw plate or 1/4 cooked plate",
        "1 medium unit per week or 1/4 raw plate per day or 1/4 plate 4 times/week",
        "< 1 medium unit per week or 1/4 raw plate per day or 1/4 plate 4 times/week",
      ],
      [
        "2 medium units per day",
        "1 medium unit per day",
        "< 1 medium unit per day",
      ],
      [
        "up to 1 slice per day or 1 small mignon per day",
        "2 slices per day or 2 small mignons per day",
        "> 2 slices per day or > 2 small mignons per day",
      ],
      [
        "1/4 plate per day of whole wheat pasta or 1 serving of dough per day",
        "1/2 plate per day or 2 servings of dough per day",
        "> 1/2 plate per day or > 2 servings per day",
      ],
      [
        "1/4 plate per day of whole wheat pasta or 1 serving of dough per day",
        "1/2 plate per day or 2 servings of dough per day",
        "> 1/2 plate per day or > 2 servings per day",
      ],
      [
        "3/4 cup for breakfast daily or 2 tea cups daily",
        "1/2 cup for breakfast or 1 tea cup daily",
        "< 1/2 cup for breakfast or < 1 tea cup",
      ],
      [
        "1 portion the size of a small matchbox or 1/2 SUBE card or 2 tablespoons",
        "1 portion the size of a die",
        "< 1 portion the size of a die",
      ],
      [
        "1 small portion without waste 5 times/week or 1/2 small portion + 1 egg daily",
        "1 medium portion without waste daily or 1 small portion + 1 egg daily",
        "> 1 medium portion without waste daily or 1 small portion + 1 egg daily",
      ],
      [
        "2 small portions per week or 1 and 1/2 cans/week",
        "1 small portion per week or 1 can/week",
        "< 1 small portion per week or 1 can/week",
      ],
      [
        "6 walnut halves or 10 almonds or 1 tablespoon daily of seeds or peanuts",
        "3 walnut halves or 5 almonds or 1/2 tablespoon daily of seeds or peanuts",
        "< 3 walnut halves or 5 almonds or 1/2 tablespoon daily of seeds or peanuts",
      ],
      [
        "2 dessert spoons per day",
        "1 dessert spoon per day",
        "< 1 dessert spoon per day",
      ],
    ], // End of 5 to 8 years
// From 9 to 14 years
    [
      [
        "1 and 1/2 plates per week",
        "1 plate per week",
        "< 1 plate per week",
      ],
      [
        "5 and 1/2 plates per week or 1 medium unit per day or 3/4 plate per day",
        "3 plates per week or 1 small unit per day or 1/3 plate per day",
        "< 3 plates per week or < 1 daily unit or < 1/3 plate per day",
      ],
      [
        "1 and 1/2 plates per week or 1/2 plate 3 times per week or 1 medallion per day",
        "1 plate per week or 1/2 plate per week or 1 medallion 3 times per week",
        "< 1 plate per week or < 1/2 plate per week or < 1 medallion 3 times per week",
      ],
      [
        "1 small unit per day or 3 medium units per week or 1/3 plate per day",
        "1 medium unit per day or 3 large units per week or 3/4 plate per day",
        "> 1 medium unit per day or > 3 large units per week or > 3/4 plate per day",
      ],
      [
        "5 medium units per week or 1/2 raw plate daily or 1/4 cooked plate daily",
        "2  1/2 medium units per week or 1/3 raw plate daily or 1/4 cooked plate",
        "< 2  1/2 medium units per week or < 1/3 raw plate daily or < 1/4 cooked plate",
      ],
      [
        "1  1/2 large unit per day or 2 medium units per day or 3 small units",
        "1 medium unit per day or 2 small units",
        "< 1 medium unit per day or < 2 small units per day",
      ],
      [
        "up to 2 mold type slices per day or 2 small mignons per day",
        "3 mold type slices per day or 3 small mignons per day",
        "> 3 mold type slices per day or > 3 small mignons per day",
      ],
      [
        "1/4 plate of whole wheat pasta per day or 1 serving of dough",
        "1/2 plate per day or 2 servings of dough",
        "> 1/2 plate per day or > 2 servings per day",
      ],
      [
        "1/4 plate of whole wheat pasta per day or 1 serving of dough",
        "1/2 plate per day or 2 servings of dough",
        "> 1/2 plate per day or > 2 servings per day",
      ],
      [
        "2 breakfast type cups",
        "1 breakfast type cup",
        "< 1 breakfast type cup",
      ],
      [
        "1 small matchbox size portion or 1/2 SUBE card or 2 tablespoons daily",
        "1 dice size portion or 1 tablespoon daily",
        "< 1 dice size portion or < 1 tablespoon daily",
      ],
      [
        "1 small portion without waste daily or up to 2 egg units daily or 1 slice size portion of peceto + 1 egg daily",
        "2 small portions without waste daily or up to 4 egg units daily or 1 small portion + 2 egg units daily",
        "> 2 small portions without waste daily or > 4 egg units daily or > 1 small portion + 2 egg units daily",
      ],
      [
        "2 medium portions or 2 cans per week",
        "1 medium portion or 1 can per week",
        "< 1 medium portion or 1 can per week",
      ],
      [
        "10 walnut halves or 20 almonds or 2 tablespoons daily of seeds or peanuts",
        "5 walnut halves or 10 almonds or 1 tablespoon daily of seeds or peanuts",
        "< 5 walnut halves or 10 almonds or 1 tablespoon daily of seeds or peanuts",
      ],
      [
        "2 tablespoons daily",
        "1 tablespoon daily",
        "< 1 tablespoon daily",
      ]
    ], // Fin de 9 a 14 años
// De 15 a 18 años
    [
      [
        "2 plates per week",
        "1 plate per week",
        "< 1 plate per week",
      ],
      [
        "1/2 plate cooked daily or 3/4 plate raw daily or 6 medium units per week",
        "1/4 plate cooked daily or 1/2 plate raw daily or 3 medium units per week",
        "< 1/4 plate cooked daily or < 1/2 plate raw daily or < 3 medium units per week",
      ],
      [
        "2 plates per week or 1 plate + 2 medallions per week",
        "1 plate per week or 1/2 plate + 1 medallion per week",
        "< 1 plate per week or < 1/2 plate + 1 medallion per week",
      ],
      [
        "up to 6 small units/week or 3 large units/week or 1/2 plate daily",
        "up to 9 units/week or 5 large units/week or 1 plate daily",
        ">  9 units/week or > 5 large units/week or > 1 plate daily",
      ],
      [
        "1 medium unit daily or 3/4 plate raw daily or 1/2 plate cooked daily",
        "1 small unit daily or 1/2 plate raw daily or 1/4 plate cooked daily",
        "< 1 small unit daily or 1/2 plate raw daily or 1/4 plate cooked daily",
      ],
      [
        "2 large units per day or 4 small units per day",
        "1 large unit per day or 2 small units per day",
        "< 1 large unit per day or 2 small units per day",
      ],
      [
        "3 slices per day or 2 small medallions",
        "6 slices per day or 4 small medallions or 2 small flutes",
        "> 6 slices per day or > 4 small medallions or > 2 small flutes",
      ],
      [
        "1/2 plate of whole wheat pasta per day or 1 and 1/2 portions of dough per day",
        "1 plate per day or 3 portions of dough per day",
        "> 1 plate per day or > 3 portions of dough per day",
      ],
      [
        "1/2 plate of whole wheat pasta per day or 1 and 1/2 portions of dough per day",
        "1 plate per day or 3 portions of dough per day",
        "> 1 plate per day or > 3 portions of dough per day",
      ],
      [
        "2 breakfast cups",
        "1 breakfast cup",
        "< 1 breakfast cup",
      ],
      [
        "1 portion the size of a small matchbox or 1/2 SUBE card or 2 tablespoons",
        "1 portion the size of a dice or 1 tablespoon",
        "< 1 portion the size of a dice or < 1 tablespoon",
      ],
      [
        "1 medium portion without waste daily or up to 3 eggs daily or 1 small portion + 2 eggs daily",
        "2 small portions without waste daily or up to 4 eggs or 1 medium portion + 2 eggs",
        "> 2 small portions without waste daily or up to 4 eggs daily or 1 medium portion + 2 eggs",
      ],
      [
        "2 large portions per week or 2 cans/week or 1/3 plate of canned fish per week",
        "1 medium portion per week or 1 can/week or 1/4 plate per week",
        "< 1 medium portion per week or 1 can/week or 1/4 plate per week",
      ],
      [
        "10 walnut halves per day or 20 almonds per day or 2 tablespoons per day of seeds or peanuts",
        "5 walnut halves per day or 10 almonds per day or 1 tablespoon per day of seeds or peanuts",
        "< 5 walnut halves per day or 10 almonds per day or 1 tablespoon per day of seeds or peanuts",
      ],
      [
        "3 tablespoons per day",
        "1 tablespoon per day",
        "< 1 tablespoon per day",
      ]
    ],
  ]
];
*/