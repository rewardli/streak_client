require 'minitest/spec'
require 'minitest/autorun'
require 'test_helper'

describe StreakClient::Box do

  before(:each) do
    @pipeline = StreakClient::Pipeline.create(name: "Test", description: "T")
    @box = StreakClient::Box.create(@pipeline.pipelineKey, {name: "Test Box"})
  end

  after(:each) do
    StreakClient::Pipeline.delete(@pipeline.pipelineKey)
  end

  it "can create one" do
    @box.boxKey.wont_be_nil
  end

  it "can find one" do
    found = StreakClient::Box.find(@box.boxKey)
    found.name.must_equal "Test Box"
  end

  it "can delete one" do
    StreakClient::Box.delete(@box.boxKey)
    StreakClient::Box.all.size.must_equal 0
  end

  it "can find all" do
    all = StreakClient::Box.all
    all.size.must_be :>, 0
    all.first.name.must_equal "Test Box"
  end

end

