class CreateOfficerPositions < ActiveRecord::Migration[7.0]
  def change
    create_table :officer_positions do |t|
      t.string :name
      t.integer :sort
      t.timestamps
    end

    add_reference :members, :officer_position, index: true
  end
end
