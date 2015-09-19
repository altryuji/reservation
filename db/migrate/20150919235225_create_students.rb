class CreateStudents < ActiveRecord::Migration
  def change
    create_table :students do |t|
      t.string :email, null: false
      t.string :name, null: false

      t.timestamps null: false
    end

    add_index :students, :email, unique: true
  end
end
