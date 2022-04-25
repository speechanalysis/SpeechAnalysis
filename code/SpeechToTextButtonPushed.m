% Button pushed function: SpeechToTextButton
        function SpeechToTextButtonPushed(app, event)
           a = uigetfile();
            [~,~,ext] = fileparts(a);
            if strcmp(ext,'.wav') || strcmp(ext,'.flac') %elgxos mese strcmp ean oi symboloseira ext einai idia me thn symboloseira '.wav' h me thn '.flac'
                file = a; %pernaei to file poy epelexe o xrhsths se mia metablhth poy 8a mporoyn na blepoyn thn timh ths kai alles synarthseis toy app
            else
                f=errordlg('You should give the right type of file'); %alliws emfanizei ena erro message dialog me to mhnyma oti o xrhsths prepei na dwsei to swsto typo arxeioy 
            end   
            txt = wav2vec(audioread(file),app.FsEditField.Value);
            %txt = char(x);
            msgbox('The transformation to text is ready','Speech To Text');
            answer = questdlg('Do you want to save the text file ?','Save File');
               if answer == 'Yes', writematrix(txt,'sttfile.txt'); end %save('sttfile.txt', 'txt','-ascii'); end % apo8hkeyei to keimeno se txt arxeio me onoma sttfile
        end
