function [x,y,z] = my_peaks_modified(n)
    xy = -3:6/n:3;
    [x,y] = meshgrid(xy,xy);
    z = 2*(1-x).^2.*exp(-(x.^2) - (y+1).^2)- 5*(x/5 - x.^3 - y.^5).*exp(-x.^2-y.^2)- 2/3*exp(-(x+1).^2 - y.^2);
    figure;
    surf(z);
end