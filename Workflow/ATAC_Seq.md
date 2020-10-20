# ATAC-Seq Workflow

## Installing cutadapter for adapter removal

`cutadapter` is used for adapter removal. 

```
sudo apt-get install cutadapter
```

In a python virtual machine, it can be installed as `pip install cutadapt` 

## Installing NGMerge for adapter removal

```
git clone https://github.com/harvardinformatics/NGmerge
cd NGmerge
make
```

`make` will produce an executable `NGmerge`, you can run as `./NGmerge`.

## Alignment

Aligning the read to the reference genomes is required in the next step. We will use `bowtie2` for the purpose. 

For many model organisms, the genome and pre-built reference indexes are available from [iGenomes](https://support.illumina.com/sequencing/sequencing_software/igenome.html).

# References

1. https://informatics.fas.harvard.edu/atac-seq-guidelines.html
2. 
