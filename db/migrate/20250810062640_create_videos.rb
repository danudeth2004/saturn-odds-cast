class CreateVideos < ActiveRecord::Migration[8.0]
  def change
    create_table :videos do |t|
      t.string :title
      t.string :youtube_link
      t.string :short_description

      t.timestamps
    end
  end
end
