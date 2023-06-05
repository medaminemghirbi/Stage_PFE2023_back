class CreateCertifications < ActiveRecord::Migration[7.0]
  def change
    create_table :certifications, id: :uuid do |t|
      t.string :certification_name
      t.string :etablissement
      t.date :date_certif
      t.belongs_to :user , type: :uuid, foreign_key: true
      t.timestamps
    end
  end
end
