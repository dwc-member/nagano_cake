class CreateItems < ActiveRecord::Migration[6.1]
  def change
    create_table :items do |t|
      ## 商品名のカラム
      t.string :name
      ## 商品説明文のカラム
      t.text :introduction
      ## 税抜価格のカラム
      t.integer :price
      ## 販売ステータスのカラム
      t.boolean :is_active

      t.timestamps
    end
  end
end
