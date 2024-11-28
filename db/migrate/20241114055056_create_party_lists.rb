# frozen_string_literal: true

class CreatePartyLists < ActiveRecord::Migration[7.0]
  def change
    create_table :party_lists do |t|
      t.references :organization
      t.string :name
      t.string :description
      t.timestamps
    end
  end
end
