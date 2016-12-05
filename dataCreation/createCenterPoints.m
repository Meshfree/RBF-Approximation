function createCenterPoints(points, filename)

    narginchk(2,2);

    for i=1:length(points)
        eval(sprintf('centerPoints%d = unitGrid(points(i));', points(i)));
    end

    save(filename, 'centerPoints*');
end