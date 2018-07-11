# frozen_string_literal: true

require 'spec_helper'

describe SuperOffice::Endpoints::Archive::Appointment do
  let(:token) { TokenAR.new }
  let(:client) { SuperOffice::OAuth::Client.new(token: token) }

  describe 'GET /Archive/Appointment' do
    context 'with no parmas' do
      it 'returns result object with json response', :vcr do
        result = client.appointment

        expect(result).to be_a(SuperOffice::Result)
        expect(result.data).to match({
          "odata.metadata": "https://sod.superoffice.com:443/Cust25708/api/v1/Archive//$metadata",
          value: [
            {
              PrimaryKey: "3",
              EntityName: "appointment",
              visibleFor: "[SR_VFC_ALL]",
              type: "(Proposal)",
              priority: "",
              date: "2015-11-04T13:00:00",
              endDate: "2015-11-04T00:00:00",
              associateId: "AM",
              appointmentId: 3,
              contactId: 1,
              personId: 1,
              projectId: 0,
              saleId: 1,
              userGroup: "Sales",
              recurrenceRuleId: 0,
              rawStatus: 1,
              rawType: 1,
              location: "",
              suggestedAppointmentId: 4,
              intention: "",
              isMilestone: false,
              registeredBy: "AM",
              registeredDate: "2015-11-04T15:56:48",
              completed: false,
              completedDate: "0001-01-01T00:00:00",
              icon: "Task",
              recordType: "Todo",
              time: "2015-11-04T13:00:00",
              endTime: "2015-11-04T14:00:00",
              text: "SOOO STRONG DEAL!",
              alarm: false,
              recurring: false,
              booking: false,
              visibleInDiary: false,
              updatedBy: "AM",
              updatedDate: "2015-11-04T16:00:19",
              who: "",
              participating: true
            }
          ]
        })
      end
    end

    context 'with parmas' do
      it 'returns result object with json response', :vcr do
        result = client.appointment(filter: 'associateId eq 5 and type oneOf (1)')

        expect(result).to be_a(SuperOffice::Result)
        expect(result.data).to match({
          "odata.metadata": "https://sod.superoffice.com:443/Cust25708/api/v1/Archive//$metadata",
          value:  [
            {
              PrimaryKey: "10",
              EntityName: "appointment",
              visibleFor: "[SR_VFC_ALL]",
              type: "Meeting (Internal)",
              priority: "",
              date: "2018-07-06T11:40:05",
              endDate: "2018-07-06T00:00:00",
              associateId: "AM",
              appointmentId: 10,
              contactId: 2,
              personId: 5,
              projectId: 0,
              saleId: 0,
              userGroup: "Sales",
              recurrenceRuleId: 0,
              rawStatus: 3,
              rawType: 2,
              location: "",
              suggestedAppointmentId: 0,
              intention: "",
              isMilestone: false,
              registeredBy: "AM",
              registeredDate: "2018-07-06T11:40:05",
              completed: true,
              completedDate: "2018-07-06T00:00:00",
              icon: "Appointment",
              recordType: "Appointment",
              time: "2018-07-06T11:40:05",
              endTime: "2018-07-06T00:00:00",
              text: "",
              alarm: false,
              recurring: false,
              booking: false,
              visibleInDiary: false,
              updatedBy: "AM",
              updatedDate: "2018-07-06T11:40:05",
              who: "",
              participating: true
            }
          ]
        })
      end
    end
  end
end
