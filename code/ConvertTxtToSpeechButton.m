% Button pushed function: ConvertTxtToSpeechButton
       function ButtonPushed(app, event)
              a = uigetfile(); %anoigei ena dialog gia na ginei upload ena file apo to file manager
              fid = fopen(a); %anoigei to file pou epilexthke
              txt = fscanf(fid,'%s'); %diabazei-metatrepei to txt file se symboloseira
              %txt = extractFileText(a);
              %txt = app.TextEditField.Value;
              pace = app.PaceSpinner.Value; %pairnei thn timh poy exoyme dwsei gia to pace mesw gui
              fs = app.FsEditField.Value; %pairnei thn timh poy exoyme dwsei gia to fs mesw gui
              tts(txt,'1',pace,fs); %ekteleitai h synarthsh tts gia thn metatroph tou keimenoy se omilia
              answer = questdlg('Do you want to save the audio file ?','Save Audio');
              wav = tts(txt,'1',pace,fs);
              if answer == 'Yes', audiowrite('sample.wav',wav,fs); end
              fclose(fid); %kleinei to txt file
       end
