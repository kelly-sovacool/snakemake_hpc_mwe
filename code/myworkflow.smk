samples, = glob_wildcards("data/sample_{sample}.txt")

rule targets:
	input:
		expand("results/result_{sample}.txt", sample = samples)	

rule copy:
	input:
		"data/sample_{sample}.txt"
	output:
		"results/result_{sample}.txt"
	shell:
		"cp {input} {output}"
