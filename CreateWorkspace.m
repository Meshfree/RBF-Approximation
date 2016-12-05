clc;
close all;
clear all;
addpath(genpath('/RBF-Approximation/'));

filename = 'data/haltonPoints.mat'
haltons = [500, 600, 700, 800, 900, 1000, 1100, 1200, 1300, 1400, 1500, 1600, 1700, 1800, 1900, 2000];

createHaltonPoints(haltons, filename);