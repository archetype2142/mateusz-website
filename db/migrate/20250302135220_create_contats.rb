class CreateContats < ActiveRecord::Migration[7.2]
  def change
    create_table :contacts do |t|
      t.string :name
      t.string :email
      t.string :message
      t.string :phone

      t.timestamps
    end
  end
end
