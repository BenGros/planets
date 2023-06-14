.. py:function:: get_tissue_atlas_remapping(wildcards)

   This function generates a remapping command for a given tissue atlas.

   :param wildcards: A dictionary containing the atlas name.
   :type wildcards: dict
   :return: A string containing the remapping command.
   :rtype: str
   :raises: None

   This function takes a dictionary containing the name of a tissue atlas and generates a remapping command based on the atlas's mapping configuration.    The remapping command is returned as a string.

   Example usage:

   .. code-block:: python

      atlas = {"atlas": "allen"}
      remap_command = get_tissue_atlas_remapping(atlas)
      print(remap_command)

   Output:

   .. code-block:: python

      -threshold 1 1 1 0 -popas cortex
      -threshold 2 2 2 0 -popas hippocampus
      -threshold 3 3 3 0 -popas striatum
      -threshold 4 4 4 0 -popas thalamus
      -threshold 5 5 5 0 -popas cerebellum
      -threshold 6 6 6 0 -popas brainstem
      -threshold 7 7 7 0 -popas olfactory_bulb
      -threshold 8 8 8 0 -popas amygdala
      -threshold 9 9 9 0 -popas pallidum
      -threshold 10 10 10 0 -popas hypothalamus
      -threshold 11 11 11 0 -popas midbrain
      -threshold 12 12 12 0 -popas pons
      -threshold 13 13 13 0 -popas medulla
      -threshold 14 14 14 0 -popas spinal_cord
