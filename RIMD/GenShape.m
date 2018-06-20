function [ ] = GenShape( basemesh,savemesh, NLOGDR, NS)

exename = '.\RIMD.exe';
[ex,f]=fileparts(savemesh);
if ~exist([ex,'\tmp'],'file')
    mkdir([ex,'\tmp'])
end
nfvmat = [ex,'\tmp\',f,'.mat'];
save(nfvmat,'NLOGDR', 'NS');
ininame = [ex,'\tmp\',f,'.ini'];
fid = fopen(ininame,'w');
fprintf(fid,'%s\r\n',['[default]']);
fprintf(fid,'fvmat=%s\r\n',nfvmat);
fprintf(fid,'meshname=%s\r\n',basemesh);
fprintf(fid,'iternum=%d\r\n',10);
fprintf(fid,'savename=%s\r\n',savemesh);
fclose(fid);
cmdline = [exename, ' 2 ',ininame];
dos(cmdline);
end