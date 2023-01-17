namespace app.mfc;

// using { Country } from '@sap/cds/common';
type Varchar : String(30);
type SDate : DateTime;
type LText : String(20);
type Bolla : Boolean;
type Messaggio : String(1000);



entity Anagrafica_Utenti {
  key ID_UTENTE : Integer;
  ITEMS  : Composition of many Anagrafica_Ruoli on ITEMS.ID_RUOLO = $self;
  COGNOME_UTENTE : Varchar Not null;
  NOME_UTENTE : Varchar Not null;
  EMAIL_UTENTE : LText Not null;
  ID_RUOLO : Integer;
  TELEFONO_UTENTE : LText Not Null;

};
entity Anagrafica_Ruoli {

    key ID_RUOLO : association to Anagrafica_Utenti;
    RUOLO : LText;

};
entity Anagrafica_Flussi {
  key ID_FLUSSO : Integer;
  ITEMS  : Composition of many Anagrafica_Moduli on ITEMS.INTHeader1 = $self;
  NOME_FLUSSO : LText;
  DESCRIZIONE_FLUSSO : LText;
  ID_MODULO : Integer;

};
entity Anagrafica_Moduli {

    key INTHeader1 : association to Anagrafica_Flussi;
    ID_MODULO: Integer;
    MODULO : LText;

};

entity Anagrafica_Errori {
  key ID_ERRORE : Integer;
  ID_FLUSSO : Integer;
  ITEMS  : Composition of many Anagrafica_Stato_Errori on ITEMS.INTHeader2 = $self;
  MESSAGGIO_ERRORE: LText;
  DATA_ERRORE : SDate;
  ID_STATO_ERRORE : Integer;
  ID_UTENTE : Integer;
Id_UTENTE_TECHNICAL : Integer;
STATO_BOTTONE: Bolla;

};
entity Anagrafica_Stato_Errori {

    key INTHeader2 : association to Anagrafica_Errori;
    ID_MODULO: Integer;
    MODULO : LText;

};