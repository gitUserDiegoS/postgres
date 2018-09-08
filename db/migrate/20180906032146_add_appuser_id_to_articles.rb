class AddAppuserIdToArticles < ActiveRecord::Migration[5.2]
  def change
    add_reference :articles, :appuser, foreign_key: true
  end
end
