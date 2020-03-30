class RenameContetnColumnToAnswers < ActiveRecord::Migration[5.0]
  def change
    rename_column :answers, :contetn, :content
  end
end
