# Repository Overview 
This repository contains tools and workflows for optimizing Continuous Integration (CI) performance by reusing minified versions of R packages. By caching and retrieving precompiled historical versions of R packages, we significantly reduce build times and conserve CI resources.
# Project Background
The project addresses inefficiencies in current CI workflows that involve rebuilding and reinstalling R packages for each job run. By leveraging artifact caching and minimizing package installations, this approach enhances time efficiency and speeds up job runs.
# Key Features
- Artifact Caching & Retrieval: Utilizes GitHub Actions to store and retrieve precompiled versions of R packages, avoiding redundant compilations.

- Minimized Package Installation: Reduces package size and installation time by excluding non-essential components such as documentation, vignettes, and tests.

- Integration with GitHub Actions: Automatically checks for cached artifacts and either downloads or builds and caches minified versions as needed.
# Implementation
 ## Minimized Package 
**Step** 1 Download pacakage data.table_1.16.99.tar.gz from [data.table](https://cran.r-project.org/web/packages/data.table/index.html)

**Step 2** Run  
```sh 
git clone  https://github.com/tech0priyanshu/r-package-ci-optimization.git
```
**Step** 3 To maintain the integrity of our CI workflow, it is essential to ensure that both our minified R package and the necessary files are present in the same directory. Additionally, we must ensure that the script has execution permissions.

**Step** 4 Run the Script 
```sh
 bash minimize_and_install.sh
```

Excepted Output :

![Output](https://github.com/user-attachments/assets/ddad416d-7dc8-4fe7-8866-d39a69fffb39)

Impact :

![Impact](https://github.com/user-attachments/assets/cb071822-5c66-4aae-84ea-eebba6b5a224)


## Artifact Caching & Retrieval:Underdevelopment

## Intergration:Underdevelopment
