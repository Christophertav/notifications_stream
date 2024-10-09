class CreateAlumnis < ActiveRecord::Migration[7.0]
  def change
    create_table :alumnis do |t|
      t.string :name

      t.timestamps
    end
  end
end
