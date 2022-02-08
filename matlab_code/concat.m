n1 = load('Data/train_data/imagettes_9x9_100_bis/normals1');
n2 = load('Data/train_data/imagettes_9x9_100_bis/normals2');
n3 = load('Data/train_data/imagettes_9x9_100_bis/normals3');

normals = [n1.normals; n2.normals; n3.normals];

save('Data/train_data/imagettes_9x9_100_bis/normals.mat','normals');