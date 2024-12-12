class CreateCandidates < ActiveRecord::Migration[7.0]
  def change
    create_table :candidates do |t|
      t.references :officer_position, foreign_key: true
      t.references :party_list, foreign_key: true
      t.references :election, foreign_key: true
      t.string :serial_number
      t.string :name
      t.string :section
      t.string :course
      t.string :label
      t.integer :votes, default: 0
      t.timestamps
    end
  end
end
