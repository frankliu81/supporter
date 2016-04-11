class RequestAddStatusColumn < ActiveRecord::Migration
  def change
    add_column  :requests, :status, :string, default: 'not_done'
  end
end
