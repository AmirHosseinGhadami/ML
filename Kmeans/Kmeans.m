function [y_predict ,centroids] = Kmeans(X,K)
iter = 500;

[num_samples,~] = size(X);
centroids = X(ceil(rand(K,1).*size(X,1)) ,:);

for it=1:iter
    
    %finding closest centroids
    idx = zeros(num_samples, 1);
    for i=1:num_samples
        temp = zeros(K,1);
        for j=1:K
            temp(j)=sqrt(sum(power((X(i,:)- centroids(j,:)),2)));
        end
        [~,idx(i)] = min(temp);    
    end


    
    %update centroids
    for i = 1:K
          idx_i = find(idx==i);       
          centroids(i,:) = mean(X(idx_i,:)); 
    end   
    
    
end
y_predict=idx;
scatter(X(:,1),X(:,2),[],y_predict)
end


