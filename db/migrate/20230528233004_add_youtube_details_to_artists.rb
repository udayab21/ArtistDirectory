class AddYoutubeDetailsToArtists < ActiveRecord::Migration[7.0]
  def change
    add_column :artists, :video_url, :string
    add_column :artists, :thumbnail_url, :string
  end
end
