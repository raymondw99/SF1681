function f = comparison(A)
    r = [1 3 5 10 25 50];
    for i =1:6     
        visualize(A,r(i),i);
    end
end 

function f = visualize(A,n,k)
    subplot(2,3,k);
    compress(A,n);
    title('s = ' + string(n));
    set(gca,'fontsize',20);
    set(gcf,'Color','w');
end

function f = plotSingular(A)
    [Y, S, X] = svd(A);

    range = linspace(1,length(diag(S)),length(diag(S)));
    scatter(range,diag(S),'filled');
    ylim([-500 4000]);
    title('Singular values in descending order');
    ylabel('Singular value'); xlabel('Order');
    set(gca,'fontsize',20); set(gcf,'Color','w');
end

function f = compress(A,n)
    [Y, S, X] = svd(A);
    x = X'; s = diag(S);
    B = s(1).*Y(:,1).*x(1,:);
    for i=2:n
        B = B + s(i).*Y(:,i).*x(i,:);
    end
    imshow(B,[0 255])
end
