class CreateAppointments < ActiveRecord::Migration[8.0]
  def change
    create_table :appointments, id: :uuid do |t|
      t.datetime :start_time
      t.datetime :end_time
      t.uuid :booked_by_id, null: false
      t.uuid :coach_id, null: false

      t.timestamps
    end
    add_index :appointments, :booked_by_id
    add_index :appointments, :coach_id
  end
end
