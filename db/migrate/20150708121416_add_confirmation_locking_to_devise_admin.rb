class AddConfirmationLockingToDeviseAdmin < ActiveRecord::Migration
  def change
    ## Confirmable
    add_column  :admin_users, :confirmation_token, :string
    add_column  :admin_users, :confirmed_at, :datetime
    add_column  :admin_users, :confirmation_sent_at, :datetime
    add_column  :admin_users, :unconfirmed_email, :string # Only if using reconfirmable

    ## Lockable
    add_column  :admin_users, :failed_attempts, :integer, default: 0, null: false # Only if lock strategy is :failed_attempts
    add_column  :admin_users, :unlock_token, :string # Only if unlock strategy is :email or :both
    add_column  :admin_users, :locked_at, :datetime
    
    add_index :admin_users, :confirmation_token,   unique: true
    add_index :admin_users, :unlock_token,         unique: true
  end
end
