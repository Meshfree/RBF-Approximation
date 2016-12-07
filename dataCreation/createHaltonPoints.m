function createHaltonPoints(points, filename)

    narginchk(2,2);

    for i=1:length(points)
        eval(sprintf('haltonPoints%d = haltonWithCorners(points(i),2);', points(i)));
    end
    pointsPerEdge = 20;
    eval(sprintf('haltonPointsEdges%d = haltonWithEdgesAndCorners(points(1),2,pointsPerEdge);', points(1)));
    eval(sprintf('haltonPointsEdges%d = haltonWithEdgesAndCorners(points(length(points)),2, pointsPerEdge);', points(length(points))));
    
    save(filename, 'haltonPoints*');
end