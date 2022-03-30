function wav = tts(txt,voice,pace,fs) %dhmioyrgia mias synarthseis me 4 inputs text, voice, pace, fs kai epistrofh ths timhse me etablhth 'wav'
%TTS text to speech.
%   TTS (TXT) synthesizes speech from string TXT, and speaks it. The audio
%   format is mono, 16 bit, 16k Hz by default.
%   
%   WAV = TTS(TXT) does not vocalize but output to the variable WAV.
%
%   TTS(TXT,VOICE) uses the specific voice. Use TTS('','List') to see a
%   list of availble voices. Default is the first voice.
%
%   TTS(...,PACE) set the pace of speech to PACE. PACE ranges from 
%   -10 (slowest) to 10 (fastest). Default 0.
%
%   TTS(...,FS) set the sampling rate of the speech to FS kHz. FS must be
%   one of the following: 8000, 11025, 12000, 16000, 22050, 24000, 32000,
%       44100, 48000. Default 16.
%   
%   This function requires the Microsoft Win32 Speech API (SAPI).
%
%   Examples:
%       % Speak the text;
%       tts('I can speak.');
%       % List availble voices;
%       tts('I can speak.','List');
%       % Do not speak out, store the speech in a variable;
%       w = tts('I can speak.',[],-4,44100);
%       wavplay(w,44100);
%
%   See also WAVREAD, WAVWRITE, WAVPLAY.
% Written by Siyi Deng; 12-21-2007;
if ~ispc, errordlg('Microsoft Win32 SAPI is required.','Operating System Error'); end %error('Microsoft Win32 SAPI is required.'); end %elegxei ean yparxei to Mirosoft Speech API dhladh ean to leitourgiko einai windows
if ~ischar(txt), errordlg ('First input must be string.','Text input Error'); end %error('First input must be string.'); end %elegxei ean to text input ths synarthshs einai ontws string alliws bgazei error.
SV = actxserver('SAPI.SpVoice');%Dhmioyrgei ena Microsoft Speech API antikeimeno. Pio sygkekrimena dhmiourgei enan local OLE Automation server gia na mporesoyme na xrhsimopoihsoyme thn yphresia SAPI twn Windows kai to apotelesma ths synarthshs actserver ekxwreitai sthn metablhth SV.
TK = invoke(SV,'GetVoices');% Epikaleitai thn methodo 'GetVoices' ths yphresias SAPI poy thn exoyme ekxwrhsei sto SV mesw ths synarthshs actserver kai thn ekxwrei sthn metablhth TK. 
if nargin > 1 %elegxei an to number of function input arguments einai megalytero apo 1 tote 
    % Select voice;
    for k = 0:TK.Count-1 %epanalhpsh for gia na dialexei fwnh to systhma apo 0 ews thn timh TK.Count-1
        if strcmpi(voice,TK.Item(k).GetDescription) %elegxei an h symboloseira voice einai iidia me thn symboloseira toy sapi mesw ths TK metablhths.
            SV.Voice = TK.Item(k); %ekxwreitai sto antikeimeno SV voice to antikeimeno TK gia thn sygkekrimenh loupa
            break; %termatizetai h ektelesh tou for xwris na ektelestoyn oi parakatw entoles mesa se ayto
        elseif strcmpi(voice,'list') % alliws an h symboloseira voice einai idio me to 'list'
            disp(TK.Item(k).GetDescription); %emfanizei thn lista me ta diathesima voices pou mporei na parei to SAPI
        end
    end
    % Set pace;
    if nargin > 2 %elegxei ean to number of function input arguments einai megalytero apo 2 tote
        if isempty(pace), pace = 0; end % elegxei an to dianysma toy pace einai adeio tote bazei sto pace thn timh 0
        if abs(pace) > 10, pace = sign(pace)*10; end  % elegxei an h apolyth timh pace einai megalyterh toy 10 tote h metablhth pace pairnei thn timh toy pinaka poy dhmioyrgeitai apo thn synarthsh sign epi 10     
        SV.Rate = pace; %ekxwrei sto rate tou SAPI thn timh tou pace
    end
end
if nargin < 4 || ~ismember(fs,[8000,11025,12000,16000,22050,24000,32000,...
        44100,48000]), fs = 16000; end %elegxei an to number of function input arguments einaimikrotero apo 4 h an to fs einai diaforo apo tis times poy mporei na parei tote ekxwrei sthn metablhth fs thn timh 16000 Hz. 
if nargout > 0 % elegxei ean to  number of function output arguments einai megalytero tou 0 tote 
   % Output variable;
   MS = actxserver('SAPI.SpMemoryStream'); %ekxwrei sthn metablhth MS thn leitoyrgia tou SAPI.spMemoryStream. To actserver kanei oti eipame kai pio panw.
   MS.Format.Type = sprintf('SAFT%dkHz16BitMono',fix(fs/1000)); %sto antikeimeno MS.Format.Type ekxwreitai h timh ths morfopoihmenhs timhs ths strogkylopoihshs ths fix toy arithmoy deigmatoleipsias pros 1000 se mia akeraia timh poy plhsiazei to mhden
   SV.AudioOutputStream = MS;  %ekxwrei sto antikeimeno SV.AudioOutputStream thn timh MS
end
invoke(SV,'Speak',txt); % Epikaleitai thn methodo 'Speak' ths yphresias SAPI pou thn exoyme ekxwrhsei sto SV mesw ths synarthshs actserver
if nargout > 0 % elegxei ean to  number of function output arguments einai megalytero tou 0 tote
    % Convert uint8 to double precision; unsigned integer number stored
    % with 8 bits
    wav = reshape(double(invoke(MS,'GetData')),2,[])';
    wav = (wav(:,2)*256+wav(:,1))/32768;
    wav(wav >= 1) = wav(wav >= 1)-2;
    delete(MS);
    clear MS;
end
delete(SV); 
clear SV TK;
pause(0.2);
end % TTS;
