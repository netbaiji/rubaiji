module Rubaiji
  class Connection
    attr_reader :api_id, :api_key, :format
    API_URL = "http://localhost:8000"
    REPORT_INDEX_URL = "/api/v2/report/"

    def initialize(params)
      params.each do |k, v|
        instance_variable_set("@#{k}", v) unless v.nil?
      end
    end

    def all_reports
      res = query REPORT_INDEX_URL
      report_set = Rubaiji::ReportSet.new(res["objects"])
      report_set.add_meta(res["meta"])
      report_set
    end

    def report(resource_uri)
      res = query resource_uri
      report = Rubaiji::Report.new(res)
      report
    end

    private
    def get_url(url)
      URI.escape "#{API_URL}#{url}?format=json&username=#{api_id}&api_key=#{api_key}"
    end

    def query(url)
      RestClient.get(get_url(url), {:accept => :json}) { |response, request, result, &block|
        case response.code
        when 200
          JSON.parse response
        when 401
          raise Rubaiji::AuthenticationError
        when 404
          raise Rubaiji::ApiNotFound
        end
      }
    end
  end
end
