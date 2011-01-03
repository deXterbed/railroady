require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe String do
  describe '#camelize' do
    it "should upper-camelcase a lower case and underscored word" do
      'lower_case_and_underscored_word'.camelize.should == 'LowerCaseAndUnderscoredWord'
    end

    it "should lower-camelcase a lower case and underscored word when the :lower parameter is passed" do
      'lower_case_and_underscored_word'.camelize(:lower).should == 'lowerCaseAndUnderscoredWord'
    end
  end
end
