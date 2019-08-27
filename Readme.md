Predictive Analytics - Mortality
========

2019-08-27 08:30 CEST

NICU temporal patterns for mortality
--------

charlotte zuber.

140 nicu pts. vandy. 2017-18 9 months. post op. time interval based.
First abstraction. Then Allen's interval algebra. There are 13
possible relationships/patterns. Patterns were features. Also bin the
2 before patterns, 9 "co occurs," 2 after. Temporal abstraction
basically creates intervals of inc/stable/decrease; also there's some
min/max in there, and maybe nl/abnl. For training, oversampled the
cases, 10 cases of mortality only. 3FCV. L1 logistic. Compared
atemporal to pair and triplet (which uses the tempo patterns). AUC
like 0.6 - 0.7? stable o2, stable o2, decreased o2 had odds ratio
90.2. Next few had OR 14. Then others.

mort of AKI in crit care
--------

@JyotiPathak

Demirjian. VA ARF Trial Network. PMID: 21896828. But those lump all
stages of AKI. AUC 0.85, 0.80. Pathak has 3 strata for 3 diff stages.
They used MIMIC III. Also the prior work mainly used ICD. They
selected KDIGO, cr 0.3 / 24h, cr 1.5x / 7 d, UOP 0.5 ml/kg/h x 6h.
Plain LR, L2 LR, RandoFor, GradBoostDecisTree. Mortality is like 10
ish % in some strata. Matched cases/controls on APACHE II and CCI.
Constructed some features fr. time-dependent continuous and discrete
(dx is time dep discrete). About 224 features. GBDT = best, AUC = ?.
Variable importance: lab best for stg 1, chart events best for stg
2-3. demog, meds, comorb not so much. Specif, HR, cr, Cl, wbc, hgb,
RR.

AMI and post MI one year mort
--------

FSU. CADILLAC, PAMI, TIMI score, etc. Also MIMIC III. 40k pts, 11 yr.
First ICD, 7590 admissions, resulted in like 5000 some admissions
after excluding some stuff, maybe excluded some missingness. Used
WEKA, like 20 models??, also TensorFlow? Notes info was in there some.
simple LR like AUC 0.90. LMT logistic model tree. Deep FNN auc 0.75?
Next best published ones were AUC 0.84. Word embeddings: pretrained.
That's the enhanced model (and now tanh instead of ReLu). Now like 200
ish features. Acc 86 --> 93. F measure 0.72 --> 0.93. Text + admission
descriptor vars, and Text + demogs were best subsets of features,
better than text + labs.

ML to integrate socio beh in CV mort risk
--------

Yuan Luo, northwestern. @yuanhypnosluo

CVD Life Risk Pooling Project. JT Wilkins et al, International Journal
of Epidemiology, 44(5):1557-1564. Outcomes: death from **cvd**, death from
**chd**, and total all cause mort. Demog, labs, VS, med status, edu,
smok, drink, amount, DASH score, alternate Health Eating Index score,
primary Physical Activity, mod to vigorous physical activity, etc. AUC
random forest like 0.84. Naive bayes, LR, SVM too. Best is RF trained
on physiol plus med plus soc, for predictitng **cvd** and **chd**
mort, and that's AUC 0.89. (Your numbers on your slide are mich too
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
i2b2[^fet].

[^haar]: Haarbrandt et al, JBI 2016, Automated population of an
i2b2....

[^fet]: Query Translation Between openEHR and i2b2. Stud Health
Technol Inform. 2019;258:16-20. PMID: 30942705.

Integrated data strategy
--------

Adam McLeod

Interactive machine learning
--------

Nate Fillmore

Processing clinical narratives
========

2019-08-27 16:30

Phenotyping
========

2019-08-27 16:30