# frozen_string_literal: true

require 'spec_helper'

describe SuperOffice::Endpoints::Archive::Person do
  let(:token) { TokenAR.new }
  let(:client) { SuperOffice::OAuth::Client.new(token: token) }

  describe 'GET /Archive/Person' do
    context 'with no parmas' do
      it 'returns result object with json response', :vcr do
        result = client.person

        expect(result).to be_a(SuperOffice::Result)
        expect(result.data).to match({
          "odata.metadata": "https://sod.superoffice.com:443/Cust25708/api/v1/Archive//$metadata",
          value: [
            {
              PrimaryKey: "5",
              EntityName: "person",
              personInterestIds: "",
              hasStoreConsent: true,
              hasEmarketingConsent: false,
              isMailingRecipient: true,
              subscription: "",
              legalBaseStore: "NO:\"Berettiget interesse\";IT:\"Interesse legittimo\";PL:\"Prawnie uzasadnione interesy\";JP:\"正当な利益\";CN:\"合法权益\";FR:\"Intérêt légitime\";CZ:\"Oprávněný zájem\";SP:\"Interés legítimo\";SW:\"Legitimt intresse\";NL:\"Rechtmatig belang\";DA:\"Legitim interesse\";FI:\"Oikeutettu etu\";GE:\"Berechtigte Interessen\";US:\"Legitimate interest\";RU:\"Законный интерес\"",
              legalBaseEmarketing: "",
              consentSourceStore: "NO:\"Ukjent\";IT:\"Sconosciuto\";PL:\"Nieznane\";JP:\"不明\";CN:\"未知\";FR:\"Inconnu\";CZ:\"Neznámé\";SP:\"Desconocido\";SW:\"Okänt\";NL:\"Onbekend\";DA:\"Ukendt\";FI:\"Tuntematon\";GE:\"Unbekannt\";US:\"Unknown\";RU:\"Неизвестно\"",
              consentSourceEmarketing: "",
              personId: 5,
              firstName: "Adam",
              middleName: "",
              lastName: "MissingLastname",
              contactId: 2,
              personDeletedDate: "0001-01-01T00:00:00",
              mrMrs: "",
              personNumber: "10011",
              title: "",
              useAsMailingAddress: false,
              position: "",
              personCountry: "United Kingdom",
              rank: 1,
              retired: false,
              birthYear: 0,
              birthMonth: 0,
              birthDay: 0,
              kanaFirstName: "",
              kanaLastName: "",
              supportAssociate: "",
              supportLanguage: "",
              ticketPriority: "",
              personAssociateId: "",
              personCategory: "Supplier",
              personBusiness: "Industry",
              personSource: "Sales & Marketing",
              portraitThumbnail: "",
              personActiveErpLinks: false,
              hasCompany: true,
              personRegisteredBy: "sysCust25708",
              personRegisteredDate: "2018-07-02T14:09:52",
              fullName: "Adam MissingLastname",
              fullNameWithContact: "Adam MissingLastname (Saleskick AB)",
              hasInfoText: false,
              hasInterests: false,
              birthdate: "0001-01-01T00:00:00",
              personNoMail: true,
              associateType: "Associate_Current",
              personUpdatedBy: "AM",
              personUpdatedDate: "2018-07-06T08:20:53"
            }, {
              PrimaryKey: "6",
              EntityName: "person",
              personInterestIds: "",
              hasStoreConsent: true,
              hasEmarketingConsent: false,
              isMailingRecipient: true,
              subscription: "",
              legalBaseStore: "NO:\"Berettiget interesse\";IT:\"Interesse legittimo\";PL:\"Prawnie uzasadnione interesy\";JP:\"正当な利益\";CN:\"合法权益\";FR:\"Intérêt légitime\";CZ:\"Oprávněný zájem\";SP:\"Interés legítimo\";SW:\"Legitimt intresse\";NL:\"Rechtmatig belang\";DA:\"Legitim interesse\";FI:\"Oikeutettu etu\";GE:\"Berechtigte Interessen\";US:\"Legitimate interest\";RU:\"Законный интерес\"",
              legalBaseEmarketing: "",
              consentSourceStore: "NO:\"Registrert av bruker\";IT:\"Creato dall'utente\";PL:\"Utworzony przez użytkownika\";JP:\"ﾕｰｻﾞｰによる作成\";CN:\"由用户创建\";FR:\"Créé par l'utilisateur\";CZ:\"Vytvořeno uživatelem\";SP:\"Creado por el usuario\";SW:\"Skapad av användare\";NL:\"Gemaakt door gebruiker\";DA:\"Oprettet af bruger\";FI:\"Käyttäjän luoma\";GE:\"Erstellt von Benutzer\";US:\"Created by user\";RU:\"Создано пользователем\"",
              consentSourceEmarketing: "",
              personId: 6,
              firstName: "Chris",
              middleName: "",
              lastName: "Rybka",
              contactId: 2,
              personDeletedDate: "0001-01-01T00:00:00",
              mrMrs: "Mr.",
              personNumber: "10012",
              title: "",
              useAsMailingAddress: false,
              position: "",
              personCountry: "United Kingdom",
              rank: 2,
              retired: false,
              birthYear: 0,
              birthMonth: 0,
              birthDay: 0,
              kanaFirstName: "",
              kanaLastName: "",
              supportAssociate: "",
              supportLanguage: "",
              ticketPriority: "",
              personAssociateId: "",
              personCategory: "Supplier",
              personBusiness: "Industry",
              personSource: "Sales & Marketing",
              portraitThumbnail: "",
              personActiveErpLinks: false,
              hasCompany: true,
              personRegisteredBy: "AM",
              personRegisteredDate: "2018-07-02T15:02:54",
              fullName: "Chris Rybka",
              fullNameWithContact: "Chris Rybka (Saleskick AB)",
              hasInfoText: false,
              hasInterests: false,
              birthdate: "0001-01-01T00:00:00",
              personNoMail: true,
              associateType: "Associate",
              personUpdatedBy: "CR",
              personUpdatedDate: "2018-07-09T12:34:25"
            }
          ]
        })
      end
    end

    context 'with parmas' do
      it 'returns result object with json response', :vcr do
        result = client.person(select: 'email/emailAddress')

        expect(result).to be_a(SuperOffice::Result)
        expect(result.data).to match({
          "odata.metadata": "https://sod.superoffice.com:443/Cust25708/api/v1/Archive//$metadata",
          value: [
            {
              PrimaryKey: "1",
              EntityName: "person",
              "email/emailAddress": "marie.degreeve@superoffice.co.uk"
            }, {
              PrimaryKey: "2",
              EntityName: "person",
              "email/emailAddress": "matt.cove@superoffice.co.uk"
            }, {
              PrimaryKey: "3",
              EntityName: "person",
              "email/emailAddress": "weronika.dabrowska@superoffice.co.uk"
            }, {
              PrimaryKey: "4",
              EntityName: "person",
              "email/emailAddress": "chris.massen@superoffice.co.uk"
            }, {
              PrimaryKey: "5",
              EntityName: "person",
              "email/emailAddress": "adamo@saleskick.co"
            }, {
              PrimaryKey: "6",
              EntityName: "person",
              "email/emailAddress": "chris@saleskick.co"
            }, {
              PrimaryKey: "7",
              EntityName: "person",
              "email/emailAddress": ""
            }, {
              PrimaryKey: "8",
              EntityName: "person",
              "email/emailAddress": ""
            }, {
              PrimaryKey: "9",
              EntityName: "person",
              "email/emailAddress": "mat@saleskick.co"
            }, {
              PrimaryKey: "10",
              EntityName: "person",
              "email/emailAddress": ""
            }, {
              PrimaryKey: "11",
              EntityName: "person",
              "email/emailAddress": "kuvidiku@99pubblicita.com"
            }
          ]
        })
      end
    end
  end
end
