class AddFieldsToUser < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :uuid, :string
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :type, :string, default: 'Customer'
    add_column :users, :birthday, :date
    add_column :users, :provider, :string
    add_column :users, :avatar, :string
    add_column :users, :mobile_token, :string
    add_column :users, :mobile_token_expiration, :datetime
    add_column :users, :hashed_id, :string
    add_column :users, :mobile_push_token, :string
    add_column :users, :uid, :string
    add_column :users, :access_token, :string
    add_column :users, :remote_avatar, :string
    add_column :users, :status, :integer, default: 0, null: false
    add_column :users, :level, :string, default: 'Init', null: false
    add_column :users, :points, :integer, default: 0, null: false
  end
end
