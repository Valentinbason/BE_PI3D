function N = normalise(pred)
    N = pred;
    for i=1:size(pred,1)
        for j =1:size(pred,2)
            norme = norm(squeeze(pred(i,j,:)));
            N(i,j,:) = N(i,j,:)/norme;
        end
    end
end