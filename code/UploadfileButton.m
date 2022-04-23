% Button pushed function: UploadfileButton
        function UploadfileButtonPushed(app, event)
            file = uigetfile(); % dialogbox gia na dialexei o xrhsths audio file
            [filepath,name,ext] = fileparts(file); % returns the path name, file name, and extension for the specified file.
            if strcmp(ext,'.wav') | strcmp(ext,'.flac'); % elgxos mese strcmp ean oi symboloseira ext einai idia me thn symboloseira '.wav' h me thn '.flac'
                app.file=file; % pernaei to file poy epelexe o xrhsths se mia metablhth poy 8a mporoyn na blepoyn thn timh ths kai alles synarthseis toy app
            else
                f=errordlg('You should give the right type of file'); % alliws emfanizei ena erro message dialog me to mhnyma oti o xrhsths prepei na dwsei to swsto typo arxeioy 
            end   


        end
