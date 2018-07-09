# frozen_string_literal: true

require 'spec_helper'

describe SuperOffice::Endpoints::Archive::InternalUsers do
  let(:token) { TokenAR.new }
  let(:client) { SuperOffice::OAuth::Client.new(token: token) }

  describe 'GET /Archive/InternalUsers' do
    it 'returns result object with json response', :vcr do
      result = client.internal_users

      expect(result).to be_a(SuperOffice::Result)
      expect(result.data).to match(
        {
          "odata.metadata": "https://sod.superoffice.com:443/Cust25708/api/v1/Archive//$metadata",
          value: [
            {
              PrimaryKey: "5",
              EntityName: "all",
              otherGroups: "Sales",
              associateDbId: 5,
              ejUserId: 2,
              assocName: "AM",
              assocTooltip: "",
              userName: "adam@saleskick.co",
              personId: 5,
              firstName: "Adam",
              lastName: "MissingLastname",
              middleName: "",
              contactId: 2,
              mrMrs: "",
              title: "",
              contactName: "Saleskick AB",
              contactDepartment: "",
              contactCategory: "Supplier",
              contactFullName: "Saleskick AB",
              assocType: "",
              simultaneousEjUser: false,
              ejDisplayName: "AM",
              ejStatus: 1,
              usergroup: "Sales",
              role: "User level 0",
              credentialType: "[SR_SUPERID_TYPE]",
              credentialDisplayValue: "",
              portraitThumbnail: "",
              fullName: "Adam MissingLastname",
              isActive: true,
              "superoffice_visible-for": 0,
              "superoffice_superlicense-no-selection": 0,
              "superoffice_superlicense-contact-manager": 0,
              "superoffice_superlicense-marketing-pro": 0,
              "superoffice_superlicense-sales-pro": 0,
              "superoffice_superlicense-service-pro": 0,
              "superoffice_superlicense-complete": 1
            }, {
              PrimaryKey: "6",
              EntityName: "all",
              otherGroups: "Sales",
              associateDbId: 6,
              ejUserId: 3,
              assocName: "CR",
              assocTooltip: "",
              userName: "chris@saleskick.co",
              personId: 6,
              firstName: "Chris",
              lastName: "Rybka",
              middleName: "",
              contactId: 2,
              mrMrs: "Mr.",
              title: "",
              contactName: "Saleskick AB",
              contactDepartment: "",
              contactCategory: "Supplier",
              contactFullName: "Saleskick AB",
              assocType: "",
              simultaneousEjUser: false,
              ejDisplayName: "CR",
              ejStatus: 1,
              usergroup: "Sales",
              role: "User level 0",
              credentialType: "[SR_SUPERID_TYPE]",
              credentialDisplayValue: "",
              portraitThumbnail: "",
              fullName: "Chris Rybka",
              isActive: true,
              "superoffice_visible-for": 0,
              "superoffice_superlicense-no-selection": 0,
              "superoffice_superlicense-contact-manager": 0,
              "superoffice_superlicense-marketing-pro": 0,
              "superoffice_superlicense-sales-pro": 0,
              "superoffice_superlicense-service-pro": 0,
              "superoffice_superlicense-complete": 1
            }
          ]
        }
      )
    end
  end
end
