# frozen_string_literal: true

class CreateMembers < ActiveRecord::Migration[7.0]
  def change
    create_table :members do |t|
      t.references :organization
      t.references :user
      t.integer :role, default: 0
      t.timestamps
    end
  end
end
