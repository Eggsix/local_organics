class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.references :user, index: true
      t.references :market, index: true
      t.text :content

      t.timestamps
    end
  end
end
