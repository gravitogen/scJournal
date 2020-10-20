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


# References

1. https://informatics.fas.harvard.edu/atac-seq-guidelines.html
2. 
