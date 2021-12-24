class ChangeGradeToBeStringInLabs < ActiveRecord::Migration[6.1]
  def change
    change_column :labs, :grade, :string
  end
end
