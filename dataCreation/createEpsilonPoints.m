function createEpsilonPoints(points, filename)

    narginchk(2,2);

    for i=1:length(points)
        eval(sprintf('epsilonPoints%d = epsilon(points(i));', points(i)));
    end

    save(filename, 'epsilonPoints*');
end