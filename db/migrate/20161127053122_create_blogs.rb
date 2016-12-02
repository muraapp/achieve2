class CreateBlogs < ActiveRecord::Migration
  def change
    create_table :blogs do |t|
      # t.欲しいカラムのデータ型 :カラムの名前
      t.string :title
      t.text   :content
      t.timestamps null: false
    end
  end
end
