class RequestAddStatusColumn < ActiveRecord::Migration
  def change
    add_column  :requests, :status, :string, default: 'Not Done'
  end
end
