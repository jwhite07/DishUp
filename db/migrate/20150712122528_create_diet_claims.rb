class CreateDietClaims < ActiveRecord::Migration
  def change
    create_table :diet_claims do |t|
      t.references :diet_type, index: true, foreign_key: true
      t.references :dish, index: true, foreign_key: true
      t.string :notes
      t.string :claim_type

      t.timestamps null: false
    end
  end
end
