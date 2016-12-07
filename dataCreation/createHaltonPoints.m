function createHaltonPoints(points, filename)

    narginchk(2,2);

    pointsPerEdge = 20;
    for i=1:length(points)
        eval(sprintf('haltonPoints%d = haltonWithCorners(points(i),2);', points(i)));
        eval(sprintf('haltonPointsEdges%d = haltonWithEdgesAndCorners(points(i),2,pointsPerEdge);', points(i)));
    end
    
    save(filename, 'haltonPoints*');
end