% Value changed function: PlayPauseButton
        function PlayPauseButtonValueChanged(app, event)
            value = app.PlayPauseButton.Value;
            if value %elegxei ean h timh toy button einai true
            app.AFR = dsp.AudioFileReader(app.file); %diabazei to hxhtiko arxeio
            app.ADW = audioDeviceWriter(app.AFR.SampleRate); % grafei ta hxhtika deigmata sthn syskeyh exodoy
            app.VolumeSlider.Value = 1; %arxikopoioume thn timh tou volume sto 1
            app.keepPlaying = value; % arxikopoioymai thn timh tou 'flag' sto true
            while ~isDone(app.AFR) && app.keepPlaying == true % while epanalhpsh gia oso den exei teleiwsei to app.AFR kai to flag mas einai true
                audio = app.AFR(); %kalei to antikeimeno app.AFR san na einai synarthsh kai to ekxvrei sto audio
                app.ADW(app.VolumeSlider.Value/100 * audio); % paizei to hxhtiko kalwntas to antikeimeno app.ADW kai dinontas san orisma to audio epi thn timh tou volume
                drawnow limitrate % drawnow einai gia na sigoyreytoyme oti to graphic callback tha prospelastei. Auto xreiazetai otan trexoyme megales epanalhpseis - loops kai theloume na diakopsoume thn epanalhpsh gia na prospelasoume to callback kapoioy alloy graphic antikeimenou.
            end
                release(app.AFR); % afou teleiwsei to hxhtiko kleinei to arxeio kai stamataei thn xrhsh tou audio device.
                release(app.ADW);
                app.PlayPauseButton.Value = false;% vazei thn timh tou stete button sto false
            else
                app.keepPlaying = value; %alliws bbazei thn timh tou flag sto false
            end   
