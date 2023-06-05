class Createfavoris < ActiveRecord::Migration[7.0]
  def change
    create_table :favoris, id: :uuid do |t|
      t.belongs_to :user , type: :uuid, foreign_key: true
      t.belongs_to :offre , type: :uuid, foreign_key: true
  end
end
end
