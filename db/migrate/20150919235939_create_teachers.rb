class CreateTeachers < ActiveRecord::Migration
  def change
    create_table :teachers do |t|
      t.string :email, null: false
      t.string :name, null: false

      t.timestamps null: false
    end

    add_index :teachers, :email, unique: true
  end
end
