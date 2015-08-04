class CreateRegistrations < ActiveRecord::Migration
  def change
    create_table :registrations do |t|
      t.string :name
      t.string :email
      t.belongs_to :event, index: true, foreign_key: true
      t.datetime :registered_at
      t.datetime :deregistered_at
      t.boolean :paid

      t.timestamps null: false
    end
  end
end
