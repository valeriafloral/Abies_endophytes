# <div align="center"> Role of endophytic fungi in the resistance of sacred fir (*Abies religiosa*) to air pollution </div>

### <div align="center">  :construction::construction::construction::construction: REPOSITORY UNDER CONSTRUCTION :construction::construction::construction::construction: </div>






Air pollution by tropospheric ozone (O<sub>3</sub>) is causing the strong decline of sacred fir (*Abies religiosa*) in peripheral areas of Mexico City (de Bauer y Hernández-Tejeda, 2007). However, within high contaminated zones, variation in the level of damage to air pollution was detected among fir individuals. These results suggest that there is genetic variability related to tolerance to (O<sub>3</sub>) (Reyes-Galindo, 2019). Due to their effects on plant resistance to abiotic stresses, it is very likely that endophytic fungi present inside fir leaves are involved in resistance to air pollution (Pan *et al.* 2017).

In this repository, you will find the workflow of a metatranscriptomics analysis from *Abies religiosa* indivuals exposed to high (O<sub>3</sub>) concentrations and showed 2 different phenotypes (tolerant and damaged). 

## **Aims**

1. To characterize the diversity of fungal endophytes inside the leaves of tolerant and damaged fir trees.
2. To detect differential expression of fungal genes from tolerant and damaged fir trees. 
3. To identify fungal genes putitive involved in the resistance to air pollution caused by (O<sub>3</sub>).

## **Prerequisites**

* [FastQC](https://www.bioinformatics.babraham.ac.uk/projects/fastqc/)
* [Trimmomatic-0.39](http://www.usadellab.org/cms/?page=trimmomatic)
* [BWA-0.7.17](http://bio-bwa.sourceforge.net)
* [samtools-1.10](http://www.htslib.org)
* [SPADES-3.14.1](https://cab.spbu.ru/software/spades/)
* [MaxBin2-2.2.4-1](https://sourceforge.net/projects/maxbin2/)
* [Kraken2](https://ccb.jhu.edu/software/kraken2/)
* [Kaiju-1.7.3](http://kaiju.binf.ku.dk)
* [Prodigal-2.6.3](https://github.com/hyattpd/Prodigal)
* [Diamond-2.0.5](https://github.com/bbuchfink/diamond)	


## **Data**

The data comes from Veronica Reyes Galindo's project [***Abies* vs ozone**](https://github.com/VeroIarrachtai/Abies_vs_ozone). For more information about the samples see the folder [**metadata**](https://github.com/VeroIarrachtai/Abies_vs_ozone/blob/master/4_Transcriptomics/metadata/RNA_sacredfir.csv).

For this project **16** samples in total were used:

* **8** samples **tolerant**.
* **8** samples **damaged**.  


## **Workflow**

![](workflow.png)

## **Repository structure**

This repository contains the following folders:

# `/bin`

Folder with the scripts to perform the analysis:

* **README.md**: Every step of the analysis detaily explained.
* **01_filter.sh:** Performs quality analysis with FastQC, adapters deletion and paired-end read merging with *Trimmomatic*.
* **02_removehost.sh:** Deletes host reads with BWA by mapping the paired and unpaired reads to the reference transcriptome and saves the unmapped reads (paired and unpaired) with *samtools*.
* **03_assembly.sh:** Performs the reads assembly into contigs using *metaSPADES*. **Work in progress**
* **04_binning.sh:** Group the contigs into bins with *MaxBin*. **Work in progress**
* **05_kraken.sh:** Performs a taxonomic profile to reads and bins using *Kraken*. **Work in progress**
* **06_kaiju.sh:** Performs a taxonomic profile ro reads and bins using *Kaiju*. **Work in progress**
* **07_prediction.sh:** Performs the genes prediction from the bins using *Prodigal*. **Work in progress**
* **08_annotation.sh:** Annotates the predicted genes by comparing them against the Non-Redundant (NR) protein database. **Work in progress**
  
# `/metadata`


Contains the **RNA_sacredfir.csv** file with information about the samples, and the subfolder `reports` with the output report from *fastqc* and *multiqc* analyses. 

# `/parkinsonlabtutorial`

This folder was made to follow the Parkinson's Lab tutorial Some of the steps of the tutorial are gonna be adapted. This folder will be deleted once the scripts are adapted.

# `/archive/`

Contains the slides for methodological topic seminar were I spoke about the approaches to look for fungal signals in RNA-Seq data.

Also it contains the subfolder `tutorales` with each of the 5 tutoral presentations.  



# `/data`

This folder should contain the raw data and the subsequent analysis outputs. The content will remain hidden until publication. Once published the data will be available on OSF.




<details>
<summary>To run the analysis it is suggested to subdivide this folder into the following subfolders:</summary>
<br>

### `/raw/`
Must contain the raw reads.

### `/filter/`


Contains the following subfolders:

1. **`/outputs`:** with the outputs from the filtering process (trimming with *Trimmomatic* and host reads remotion with *BWA* and *samtools*): 
2. **`/adapters/`:** with a symbolic link to the adapters folder from Trimmomatic data.
3. **`/reference/`:** with the *A. balsamea* reference transcriptome in `.fa`files also it contains de index files made wit *BWA*.


### `/assembly/`
Contains subfolders with metaSPADES outputs from every sample (Every subfolder is called: `samplename_assembly`).

### `/binning/`
Contains the output from MaxBin.

### `/taxonomy/`
Contains the subfolders `/kraken/` and `/kaiju/` with every software output from reads and bins. 


### `/function/`
Contains the subfolders `/prediction/`and `/annotation/`with every output from *Prodigal* and *Diamond* respectively.

</details>



## **References**

* de Bauer, M. de L., y Hernández-Tejeda, T. (2007). A review of ozone- induced effects on the forests of central Mexico.
Environmental Pollution, 147: 446–453.
* Pan, F., Su, T. J., Cai, S. M., & Wu, W. (2017). Fungal endophyte-derived Fritillaria unibracteata var. wabuensis: diversity, antioxidant capacities in vitro and relations to phenolic, flavonoid or saponin compounds. Scientific reports, 7: 1-14.
* Reyes-Galindo, V. (2019). Análisis transcriptómico de la tolerancia a ozono troposférico en Abies religiosa (Tesis de
maestría). Universidad Nacional Autónoma de México. México.

