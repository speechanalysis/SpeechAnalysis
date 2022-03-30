function SpeechToTextButtonPushed(app, event)
            file = uigetfile();
            txt = wav2vec(audioread(file),app.FsEditField.Value);
            msgbox('The transformation to text is ready','Speech To Text');
            answer = questdlg('Do you want to save the text file ?','Save File');
               if answer == 'Yes', writematrix(txt,'sttfile.txt'); end 

        end
