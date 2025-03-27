clear;
FileSessionName = "Data/test5sept2020_22H16";
%FileSessionName = "Data/test6sept2020_23H36";
FileNameExt = ".txt";

Start = 10;
Stop = 71;
for fileNum = Start:Stop
   CompleFileName = FileSessionName + "_" + sprintf('%04d',fileNum) + FileNameExt;
   fileID = fopen(CompleFileName);
   A = textscan(fileID, '%s %s %s %s' ,1);
   B = textscan(fileID, '%f32 %f32');
   %Array(fileNum-9,:) = B{2};
   Array(fileNum-9,:) = medfilt1(B{2},13);
   fclose(fileID);
   
end

Start2 = 8;
%Stop2 = 91;
Stop2 = 86;
FileSessionName = "Data/test6sept2020_23H36";
for fileNum = Start2:Stop2
   CompleFileName = FileSessionName + "_" + sprintf('%04d',fileNum) + FileNameExt;
   fileID = fopen(CompleFileName);
   A = textscan(fileID, '%s %s %s %s' ,1);
   B = textscan(fileID, '%f32 %f32');
   %Array(fileNum-9,:) = B{2};
   Array(fileNum+(Stop-Start)-Start2,:) = medfilt1(B{2},13);
  fclose(fileID);
   
end


figure();
mesh(Array);

%plot(B{1},B{2},'.')
%plot3(fileNum,B{1},B{2},'.');

   %plot3(B{1},Array,'.');
   %plot(B{1},B{2},'.');