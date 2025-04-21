class CreateCollectionConfigrations < ActiveRecord::Migration[5.0]
  def change
    create_table :collection_configrations do |t|
    	t.string 			:collecion_name
      t.string 			:shop_name
      t.attachment 	:avatar
      t.timestamps
    end
  end
end
