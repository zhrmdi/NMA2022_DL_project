% See below for reference
% https://github.com/KamitaniLab/BlurImageSharpening/blob/master/TrainFeatureDecoders.m

% To run this, you also need to install BrainDecoderToolbox2
% https://github.com/KamitaniLab/BrainDecoderToolbox2/

load('data/Subject1.mat');

%%
disp_metadata(metaData)

%% 
imgcode = get_dataset(dataSet, metaData, 'ImageCode');
trtest = get_dataset(dataSet, metaData, 'TrTest');
category = get_dataset(dataSet, metaData, 'Category');
modification = get_dataset(dataSet, metaData, 'Modification');
condition = get_dataset(dataSet, metaData, 'Condition');
correct = get_dataset(dataSet, metaData, 'Correct');
certain = get_dataset(dataSet, metaData, 'Certain');

%%
metaTable = table(trtest, condition, category, imgcode, modification, correct, certain);

writetable(metaTable, 'data/meta_table.csv');

%%
% voxels for each ROI
% v1, v2, v3, v4, loc, ffa, ppa, vc
[vox_v1, ~] = select_feature(dataSet, metaData, 'V1 = 1');
[vox_v2, ~] = select_feature(dataSet, metaData, 'V2 = 1');
[vox_v3, ~] = select_feature(dataSet, metaData, 'V3 = 1');
[vox_v4, ~] = select_feature(dataSet, metaData, 'V4 = 1');
[vox_loc, ~] = select_feature(dataSet, metaData, 'LOC = 1');
[vox_ffa, ~] = select_feature(dataSet, metaData, 'FFA = 1');
[vox_ppa, ~] = select_feature(dataSet, metaData, 'PPA = 1');
[vox_vc, ~]  = select_feature(dataSet, metaData, 'VC = 1');

%%
save data/vox_rois.mat ...
     vox_v1 vox_v2 vox_v3 vox_v4 vox_loc vox_ffa vox_ppa vox_vc;
