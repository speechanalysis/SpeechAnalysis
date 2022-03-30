# Speech Analysis Project

#### Authors: 
[Alexandros Vythoulkas](https://github.com/AlexandrosV20) Π2013021

[Apostolos Kamplionis](https://github.com/apostoloskp) Π2015121

[Open E-Class Thread](https://opencourses.ionio.gr/modules/forum/viewtopic.php?course=DDI119&topic=2169&forum=3246)

## Checkpoint 1 18/3/2022
Όσο αφορά το 1ο Παραδοτέο, αρχικά, εξοικειωθήκαμε περαιτέρω με το Matlab και τις δυνατότητες που προσφέρει, ερχόμενοι από απο τυπική μελέτη της χρήσης του Octave.
Στη συνέχεια, επηρεασμένοι από την θεωρητική ύλη του μαθήματος το ενδιαφέρον μας επικεντρώθηκε στο στήσιμο μιας εφαρμογής που θα συνδυάζει λειτουργίες όπως
**Text-To-Speech(TTS)** και **Speech-To-Text(STT)**. Θεωρήσαμε πως θα αποβεί ένα ιδιαίτερα χρήσιμο εργαλείο για άτομα που παρουσιάζουν προβλήματα ομιλίας και όρασης.
Η έναρξη της υλοποίησης πραγματοποιήθηκε με την έρευνα και αναζήτηση του κατάλληλου υλικού. Ειδικότερα εντοπίσαμε σε ένα guide-thread πληροφορίες για το στήσιμο της
συνάρτησης TTS, που κάνει χρήση του Microsoft Win32 SAPI. Ενδεικτικά, παραθέτουμε τον σχολιασμένο κώδικα μετά από την μελέτη που του κάναμε.

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

## Checkpoint 2 1/4/2022
Όσο αφορά το 2ο Παραδοτέο, ερχόμενοι από την ολοκληρωμένη υλοποίηση της λειτουργίας Text-To-Speech(TTS), εστιάσαμε στη σύνταξη κώδικα για την αντίστροφη λειτουργία
Speech-To-Text(STT) καθώς και το αντίστοιχο GUI Button αυτής.

![stt](https://github.com/speechanalysis/speechanalysis/blob/main/screenshots/stt.png)

![app](https://github.com/speechanalysis/speechanalysis/blob/main/screenshots/app.png)

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

## Checkpoint 3 15/4/2022

## Checkpoint 4 6/5/2022

### Github Repository
[Αρχεία Κώδικα](in progress)

### Youtube Video
[in progress]
