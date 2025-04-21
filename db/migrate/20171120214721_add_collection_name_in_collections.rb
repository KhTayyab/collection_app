class AddCollectionNameInCollections < ActiveRecord::Migration[5.0]
  def change
  	add_column 		:collection_configrations, 		:collection_name, :string
  	remove_column :collection_configrations, 		:collecion_name, 	:string
  end
end
