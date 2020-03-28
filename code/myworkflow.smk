samples, = glob_wildcards("data/sample_{sample}.txt")

rule targets:
    input:
        expand("results/sample_{sample}_sleep.txt", sample = samples)

rule copy:
    input:
        txt="data/sample_{sample}.txt"
    output:
        txt="results/sample_{sample}_copy.txt"
    shell:
        "cp {input} {output}"

rule sleep:
    input:
        rules.copy.output.txt
    output:
        "results/sample_{sample}_sleep.txt"
    shell:
        """
        echo "Imagine that this is a job with more intensive resource requirements..."
        time sleep 5s > {output}
        """

rule clean:
    shell:
        "rm results/*"
