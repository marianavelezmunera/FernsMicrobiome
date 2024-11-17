# Changes in the microbial communities of a tree fern along an elevation gradient.
This GitHub Repository contains code and data included in 

Mariana Vélez-Múnera, Morena Avitia, Eria A. Rebollar et al. Changes in the phyllosphere and rhizosphere of a cloud forest tree fern along an elevation gradient, 15 November 2024, PREPRINT (Version 1) available at Research Square [https://doi.org/10.21203/rs.3.rs-5374836/v1]

# Summary

The diversity of plant-associated microbial communities is shaped by both host-associated factors and environmental factors. Natural environmental gradients, specifically elevational ones, can serve as study systems to understand community and ecosystem responses to environmental changes, however the relationship between elevation and microbiota is not completely understood, especially in non-model systems such as wild plants. In this paper we explored the role of environmental factors in shaping the diversity and structure of the rhizosphere and phyllosphere of the cloud forest tree fern Cyathea fulva. Swabs of mature leaves, soil and rhizosphere samples were collected from 15 individual tree ferns within five forest plots along an elevation gradient ranging from 1978 to 2210 meters above sea level. Physicochemical soil data were collected, along with environmental data of all plots. Using 16S rRNA and ITS1 amplicon sequencing, we tested for differences in diversity, relative abundance, and composition of bacterial and fungal communities and their potential abiotic drivers. We found comparable levels of alpha diversity between sites for fungi, but we did find differences for bacterial alpha diversity. We found a monotonic decrease in bacterial alpha diversity with elevation in the phyllosphere and rhizosphere, but this pattern was only found for fungal alpha diversity in the rhizosphere. Significant changes in community structure and composition along the elevation gradient were found in both the fungal and bacterial phyllosphere and rhizosphere. Our results suggest a close relationship between elevation and the overall microbial structure in tree ferns. We envision this information will help to further understand the dynamics between microbiota and wild plants, contributing to the conservation of necessary interactions for plants and ecosystems wellbeing.

# Data availability

All raw sequences are publish in NCBI GenBank under the Bioproject PRJNA1180585

This repository contains two folders:

- **QIIME2:** With all code used to filter the sequences using the QIIME2 pipeline and its associated metadata (QIIME2Bacteria.ipynb, QIIME2Fungi.ipynb, metadata_bacteria_qiime.txt and metadata_fungi_qiime.txt)
- **R:** That contains all QIIME artifacts imported to R (DADA2 Tables:TableDADA2Bacteria.qza and TableDADA2Fungi.qza; phylogenetic tres: RootedTreeBacteria.qza and RootedTreeFungi.qza; taxonomy tables: TaxonomyBacteria.qza and TaxonomyFungi.qza, and beta diversity matrix: unifrac_bacteria.qza, wunifrac_bacteria.qza, unifrac_fungi.qza and wunifrac_fungi.qza), and all code used to analyze the data, including the metadata files with the description of the data. 

All files are named indicating the microbial community the belong to (bacteria or fungi)
