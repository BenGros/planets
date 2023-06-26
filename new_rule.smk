rule simple_rule:
    input:
        "input_file.txt"
    output:
        "output_file.txt"
    shell:
        """
        echo "Running simple rule"
        cp {input} {output}
        """
