const spanishText = r"""
              <h2>Horas recomendadas de sueño según edad</h2>
              <ul>
                <li>4-12 meses de vida: 12-16 hs/ dia incluyendo siestas regulares.</li>
                <li>1-2 años: 11 -14 hs / dia incluyendo siestas regulares.</li>
                <li>3-5 años: 10-13 hs/días incluyendo siestas regulares.</li>
                <li>6-12 años: 9-12 hs/día</li>
                <li>13-18 años: 8-10 hs/dia</li>
              </ul>
              <h6>Tabla de horarios de sueño recomendados</h6>
 <table align="center" border="2" cellpadding="3">
	<thead>
		<tr>
			<th style="text-align:center">Edad</th>
			<th style="text-align:center">Apropiado</th>
			<th style="text-align:center">Inapropiado</th>
		</tr>
	</thead>
	<tbody>
		<tr>
			<td style="text-align:center">3-5</td>
			<td style="text-align:center">10-13 hs/día</td>
			<td style="text-align:center">&lt; 10 &oacute; &gt; 14 hs/día</td>
		</tr>
		<tr>
			<td style="text-align:center">6-12</td>
			<td style="text-align:center">9-12 hs/día</td>
			<td style="text-align:center">&lt; 9 &oacute; &gt; 13 hs/día</td>
		</tr>
		<tr>
			<td style="text-align:center">13-18</td>
			<td style="text-align:center">8-10 hs/día</td>
			<td style="text-align:center">&lt; 8 &oacute; &gt; 10 hs/día</td>
		</tr>
	</tbody>
</table>
              <h3>Bibliografía</h3>
              <ol>
                <li>Paruthi S, Brooks LJ, D'Ambrosio C, Hall WA, Kotagal S, Lloyd RM, Malow BA, Maski K, Nichols C, Quan SF, Rosen CL, Troester MM, Wise MS. Consensus Statement of the American Academy of Sleep Medicine on the Recommended Amount of Sleep for Healthy Children: Methodology and Discussion. J Clin Sleep Med. 2016 Nov 15;12(11):1549-1561. doi: 10.5664/jcsm.6288. PMID: 27707447; PMCID: PMC5078711.</li>
                <li>Galland BC, Taylor BJ, Elder DE, Herbison P. Normal sleep patterns in infants and children: a systematic review of observational studies. Sleep Med Rev. 2012 Jun;16(3):213-22. doi: 10.1016/j.smrv.2011.06.001. Epub 2011 Jul 23. PMID: 21784676.</li>
                <li>Eaton DK, McKnight-Eily LR, Lowry R, Perry GS, Presley-Cantrell L, Croft JB. Prevalence of insufficient, borderline, and optimal hours of sleep among high school students - United States, 2007. J Adolesc Health. 2010 Apr;46(4):399-401. doi: 10.1016/j.jadohealth.2009.10.011. Epub 2010 Jan 3. PMID: 20307832.</li>
                <li>Meltzer LJ, Williamson AA, Mindell JA. Pediatric sleep health: It matters, and so does how we define it. Sleep Med Rev. 2021 Jun;57:101425. doi: 10.1016/j.smrv.2021.101425. Epub 2021 Jan 19. PMID: 33601324; PMCID: PMC9067252</li>
              </ol>

    """;

const englishText = r"""

              <h3>Recommended sleep hours according to age</h3>

<ul>
  <li>4-12 months of age: 12-16 hours per day including regular naps.</li>
  <li>1-2 years: 11-14 hours per day including regular naps.</li>
  <li>3-5 years: 10-13 hours per day including regular naps.</li>
  <li>6-12 years: 9-12 hours per day.</li>
  <li>13-18 years: 8-10 hours per day.</li>
</ul>

<h4>Recommended Sleep Schedule Table</h4>

<table align="center" border="2" cellpadding="3">
	<thead>
		<tr>
			<th>Age</th>
			<th>Appropriate</th>
			<th>Inappropriate</th>
		</tr>
	</thead>
	<tbody>
		<tr>
			<td style="text-align:center">3-5</td>
			<td style="text-align:center">10-13 hs/day</td>
			<td style="text-align:center">&lt; 10 &oacute; &gt; 14 hs/day</td>
		</tr>
		<tr>
			<td style="text-align:center">6-12</td>
			<td style="text-align:center">9-12 hs/day</td>
			<td style="text-align:center">&lt; 9 &oacute; &gt; 13 hs/day</td>
		</tr>
		<tr>
			<td style="text-align:center">13-18</td>
			<td style="text-align:center">8-10 hs/day</td>
			<td style="text-align:center">&lt; 8 &oacute; &gt; 10 hs/day</td>
		</tr>
	</tbody>
</table>

              <h3>Bibliography</h3>
              <ol>
                <li>Paruthi S, Brooks LJ, D'Ambrosio C, Hall WA, Kotagal S, Lloyd RM, Malow BA, Maski K, Nichols C, Quan SF, Rosen CL, Troester MM, Wise MS. Consensus Statement of the American Academy of Sleep Medicine on the Recommended Amount of Sleep for Healthy Children: Methodology and Discussion. J Clin Sleep Med. 2016 Nov 15;12(11):1549-1561. doi: 10.5664/jcsm.6288. PMID: 27707447; PMCID: PMC5078711.</li>
                <li>Galland BC, Taylor BJ, Elder DE, Herbison P. Normal sleep patterns in infants and children: a systematic review of observational studies. Sleep Med Rev. 2012 Jun;16(3):213-22. doi: 10.1016/j.smrv.2011.06.001. Epub 2011 Jul 23. PMID: 21784676.</li>
                <li>Eaton DK, McKnight-Eily LR, Lowry R, Perry GS, Presley-Cantrell L, Croft JB. Prevalence of insufficient, borderline, and optimal hours of sleep among high school students - United States, 2007. J Adolesc Health. 2010 Apr;46(4):399-401. doi: 10.1016/j.jadohealth.2009.10.011. Epub 2010 Jan 3. PMID: 20307832.</li>
                <li>Meltzer LJ, Williamson AA, Mindell JA. Pediatric sleep health: It matters, and so does how we define it. Sleep Med Rev. 2021 Jun;57:101425. doi: 10.1016/j.smrv.2021.101425. Epub 2021 Jan 19. PMID: 33601324; PMCID: PMC9067252</li>
              </ol>
    """;
