COMARestLib
===========

COMA Resting State fMRI Analysis Library

COMARestLib is a library to perform advanced postprocessing of resting state data from fMRI Independent Component Analysis.

Libray has been developed to overcome several classical limitations that appears in Dissorder of Conciousness (DoC) patients analysis.


Library perform several high level task over the ICA components such as:

	- Automatic ICA computation from fMRI (only for GroupICA)
	- Classification of neuronal/non-neuronal ICA components using machine learning.
	- Matching of multiple neuronal components using GoF.
	- fMRI signal denoising.
	- Computation of "metabolic" maps from fMRI.
	- Indices for large head motion.
	- Graph characterization on ICA Components.

This library is running now on GroupICA decomposition (http://mialab.mrn.org/software/) but algorithms could easy extended to other ICA
tools (FSL, cooming soon)


How to use it: Don't forget to setup the libs
--------------
Setup.m 


Examples:
--------

exampleDenoising.m % performs ICA component denoising
exampleMatchingClassification % perform matching and classification for ICA labeling.

WARNING:
--------

Publications related to this work are still under preparation!!
If you are using this library please contact us before to use it in your own work!!


Resting Team (Alphabetic Order):
--------------------------------

- Baquero Katherine. MsC student. (apigrafa@gmail.com)
- Demertzi Athena. PhD. (a.demertzi@ulg.ac.be)
- Gómez Francisco. PhD. (fagomezj@gmail.com)
- Noirhomme Quentin. PhD. (quentin.noirhomme@ulg.ac.be)
- Soddu Andrea. PhD. (Andrea.Soddu@ulg.ac.be)
- Ziegler Erik. PhD Candidate (erik.ziegler@ulg.ac.be)

- Prof. Steven Laureys (steven.laureys@ulg.ac.be)


Publications:
-------------

Comming Soon!!
In preparation



This work has been supported by:
--------------------------------

FNRS - Fonds de la Recherche Scientifique, Belgium
CRC - Cyclotron Research Center, University of Liege, Belgium
Baquero Katherine has been (supported by Universidad Nacional de Colombia, Colombia)


Many tanks to:
--------------

Christophe Phillips (CRC,ULg)
Eric Genon (CRC,ULg)


COMA Science Group
Cyclotron Research Center
University of Liege
2011
