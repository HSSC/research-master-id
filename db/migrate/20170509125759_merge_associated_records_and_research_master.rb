class MergeAssociatedRecordsAndResearchMaster < ActiveRecord::Migration[5.0]
  def change
    add_column :research_masters, :sparc_protocol_id, :integer, after: :user_id
    add_column :research_masters, :eirb_protocol_id, :integer, after: :sparc_protocol_id
  end
end
