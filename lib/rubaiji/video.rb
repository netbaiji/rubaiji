module Rubaiji
  class Video
    attr_accessor :embed

    def initialize(params)
      params.each do |k, v|
        instance_variable_set("@#{k}", v) unless v.nil?
      end
    end
  end
end
