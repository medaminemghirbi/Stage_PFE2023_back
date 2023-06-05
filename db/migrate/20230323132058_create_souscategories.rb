class CreateSouscategories < ActiveRecord::Migration[7.0]
  def change
    create_table :souscategories, id: :uuid do |t|
      t.string :sous_categorie_name
      t.belongs_to :categorie , type: :uuid, foreign_key: true
      t.timestamps
    end
  end
end
