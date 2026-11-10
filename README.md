# Mir Quddus, Ph.D.

**Data scientist and polymer/materials scientist.** I apply statistics, machine learning, and data engineering to R&D and operations data, backed by 20+ years of industrial research at Shurtape, Lear, and Whirlpool.

- 🎓 Ph.D., Fiber & Polymer Science (NC State) · M.S., Data Science (East Carolina University, 2025)
- 🔬 Senior Scientist at Shurtape Technologies: LIMS data pipelines, statistical dashboards, DOE, and ML for product development
- 📜 Named inventor on U.S. patents · Six Sigma Black Belt
- 🔗 [LinkedIn](https://linkedin.com/in/mirquddusphd) · [ORCID](https://orcid.org/0000-0002-7941-4921)

## Featured projects (separate repositories)

| Project | What it shows | Stack |
|---|---|---|
| [Cityworks work-order analytics](https://github.com/miraquddus/cityworks-work-order-analytics) | 583K public Cityworks work orders: SQL data model, 7 data-quality rules, a status-code reference fix, mix-adjusted ward KPIs, a close-within-7-days model (AUC 0.956 on a held-out year), weekly forecast, Power BI star schema + DAX | SQL (DuckDB), Python, scikit-learn, Power BI |
| [Polyester biodegradability from structure](https://github.com/miraquddus/polymer-biodegradability-ml) | Built repeat units for 661 polymers from reagent lists with RDKit; predicts biodegradability with 72% accuracy on unseen monomer families; hydrophobicity and ether oxygens drive the result | Python, RDKit, scikit-learn |
| [Screen time, ADHD and child health](https://github.com/miraquddus/screen-time-adhd-nsch) | 69K children (NSCH 2024–25): survey-weighted models with design-based SEs written from scratch; 4+ h/day is associated with ADHD (adjusted OR 1.75) | Python, survey statistics, gradient boosting |
| [Gaming, social media and teen health](https://github.com/miraquddus/teen-gaming-social-media-yrbs) | CDC YRBS 2019 and 2025: fixed-width parsing from SAS layouts, cluster-design variance, adjusted odds ratios and incremental-AUC analysis | Python, survey statistics |

## Coursework projects (this repository)

| Project | What it shows | Stack |
|---|---|---|
| [Few-shot out-of-scope intent detection](./few-shot-oos-detection) | Reproduced a published NLP benchmark, then extended it with supervised contrastive loss: OOS AUROC 0.84 → 0.88 with 5 examples per class | Python, BERT |
| [Geocoding and spatial integration of NC public records](./nc-public-records-geospatial) | Linked ~1.1M text records to address points and tax parcels across two counties; documented match rates and data-quality problems | Python, GeoPandas, Folium |
| [Image warping and QR reader from first principles](./image-warping-qr-reader) | Homographies, bilinear interpolation, backward mapping, and a size-agnostic QR decoder in pure NumPy | Python, NumPy |
| [Version-controlled SQL with Dolt](./dolt-version-controlled-sql) | Evaluated Git-style versioning for data auditability, with a runnable diff/branch/merge/revert demo | SQL, Dolt, Bash |

**M.S. capstone:** *Enhancing Adhesive Performance: A Data-Driven Approach to Predicting PSA Effectiveness in Building Materials.* Regression and tree-based models that predict adhesive peel performance from film mechanical test data. It uses proprietary industrial data, so it is not published here.

## Tools

Python (pandas, NumPy, scikit-learn, RDKit, statsmodels, GeoPandas, matplotlib, seaborn) · SQL / DuckDB / PostgreSQL · R · Power BI · Tableau · JMP · Minitab
