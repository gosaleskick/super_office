# frozen_string_literal: true

class Create<%= table_name.camelize %> < ActiveRecord::Migration<%= migration_version %>
  def change
    create_table :<%= table_name %> do |t|
      t.bytea :encrypted_access_token
      t.bytea :encrypted_refresh_token
      t.datetime :expires_at
      t.string :api_endpoint, null: false

      t.timestamps null: false
    end

    add_index :<%= table_name %>, :api_endpoint
  end
end
