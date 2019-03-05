class CreateReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :reviews do |t|
      t.references :author, foreign_key: { to_table: :users }
      t.references :receiver, foreign_key: { to_table: :users }
      t.string :content
      t.integer :rating
      t.boolean :barber_review

      t.timestamps
    end
  end
end
