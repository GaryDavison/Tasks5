class CreateRoles < ActiveRecord::Migration
  def change
    create_table :roles do |t|
      t.string :admin
    end
  end
end
