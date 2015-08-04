class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :title
      t.text :description
      t.datetime :starts_at
      t.datetime :ends_at
      t.date :registration_starts_on
      t.date :registration_ends_on
      t.string :location
      t.boolean :payment_needed
      t.boolean :main_event

      t.timestamps null: false
    end
  end
end
