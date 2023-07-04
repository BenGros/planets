# medium_rule.smk

> This rule aligns reads to a reference genome using BWA-MEM and
> generates a BAM file and alignment statistics.
>
> input fastq  
> The input FASTQ file containing the reads to be aligned.
>
> input genome  
> The reference genome in FASTA format.
>
> input index  
> The index file for the reference genome.
>
> output bam  
> The output BAM file containing the aligned reads.
>
> output stats  
> The output text file containing alignment statistics.
>
> param threads  
> The number of threads to use for alignment.
>
> param mem  
> The amount of memory to allocate for alignment.
>
> shell  
> The shell command to execute the alignment and generate the BAM file
> and alignment statistics.
>
> <div class="collapse">
>
> See Code Here
>
> ``` 
> rule align_reads:
>     input:
>         fastq="data/{sample}.fastq",
>         genome="reference/genome.fasta",
>         index="reference/genome.fasta.fai"
>     output:
>         bam="alignments/{sample}.bam",
>         stats="alignments/{sample}.stats.txt"
>     params:
>         threads=4,
>         mem="8G"
>     shell:
>         """
>         bwa mem -t {params.threads} -M {input.genome} {input.fastq} | samtools view -Sb - > {output.bam}
>         samtools flagstat {output.bam} > {output.stats}
>         """
> ```
>
> </div>
