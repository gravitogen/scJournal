#!/bin/bash
ACC_FILE=SRR_Acc_List.txt
value=`cat $ACC_FILE`

for v in $value
do
    echo $v
    fastq-dump --split-files --origfmt --gzip $v
done

mkdir -p fastqgz/

for file in *.fastq.gz
do
    mv $file "fastqgz/${file%.fastq.gz}_S1_L001_R1_001.fastq.gz"
done
