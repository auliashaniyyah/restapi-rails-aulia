class CreateTestings < ActiveRecord::Migration[6.0]
  def change
    create_table :testings do |t|
      t.string :deskripsi
      t.string :keterangan

      t.timestamps
    end
  end
end
