class Updatemessage < ActiveRecord::Migration[7.0]
  def change
    add_column :messages, :offre_id, :uuid
    add_column :messages, :candidature_id, :uuid
    add_column :messages, :receiver_id, :uuid
    add_column :messages, :sender_id, :uuid

  end
end
