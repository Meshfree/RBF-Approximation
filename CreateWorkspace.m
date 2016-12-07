clc;
close all;
clear all;
addpath(genpath(pwd));

filenameHalton = 'data/haltonPoints.mat';
finenameCenter = 'data/centerPoints.mat';
fimenameUnit = 'data/unitGridPoints.mat';
filenameEpsilon = 'data/epsilonPoints.mat';
haltons = [500, 600, 700, 800, 900, 1000, 1100, 1200, 1300, 1400, 1500, 1600, 1700, 1800, 1900, 2000,4225];
centers = 81;
unitGrids = [];
epsilon = [500];

createHaltonPoints(haltons, filenameHalton);
createCenterPoints(centers, finenameCenter);
createEpsilonPoints(epsilon, filenameEpsilon);