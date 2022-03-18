%%%%%%%% Red mangrove area calculation code

ImageFile = '/Users/isamarcortes/Dropbox/Isamar/Papers_In_Prep/Paper_1/Climate_Change_Mangroves/Red_Black_Mangrove_Separation/Bahamas1.tif';
test = imread(ImageFile);
pcolor(test);

redMangroveArea = sum(ImageFile(1))*100; %%% 100 is for the sentinel area