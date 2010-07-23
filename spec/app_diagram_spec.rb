require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe AppDiagram do
  describe 'file name processing' do
    it 'should extract a simple name' do
      ad = AppDiagram.new
      name = ad.instance_eval {extract_class_name('app/models/test_this.rb')}
      name.should == 'TestThis'
    end
    it 'should constantize a name' do
      'String'.constantize.should == String
    end
      
  end
end
