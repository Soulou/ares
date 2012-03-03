class DeviseCreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.references :group, null: false
      t.string :username, null: false # LDAP uid
      t.string :email, null: false
      t.string :first_name, null: false
      t.string :last_name, null: false
      t.string :encrypted_password, null: false # LDAP userPassword

      ## LDAP posixAccount
      t.integer :uid_number, auto_increment: true
      t.string :home_directory, null: false
      t.string :login_shell, default: '/bin/bash'
      t.string :description

      ## Recoverable
      t.string   :reset_password_token
      t.datetime :reset_password_sent_at

      ## Rememberable
      t.datetime :remember_created_at

      ## Trackable
      t.integer  :sign_in_count, default: 0
      t.datetime :current_sign_in_at
      t.datetime :last_sign_in_at
      t.string   :current_sign_in_ip
      t.string   :last_sign_in_ip

      ## Token authenticatable
      t.string :authentication_token

      t.timestamps
    end

    add_index :users, :username, unique: true
    add_index :users, :uid_number, unique: true
    add_index :users, :reset_password_token, unique: true
    add_index :users, :authentication_token, unique: true
  end
end
