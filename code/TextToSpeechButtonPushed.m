function TextToSpeechButtonPushed2(app, event)
            
            txt = app.TextEditField.Value; %pairnei thn timh poy exoyme dwsei sto plaisio toy gui gia symboloseira
            pace = app.PaceSpinner.Value; %pairnei thn timh poy exoyme dwsei gia to pace mesw gui
            fs = app.FsEditField.Value; %pairnei thn timh poy exoyme dwsei gia to fs mesw gui
            tts(txt,'1',pace,fs); %ekteleitai h synarthsh tts gia thn metatroph tou keimenoy se omilia
            answer = questdlg('Do you want to save the audio file ?','Save Audio');
            wav = tts(txt,'1',pace,fs);
            if answer == 'Yes', audiowrite('sample.wav',wav,fs); end
           
           
        end
