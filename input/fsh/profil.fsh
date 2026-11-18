/* ---------------------------------------------------------------------------
 * --  _____       _____ _______                                             -
 * -- |_   _|     |_   _|__   __|                                            -
 * --   | |  _ __   | |    | |       Institute of Computer Science           -
 * --   | | | '_ \  | |    | |       Zurich University of                    -
 * --  _| |_| | | |_| |_   | |       Applied Sciences                        -
 * -- |_____|_| |_|_____|  |_|       8401 Winterthur, Switzerland            -
 * ---------------------------------------------------------------------------
 */

Profile: DgMedicationAllergy
Parent: CHCoreAllergyIntolerance
Id: dg-medication-allergy
Title: "DG Arzneimittelallergie"
Description: "Arzneimittelallergie, wie sie in der Hausarztpraxis erfasst und auf der Notfallstation gelesen wird."

// Anforderung 1: Genau eine Kategorie, immer Arzneimittel.
* category 1..1
* category = #medication

// Anforderung 2: Der klinische Status ist verpflichtend.
* clinicalStatus 1..1

// Anforderung 3: Allergie verpflichtend; passenden Code aus dem ValueSet nutzen.
// Falls kein passender Code existiert, bleibt eine andere Erfassung möglich.
* code 1..1
* code from $ch-allergy-vs (extensible)

// Anforderung 4: Die Gefährlichkeit muss angegeben und unterstützt werden.
// Bei unbekannter Gefährlichkeit kann #unable-to-assess verwendet werden.
* criticality 1..1 MS

// Anforderung 5: Beginn als Datum oder Alter; die Angabe bleibt optional.
* onset[x] only dateTime or Age
* onset[x] MS

// Anforderung 6: Die erfassende Fachperson muss angegeben sein.
* recorder 1..1
* recorder only Reference(CHCorePractitioner or CHCorePractitionerRole)

// Anforderung 7: Reaktionen bleiben optional und müssen unterstützt werden.
// Bei bestätigter Allergie verlangt die Invariante mindestens eine Reaktion.
* reaction MS
* reaction.manifestation MS
* reaction.manifestation from $ch-allergy-manifestation-vs (extensible)

// Vorgegebene Invariante aus invarianten.fsh anwenden.
* obeys dg-allergy-1
