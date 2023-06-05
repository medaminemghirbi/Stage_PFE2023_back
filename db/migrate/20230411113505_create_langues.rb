class CreateLangues < ActiveRecord::Migration[7.0]
  def change
    create_table :langues, id: :uuid do |t|
      t.string :langue_name
      t.timestamps
    end
  end
end
