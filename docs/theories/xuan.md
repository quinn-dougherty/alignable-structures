---
sidebar_position: 7
---

# Tan Zhi-Xuan

## AI Engineering Platforms for Alignable and Interpretable Structures

To build aligned AI systems with strong safety guarantees, it may be important to develop engineering platforms for interpretable and formally correct model-based reasoning. To ensure adoption, these platforms also need to deliver comparable performance relative to competing approaches, while ensuring modularity and ease-of-use. We present two such prototype platforms (described below), the first for simulation-based Bayesian inference via probabilistic programming, and the second for model-based automated planning, along with illustrations of how they can be combined to develop more principled and interpretable approaches to planning under uncertainty and inferring human goals.

### Genify.jl: Transforming Julia into Gen to enable programmable inference

A wide variety of libraries implement stochastic simulators for the purposes of computational science. However, these simulators are not generally amenable to Bayesian inference. Genify.jl address this by transforming plain Julia code into generative functions in Gen, a universal probabilistic programming system with programmable inference. This will also serve as an introduction to recent advances in probabilistic programming, along with their relevance to epistemic public goods, AI capabilities, and AI safety.

### PDDL.jl: A fast and flexible interface for automated model-based planning

The Planning Domain Definition Language (PDDL) is a formal specification language for symbolic planning that is widely used by the AI planning community. Here we present PDDL.jl, a general high-performance platform for contemporary AI applications and research programs that leverage automated symbolic planning. This will also serve as an introduction to the symbolic planning paradigm of AI, how it can be integrated with Bayesian methods like probabilistic programming, its relevance to inner alignment and interpretability, and its prospects as an alternative (potentially safer) scaling route to pure deep learning.

## Keywords
- Probabilistic programming
- Planning
