This code labels subfields using volumetric coordinates and atlas subfield labels.

:param label_nii: BIDS path to subfields nifti file, defaults to bids(root=work, datatype="anat", suffix="subfields.nii.gz", space="unfold", hemi="{hemi}", label="hipp", atlas="{atlas}", **config["subj_wildcards"])
:type label_nii: BIDSPath, optional
:param nii_ap: BIDS path to AP coordinates nifti file, defaults to bids(root=work, datatype="coords", dir="AP", label="hipp", suffix="coords.nii.gz", desc="laplace", space="corobl", hemi="{hemi}", **config["subj_wildcards"])
:type nii_ap: BIDSPath, optional
:param nii_pd: BIDS path to PD coordinates nifti file, defaults to bids(root=work, datatype="coords", dir="PD", label="hipp", suffix="coords.nii.gz", desc="laplace", space="corobl", hemi="{hemi}", **config["subj_wildcards"])
:type nii_pd: BIDSPath, optional
:param nii_io: BIDS path to laminar coordinates nifti file, defaults to get_laminar_coords
:type nii_io: BIDSPath, optional
:param nii_label: BIDS path to output labeled nifti file, defaults to bids(root=work, datatype="anat", desc="subfieldsnotissue", suffix="dseg.nii.gz", space="corobl", hemi="{hemi}", atlas="{atlas}", **config["subj_wildcards"])
:type nii_label: BIDSPath, optional
:raises: FileNotFoundError
:return: None
:rtype: None

rule label_subfields_from_vol_coords_corobl:
    '''Label subfields using the volumetric coords and atlas subfield labels'''
    input:
        label_nii=bids(
            root=work,
            datatype="anat",
            suffix="subfields.nii.gz",
            space="unfold",
            hemi="{hemi}",
            label="hipp",
            atlas="{atlas}",
            **config["subj_wildcards"]
        ),
        nii_ap=bids(
            root=work,
            datatype="coords",
            dir="AP",
            label="hipp",
            suffix="coords.nii.gz",
            desc="laplace",
            space="corobl",
            hemi="{hemi}",
            **config["subj_wildcards"]
        ),
        nii_pd=bids(
            root=work,
            datatype="coords",
            dir="PD",
            label="hipp",
            suffix="coords.nii.gz",
            desc="laplace",
            space="corobl",
            hemi="{hemi}",
            **config["subj_wildcards"]
        ),
        nii_io=get_laminar_coords,
    output:
        nii_label=bids(
            root=work,
            datatype="anat",
            desc="subfieldsnotissue",
            suffix="dseg.nii.gz",
            space="corobl",
            hemi="{hemi}",
            atlas="{atlas}",
            **config["subj_wildcards"]
        ),
    group:
        "subj"
    script:
        "../scripts/label_subfields_from_vol_coords.py"
