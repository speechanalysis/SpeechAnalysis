# Speech And Sound Processing Project
### speech.io

![logo](https://github.com/speechanalysis/Speechanalysis/blob/main/screenshots/logofinal.png)

### About ℹ️

_An application for Text-To-Speech and Speech-To-Text conversion_

#### Authors ✍️
[Alexandros Vythoulkas](https://github.com/AlexandrosV20) Π2013021

[Apostolos Kamplionis](https://github.com/apostoloskp) Π2015121

[Open E-Class Thread](https://opencourses.ionio.gr/modules/forum/viewtopic.php?course=DDI119&topic=2169&forum=3246)

## Ενότητες:

<sup><a href="#1">Λειτουργίες</a></sup>

<sup><a href="#2">Ελάχιστες απαιτήσεις συστήματος</a></sup>

<sup><a href="#3">Checkpoints</a></sup>

[Λήψη εφαρμογής](https://drive.google.com/file/d/1uFH_Bs45B_hl2G5TtFAjPyUVdpYI8Y2S/view?usp=sharing)

##### [1]

### Λειτουργίες ⚙️

* Δυναμική μετατροπή Text-To-Speech μέσω πληκτρολόγησης κειμένου ή χρήσης αρχείου text.

* Προσαρμόσιμες τιμές pace και Fs για την παραγωγή αρχείου ομιλίας.

* Μετατροπή Speech-To-Text ηχητικού σήματος σε αρχείο text

* User-friendly σχεδίαση GUI εφαρμογής.

* Ηχογράφηση ομιλίας και αποθήκευση ως wav ή flac αρχείο.

* Ενσωματωμένο Audio Player για αναπαραγωγή ηχητικών αρχείων και ηχογραφήσεων.

**Λειτουργία Text-To-Speech**:

**Λειτουργία Speech-To-Text**:

**Λειτουργία Record**:

![record](https://github.com/speechanalysis/Speechanalysis/blob/main/screenshots/record.gif)

**Audio Player**:

##### [2]

### Ελάχιστες απαιτήσεις συστήματος:

**OS**: Windows 7 SP1+

**Processor**: SSE2 instruction set support

**Memory**: 1 GB RAM

**Storage**: 766 MB available space for installation

**Additional Notes**: At least one audio recording device, e.g. microphone, USB headset recommended

*Internet connection required for downloading the Matlab Runtime Compiler if not already installed*

##### [3]

### Checkpoints

## Checkpoint 1 (18/3/2022)
Όσο αφορά το 1ο Παραδοτέο, αρχικά, εξοικειωθήκαμε περαιτέρω με το Matlab και τις δυνατότητες που προσφέρει, ερχόμενοι από απο τυπική μελέτη της χρήσης του Octave.
Στη συνέχεια, επηρεασμένοι από την θεωρητική ύλη του μαθήματος το ενδιαφέρον μας επικεντρώθηκε στο στήσιμο μιας εφαρμογής που θα συνδυάζει λειτουργίες όπως
**Text-To-Speech(TTS)** και **Speech-To-Text(STT)**. Θεωρήσαμε πως θα αποβεί ένα ιδιαίτερα χρήσιμο εργαλείο για άτομα που παρουσιάζουν προβλήματα ομιλίας και όρασης.
Η έναρξη της υλοποίησης πραγματοποιήθηκε με την έρευνα και αναζήτηση του κατάλληλου υλικού. Ειδικότερα για το [Text To Speech](https://www.mathworks.com/matlabcentral/fileexchange/18091-text-to-speech) [1] εντοπίσαμε σε ένα guide-thread πληροφορίες για το στήσιμο της
συνάρτησης TTS, που κάνει χρήση του [Microsoft Win32 SAPI](https://docs.microsoft.com/en-us/previous-versions/windows/desktop/ms720151(v=vs.85)) [2]. Ενδεικτικά, παραθέτουμε τον σχολιασμένο κώδικα μετά από την μελέτη που του κάναμε.

![screen1](https://github.com/speechanalysis/speechanalysis/blob/main/screenshots/screen1.png)

![screen2](https://github.com/speechanalysis/speechanalysis/blob/main/screenshots/screen2.png)

**Υλοποίηση του TTS κομματιού με την δημιουργία του κατάλληλου UI**

Συγκεκριμένα δημιουργήθηκαν 2 buttons, ένα που εκτελεί την λειτουργία TTS της αντίστοιχης συνάρτησης και ένα άλλο που να κάνει convert ολόκληρο txt file σε string και
μετά να εκτελεί την TTS συνάρτηση. Επίσης, έγινε η αρχή δημιουργίας ενός dialog box που θα ζητάει από τον χρήστη εάν θέλει να αποθηκεύσει το παραγόμενο ηχητικό ή όχι.
Παραθέτουμε screenshots από την μέχρι τώρα πρόοδο μαζί με τον κώδικα.

![screen3](https://github.com/speechanalysis/speechanalysis/blob/main/screenshots/screen3.png)

![screen4](https://github.com/speechanalysis/speechanalysis/blob/main/screenshots/screen4.png)

Αυτά είναι τα dialog boxes που έχουμε φτιάξει. Το ένα είναι όταν δημιουργείται το ηχητικό από τη συνάρτηση TTS να ζητάει να το αποθηκεύσει και το δεύτερο είναι από το 
convert button που ζητάει από τον χρήστη να να κάνει upload ένα txt αρχείο για να το κάνει μετατροπή σε συμβολοσειρά.
O κώδικας που έχουμε γράψει μέχρι τώρα, δύο callback functions για το πάτημα των κουμπιών με τον εξής κώδικα:

![screen5](https://github.com/speechanalysis/speechanalysis/blob/main/screenshots/screen5.png)

Το μόνο πράγμα που αλλάζει για το convert του txt είναι ότι αντί να πάρει σαν είσοδο το κείμενο που θα δώσει ο χρήστης απευθείας από το γραφικό περιβάλλον, θα πάρει 
σαν είσοδο το κείμενο που θα δώσει ο χρήστης από το dialog box και με την εντολή fscanf θα το μετατρέψει σε συμβολοσειρά.

[Checkpoint 1 PDF](https://github.com/speechanalysis/speechanalysis/blob/main/screenshots/%CE%A0%CE%91%CE%A1%CE%91%CE%94%CE%9F%CE%A4%CE%95%CE%9F%201.pdf)

## Checkpoint 2 (1/4/2022)
Όσο αφορά το 2ο Παραδοτέο, ερχόμενοι από την ολοκληρωμένη υλοποίηση της λειτουργίας Text-To-Speech(TTS), εστιάσαμε στη σύνταξη κώδικα για την αντίστροφη λειτουργία
Speech-To-Text(STT) καθώς και το αντίστοιχο GUI Button αυτής.

![stt](https://github.com/speechanalysis/speechanalysis/blob/main/screenshots/stt.png)



**Υλοποίηση του STT κομματιού με την δημιουργία του κατάλληλου UI**

[Mathworks link](https://uk.mathworks.com/matlabcentral/fileexchange/103525-wav2vec-2-0)

Συγκεκριμένα δημιουργήθηκαν 2 buttons. Το πρώτο εκτελεί την λειτουργία Record του
ηχητικού input(με τη χρήση Record GUI Button μέσω App Designer) και εμφάνιση
αντίστοιχων dialog boxes για την ενημέρωση του χρήστη ως προς το recording
state(start/stop) καθώς και ερώτημα για την αποθήκευση ή μη της εισόδου σε αρχείο wav.
Το δεύτερο button εστιάζει στη μετατροπή του παραπάνω αποθηκευμένου ηχητικού σε
κείμενο και αποθήκευση αυτού σε txt αρχείο. Πραγματοποιείται εφαρμογή του μοντέλου
wav2vec, το οποίο εκπαιδεύτηκε χρησιμοποιώντας το [LibriSpeech dataset](https://paperswithcode.com/dataset/librispeech) και αποτελείται
από 4 στάδια:

![wav2vec_model](https://github.com/speechanalysis/Speechanalysis/blob/main/screenshots/wav2vec_model.png)

![wav2vec1](https://github.com/speechanalysis/speechanalysis/blob/main/screenshots/wav2vec1.png)

• Το πρώτο ονομάζεται Feature Encoder όπου το ηχητικό αρχείο εισόδου διέρχεται
  μέσα από 7 σύστροφα μπλόκς μιας διάστασης. Το πρώτο μπλοκ περιέχει ένα
  επίπεδο κανονικοποίησης μεταξύ του σύστροφου μπλοκ και της συνάρτησης
  Gaussian Error Linear Units (GELU). Η έξοδος των σύστροφων μπλόκς διέρχεται
  πάλι από ένα στρώμα κανονικοποίησης πριν περάσουν από το γραμμικό επίπεδο.
  
Το συνολικό περιεχόμενο από την περιοχή λήψης του κωδικοποιητή είναι 400
δείγματα τα οποία συμβαδίζουν με 25 ms στα 16 kHz δειγματοληψίας fs.

![wav2vec2](https://github.com/speechanalysis/speechanalysis/blob/main/screenshots/wav2vec2.png)

• Το δεύτερο λέγεται Positional Encoding. Σε αυτό, τα λανθάνοντα χαρακτηριστικά
  που προέκυψαν από το προηγούμενο βήμα εισέρχονται σε ένα σύστροφο γκρουπ
  μιας διάστασης για να δημιουργηθεί ένα σχετικό διάνυσμα θέσεων το οποίο θα
  προστεθεί στα λανθάνοντα χαρακτηριστικά για την κωδικοποίηση της θέσης των
  συγγενικών χαρακτηριστικών μεταξύ τους.
  
![wav2vec3](https://github.com/speechanalysis/speechanalysis/blob/main/screenshots/wav2vec3.png)

• Το τρίτο στάδιο λέγεται Contex Network και αποτελείται από 12 block
  κωδικοποιητών. Κάθε μπλοκ εφαρμόζει μια multi-head προσέγγιση και τροφοδοτεί το
  επόμενο διαδοχικό μπλοκ. To επόμενο διαδοχικό μπλοκ αποτελείται από 2 πλήρως
  συνδεδεμένα επίπεδα κανονικοποίησης χωριζόμενα από ένα GELU layer. Στην multihead προσέγγιση κάθε μπλοκ του context network έχει 3 γραμμικά (fully-connected)
  layers των οποίων οι έξοδοι είναι το Q (query), K (key), και V (value) διανύσματα. Τα
  διανύσματα Q, K, and V στην συνέχεια χωρίζονται σε 12 (ο αριθμός των κεφαλών
  μέσα στο σύστημα) μη επικαλυπτόμενων sections. H Scaled dot-product προσέγγιση
  εφαρμόζεται σε κάθε χώρισμα ξεχωριστά και τα αποτελέσματα είναι συνδεδεμένα. Η
  έξοδος διέρχεται μέσω ενός γραμμικού επιπέδου για να σχηματιστεί η τελική multihead προσέγγιση.
  
![wav2vec4](https://github.com/speechanalysis/speechanalysis/blob/main/screenshots/wav2vec4.png)

![wav2vec5](https://github.com/speechanalysis/speechanalysis/blob/main/screenshots/wav2vec5.png)

![wav2vec6](https://github.com/speechanalysis/speechanalysis/blob/main/screenshots/wav2vec6.png)

• Το τέταρτο και τελευταίο στάδιο ονομάζεται Text Decoding και όπως λέει και το
  όνομα εδώ γίνεται αποκωδικοποίηση στην τελική μορφή του κειμένου. Το μοντέλο
  είναι εκπαιδευμένο χρησιμοποιώντας connectionist temporal classification (CTC).
  
![wav2vec7](https://github.com/speechanalysis/speechanalysis/blob/main/screenshots/wav2vec7.png)

**Gaussian Error Linear Unit(GELU) Activation**

![wav2vec8](https://github.com/speechanalysis/speechanalysis/blob/main/screenshots/wav2vec8.png)

**Οι πληροφορίες για τα παραπάνω πάρθηκαν απο τον οργανισμό [Mathworks - wav2vec](https://github.com/matlab-deep-learning/wav2vec-2.0) [3]**.

Με την ολοκλήρωση της ηχογράφησης(unpressed button state), εμφανίζεται το αντίστοιχο
dialog box που προτρέπει τον χρήστη να αποθηκεύσει το ηχητικό input ως αρχείο wav.
Με το button Speech To Text ο χρήστης έχει τη δυνατότητα να μετατρέψει το περιεχόμενο
του σήματος από το wav αρχείο σε μορφή κειμένου txt.

*Παραθέτουμε screenshots από την μέχρι τώρα πρόοδο:*

![recbutton](https://github.com/speechanalysis/speechanalysis/blob/main/screenshots/recbutton.png)

![recstart](https://github.com/speechanalysis/speechanalysis/blob/main/screenshots/recstart.png)

![recsave](https://github.com/speechanalysis/speechanalysis/blob/main/screenshots/recsave.png)

[Checkpoint 2 PDF](https://github.com/speechanalysis/Speechanalysis/blob/main/screenshots/%CE%A0%CE%91%CE%A1%CE%91%CE%94%CE%9F%CE%A4%CE%95%CE%9F%202.pdf)

## Checkpoint 3 (15/4/2022)
Όσον αφορά το 3ο Παραδοτέο, ερχόμενοι από την ολοκληρωμένη υλοποίηση της λειτουργίας Speech-To-Text(STT) εστιάσαμε στη δημιουργία ενός media player για τα ηχητικά 
ρχεία που υποστηρίζει η εφαρμογή μας. Tο player αυτό, εφόσον ο χρήστης κάνει επιλογή του ηχητικού αρχείου μέσω του Upload button, παρέχει λειτουργίες αναπαραγωγής(Play 
button), αυξομείωσης της έντασης αναπαραγωγής(Volume button) αλλά και διακοπή αυτής(Stop button).

**Σχεδιασμός και μορφή του κατάλληλου GUI για το audio player**

![audioplayer](https://github.com/speechanalysis/Speechanalysis/blob/main/screenshots/audioplayer.png)

Για την υλοποίηση του play/push button σε συνδυασμό με την τιμή του Volume Slider, έγινε χρήση του **[dsp.AudioFileReader](https://www.mathworks.com/help/dsp/ref/dsp.audiofilereader-system-object.html) [4]** για να διαβάσουμε δεδομένα από το αρχείο ήχου και **[audioDeviceWriter](https://www.mathworks.com/help/audio/ref/audiodevicewriter-system-object.html) [5]** για την αναπαραγωγή του ηχητικού, γράφοντας τα ηχητικά δείγματα στην συσκευή εξόδου. Ως 
αποτέλεσμα αποφεύχθηκε η επανεκκίνηση του αρχείου που αναπαράγεται κάθε φορά με την χρήση του audioplayer αφού έτσι κάθε φορά χρειάζεται να ξαναπαίξει το audio απο το 
σημείο που έμεινε με την νέα τιμή του value. Στη συνέχεια, κάνουμε μια επανάληψη while για όσο δεν έχει τελειώσει το ηχητικό που έχουμε εκχωρήσει στο αντικείμενο 
app.AFR και το flag μας έχει την τιμή true. Ενώ τρέχει το while για κάθε επανάληψη καλούμε το αντικείμενο app.AFR σαν να είναι συνάρτηση και εκχωρούμε την τιμή στο 
audio, δηλαδή, audio = app.AFR();. Επίσης,για να παιχτεί το ηχητικό γράφουμε άλλη μια εντολή μέσα στο while, app.ADW(app.VolumeSlider.Value/100 * audio); όπου παίζει 
το ηχητικό καλώντας το αντικείμενο app.ADW στο οποίο έχουμε εκχωρήσει την τιμή του audioDeviceWriter και δίνουμε σαν όρισμα το audio επί την τιμή του volume δια 100. 
Βάζουμε δια εκατό επειδή οι τιμές που έχουμε δώσει στον slider είναι “επί τοις εκατό” οπότε πρέπει να γίνει αυτό για να δουλέψει σωστά. Τέλος  για να σιγουρευτούμε ότι 
το graphic callback θα προσπελαστει γράφουμε την εντολή [drawnow limitrate](https://www.mathworks.com/help/matlab/ref/drawnow.html) στο τέλος της επανάληψης. Αυτό 
χρειάζεται όταν έχουμε μεγάλες επαναλήψεις - loops και θέλουμε να διακόψουμε την επανάληψη για να προσπελάσουμε το callback κάποιου άλλου graphic αντικειμένου.

**Ο κώδικας του Play/Pause button**

![playbutton](https://github.com/speechanalysis/Speechanalysis/blob/main/screenshots/playbutton.png)

**Ο κώδικας του Upload file button**

![uploadbutton](https://github.com/speechanalysis/Speechanalysis/blob/main/screenshots/uploadbutton.png)

**Ο κώδικας του Stop button**

![stopbutton](https://github.com/speechanalysis/Speechanalysis/blob/main/screenshots/stopbutton.png)

**Η μορφή της εφαρμογής μέχρι τώρα**

![appv1](https://github.com/speechanalysis/Speechanalysis/blob/main/screenshots/appv1.png)

[Checkpoint 3 PDF](https://github.com/speechanalysis/Speechanalysis/blob/main/screenshots/%CE%A0%CE%91%CE%A1%CE%91%CE%94%CE%9F%CE%A4%CE%95%CE%9F%203.pdf)

## Checkpoint 4 (6/5/2022)

x

[Αρχεία Κώδικα](https://github.com/speechanalysis/Speechanalysis/tree/main/code)

[Youtube Video](https://www.youtube.com/watch?v=zhsUfEOhzmw) 📹

### Βιβλιογραφία 📖
[Mathworks - Text To Speech](https://www.mathworks.com/matlabcentral/fileexchange/18091-text-to-speech) [1]

[Microsoft speech api](https://docs.microsoft.com/en-us/previous-versions/windows/desktop/ms720151(v=vs.85)) [2]

[Mathworks - Deep Learning - wav2vec](https://github.com/matlab-deep-learning/wav2vec-2.0) [3]

[Mathworks - dsp.AudioFileReader](https://www.mathworks.com/help/dsp/ref/dsp.audiofilereader-system-object.html) [4]

[Mathworks - audioDeviceWriter](https://www.mathworks.com/help/audio/ref/audiodevicewriter-system-object.html) [5]
