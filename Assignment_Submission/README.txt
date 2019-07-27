===== README =====
----- Dependencies -----
The python packages required to reporduce the results in this analysis can be found in requirements.txt
----- Full Scale Reproduction -----
- Check requirements.txt for Dependencies
- Run data_preparation.ipynb
- Run model_fitting.ipynb with LOAD_MODEL=False

----- Reproducing Solutions -----
- Check requirements.txt for Dependencies
- Run model_fitting.ipynb with default parameters
- csv files are written to submissions folder

----- Files -----
model.pickle		:	The final model, saved as a binary with pickle
requirements.txt	:	A list of python packages required for this analysis
data_preparation.ipynb	:	A jupyter notebook cleaning data, generating features and EDA
model_fitting.ipynb	:	A jupyter notebook fitting and writing the submission file(s)
	
----- Sub Directories -----
original_data		:	Contains the original files provided on kaggle
gen_data		:	This is where generated intermediate data is saved, you can ignore this
saved_datasets		:	This is where the final data used in the modelling is saved
submissions		:	This is where submissio files are written to
