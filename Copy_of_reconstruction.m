clear all;
% close all;
taille_ecran = get(0,'ScreenSize');
L = taille_ecran(3);
H = taille_ecran(4);

n=43;
xy = 1:n;
[X,Y] = meshgrid(xy,xy);

load normals.mat
N_estime = normalise(normals_pred);

Im = uint8(N_estime(:,:,3)*255);
figure;
imshow(Im);
N_estime = reshape(N_estime,[(n-1)*(n-1) 3])';

% Intégration du champ de normales :
p_estime = reshape(-N_estime(1,:)./N_estime(3,:),[n-1 n-1]);
q_estime = reshape(-N_estime(2,:)./N_estime(3,:),[n-1 n-1]);
z_estime = integration_SCS(q_estime,p_estime);

% Ambiguïté concave/convexe :
if (z_estime(floor((n-1)/2),floor((n-1)/2))<z_estime(1,1))
	z_estime = -z_estime;
end

% Affichage de l'albédo et du relief :
figure('Name','Albedo et relief','Position',[0.6*L,0,0.2*L,0.7*H]);
affichage_albedo_relief(1,z_estime);

% Affichage surface z_estime :
figure('Name','Avec z_estime');
surf(X(1:end-1,1:end-1),Y(1:end-1,1:end-1),z_estime);
colormap('gray');