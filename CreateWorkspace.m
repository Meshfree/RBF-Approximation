clc;
close all;
clear all;
addpath(genpath(pwd));

filenameHalton = 'data/haltonPoints.mat';
finenameCenter = 'data/centerPoints.mat';
fimenameUnit = 'data/unitGridPoints.mat';
haltons = [81, 600, 700, 800, 900, 1000, 1100, 1200, 1300, 1400, 1500, 1600, 1700, 1800, 1900, 2000];
centers = 9;
unitGrids = [];

createHaltonPoints(haltons, filenameHalton);
createCenterPoints(centers, finenameCenter);
