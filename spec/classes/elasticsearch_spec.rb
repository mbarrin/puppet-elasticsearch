require 'spec_helper'

describe 'elasticsearch2' do
  let(:facts) { default_test_facts }

  it do
    should contain_class("elasticsearch2::config")
    should contain_class("elasticsearch2::package")
    should contain_class("elasticsearch2::service")

    should contain_class("java")
  end
end
