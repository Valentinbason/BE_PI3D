clear all;
close all;


for k=1:1
    figure;
    [X,Y,Z] = peaks(51);
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
    normals = reshape(A.FaceNormals,[50*50 3]);
    normals = normals./sqrt(sum(normals.^2,2));
    normals = reshape(normals,[50 50 3]);
    % Image en fonction des normales
    Im = flipud(uint8(normals(:,:,3)*255));
    figure;
    imshow(Im);
    
    % Récuperation des imagettes
    for j=1:42
        for i=1:42
            imagette = Im(i:i+8,j:j+8);
            imwrite(imagette,strcat('Data/imagettes_8x8/im',int2str(sub2ind([42,42],i,j)),'.png'),'png');
        end
    end

    % Supression des normales inutiles
    normals([1 2 3 4 47 48 49 50],:,:) = [];
    normals(:,[1 2 3 4 47 48 49 50],:) = [];
    normals = reshape(normals,[42*42 3]);
end

save('Data/imagettes_8x8/normals.mat','normals');