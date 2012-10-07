require 'rubaiji'

describe Rubaiji::ReportSet do

  it "should return valid report set" do
    api_id = "root"
    api_key = "8dc3e35e989b51e849592d6fef6afe4bd07aaae7"
    c = Rubaiji::Connection.new(:api_id => api_id, :api_key => api_key)

    reports = c.all_reports
    reports.class.should eql(Rubaiji::ReportSet)
  end

  it "should return report instances and have correct fields" do
    api_id = "root"
    api_key = "8dc3e35e989b51e849592d6fef6afe4bd07aaae7"
    c = Rubaiji::Connection.new(:api_id => api_id, :api_key => api_key)

    reports = c.all_reports

    reports.each do |report|
      report.should be_an_instance_of Rubaiji::Report
      report.resource_uri.should_not be_nil
      report.results_no.should be_an_instance_of Fixnum
      report.date.should be_an_instance_of DateTime
    end
  end

  it "should return report instance and have results" do
    api_id = "root"
    api_key = "8dc3e35e989b51e849592d6fef6afe4bd07aaae7"
    c = Rubaiji::Connection.new(:api_id => api_id, :api_key => api_key)

    report = c.report '/api/v2/report/1270/'
    report.class.should eql(Rubaiji::Report)

    report.results.each do |result|
      result.class.should eql(Rubaiji::Result)
    end
  end
end
