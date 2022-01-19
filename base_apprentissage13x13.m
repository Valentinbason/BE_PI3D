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
    Im = uint8(normals(:,:,3)*255);
    figure;
    imshow(Im);
    
    % Récuperation des imagettes
    for j=1:38
        for i=1:38
            imagette = Im(i:i+12,j:j+12);
            imwrite(imagette,strcat('Data/imagettes_13x13/im',int2str(sub2ind([38,38],i,j)),'.png'),'png');
        end
    end

    % Supression des normales inutiles
    normals([1 2 3 4 5 6 45 46 47 48 49 50],:,:) = [];
    normals(:,[1 2 3 4 5 6 45 46 47 48 49 50],:) = [];
    normals = reshape(normals,[38*38 3]);
end

save('Data/imagettes_13x13/normals.mat','normals');