clc; clear; close all; warning off all;

[nama_file, nama_folder] = uigetfile('*.png');

if ~isequal(nama_file, 0)
    img= imread(fullfile(nama_folder,nama_file));
    figure, imshow(Img)
    
    img_gray = rgb2gray(img);
    %ekstrasi ciri metode glcm
   pixel_dist = 1;
   GLCM = graycomatrix(Img_gray,'Offset',[0 pixel_dist; -pixel_dist pixel_dist;
       -pixel_dist 0; -pixel_dist -pixel_dist]);
   stast = graycoprops (GLCM,'correlation','energy');
   
   Correlation = mean(stats.Correlation);
   Energy = mean (stats.Energy);
   
   %variabel fata_latih
   data_latih(1,1) = Correlation;
   data_latih(1,2) = Energy;
   
end 

load Mdl
kelas_keluaran=predict(Mdl,data_uji);

figure, imshow(Img)
title({['Nama File: ',nama_file],['Kelas Keluaran:',kelas_keluaran{1}]})

else
    return
    end