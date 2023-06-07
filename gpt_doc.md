"""
BIDS Function
=============

This module provides a function for generating BIDS-like filepaths based on keyword arguments.

"""

def bids(root, subject, session, datatype, task, acq, run, suffix):
    """
    Generate a BIDS-like filepath based on the provided keyword arguments.

    :param root: Root directory of the file path.
    :param subject: Subject identifier.
    :param session: Session identifier.
    :param datatype: Data type.
    :param task: Task identifier.
    :param acq: Acquisition identifier.
    :param run: Run identifier.
    :param suffix: Suffix of the file.
    :return: Generated BIDS-like filepath.
    """
    filepath = f"{root}/sub-{subject}/ses-{session}/{datatype}/sub-{subject}_ses-{session}_{task}_{acq}_run-{run}_{suffix}"
    return filepath

# Example usage
generated_filepath = bids(
    root="data",
    subject="01",
    session="01",
    datatype="func",
    task="rest",
    acq="01",
    run="1",
    suffix="bold.nii.gz"
)
