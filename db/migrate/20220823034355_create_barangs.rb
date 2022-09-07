class CreateBarangs < ActiveRecord::Migration[6.0]
  def change
    create_table :barangs do |t|
      t.integer :jumlah
      t.string :deskripsi

      t.timestamps
    end
  end
end
