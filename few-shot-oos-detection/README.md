# Few-Shot Out-of-Scope Intent Detection with Contrastive Learning

**NLP · BERT · PyTorch · CLINC150**

Team project for DASC 6010 *Big Data Analytics and Management*, East Carolina University (April 2025).
Authors: Thomas O'Sullivan and Mir Quddus.

## The problem

Production chatbots and intake systems have to recognize requests they were never trained on: *out-of-scope* (OOS) queries. Without that, they confidently route an unsupported request to the wrong intent. Published OOS detectors do well when every intent has plenty of labeled examples, but labeled data is often scarce in practice.

**Research question:** with only 5 labeled examples per intent, can supervised contrastive learning keep OOS detection working?

## Approach

The project reproduces and then extends Zhang et al., *"A new approach for fine-tuning sentence transformers for intent classification and out-of-scope detection tasks"* (Northeastern University / University of Victoria / Cerence).

| | Baseline (paper) | Few-shot baseline | Few-shot + contrastive (ours) |
|---|---|---|---|
| Encoder | BERT + max pooling | same | same |
| Head | Linear classifier | same | same |
| Loss | Cross-entropy | Cross-entropy | Cross-entropy + **supervised contrastive loss** |
| Training data | Full CLINC150 | 5 per intent (750 total) | 5 per intent (750 total) |
| OOS scoring | Embedding distance to class means | same | same |

The CLINC150 dataset covers 150 in-scope intents across 10 domains, plus a held-out out-of-scope set.

## Results

| Setup | Test accuracy (in-scope) | AUPR (OOS) | AUROC (OOS) |
|---|---:|---:|---:|
| Original paper, full data | 96.1% | 0.919 | 0.978 |
| Few-shot (5 per intent) | 79.8% | 0.529 | 0.836 |
| **Few-shot + contrastive loss** | 78.0% | **0.602** | **0.876** |

## Takeaways

- Cutting training data to 5 examples per intent lowers both in-scope accuracy and OOS detection, as expected.
- Supervised contrastive loss raised OOS AUPR by about 0.07 (+14% relative) and AUROC by 0.04. It tightens same-intent clusters, which makes unseen queries easier to separate.
- The cost is a 1.8-point drop in in-scope accuracy, a trade-off worth tuning to the application. When a wrong answer costs more than a fallback, OOS precision matters more.

## Next steps

Tune the weight between the cross-entropy and contrastive losses, try mean or CLS pooling, and compare against prototypical networks.

## Files

- `slides.pdf`: final presentation
- `notebook/`: training and evaluation notebook *(to be added)*
