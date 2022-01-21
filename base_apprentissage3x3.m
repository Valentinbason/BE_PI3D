clear all;
close all;

n = 51;
taille_im = 3;

for k=1:1
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
    normals = reshape(A.FaceNormals,[(n-1)*(n-1) 3]);
    normals = normals./sqrt(sum(normals.^2,2));
    normals = reshape(normals,[n-1 n-1 3]);
    % Image en fonction des normales
    Im = uint8(normals(:,:,3)*255);
    figure;
    imshow(Im);
    
    % Récuperation des imagettes
    m = int2str(taille_im);
    for j=1:n-taille_im
        for i=1:n-taille_im
            imagette = Im(i:i+taille_im-1,j:j+taille_im-1);
            imwrite(imagette,strcat('Data/imagettes_',m,'x',m,'/im',int2str(sub2ind([48,48],i,j)),'.png'),'png');
        end
    end

    % Supression des normales inutiles
    ind = [1:(taille_im-1)/2 n-(taille_im-1)/2:n-1];
    normals(ind,:,:) = [];
    normals(:,ind,:) = [];
    normals = reshape(normals,[(n-taille_im)*(n-taille_im) 3]);
end

%save('Data/imagettes_',m,'x',m,'/normals.mat','normals');