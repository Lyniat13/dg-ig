### Use Case

Eine Hausarztpraxis erfasst die Arzneimittelallergien ihrer Patientinnen und Patienten strukturiert. Die Notfallstation liest diese Angaben, um auslösende Arzneimittel, den klinischen Status, die Gefährlichkeit und bekannte Reaktionen zuverlässig beurteilen zu können. Das Beispiel zeigt eine bestätigte Penicillinallergie bei Anna Muster, dokumentiert durch Dr. Sara Keller.

### Scope

Dieses IG beschreibt die Dokumentation von Arzneimittelallergien mit der FHIR-Ressource AllergyIntolerance auf Basis von CH Core. Es umfasst den klinischen Status, die Allergiebezeichnung, die Kritikalität, den Beginn als Datum oder Alter, die erfassende Fachperson und bekannte Reaktionen. Andere Allergiekategorien, Therapieempfehlungen und die technische Umsetzung einer Praxissoftware sind nicht Gegenstand dieses IG.

### Artefakte

* [DG Arzneimittelallergie](StructureDefinition-dg-medication-allergy.html): Profil mit Regeln für die strukturierte Erfassung einer Arzneimittelallergie auf Basis von CH Core AllergyIntolerance.
* [Bestätigte Penicillinallergie bei Anna Muster](AllergyIntolerance-PenicillinAllergieAnna.html): Beispiel einer aktiven, bestätigten Penicillinallergie mit hoher Kritikalität, Beginn am 15. Mai 2020 und Urtikaria als Reaktion.

### Festlegungen des Profils

* Kategorie, klinischer Status, Allergiebezeichnung, Kritikalität und erfassende Fachperson sind verpflichtend.
* Die Kategorie ist auf Arzneimittel (`medication`) festgelegt.
* Die Schweizer Allergieliste und die Schweizer Liste der Reaktionssymptome werden mit der Binding-Stärke `extensible` verwendet: Ein passender Code aus dem jeweiligen ValueSet muss genutzt werden; fehlt ein solcher, ist eine andere geeignete Erfassung möglich.
* Der Beginn bleibt optional und darf als Datum (`dateTime`) oder Alter (`Age`) erfasst werden.
* Die erfassende Person wird als CH Core Practitioner oder CH Core PractitionerRole referenziert. Im Use Case handelt es sich um eine Ärztin oder einen Arzt; die berufliche Qualifikation wird durch diese Referenzeinschränkung allein nicht geprüft.
* Reaktionen bleiben grundsätzlich optional. Die vorgegebene Invariante `dg-allergy-1` verlangt bei einer bestätigten Allergie mindestens eine Reaktion.
* Must Support bedeutet in diesem IG: Das erfassende System muss die betreffenden Angaben erfassen und speichern können; das empfangende System muss vorhandene Angaben verarbeiten und anzeigen können. Dies gilt für Kritikalität, Beginn, Reaktionen und Reaktionssymptome. Must Support macht optionale Angaben nicht verpflichtend.

### Abhängigkeiten

Dieses IG baut auf [CH Core 6.0.0](https://fhir.ch/ig/ch-core/6.0.0/) auf. Die Terminologie wird über die in der Vorlage definierten Aliase eingebunden.

### Autorin oder Autor

Natalie Brög

<p style="font-size:smaller">Erstellt im Lab des Moduls Data Standards in Healthcare, ZHAW, HS26. Kein offizieller Standard.</p>
