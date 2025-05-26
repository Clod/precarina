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
