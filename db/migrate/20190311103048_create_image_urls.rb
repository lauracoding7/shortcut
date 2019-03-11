class CreateImageUrls < ActiveRecord::Migration[5.2]
  def change
    create_table :image_urls do |t|
      t.string :url
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
