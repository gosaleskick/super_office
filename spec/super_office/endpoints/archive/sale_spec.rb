# frozen_string_literal: true

require 'spec_helper'

describe SuperOffice::Endpoints::Archive::Sale do
  let(:token) { TokenAR.new }
  let(:client) { SuperOffice::OAuth::Client.new(token: token) }

  describe 'GET /Archive/Sale' do
    context 'with no parmas' do
      it 'returns result object with json response', :vcr do
        result = client.sale

        expect(result).to be_a(SuperOffice::Result)
        expect(result.data).to match({
          "odata.metadata": "https://sod.superoffice.com:443/Cust25708/api/v1/Archive//$metadata",
          value: [
            {
              PrimaryKey: "1",
              EntityName: "sale",
              visibleFor: "[SR_VFC_ALL]",
              date: "2018-07-02T15:51:27",
              heading: "Example sale",
              currency: "GBP",
              competitor: "",
              lossReason: "",
              source: "Campaign",
              credited: "",
              userGroup: "Sales",
              saleStatus: "[SR_SALE_SOLD]",
              amount: 150.0,
              earning: 100.0,
              earningPercent: 100.0,
              saleNumber: "10011",
              associateId: "AM",
              saleId: 1,
              contactId: 1,
              personId: 1,
              projectId: 0,
              currencyId: 36,
              nextDueDate: "2015-11-04T13:00:00",
              saleType: "Sale to new customer",
              stalledComment: "",
              soldReason: "",
              activeErpLinks: false,
              probPercent: "100",
              reopenDate: "0001-01-01T00:00:00",
              registeredBy: "",
              registeredDate: "0001-01-01T00:00:00",
              hasGuide: true,
              hasStakeholders: true,
              completed: true,
              icon: "Sale_Sold",
              time: "2018-07-02T15:51:27",
              amountWeighted: 150.0,
              type: "[SR_SALE_SOLD]",
              stage: "[SR_SALE_SOLD]",
              originalStage: "",
              hasQuote: true,
              text: "Example sale",
              description: "This is just an example sale!",
              updatedBy: "AM",
              updatedDate: "2018-07-02T15:51:30",
              who: ""
            }, {
              PrimaryKey: "2",
              EntityName: "sale",
              visibleFor: "[SR_VFC_ALL]",
              date: "2018-07-02T15:52:04",
              heading: "IBM",
              currency: "GBP",
              competitor: "",
              lossReason: "",
              source: "",
              credited: "",
              userGroup: "Sales",
              saleStatus: "[SR_SALE_LOST]",
              amount: 80.0,
              earning: 80.0,
              earningPercent: 100.0,
              saleNumber: "10012",
              associateId: "CR",
              saleId: 2,
              contactId: 2,
              personId: 6,
              projectId: 0,
              currencyId: 36,
              nextDueDate: "2018-07-02T15:52:04",
              saleType: "Sale to new customer",
              stalledComment: "",
              soldReason: "",
              activeErpLinks: false,
              probPercent: "0",
              reopenDate: "0001-01-01T00:00:00",
              registeredBy: "AM",
              registeredDate: "2018-07-02T15:49:52",
              hasGuide: true,
              hasStakeholders: true,
              completed: true,
              icon: "Sale_Lost",
              time: "2018-07-02T15:52:04",
              amountWeighted: 0.0,
              type: "[SR_SALE_LOST]",
              stage: "[SR_SALE_LOST]",
              originalStage: "",
              hasQuote: true,
              text: "IBM",
              description: "",
              updatedBy: "AM",
              updatedDate: "2018-07-02T15:52:05",
              who: ""
            }
          ]
        })
      end
    end

    context 'with parmas' do
      it 'returns result object with json response', :vcr do
        result = client.sale(select: 'date', filter: "saleStatus oneOf (1)")

        expect(result).to be_a(SuperOffice::Result)
        expect(result.data).to match({
          "odata.metadata": "https://sod.superoffice.com:443/Cust25708/api/v1/Archive//$metadata",
          value: [
            {
              PrimaryKey: "3",
              EntityName: "sale",
              date: "2018-10-03T00:00:00"
            }, {
              PrimaryKey: "4",
              EntityName: "sale",
              date: "2018-10-03T00:00:00"
            }, {
              PrimaryKey: "6",
              EntityName: "sale",
              date: "2018-10-04T00:00:00"
            }, {
              PrimaryKey: "7",
              EntityName: "sale",
              date: "2018-10-04T00:00:00"
            }
          ]
        })
      end
    end
  end
end
