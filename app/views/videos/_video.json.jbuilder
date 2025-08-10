json.extract! video, :id, :title, :youtube_link, :short_description, :created_at, :updated_at
json.url video_url(video, format: :json)
