class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :user_name, :password_hash

      t.timestamps
    end
  end
end


