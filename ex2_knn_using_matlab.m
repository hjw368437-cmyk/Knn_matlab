clear; close all; clc;

load fisheriris;

spcs2num = [];
for k=1:1:length(species)
    if strcmp(species(k), 'versicolor') == 1
        spcs2num(k,1) = 1;
    elseif strcmp(species(k), 'virginica') == 1
        spcs2num(k,1) = 2;
    end
end


tr_id = [71:1:100 121:1:150];
Training_data = meas(tr_id, 1:2);
Training_label = spcs2num(tr_id,:);

ts_id = [51:1:70 101:1:120];
Test_data = meas(ts_id, 1:2);
Test_label = spcs2num(ts_id,:);


k=3;
md1 = fitcknn(Training_data, Training_label, 'NumNeighbors',k, 'Distance','euclidean');


result = predict(md1, Test_data(1,:))

result = predict(md1, Test_data)

figure;
subplot(211); bar(Test_label); axis tight;
subplot(212); bar(result); axis tight;

figure;
subplot(311); bar(Test_label); axis tight;
subplot(312); bar(result); axis tight;
subplot(313); bar(Test_label - result); axis tight;
