
# From SRA to BAM file


## Download Human Reference dataset
```
wget https://cf.10xgenomics.com/supp/cell-exp/refdata-gex-GRCh38-2020-A.tar.gz
tar -xzvf  refdata-gex-GRCh38-2020-A.tar.gz

```

## Download Mouse Reference dataset
```
wget https://cf.10xgenomics.com/supp/cell-exp/refdata-gex-mm10-2020-A.tar.gz
tar -xzvf  refdata-gex-mm10-2020-A.tar.gz

```

## Download and Install SRA Toolkit

Reference: https://www.ncbi.nlm.nih.gov/sra/docs/sradownload/

Download the SRA toolkit:

```
wget https://ftp-trace.ncbi.nlm.nih.gov/sra/sdk/2.10.8/sratoolkit.2.10.8-ubuntu64.tar.gz
```

Install SRA toolkit:

```
sudo cp sratoolkit.2.10.8-ubuntu64.tar.gz /opt
cd /opt
sudo tar -xzvf sratoolkit.2.10.8-ubuntu64.tar.gz

```

Add the following at the end of the `~/.bashrc` file


```
export PATH=$PATH:/opt/sratoolkit.2.10.8-ubuntu64/bin
```
and then source the `/.bashrc` file:

```
source ~/.bashrc
```

Now lets show with an example, how to use SRA Run selector to download the SRA 

## Example

1. We wil use data from GSE104323. Go to https://www.ncbi.nlm.nih.gov/geo/query/acc.cgi?acc=GSE104323
2. We are interested in the data from mouse P0. For the we will note down sample GSM2795247
3. Now click on [SRA Run Selector](https://www.ncbi.nlm.nih.gov/Traces/study/?acc=PRJNA412365) at the bottom. This will open a new tab/window with SRA Run Selector. In search box of SRR table, type GSM2795247 as noted in the step 2.
4. Select all the runs corresponding to GSM2795247. There should be a total of 136 samples. Click on Accession List of select portion to download the required accession list. This will download an SRR_Acc_List.txt
5. Run following: 


```
prefetch --option-file SRR_Acc_List.txt
```
Note, if you are using HPC, you can load SRA module with the command `module load sratoolkit/2/2.10.0`

This will download all the sra file in their respective folder. This annoying because usually we want all .sra file to be in the same directory, but I do not know a way of doing that. So I gathered .sra file to same directory once all .sra files were download to the their respective named directory.

6. Now I will generate fastq file from .sra file using fastq-dump command:

```
fastq-dump *.sra
```

# Installing STAR for alignment

```
wget https://github.com/alexdobin/STAR/archive/2.7.5c.tar.gz
sudo cp  2.7.5c.tar.gz /opt
sudo tar -xzf 2.7.5c.tar.gz
```

Add the following at the end of the `~/.bashrc` file

```
export PATH=$PATH:/opt/STAR-2.7.5c/bin/Linux_x86_64_static

```

and then source the `/.bashrc` file:

```
source ~/.bashrc
```

Since GSM2795247 is a mousic cell, we will use the mouse reference gnome, refdata-gex-mm10-2020-A. Lets assume that they are in directory `~/refdata-gex-mm10-2020-A`.

We will first create a genome index.

## Create genome index

To store the genome index, we will create a folder mm10index
```
mkdir mm10index
```
Now we run the `STAR` command to generate reference genome

```
STAR --runThreadN 6 --runMode genomeGenerate --genomeDir ~/mm10index --genomeFastaFiles ~/refdata-gex-mm10-2020-A/fasta/genome.fa --sjdbGTFfile ~/refdata-gex-mm10-2020-A/genes/genes.gtf --sjdbOverhang 99
```

This is going to take a while.

Once we have genome index, we can perform alignment as follows:

```
 STAR --runThreadN 7 --genomeDir mm10index/ --sjdbGTFfile ~/refdata-gex-mm10-2020-A/genes/genes.gtf  --sjdbOverhang 99 --readFilesIn ~/fastq/SRR6084365.fastq --outSAMtype BAM SortedByCoordinate --outSAMunmapped Within --outSAMattributes Standard -outFileNamePrefix GSM2795247
```

This will produce a .bam file in the current directory.


## References
1. https://support.10xgenomics.com/single-cell-gene-expression/software/downloads/latest
2. https://github.com/ncbi/sra-tools/wiki/HowTo:-fasterq-dump
3. https://github.com/ncbi/sra-tools/wiki/03.-Quick-Toolkit-Configuration
4. https://github.com/ncbi/sra-tools/wiki/02.-Installing-SRA-Toolkit
5. https://trace.ncbi.nlm.nih.gov/Traces/sra/sra.cgi?view=toolkit_doc&f=fastq-dump
6. https://www.ncbi.nlm.nih.gov/sra/docs/sradownload/
7. https://sci-hub.tw/10.1038/s41593-017-0056-2
8. https://github.com/hbctraining/Intro-to-rnaseq-hpc-O2/blob/master/lessons/02_assessing_quality.md
9. https://github.com/alexdobin/STAR
10. https://physiology.med.cornell.edu/faculty/skrabanek/lab/angsd/lecture_notes/STARmanual.pdf
11. https://www.ncbi.nlm.nih.gov/pmc/articles/PMC4631051/pdf/nihms722197.pdf
