def get_input_for_shape_inject(wildcards):
    """
    Returns the input segmentation file path for shape injection

    :param wildcards: BIDS wildcards for subject and hemisphere
    :type wildcards: dict
    :return: Returns the segmentation file path for shape injection

    """
    if config["modality"] == "cropseg":
        seg = bids(
            root=work,
            datatype="anat",
            **config["subj_wildcards"],
            suffix="dseg.nii.gz",
            space="corobl",
            hemi="{hemi}"
        ).format(**wildcards)
    elif get_modality_key(config["modality"]) == "seg":
        modality_suffix = get_modality_suffix(config["modality"])
        seg = (
            bids(
                root=work,
                datatype="anat",
                **config["subj_wildcards"],
                suffix="dseg.nii.gz",
                space="corobl",
                hemi="{hemi}",
                from_="{modality_suffix}"
            ).format(**wildcards, modality_suffix=modality_suffix),
        )
    else:
        seg = bids(
            root=work,
            datatype="anat",
            **config["subj_wildcards"],
            suffix="dseg.nii.gz",
            desc="nnunet",
            space="corobl",
            hemi="{hemi}"
        ).format(**wildcards)
    return seg


def get_input_splitseg_for_shape_inject(wildcards):
    """
    Returns input for shape injection

    :param wildcards: Dictionary containing wildcards
    :type wildcards: Dictionary
    :return: Returns input for shape injection

    """
    if config["modality"] == "cropseg":
        seg = bids(
            root=work,
            datatype="anat",
            **config["subj_wildcards"],
            suffix="dsegsplit",
            space="corobl",
            hemi="{hemi}"
        ).format(**wildcards)

    elif get_modality_key(config["modality"]) == "seg":
        modality_suffix = get_modality_suffix(config["modality"])
        seg = bids(
            root=work,
            datatype="anat",
            **config["subj_wildcards"],
            suffix="dsegsplit",
            space="corobl",
            hemi="{hemi}",
            from_="{modality_suffix}"
        ).format(**wildcards, modality_suffix=modality_suffix)
    else:
        seg = bids(
            root=work,
            datatype="anat",
            **config["subj_wildcards"],
            suffix="dsegsplit",
            desc="nnunet",
            space="corobl",
            hemi="{hemi}"
        ).format(**wildcards)
    return seg


rule prep_segs_for_greedy:
    """
    Prepares segmentations for greedy registration by splitting them into individual labels and smoothing them.
    
    :input "{prefix}_dseg.nii.gz":  The input segmentation file.
    
    :params labels:                 A space-separated list of label values to retain.
                                    For example, "1 2 3".
                                    Default is defined in the config file.
                                    
            smoothing_stdev:        The standard deviation of the Gaussian kernel used for smoothing.
                                    Default is defined in the config file.
    
    :output directory("{prefix}_dsegsplit"): A directory containing the split and smoothed label files.
    
    :group:                        "subj".
    :container:                    The container configuration defined in the config file.
    :threads:                      8.
    :shell:                        The shell command used to split and smooth the segmentation files.
    
    .. note::
        If a label file is not found, it will not be used in the registration.
        The numbering of the label files will be from 1 to N, where N is the number of labels retained.
        If a line goes over 50 characters, indent the remaining text 8 spaces to align with the first line.
    """
    input:
        "{prefix}_dseg.nii.gz",
    params:
        labels=" ".join(str(label) for label in config["shape_inject"]["labels_reg"]),
        smoothing_stdev=config["shape_inject"]["label_smoothing_stdev"],
    output:
        directory("{prefix}_dsegsplit"),
    group:
        "subj"
    container:
        config["singularity"]["autotop"]
    shell:
        "mkdir -p {output} && "
        "c3d {input} -retain-labels {params.labels} -split -foreach -smooth {params.smoothing_stdev} -endfor -oo {output}/label_%02d.nii.gz"


rule import_template_shape:
    """
    Rule to import the template segmentation for shape injection. 

    :input template_seg:           Path to the template segmentation file.
    
    :output template_seg:          Path to the output template segmentation file.
    
    :group:                        "subj".
    :container:                    config["singularity"]["autotop"].
    :log:                          bids(root="logs", **config["subj_wildcards"], suffix="templateshapereg.txt", hemi="{hemi,Lflip|R}").
    :shell:                        "cp {input} {output}".
    """
    input:
        template_seg=os.path.join(
            workflow.basedir,
            "..",
            "resources",
            "tpl-upenn",
            "tpl-upenn_desc-hipptissue_dseg.nii.gz",
        ),
    output:def get_input_for_shape_inject(wildcards):
    """
    Returns the input segmentation file path for shape injection

    :param wildcards: BIDS wildcards for subject and hemisphere
    :type wildcards: dict
    :return: Returns the segmentation file path for shape injection

    """
    if config["modality"] == "cropseg":
        seg = bids(
            root=work,
            datatype="anat",
            **config["subj_wildcards"],
            suffix="dseg.nii.gz",
            space="corobl",
            hemi="{hemi}"
        ).format(**wildcards)
    elif get_modality_key(config["modality"]) == "seg":
        modality_suffix = get_modality_suffix(config["modality"])
        seg = (
            bids(
                root=work,
                datatype="anat",
                **config["subj_wildcards"],
                suffix="dseg.nii.gz",
                space="corobl",
                hemi="{hemi}",
                from_="{modality_suffix}"
            ).format(**wildcards, modality_suffix=modality_suffix),
        )
    else:
        seg = bids(
            root=work,
            datatype="anat",
            **config["subj_wildcards"],
            suffix="dseg.nii.gz",
            desc="nnunet",
            space="corobl",
            hemi="{hemi}"
        ).format(**wildcards)
    return seg


def get_input_splitseg_for_shape_inject(wildcards):
    """
    Returns input for shape injection

    :param wildcards: Dictionary containing wildcards
    :type wildcards: Dictionary
    :return: Returns input for shape injection

    """
    if config["modality"] == "cropseg":
        seg = bids(
            root=work,
            datatype="anat",
            **config["subj_wildcards"],
            suffix="dsegsplit",
            space="corobl",
            hemi="{hemi}"
        ).format(**wildcards)

    elif get_modality_key(config["modality"]) == "seg":
        modality_suffix = get_modality_suffix(config["modality"])
        seg = bids(
            root=work,
            datatype="anat",
            **config["subj_wildcards"],
            suffix="dsegsplit",
            space="corobl",
            hemi="{hemi}",
            from_="{modality_suffix}"
        ).format(**wildcards, modality_suffix=modality_suffix)
    else:
        seg = bids(
            root=work,
            datatype="anat",
            **config["subj_wildcards"],
            suffix="dsegsplit",
            desc="nnunet",
            space="corobl",
            hemi="{hemi}"
        ).format(**wildcards)
    return seg


rule prep_segs_for_greedy:
    """
    Prepares segmentations for greedy registration by splitting them into individual labels and smoothing them.
    
    :input "{prefix}_dseg.nii.gz":  The input segmentation file.
    
    :params labels:                 A space-separated list of label values to retain.
                                    For example, "1 2 3".
                                    Default is defined in the config file.
                                    
            smoothing_stdev:        The standard deviation of the Gaussian kernel used for smoothing.
                                    Default is defined in the config file.
    
    :output directory("{prefix}_dsegsplit"): A directory containing the split and smoothed label files.
    
    :group:                        "subj".
    :container:                    The container configuration defined in the config file.
    :threads:                      8.
    :shell:                        The shell command used to split and smooth the segmentation files.
    
    .. note::
        If a label file is not found, it will not be used in the registration.
        The numbering of the label files will be from 1 to N, where N is the number of labels retained.
        If a line goes over 50 characters, indent the remaining text 8 spaces to align with the first line.
    """
    input:
        "{prefix}_dseg.nii.gz",
    params:
        labels=" ".join(str(label) for label in config["shape_inject"]["labels_reg"]),
        smoothing_stdev=config["shape_inject"]["label_smoothing_stdev"],
    output:
        directory("{prefix}_dsegsplit"),
    group:
        template_seg=bids(
            root=work,
            datatype="anat",
            space="template",
            **config["subj_wildcards"],
            desc="hipptissue",
            suffix="dseg.nii.gz"
        ),
    group:
        "subj"
    shell:
        "cp {input} {output}"


def get_image_pairs(wildcards, input):
    """
    Generates image pairs for greedy registration

    :param wildcards: wildcards: dictionary containing wildcard values
    :type wildcards: dict
    :param input: input: input file(s) for the rule
    :type input: list
    :return: Returns a formatted string of image pairs for greedy registration

    """
    """This rule requires snakemake 6.4.0, since it uses the new feature to execute if input files are not found"""

    import errno

    if not os.path.exists(input.subject_seg):
        raise FileNotFoundError(
            errno.ENOENT, os.strerror(errno.ENOENT), input.subject_seg
        )
    if not os.path.exists(input.template_seg):
        raise FileNotFoundError(
            errno.ENOENT, os.strerror(errno.ENOENT), input.template_seg
        )

    args = []
    # prep_segs_for_greedy creates label_{i} images for each entry in labels_reg,
    # but the numbering will be from 1 to N (not the numbers in the list)
    for label in range(1, len(config["shape_inject"]["labels_reg"]) + 1):
        subject_label = f"{input.subject_seg}/label_{label:02d}.nii.gz"
        template_label = f"{input.template_seg}/label_{label:02d}.nii.gz"

        if not os.path.exists(subject_label):
            print(f"Warning: {subject_label} does not exist, not using in registration")
            continue
        if not os.path.exists(template_label):
            print(
                f"Warning: {template_label} does not exist, not using in registration"
            )
            continue

        args.append("-i")
        args.append(subject_label)  # subject is fixed
        args.append(template_label)  # template is moving
    return " ".join(args)


def get_inject_scaling_opt(wildcards):
    """
    Sets the smoothness of the greedy template shape injection deformation

    :param wildcards: sets the smoothness of the greedy template shape injection deformation
    :type wildcards: string
    :return: string

    """
    """sets the smoothness of the greedy template shape injection deformation"""

    gradient_sigma = 1.732 * float(config["inject_template_smoothing_factor"])
    warp_sigma = 0.7071 * float(config["inject_template_smoothing_factor"])

    return f"-s {gradient_sigma}vox {warp_sigma}vox"


rule template_shape_reg:
    """
    Rule to register the subject's segmented brain to the template brain segmented into hippocampal tissue. 
    Uses greedy registration with affine and scaling options. 
    Outputs a transformation matrix and warp file for each hemisphere.
    
    :input template_seg:           Segmented template brain in hippocampal tissue space.
    :input subject_seg:            Segmented subject brain in native space.
    
    :params general_opts:          Options for greedy registration.
    :params affine_opts:           Options for affine registration.
    :params greedy_opts:           Options for greedy registration with scaling.
    :params img_pairs:             Image pairs for registration.
    
    :output matrix:                Transformation matrix for each hemisphere.
    :output warp:                  Warp file for each hemisphere.
    
    :group:                        "subj".
    :container:                    Singularity container configuration.
    :threads:                      8.
    :log:                          Log file for each hemisphere.
    :shell:                        Shell command for affine and greedy registration.
    
    .. note::
        The registration is performed separately for each hemisphere.
        The input and output files are formatted using wildcards.
        The img_pairs parameter is generated using a Python function.
        The greedy_opts parameter is generated using a Python function.
        The log file is formatted using wildcards.
    """
    input:
        template_seg=bids(
            root=work,
            datatype="anat",
            space="template",
            **config["subj_wildcards"],
            desc="hipptissue",
            suffix="dsegsplit"
        ),
        subject_seg=get_input_splitseg_for_shape_inject,
    params:
        general_opts="-d 3 -m SSD",
        affine_opts="-moments 2 -det 1",
        greedy_opts=get_inject_scaling_opt,
        img_pairs=get_image_pairs,
    output:
        matrix=bids(
            root=work,
            **config["subj_wildcards"],
            suffix="xfm.txt",
            datatype="warps",
            desc="moments",
            from_="template",
            to="subject",
            space="corobl",
            type_="ras",
            hemi="{hemi,Lflip|R}"
        ),
        warp=bids(
            root=work,
            **config["subj_wildcards"],
            suffix="xfm.nii.gz",
            datatype="warps",
            desc="greedy",
            from_="template",
            to="subject",
            space="corobl",
            hemi="{hemi,Lflip|R}"
        ),
    group:
        "subj"
    container:
        config["singularity"]["autotop"]
    threads: 8
    log:
        bids(
            root="logs",
            **config["subj_wildcards"],
            hemi="{hemi,Lflip|R}",
            suffix="templateshapereg.txt"
        ),
    shell:
        #affine (with moments), then greedy
        "greedy -threads {threads} {params.general_opts} {params.affine_opts} {params.img_pairs} -o {output.matrix}  &> {log} && "
        "greedy -threads {threads} {params.general_opts} {params.greedy_opts} {params.img_pairs} -it {output.matrix} -o {output.warp} &>> {log}"


rule template_shape_inject:
    """
    Rule description
    
    This rule performs a template shape injection on a subject's segmentation. 
    It uses the greedy algorithm to deform the subject's segmentation to match the template's segmentation. 
    The resulting segmentation is saved as a new file with the suffix "inject". 
    This rule is part of the shape injection workflow.
    
    :input template_seg:           The template segmentation file in the template space.
                                   It should be a dseg.nii.gz file with the suffix "hipptissue".
    :input subject_seg:            The subject segmentation file in the subject space.
                                   It should be a dseg.nii.gz file.
    :input matrix:                 The transformation matrix from the template space to the subject space.
                                   It should be a warps file with the suffix "xfm.txt" and the desc "moments".
    :input warp:                   The warp file from the template space to the subject space.
                                   It should be a warps file with the suffix "xfm.nii.gz" and the desc "greedy".
    :params interp_opt:            The interpolation option for the greedy algorithm.
                                   It should be "-ri LABEL 0.2vox".
    
    :output inject_seg:            The resulting segmentation file after template shape injection.
                                   It should be a dseg.nii.gz file with the suffix "inject" and the space "corobl".
    :log:                          The log file for this rule.
                                   It should be a txt file with the suffix "templateshapeinject.txt".
    
    :group:                        "subj"
    :container:                    The container configuration for this rule.
                                   It uses the "autotop" singularity image.
    :threads:                      8
    :shell:                        The shell command for this rule.
                                   It uses the greedy algorithm to perform the template shape injection.
    
    .. note::
        This rule is part of the shape injection workflow.
        The resulting segmentation file is saved as a new file with the suffix "inject".
        The interpolation option for the greedy algorithm is "-ri LABEL 0.2vox".
    """
    input:
        template_seg=bids(
            root=work,
            datatype="anat",
            space="template",
            **config["subj_wildcards"],
            desc="hipptissue",
            suffix="dseg.nii.gz"
        ),
        subject_seg=get_input_for_shape_inject,
        matrix=bids(
            root=work,
            **config["subj_wildcards"],
            suffix="xfm.txt",
            datatype="warps",
            desc="moments",
            from_="template",
            to="subject",
            space="corobl",
            type_="ras",
            hemi="{hemi}"
        ),
        warp=bids(
            root=work,
            **config["subj_wildcards"],
            suffix="xfm.nii.gz",
            datatype="warps",
            desc="greedy",
            from_="template",
            to="subject",
            space="corobl",
            hemi="{hemi}"
        ),
    params:
        interp_opt="-ri LABEL 0.2vox",
    output:
        inject_seg=bids(
            root=work,
            datatype="anat",
            **config["subj_wildcards"],
            suffix="dseg.nii.gz",
            desc="inject",
            space="corobl",
            hemi="{hemi,Lflip|R}"
        ),
    log:
        bids(
            root="logs",
            **config["subj_wildcards"],
            suffix="templateshapeinject.txt",
            hemi="{hemi,Lflip|R}"
        ),
    group:
        "subj"
    container:
        config["singularity"]["autotop"]
    threads: 8
    shell:
        "greedy -d 3 -threads {threads} {params.interp_opt} -rf {input.subject_seg} -rm {input.template_seg} {output.inject_seg}  -r {input.warp} {input.matrix} &> {log}"


rule inject_init_laplace_coords:
    """
Rule description

    This rule injects initial Laplace coordinates into the subject's segmentation. 
    It uses greedy to register the subject's segmentation to the template's segmentation. 
    The resulting warp and matrix are used to inject the template's segmentation into the subject's segmentation. 
    The resulting segmentation is then reinserted into the subject's original segmentation. 

    :input coords:                  Path to the template's Laplace coordinates.
    :input subject_seg:             Path to the subject's segmentation.
    :input matrix:                  Path to the warp matrix.
    :input warp:                    Path to the warp file.
    
    :output init_coords:            Path to the output Laplace coordinates.
    
    :log:                          Path to the log file.
    
    :group:                        "subj".
    :container:                    Singularity container configuration.
    :threads:                      8.
    :shell:                        Shell command to execute.
    
    .. note::
        The Laplace coordinates are injected using greedy with nearest neighbor interpolation.
    """
    input:
        coords=os.path.join(
            workflow.basedir,
            "..",
            "resources",
            "tpl-upenn",
            "tpl-upenn_dir-{dir}_label-{autotop}_coords.nii.gz",
        ),
        subject_seg=get_input_for_shape_inject,
        matrix=bids(
            root=work,
            **config["subj_wildcards"],
            suffix="xfm.txt",
            datatype="warps",
            desc="moments",
            from_="template",
            to="subject",
            space="corobl",
            type_="ras",
            hemi="{hemi}"
        ),
        warp=bids(
            root=work,
            **config["subj_wildcards"],
            suffix="xfm.nii.gz",
            datatype="warps",
            desc="greedy",
            from_="template",
            to="subject",
            space="corobl",
            hemi="{hemi}"
        ),
    params:
        interp_opt="-ri NN",
    output:
        init_coords=bids(
            root=work,
            datatype="coords",
            **config["subj_wildcards"],
            dir="{dir}",
            label="{autotop}",
            suffix="coords.nii.gz",
            desc="init",
            space="corobl",
            hemi="{hemi,R|Lflip}"
        ),
    log:
        bids(
            root="logs",
            **config["subj_wildcards"],
            dir="{dir}",
            label="{autotop}",
            suffix="injectcoords.txt",
            desc="init",
            hemi="{hemi,R|Lflip}"
        ),
    group:
        "subj"
    container:
        config["singularity"]["autotop"]
    threads: 8
    shell:
        "greedy -d 3 -threads {threads} {params.interp_opt} -rf {input.subject_seg} -rm {input.coords} {output.init_coords}  -r {input.warp} {input.matrix} &> {log}"


rule reinsert_subject_labels:
    """
    Rule to reinsert subject labels
    
    :input inject_seg:             Path to the subject segmentation file with labels to be reinserted.
    :input subject_seg:            Path to the subject segmentation file.
    
    :params labels:                String of labels to be reinserted.
    
    :output postproc_seg:          Path to the post-processed segmentation file.
    
    :group:                        "subj".
    :container:                    Singularity container configuration.
    :shell:                        Shell command to execute.
    
    .. note::
        This rule reinserts subject labels into a post-processed segmentation file.
        The input files are the subject segmentation file and the file with labels to be reinserted.
        The output file is the post-processed segmentation file.
        The group is "subj".
        The container is a Singularity container.
        The shell command executes the reinsertion of labels.
    """
    input:
        inject_seg=bids(
            root=work,
            datatype="anat",
            **config["subj_wildcards"],
            suffix="dseg.nii.gz",
            desc="inject",
            space="corobl",
            hemi="{hemi}"
        ),
        subject_seg=get_input_for_shape_inject,
    params:
        labels=" ".join(
            str(label) for label in config["shape_inject"]["labels_reinsert"]
        ),
    output:
        postproc_seg=bids(
            root=work,
            datatype="anat",
            **config["subj_wildcards"],
            suffix="dseg.nii.gz",
            desc="postproc",
            space="corobl",
            hemi="{hemi,Lflip|R}"
        ),
    group:
        "subj"
    container:
        config["singularity"]["autotop"]
    shell:
        "c3d {input.subject_seg} -retain-labels {params.labels} -popas LBL -push LBL -threshold 0 0 1 0 {input.inject_seg} -multiply -push LBL -add -o {output.postproc_seg}"


rule unflip_postproc:
    """
    Unflip post-processed segmentation files for the left hemisphere. 
    If the input file is named with the suffix "Lflip", this rule will flip it back to its original orientation. 
    This rule takes one input:
    
        :input nii:                The input segmentation file to be unflipped.
        
    And produces one output:
    
        :output nii:               The unflipped segmentation file.
        
    This rule does not use any configuration or parameters. 
    
    :group:                       "subj"
    :container:                   config["singularity"]["autotop"]
    :log:                         A log file for the unflip operation.
    :shell:                       The command to unflip the segmentation file.
    """
    input:
        nii=bids(
            root=work,
            datatype="anat",
            suffix="dseg.nii.gz",
            desc="postproc",
            space="corobl",
            hemi="{hemi}flip",
            **config["subj_wildcards"]
        ),
    output:
        nii=bids(
            root=work,
            datatype="anat",
            suffix="dseg.nii.gz",
            desc="postproc",
            space="corobl",
            hemi="{hemi,L}",
            **config["subj_wildcards"]
        ),
    container:
        config["singularity"]["autotop"]
    group:
        "subj"
    shell:
        "c3d {input} -flip x {output}"
