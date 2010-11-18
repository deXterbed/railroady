require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe ControllersDiagram do
  describe 'file processing' do

    it 'should select all the files under the controllers dir' do
      cd = ControllersDiagram.new
      files = cd.get_files("rspec/file_fixture/")
      files.size.should == 4
    end

    it 'should exclude a specific file' do
      options = OptionsStruct.new(:exclude => ['rspec/file_fixture/app/controllers/dummy1_controller.rb'])
      cd = ControllersDiagram.new(options)
      files = cd.get_files("rspec/file_fixture/")
      files.size.should == 3
    end

    it 'should exclude a glob pattern of files' do
      options = OptionsStruct.new(:exclude => ['rspec/file_fixture/app/controllers/sub-dir/*.rb'])
      cd = ControllersDiagram.new(options)
      files = cd.get_files("rspec/file_fixture/")
      files.size.should == 3
    end

    it 'should include only specific file' do
      options = OptionsStruct.new(:specify => ['rspec/file_fixture/app/controllers/sub-dir/sub_dummy_controller.rb'])
      cd = ControllersDiagram.new(options)
      files = cd.get_files("rspec/file_fixture/")
      files.size.should == 1
    end

    it 'should include only specified files' do
      options = OptionsStruct.new(:specify => ['rspec/file_fixture/app/controllers/{dummy1_*.rb,sub-dir/sub_dummy_controller.rb}'])
      cd = ControllersDiagram.new(options)
      files = cd.get_files("rspec/file_fixture/")
      files.size.should == 2
    end

    it 'should include only specified files and exclude specified files' do
      options = OptionsStruct.new(:specify => ['rspec/file_fixture/app/controllers/{dummy1_*.rb,sub-dir/sub_dummy_controller.rb}'],
                                  :exclude => ['rspec/file_fixture/app/controllers/sub-dir/sub_dummy_controller.rb'])
      cd = ControllersDiagram.new(options)
      files = cd.get_files("rspec/file_fixture/")
      files.size.should == 1
    end

  end
end
