clear all
close all
clc
%% Circuit constants
R = 10000;
C = 22e-9;
 
%% Set up transfer function
%  Create "s" as a transfer function for use later
s = tf('s');
%  Use s to generate transfer function for circuit
%H = (s * R * C) / (s * R * C + 1);
jj=1/(s^4 + 2.613*s^3 + 3.414*s^2 + 2.613*s + 1)
%  Use bode command to analyze transfer function
bode(jj);
title('Bode plots for System H');