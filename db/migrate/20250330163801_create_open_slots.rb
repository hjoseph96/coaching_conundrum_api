class CreateOpenSlots < ActiveRecord::Migration[8.0]
  def change
    create_table :open_slots, id: :uuid do |t|
      t.datetime :start_time
      t.datetime :end_time
      t.references :user, null: false, foreign_key: true, type: :uuid

      t.timestamps
    end
    add_index :open_slots, :start_time
    add_index :open_slots, :end_time
  end
end
