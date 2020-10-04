# Installing Kallisto on Ubuntu 18.04

## Download the Kallisto

```bash
wget https://github.com/pachterlab/kallisto/releases/download/v0.46.2/kallisto_linux-v0.46.2.tar.gz
```
Extract using the command:

## Extract the tarball

```bash
tar -xzvf kallisto_linux-v0.46.2.tar.gz 
```

This will create a kallisto folder in your work directory. Let's say your working directory is `/home/gravitogen/softwares`.
Now add the software path to `.bashrc` file. 

Add the following at the end of the `~/.bashrc` file:

```bash
export PATH=$PATH:/home/gravitogen/softwares/kallisto
```

and then source the `ls -/.bashrc` file:

```bash
source ~/.bashrc

```
Now, you are ready to use Kallisto. Type `kallisto` in command prompt. You will see something like this in the output:

```
kallisto 0.46.2

Usage: kallisto <CMD> [arguments] ..

Where <CMD> can be one of:

    index         Builds a kallisto index 
    quant         Runs the quantification algorithm 
    bus           Generate BUS files for single-cell data 
    pseudo        Runs the pseudoalignment step 
    merge         Merges several batch runs 
    h5dump        Converts HDF5-formatted results to plaintext
    inspect       Inspects and gives information about an index
    version       Prints version information
    cite          Prints citation information

Running kallisto <CMD> without arguments prints usage information for <CMD>

```

Enjoy.
