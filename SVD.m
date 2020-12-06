% Output
imshow(A,[0 255]);
plotSingular(A);
comparison(A);

% Comparing images for different compressions
function f = comparison(A)
    r = [1 3 5 10 25 50];
    for i =1:6  % Generating subplots   
        visualize(A,r(i),i);
    end
end 

% Generates each individual subplot in the comparison plot
function f = visualize(A,n,k)
    subplot(2,3,k); compress(A,n);
    title('r = ' + string(n));
    set(gca,'fontsize',20);
    set(gcf,'Color','w');
end

% Plotting the singular values in descending order
function f = plotSingular(A)
    [Y, S, X] = svd(A);
    range = linspace(1,length(diag(S)),...
    length(diag(S))); % Extracting singular values
    
    scatter(range,diag(S),'filled'); % Plotting
    ylim([-500 4000]);
    title('Singular values in descending order');
    ylabel('Singular value'); xlabel('Order')
    set(gca,'fontsize',20); set(gcf,'Color','w');
end

% Singular value decomposition (Image compression)
% Returns A in singular sum form with n singular values
function f = compress(A,n)
    [U, S, V] = svd(A); % Singular value decomposition
    v = V'; s = diag(S); % Defining arrays
    
    B = s(1).*U(:,1).*v(1,:);
    
    for i=2:n % Summing up to n singular values
        B = B + s(i).*U(:,i).*v(i,:);
    end
    
    imshow(B,[0 255])
end
