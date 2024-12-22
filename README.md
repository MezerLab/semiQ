# semiQ
**semiQ** is a software package designed to calculate the five new semi-quantitative quantifiers described in the following article: "[Approximating R1 and R2: A Quantitative Approach to Clinical Weighted MRI]([url](https://onlinelibrary.wiley.com/doi/10.1002/hbm.70102))". It contains example data from both phantoms and humans.
For more information, please contact:

    Aviv Mezer: aviv.mezer(AT)elsc.huji.ac.il

    Shachar Moskovich: shachar.moskovich(AT)mail.huji.ac.il


## Phantoms
* **phantoms_run_args.mat** contains all arguments needed to produce the new quantifiers, as well as the synthetic quantifiers, using the **phantom_run** function.
* **phantom_run** expands the input table T that contains the different values of different lipids.

## Humans
* **division_imgs** is a function used to produce 3 division images, T1w/T2w, T1w/PDw and ln(T1w/PDw), using 3 weighted images (T1w, T2w, and PDw), as well as a brain mask.
* **correlation_example** is a script that calculates the correlations between different quantifiers and quantitative maps, for a single subject. It calls another function, **cutoff_mask**, which is used to remove extreme values from the quantifiers and the maps.
* **relaxivity_example** is a script that calculates the relaxivity between quantitative maps, as well as the semi-quantitative relaxivities, using a modified version of **MDM_toolbox** (https://github.com/shirfilo/MDM_toolbox/tree/master, Shir Filo). It uses the function **calc_slopes**, which calls the function **calc_slopes_fit_manual_bins**, which bins the values of the input images using **slope_bin** function.
* **Example_data** contains the data of a single subject: T1w, T2w, PDw, R1, R2, PD, seg, mask and the TEs in which the T2w and PDw images were parcelled with.

## Softwear requirements
* MATLAB 2022b - http://www.mathworks.com/products/matlab/
* Vistasoft - https://github.com/vistalab/vistasoft

(C) Mezer lab, the Hebrew University of Jerusalem, Israel, Copyright 2023
