
Please cite the following paper if you intend to use the dataset:

_"Mukhopadhyay, Anand, Moses Prabhakar Naligala, Divya Lakshmi Duggisetty, Indrajit Chakrabarti, and Mrigank Sharad. "Acoustic scene analysis using analog spiking neural network." Neuromorphic Computing and Engineering (2022)."_


1) Using audio signals

Tutotial 1: (Aim is to obtain a feature vector (FV) from the input audio data)

In this tutorial, we discuss:
(a) How to load an audio file in MATLAB.
(b) Plot the magnitude of the audio signal with time. 
(c) Obtain the frequency response (FFT analysis, single-sided spectrum)
(d) Downsample the audio signal. 
(e) Reduce the single-sided spectrum vector by averaging the bins.


Tutorial 2: Using Neural Network Toolbox in MATLAB

We use the Neural Network Toolbox by importing externally generated dataset (class2_FFT_FV_data_bins64)

class1 : footstep with background noise
class2 : background noise


Tutorial2: Using Neural Net Pattern Recognition Toolbox in MATLAB
(Aim is to train a NN model, after training the there is an option to generate code as a MATLAB function)

Using Neural Net Pattern Recognition Toolbox in MATLAB using:

1) Importing externally generated dataset (footstep sound classification problem).
2) Import the function of the trained model.
