class CreateFormations < ActiveRecord::Migration[7.0]
  def change
    create_table :formations, id: :uuid do |t|
      t.string :diplome
      t.string :description
      t.string :date_debut
      t.string :date_fin
      t.string :ecole
      t.integer :niveau_etude
      t.belongs_to :user , type: :uuid, foreign_key: true
      t.timestamps
    end
  end
end
