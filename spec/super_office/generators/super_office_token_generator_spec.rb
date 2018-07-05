# frozen_string_literal: true

require 'spec_helper'
require 'generator_spec'
require 'generators/super_office/super_office_token_generator'
require 'tmpdir'

RSpec.describe SuperOffice::Generators::SuperOfficeTokenGenerator, type: :generator do
  destination File.expand_path(Dir.tmpdir(), __FILE__)
  arguments %w(SuperOfficeToken)

  before do
    prepare_destination
    run_generator
  end

  it "creates a model file" do
    assert_file "app/models/super_office_token.rb",
    <<~CONTENT
      class SuperOfficeToken < ApplicationRecord
      end
    CONTENT
  end

  it 'creates a miration file' do
    assert_migration "db/migrate/create_super_office_tokens.rb",
    <<~CONTENT
      # frozen_string_literal: true

      class CreateSuperOfficeTokens < ActiveRecord::Migration[5.2]
        def change
          create_table :super_office_tokens do |t|
            t.bytea :encrypted_access_token
            t.bytea :encrypted_refresh_token
            t.datetime :expires_at
            t.string :api_endpoint, null: false

            t.timestamps null: false
          end

          add_index :super_office_tokens, :api_endpoint
        end
      end
    CONTENT
  end
end
