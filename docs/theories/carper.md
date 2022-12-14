---
sidebar_position: 7
---

# Alex Havrilla

Controlled automated story generation seeks to generate natural language stories satisfying constraints from natural language critiques or _preferences_. Existing methods to control for story preference either rely on labor intensive or often inconsistent prompt engineering. They may also use logit-manipulation methods which require annotated datasets to exist for the desired attributes. To address these issues, we first train a contrastive bi-encoder model to align stories with corresponding human critiques, named _CARP_, building a general purpose _preference model_. This is subsequently used as a reward function to fine-tune a generative language model via PPO-based reinforcement learning toward a particular set of preferences. However, simply fine-tuning a generative language model with a contrastive preference model does not reliably result in a story generation system capable of generating stories that meet user preferences. To increase story generation robustness we further fine-tune the contrastive model using a prompt-learning technique. A human participant study is then conducted comparing generations from our system, ablations, and a prompted LLM baseline. We show that the full fine-tuning pipeline results in a story generator preferred over a LLM 20x as large.

## Keywords
- LLM
- Preference learning
