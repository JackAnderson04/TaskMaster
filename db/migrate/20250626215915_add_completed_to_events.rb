class AddCompletedToEvents < ActiveRecord::Migration[8.0]
  def change
    add_column :events, :completed, :boolean
  end
end
