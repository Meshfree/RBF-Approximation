function createHaltonPoints(points, filename)

    narginchk(2,2);

    for i=1:length(points)
        eval(sprintf('haltonPoints%d = haltonWithCorners(points(i),2);', points(i)));
    end

    save(filename, 'haltonPoints*');
end