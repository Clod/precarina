import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';

class SleepHelp extends StatelessWidget {
  const SleepHelp({
    Key? key,
    required this.title,
    required this.content,
  }) : super(key: key);

  final String title;
  final String content;

  @override
  Widget build(BuildContext context) {
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
            child: Column(
        children: [
            Html(
                data: "<html>"
                    "<div>"
                    "<p>Horas recomendadas de sueño según edad:</p>"
                    "<p>4-12 meses de vida: 12-16 hs / día incluyendo siestas regulares.</p>"
                    "<p>1-2 años: 11 -14 hs / dia incluyendo siestas regulares. </p> "
                    "<p>3-5 años: 10-13 hs/días incluyendosiestas regulares.</p>"
                    "<p>6-12 años: 9-12 hs/día</p><p >13-18 años: 8-10 hs/dia </p>"
                    "<p>Las horas de sueño se definirán como optima, limite, insuficiente, ajustada por la edad del paciente </p>"
                    "<p></p>"),
            Html(
                data:
                    "<figure class='table'> <table><tr><th></th><th>3 a <6 años</th><th>6 a <13 años</th><th>13 a 18 años</th></tr><tr><td>Apropiado</td><td>10 a 13 hrs.</td><td>9 a 12 hrs.</td><td>8 a 10 hrs.</td></tr><tr><td>Inapropiado</td> <td>Menos de 10 o más de 14 hsr.</td><td>Menos de 9 o más de 13 hsr.</td><td>Menos de 8 o más de 10 hsr.</td></tr></table> </figure>",),
            Html(
                data: "<p></p>"
                    " <p>Bibliografía </p> "
                    "<p>Paruthi<span lang=EN-US > S, Brooks LJ, D'Ambrosio C, Hall WA, Kotagal S, Lloyd RM, Malow BA, Maski K, Nichols C, Quan SF, Rosen CL, Troester MM, Wise MS. Consensus Statement of the American Academy of Sleep Medicine on the Recommended Amount of Sleep for Healthy Children: Methodology and Discussion. J Clin Sleep Med. 2016 Nov 15;12(11):1549-1561. doi: 10.5664/jcsm.6288. PMID: 27707447; PMCID: PMC5078711.<span lang=EN-US ></p> <p ><span lang=EN-US >Galland<span lang=EN-US > BC, Taylor BJ, Elder DE, Herbison P. Normal sleep patterns in infants and children: a systematic review of observational studies. Sleep Med Rev. 2012 Jun;16(3):213-22. doi: 10.1016/j.smrv.2011.06.001. Epub 2011 Jul 23. PMID: 21784676.<span lang=EN-US ></p> <p ><span lang=EN-US >Eaton DK, McKnight-Eily LR, Lowry R, Perry GS, Presley-Cantrell L, Croft JB. Prevalence of insufficient, borderline, and optimal hours of sleep among high school students - United States, 2007. J Adolesc Health. 2010 Apr;46(4):399-401. doi: 10.1016/j.jadohealth.2009.10.011. Epub 2010 Jan 3. PMID: 20307832.</p> <p >Meltzer LJ, Williamson AA, Mindell JA. Pediatric sleep health: It matters, and so does how we define it. Sleep Med Rev. 2021 Jun<span class=GramE>;57:101425. doi: 10.1016/j.smrv.2021.101425. Epub 2021 Jan 19. PMID: 33601324; PMCID: PMC9067252.<span lang=EN-US ><</p> </div></html>"),
        ],
      ),
          )),
    );
  }
}
