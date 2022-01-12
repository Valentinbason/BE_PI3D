clear all;
close all;


for k=1:1
    figure;
    [X,Y,Z] = peaks(51);
    A = surf(X,Y,Z);
    Z1 = Z;
    colormap('gray');
    c = colorbar;
    l = c.Limits;
    Z = Z + abs(l(1));
    l = l + abs(l(1));
    Z = flipud(Z/l(2));
    Im = uint8(Z*255);
    figure;
    imshow(Im);

    normals = [];
    for i=1:49
        for j = 1:49
            imagette = Z1(i:i+2,j:j+2);
            normals = [normals; A.FaceNormals(i+1,j+1,:)];
%             l = c.Limits;
%             imagette = imagette + abs(l(1));
%             l = l + abs(l(1));
%             imagette = flipud(imagette/l(2));
%             imagette = uint8(imagette*255);
%             imwrite(imagette,strcat('im',int2str(sub2ind([49,49],i,j)),'.png'),'png');
        end
    end

end

save('normals.mat','normals');