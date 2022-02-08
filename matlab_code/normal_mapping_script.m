clear all;
close all;

n = 51;
[X,Y,Z] = peaks(n);
A = surf(X,Y,Z);
N_estime = A.FaceNormals;
Im = uint8(N_estime(:,:,3)*255);
figure;
imshow(N_estime*255);