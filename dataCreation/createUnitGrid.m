function createUnitGrid(points, filename)

    narginchk(2,2);

    for i=1:length(points)
        eval(sprintf('unitGrid%d = unitGrid(points(i));', points(i)));
    end

    save(filename, 'unitGrid*');
end