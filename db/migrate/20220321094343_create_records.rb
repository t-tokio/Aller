class CreateRecords < ActiveRecord::Migration[6.0]
  def change
    create_table :records do |t|
      t.datetime :datetime,    null: false
      t.integer  :age_id,      null: false
      t.string   :food,        null: false
      t.integer  :quantity
      t.integer  :unit_id
      t.integer  :state_id,    null: :false
      t.text     :note
      t.references :user, null: false, foreign_key: true
      t.timestamps
    end
  end
end
