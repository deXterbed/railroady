require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe ModelsDiagram do
  describe 'file  processing' do

    it 'should select all the files under the models dir' do
      md = ModelsDiagram.new
      files = md.get_files("rspec/file_fixture/")
      files.size.should == 3
    end

    it 'should exclude a specific file' do
      options = OptionsStruct.new(:exclude => ['rspec/file_fixture/app/models/dummy1.rb'])
      md = ModelsDiagram.new(options)
      files = md.get_files("rspec/file_fixture/")
      files.size.should == 2
    end

    it 'should exclude a glob pattern of files' do
      options = OptionsStruct.new(:exclude => ['rspec/file_fixture/app/models/*/*.rb'])
      md = ModelsDiagram.new(options)
      files = md.get_files("rspec/file_fixture/")
      files.size.should == 2
    end

    it 'should include only specific file' do
      options = OptionsStruct.new(:specify => ['rspec/file_fixture/app/models/sub-dir/sub_dummy.rb'])
      md = ModelsDiagram.new(options)
      files = md.get_files("rspec/file_fixture/")
      files.size.should == 1
    end

    it 'should include only specified files' do
      options = OptionsStruct.new(:specify => ['rspec/file_fixture/app/models/{dummy1.rb,sub-dir/sub_dummy.rb}'])
      md = ModelsDiagram.new(options)
      files = md.get_files("rspec/file_fixture/")
      files.size.should == 2
    end

    it 'should include only specified files and exclude specified files' do
      options = OptionsStruct.new(:specify => ['rspec/file_fixture/app/models/{dummy1.rb,sub-dir/sub_dummy.rb}'],
                                  :exclude => ['rspec/file_fixture/app/models/sub-dir/sub_dummy.rb'])
      md = ModelsDiagram.new(options)
      files = md.get_files("rspec/file_fixture/")
      files.size.should == 1
    end

  end
end
