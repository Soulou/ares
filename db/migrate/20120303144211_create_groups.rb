class CreateGroups < ActiveRecord::Migration
  def change
    create_table :groups do |t|
      t.string :name, null: false
      t.integer :gid_number # LDAP
      t.string :description

      t.timestamps
    end

    add_index :groups, :name, unique: true
  end
end
