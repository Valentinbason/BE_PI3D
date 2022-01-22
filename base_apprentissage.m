clear all;
close all;

n = 101;
taille_im = 9;

figure;
[X,Y,Z] = peaks(n);
A = surf(X,Y,Z);
colormap('gray');
%     c = colorbar;
%     l = c.Limits;
%     Z = Z + abs(l(1));
%     l = l + abs(l(1));
%     Z = flipud(Z/l(2));
%     Im = uint8(Z*255);
%     figure;
%     imshow(Im);

% Récupération des normales
normals = A.FaceNormals;
normals = normals./sqrt(sum(normals.^2,3));

% Image en fonction des normales
Im = uint8(normals(:,:,3)*255);
figure;
imshow(Im);

% Récuperation des imagettes
m = int2str(taille_im);
for j=1:n-taille_im
    for i=1:n-taille_im
        imagette = Im(i:i+taille_im-1,j:j+taille_im-1);
        imwrite(imagette,strcat('Data/train_data/imagettes_9x9_100/im',int2str(sub2ind([n-taille_im,n-taille_im],i,j)),'.png'),'png');
    end
end

% Supression des normales inutiles
ind = [1:(taille_im-1)/2 n-(taille_im-1)/2:n-1];
normals(ind,:,:) = [];
normals(:,ind,:) = [];
normals = reshape(normals,[(n-taille_im)*(n-taille_im) 3]);

save('Data/train_data/imagettes_9x9_100/normals.mat','normals');