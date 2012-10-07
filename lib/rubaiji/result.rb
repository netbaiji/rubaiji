module Rubaiji
  class Result
    attr_reader :id, :link, :rank, :old_rank, :summary,
                :status, :images, :smart, :keywords
    attr_accessor :videos

    def initialize(params)
      params.each do |k, v|
        instance_variable_set("@#{k}", v) unless v.nil? or k == "videos"
      end

      _res = JSON.parse("\{\"videos\": #{params["videos"]}\}")
      self.videos = []
      _res["videos"].each do |video|
        self.videos << Rubaiji::Video.new(video)
      end
    end

    def old?
      status == "0"
    end

    def new?
      status == "1"
    end

    def smart?
      smart == true
    end

    def has_videos?
      videos.size > 0
    end
  end
end
