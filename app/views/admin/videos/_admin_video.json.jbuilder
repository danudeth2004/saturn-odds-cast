json.extract! admin_video, :id, :title, :youtube_link, :short_description, :created_at, :updated_at
json.url admin_video_url(admin_video, format: :json)
