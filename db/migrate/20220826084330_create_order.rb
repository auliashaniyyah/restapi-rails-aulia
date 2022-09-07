class CreateOrder < ActiveRecord::Migration[6.0]
  def change
    create_table :orders do |t|
    t.references :customer, null: false, foreign_key: true
    t.timestamp :date
    t.float :total
    t.string :status

    t.timestamps
    end
  end
end
