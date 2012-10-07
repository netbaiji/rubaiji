module Rubaiji
  class Report
    attr_reader :id, :results_no, :date, :resource_uri
    attr_accessor :results

    def initialize(params)
      params.each do |k, v|
        instance_variable_set("@#{k}", v) unless v.nil? || k == "results"
      end

      unless params["results"].nil?
        self.results = []
        params["results"].each do |res|
          self.results << Rubaiji::Result.new(res)
        end
      end
    end
  end

  class ReportSet < Array
    attr_reader :limit, :next_token, :offset, :previous, :total_count
    
    def initialize(array)
      array.each do |e|
        self << Rubaiji::Report.new(
          :resource_uri => e["resource_uri"],
          :date => DateTime.parse(e["date"]),
          :results_no => e["results_no"]
        )
      end
    end

    def add_meta(meta)
      limit = meta["limit"]
      next_token = meta["next"]
      offset = meta["offset"]
      previous = meta["previous"]
      total_count = meta["total_count"]
    end
  end
end
