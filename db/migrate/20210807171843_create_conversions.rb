class CreateConversions < ActiveRecord::Migration[5.2]
  def change
    create_table :conversions do |t|
      t.text :old_file_type
      t.text :new_file_type
      t.text :encoded_file
    end
  end
end
