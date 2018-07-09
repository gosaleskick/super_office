# frozen_string_literal: true

require 'spec_helper'

describe SuperOffice::Endpoints::List::Task do
  let(:token) { TokenAR.new }
  let(:client) { SuperOffice::OAuth::Client.new(token: token) }

  describe 'GET /List/Task/MDOItems' do
    it 'returns result object with json response', :vcr do
      result = client.task_mdo_items

      expect(result).to be_a(SuperOffice::Result)
      expect(result.data).to match([
        {
          TableRight: nil,
          FieldProperties: {},
          Id: 1,
          Name: "Meeting (Internal)",
          ToolTip: "Meeting (Internal)",
          Deleted: false,
          Rank: 1,
          Type: "task",
          ChildItems: [],
          IconHint: "task",
          ColorBlock: 0,
          ExtraInfo: "",
          StyleHint: "",
          FullName: ""
        }, {
          TableRight: nil,
          FieldProperties: {},
          Id: 2,
          Name: "Meeting (External)",
          ToolTip: "Meeting (External)",
          Deleted: false,
          Rank: 2,
          Type: "task",
          ChildItems: [],
          IconHint: "task",
          ColorBlock: 0,
          ExtraInfo: "",
          StyleHint: "",
          FullName: ""
        }, {
          TableRight: nil,
          FieldProperties: {},
          Id: 3,
          Name: "Phone-Out",
          ToolTip: "Phone-Out",
          Deleted: false,
          Rank: 3,
          Type: "task",
          ChildItems: [],
          IconHint: "task",
          ColorBlock: 0,
          ExtraInfo: "",
          StyleHint: "",
          FullName: ""
        }, {
          TableRight: nil,
          FieldProperties: {},
          Id: 4,
          Name: "Phone-In",
          ToolTip: "Phone-In",
          Deleted: false,
          Rank: 4,
          Type: "task",
          ChildItems: [],
          IconHint: "task",
          ColorBlock: 0,
          ExtraInfo: "",
          StyleHint: "",
          FullName: ""
        }, {
          TableRight: nil,
          FieldProperties: {},
          Id: 5,
          Name: "Follow-up",
          ToolTip: "Follow-up",
          Deleted: false,
          Rank: 5,
          Type: "task",
          ChildItems: [],
          IconHint: "task",
          ColorBlock: 0,
          ExtraInfo: "",
          StyleHint: "",
          FullName: ""
        }, {
          TableRight: nil,
          FieldProperties: {},
          Id: 6,
          Name: "Planning",
          ToolTip: "Planning",
          Deleted: false,
          Rank: 7,
          Type: "task",
          ChildItems: [],
          IconHint: "task",
          ColorBlock: 0,
          ExtraInfo: "",
          StyleHint: "",
          FullName: ""
        }, {
          TableRight: nil,
          FieldProperties: {},
          Id: 7,
          Name: "Visit",
          ToolTip: "Visit",
          Deleted: false,
          Rank: 8,
          Type: "task",
          ChildItems: [],
          IconHint: "task",
          ColorBlock: 0,
          ExtraInfo: "",
          StyleHint: "",
          FullName: ""
        }, {
          TableRight: nil,
          FieldProperties: {},
          Id: 8,
          Name: "Lunch",
          ToolTip: "Lunch",
          Deleted: false,
          Rank: 9,
          Type: "task",
          ChildItems: [],
          IconHint: "task",
          ColorBlock: 0,
          ExtraInfo: "",
          StyleHint: "",
          FullName: ""
        }, {
          TableRight: nil,
          FieldProperties: {},
          Id: 9,
          Name: "Proposal",
          ToolTip: "Proposal",
          Deleted: false,
          Rank: 10,
          Type: "task",
          ChildItems: [],
          IconHint: "task",
          ColorBlock: 0,
          ExtraInfo: "",
          StyleHint: "",
          FullName: ""
        }, {
          TableRight: nil,
          FieldProperties: {},
          Id: 10,
          Name: "Service",
          ToolTip: "Service",
          Deleted: false,
          Rank: 11,
          Type: "task",
          ChildItems: [],
          IconHint: "task",
          ColorBlock: 0,
          ExtraInfo: "",
          StyleHint: "",
          FullName: ""
        }, {
          TableRight: nil,
          FieldProperties: {},
          Id: 11,
          Name: "Private",
          ToolTip: "Private",
          Deleted: false,
          Rank: 12,
          Type: "task",
          ChildItems: [],
          IconHint: "task",
          ColorBlock: 0,
          ExtraInfo: "",
          StyleHint: "",
          FullName: ""
        }, {
          TableRight: nil,
          FieldProperties: {},
          Id: 12,
          Name: "Other",
          ToolTip: "Other",
          Deleted: false,
          Rank: 13,
          Type: "task",
          ChildItems: [],
          IconHint: "task",
          ColorBlock: 0,
          ExtraInfo: "",
          StyleHint: "",
          FullName: ""
        }
      ])
    end
  end
end
