task samSort {

    String docker_container
    Int num_cores = 8
    String memory
    
    String sample_name
    File aligned_bam

    String sorted_bam_file_name = sub(basename(aligned_bam),'.bam','.sortedByCoord.bam')

    runtime {
         docker: "${docker_container}"
         cpu: "${num_cores}"
         memory: "${memory}"
         maxRetries: 0
    }

    command {
        echo 'Finished converting to bam'

        /opt/gatk-4.1.9.0/gatk SortSamSpark \
            -I ${aligned_bam} \
            -O ${sorted_bam_file_name}  \
            --conf 'spark.executor.cores=7'

        echo 'finished making sortsamspark'
    }

    output {
        File sorted_bam = '${sorted_bam_file_name}'
        File sorted_bam_index = '${sorted_bam_file_name}.bai'
    }
}

workflow samtools_test {

    String sample_name
    File bam_file

    String docker_container = "quay.io/helomics/dnaseq-centos-cloudos"
    String? null_val

    String sam_sort_mem = "8G"

    call samSort {
        input: aligned_bam = bam_file,
               sample_name = sample_name,
               docker_container = docker_container,
               memory = sam_sort_mem
    }

    output {
        File sorted_bam = samSort.sorted_bam
        File sorted_bam_index = samSort.sorted_bam_index
    }
}
