class CreateElections < ActiveRecord::Migration[7.0]
  def change
    create_table :elections do |t|
      t.references :organization
      t.references :user
      t.string :name
      t.timestamps
    end
  end
end
