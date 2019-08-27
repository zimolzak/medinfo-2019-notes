Predictive Analytics - Mortality
========

2019-08-27 08:30 CEST

NICU temporal patterns for mortality
--------

Charlotte Zuber.

140 NICU pts. vandy. 2017-18 9 months. post op. time interval based.
First abstraction. Then Allen's interval algebra. There are 13
possible relationships/patterns. Patterns were features. Also bin the
2 before patterns, 9 "co occurs," 2 after. Temporal abstraction
basically creates intervals of inc/stable/decrease; also there's some
min/max in there, and maybe nl/abnl. For training, oversampled the
cases, 10 cases of mortality only. 3FCV. L1 logistic. Compared
atemporal to pair and triplet (which uses the tempo patterns). AUC
like 0.6 - 0.7? stable o2, stable o2, decreased o2 had odds ratio
90.2. Next few had OR 14. Then others.

Mortality of AKI in critical care
--------

@JyotiPathak

Demirjian. VA ARF Trial Network. PMID: 21896828. But those lump all
stages of AKI. AUC 0.85, 0.80. Pathak has 3 strata for 3 diff stages.
They used MIMIC III. Also the prior work mainly used ICD. They
selected KDIGO, Cr 0.3 / 24h, Cr 1.5x / 7 d, UOP 0.5 ml/kg/h x 6h.
Plain LR, L2 LR, RandoFor, GradBoostDecisTree. Mortality is like 10
ish % in some strata. Matched cases/controls on APACHE II and CCI.
Constructed some features fr. time-dependent continuous and discrete
(dx is time dep discrete). About 224 features. GBDT = best, AUC = ?.
Variable importance: lab best for stg 1, chart events best for stg
2-3. demog, meds, comorb not so much. Specif, HR, cr, Cl, wbc, hgb,
RR.

AMI and post MI one year Mortality
--------

FSU. CADILLAC, PAMI, TIMI score, etc. Also MIMIC III. 40k pts, 11 yr.
First ICD, 7590 admissions, resulted in like 5000 some admissions
after excluding some stuff, maybe excluded some missingness. Used
WEKA, like 20 models??, also TensorFlow? Notes info was in there some.
simple LR like AUC 0.90. LMT logistic model tree. Deep FNN AUC 0.75?
Next best published ones were AUC 0.84. Word embeddings: pretrained.
That's the enhanced model (and now tanh instead of ReLu). Now like 200
ish features. Acc 86 --> 93. F measure 0.72 --> 0.93. Text + admission
descriptor vars, and Text + demogs were best subsets of features,
better than text + labs.

ML to integrate socio beh in CV mort risk
--------

Yuan Luo, northwestern. @yuanhypnosluo

CVD Life Risk Pooling Project. JT Wilkins et al, International Journal
of Epidemiology, 44(5):1557-1564. Outcomes: death from **CVD**, death from
**chd**, and total all cause mort. Demog, labs, VS, med status, edu,
smok, drink, amount, DASH score, alternate Health Eating Index score,
primary Physical Activity, mod to vigorous physical activity, etc. AUC
random forest like 0.84. Naive Bayes, LR, SVM too. Best is RF trained
on physiol plus med plus soc, for predicting **CVD** and **chd**
mort, and that's AUC 0.89. (Numbers on slide are too
small.) Complete case analysis: bias: so imputation in future. Works
on numeric (traditionally). How much missingness can be tolerated by
said techniques?

AI in Medicine
========

Tze Yun Leong. CS at Nat Uni Singapore, and AI Singapore. Keynote.
2019-08-27 10:20. leongty@nus.edu.sg

Her first paper[^hfp]. A seminal paper[^asp]. Her thesis[^ht]. Hx of
AI: clinician centric --> pt centric (present) --> shared (future).
There is an overview from Zak[^ao]. Pattern recognition is in the news
(5 citations)[^ex]. Data ecosystem / merging is a second
thing[^eu][^au][^zh]. Finally, reemergence of human centric AI is a
thing[^brca][^verg].


[^eu]: European interop framework.

[^au]: Linked dataset on perinatal ... Australia.

[^zh]: China's Xiangya medical big data project.

[^hfp]: Murmur Clinic: A Diagnostic Expert System for Auscultation. Proc Annu
Symp Comput Appl Med Care. 1987 Nov 4 : 166–170. PMC2245043.

[^asp]: Reasoning foundations of medical diagnosis. Science.
1959;130(3366):9-21. PMID: 13668531.

[^ht]: MIT PhD 1994, Szolovits supervisor. An integrated approach to dynamic
decision making under uncertainty.

[^ao]: Yu KH, Beam AL, Kohane IS. Nat Biomed Eng. 2018;2(10):719-731. PMID:
31015651.

[^ex]: Nature 542:115 as one example.

[^brca]: Explainable artificial intelligence for breast
cancer.

[^verg]: Verghese et al What this computer needs is a physician, JAMA
319:19.


**Her lab's work.** Different modalities to assess stage of dementia:
neuroimaging, genomic, demographic, CSF. Tricky because Sn/Sp of
biomarkers varies w/ stage of dz. Also no gold standard (well, til
autopsy). "Multi view"[^mv].  Transfer learning[^tl].


[^mv]: Pillai PS, Lei F, Leong TY, Knowledge-Driven
Interpretation of Multi-view Data in Medicine, Proceedings of Medical
Informatics Europe (MIE 2018).

[^tl]: Nguyen TT et al, Scalable transfer learning in heterogeneous,
dynamic environments, Artificial Intelligence 247:70-94.


There are challenges in bringing research into practical applications.
One of biggest is good quality data to support. Commercial tech, but
have to look at carefully[^nyt]. Labeled data is manually generated.
Worrisome because labeled by non experts. (Kind of low paying work.)

[^nyt]: AI is Learning from Humans: Many Humans. Cade Metz. NYT
2019-08-16.

AI Singapore has grand challenges: healthcare, education, urban
solutions, and finance. For healthcare, it's about hld, htn, dm: slow
progression & complications by 20% in 5 yr. Projects are in motion.
Ooi, Beng Chin, et al: explainable ai as a service. rx adherence &
pharmacogenetics. Project 3 is community & home care: Miao, Chunyan et
al.

Training: don't just need car engineers. Need to train drivers.
Currently we're mainly training AI scientists and engineers. Not so
much users[^gat].

[^gat]: Leong TY. Growing AI Talent in Singapore: A Proposal (Draft).

Q: dangerously, devs think it's easy to improve healthcare w/ AI. Q:
AI changes people? Lose capabilities if we use AI? A: Sure, look at
Google Maps. Also people can trust AI system too much.







Data Interop and Integration
========

Standard genetic report
--------

Teja Radke. 2019-08-27 14:10. Hochshule Niederrhein.

Not discussing: the one true coding. Yes discussing: how current
situation hampers secondary use. Project is called "GENeALYSE". NGS
data + (loinc hl7 fhir, snomed-cd) + ncbi = CDA document. Reports vary
a lot (see photo), and put different things in different parts:
results, which genes, which methods, and where do they put "further
info." Plus, often methods are very briefly summarized. Results: sex
is missing from 17.5%, consent missing 88.9%, what happens to material
missing 96.6%. **Q:** interp on the report, from the clin oncologist
POV? US mandates that interp is included but interps are often not so
great; variability. **A:** Idea is basic data, all the data needed for
retrospec study, are stored somewhere.

Query translation AQL, CQL
--------

Georg Fette.

AQL = Archetype Query Language, CQL = Clinical Quality Language. As
you know, i2b2 has SHRINE, and each D Warehouse in a SHRINE instance
has its own "query distributor" system. CQL is something that could be
used for FHIR systems. And AQL query is what the user creates. If you
want to do federated query among DW of different types, maybe
translate your openEHR (or any non-i2b2 DWs) into i2b2 and thus use
SHRINE for all[^haar]. But Fette says **translate the query instead of
translatting the data.** See other paper for translating AQL to
i2b2[^fet]. Results: some constraints on what queries can/cannot be
translated successfully: like, source query needs to use only booleans
or comparators that are present in the destination language.

https://gitlab2.informatik.uni-wuerzburg.de/gef18bg/cdw_querymapper

**Q:** How to handle it if openEHR or i2b2 changes the underlying
model? **A:** If you have more than minor DW diffs, would have to
define that graph transformation. **Q:** What about data that comes
back from each query; must be different; how to handle? **A:** Current
goal is put openEHR / FHIR facade on the front.

[^haar]: Haarbrandt et al, JBI 2016, Automated population of an
i2b2....

[^fet]: Query Translation Between openEHR and i2b2. Stud Health
Technol Inform. 2019;258:16-20. PMID: 30942705.

Integrated data strategy: POLAR
--------

Adam McLeod. Outcome Health (Melbourne). @AdamCMcLeod

Aus has a good healthcare system, but not good at using standards. Fed
funds medicare, and money gets to GP; states (6 of them, and there are
some territories too) fund hospitals and community health. Diff
funding causes some problems. For example, want to get data from the
GPs. PHN Primary Health Networks do that by giving back to the GPs a
view of their own data, which clin system vendors don't do very well.
POpulation Level Analytics and Reporting = POLAR. 3 flavors: GP, PHN,
AURORA RESEARCH. What does each flavor consumer want? Researchers want
analytic data set basically, and not so much want to use BI tool
rather than explore on own. Aus also has issues with "is it secondary
or primary use of data?" **Q:** Who pays? **A:** GPs don't pay. The
PHNs pay for a license & that gets POLAR to the GPs. New PIP Qual
Improvement Payment, up to $50k AUS, for certain key data elements
like BMI, how many DM pts have A1c in past *x* months, etc. **Q:**
Evaluate impact of POLAR? **A:** PHNs do focus on certain areas like
tracking CV disease over *x* months. **Q:** Do pts need to consent
etc.? There is deident it seems, but is there reident risk? **A:** We
have privacy laws but sort of outdated. College of GPs ethics group
signed off on collection & storage of data.

Interactive machine learning
--------

Nate Fillmore.

LR LASSO, RF, SVM. Web app front end JavaScript, back end Java. VA
regs are a constraint. Peer sharing of lab groupers. **Q:**
understanding process. What if 2 diff people have same starting
string, and only one has done the adjud? Or if they have different
target concepts. **A:** Can start from scratch or use someone else's.
**Q:** Why VA not requiring all hosps properly encode. ONC specifies.
**A:** Well, good question. **Q:** What's percent of clean coding?
**Q:** how ensure data qual / coding is correct? Or prove the
predicted annotations are valid? **A:** Level of effort depends on
purpose. Sometimes look thru each machine recommendation. Sometimes
just approve them.




Phenotyping 1
========

2019-08-27 16:30

Multi view Bayes net for Alzheimer
--------

**Tze Yun Leong.** Page 358 in your proceedings. Neuroimaging, genetic, CSF, genetics, lifestyle.
Many challenges like curse of dimensionality, missing/incomplete,
symptoms show up late, biomarkers not super accurate. Conditional
Gaussian Bayesian Network CGBD. Learning the optimal struct of a net
for a set of vars is NP hard[^chi]. Matrix factorization. factor
scores = loadings * basis vector (latent factors): $X_{pq} = \sum_{r=1}^l Z_{pr} V_{rq} +
B_p + B_q + \epsilon$ . *V* is weights, *B* is "background variables,"
*Z* is latent factors. Learning a struct, finding Markov blanket,
relearning struct: cuts down dimensionality. Then learn params after
that. *m* = 589 subjects. *n* = like 1000 features (900 SNPs, 4 demog,
25 hx, 90 MRI, and MMSE). Target predict: clin status but also MMSE.
Comparing to prior work[^priorzhu]. Genes of interest APOE, TOMM40;
both with arc to DX. Their MSE for MMSE is 2.44, *cf.* 2.81[^jin].
Limitation: discrete node cannot have continuous parent.



[^chi]: Chickering et al., 2004

[^priorzhu]: Zhu et al. 2016

[^jin]: Jin et al.

Multimodal behavior for mild cogn impairment
--------

**Kaoru Shinkawa**, page 343 proceedings. Speech features during
cognitive tests have been shown to be predictive: Silence, pitch,
tempo, repetition, vocab[^kon]. Also speech from daily life. Gait
features can also predict health changes (diffs between stride length
& similar stuff betw Alzheimer and normal controls)[^ardle]. Their
data: 19 controls, 15 MCI, in their 70s, MCI 28.4 vs 25.5. (s.d. 1.47,
3.89). Extract features incl linguistic features: fillers, vocab
richness, etc. (Per proceedings, fair amount of manual annotation.
"recorded audio was preprocessed by automatic speech recognition,
which automatically transcribes audio data into text format. Then the
experimenter manually corrected the errors of the ASR by listening to
the recorded audio. The experimenter also annotated fillers and false
starts..."). SVM and LOOCV. Multimodal model resulted in 82.4%
accuracy. Gait features not super helpful (statistically) on their
own, but helped somewhat when combining them w/ speech features.
**Q:** What's gold standard for MCI? **A:** Doctors, using neuropsych,
imaging, etc. **Q:** Speech analy focused on linguistic not acoustic.
**A:** Already published something about acoustic features in AMIA,
but that publication was acoustic alone (no gait etc).

[^ardle]: ardle et al., AAIC 2018

[^kon]: Konig et al., Alzheimers Dement (Amst) 2015; Fraser et al JAD 2015.

Deep learning for colorectal cancer detection in EHR
--------

**Yu-Hsiang Wang.**

Deep learning for gait analysis in Huntington
--------

**Simon K. Poon**. Few cases, using convol neural net. somewhat trying
to limit down features (not improve acc necessarily). In handwriting
example, interlocking pentagons can turn into graph of pen speed over
time.
