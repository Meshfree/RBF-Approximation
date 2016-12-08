clc;
close all;
clear all;
addpath(genpath(pwd));

filenameHalton = 'data/haltonPoints.mat';
filenameCenter = 'data/centerPoints.mat';
filenameUnit = 'data/unitGridPoints.mat';
filenameEpsilon = 'data/epsilonPoints.mat';
haltons = [500, 600, 700, 800, 900, 1000, 1100, 1200, 1300, 1400, 1500, 1600, 1700, 1800, 1900, 2000,4225];
centers = [81,225];
unitGrids = [500, 600, 700, 800, 900, 1000, 1100, 1200, 1300, 1400, 1500, 1600, 1700, 1800, 1900, 2000,4225];
epsilon = [500, 600, 700, 800, 900, 1000, 1100, 1200, 1300, 1400, 1500, 1600, 1700, 1800, 1900, 2000,4225];

createHaltonPoints(haltons, filenameHalton);
createCenterPoints(centers, filenameCenter);
createEpsilonPoints(epsilon, filenameEpsilon);
createUnitGrid(unitGrids,filenameUnit);