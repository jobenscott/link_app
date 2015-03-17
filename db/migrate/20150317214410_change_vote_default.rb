class ChangeVoteDefault < ActiveRecord::Migration
  def up
    change_column :posts, :vote, :integer, :default => 0 
  end

  def down  
    raise ActiveRecord::IrreversibleMigration, "Can't remove the defult"
  end
end
