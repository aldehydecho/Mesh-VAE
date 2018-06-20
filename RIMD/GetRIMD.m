function [ ] = GetRIMD( srcfolder, number )

cmdline = ['.\RIMD.exe 3 ',srcfolder,' ', num2str(number)];
dos(cmdline);

end
