require 'spec_helper'

describe 'elasticsearch2::config' do
  let(:facts) { default_test_facts }

  it do
    %w(log config data).each do |d|
      should contain_file("/test/boxen/#{d}/elasticsearch2").with_ensure(:directory)
    end

    should contain_file("/test/boxen/config/elasticsearch2/elasticsearch.yml")

    should contain_file("/Library/LaunchDaemons/dev.elasticsearch2.plist").with({
      :group => "wheel",
      :owner => "root",
    })

    should contain_boxen__env_script("elasticsearch2").with({
      :ensure   => :present,
      :priority => "lower",
    })

    should contain_file("/test/boxen/env.d/elasticsearch2.sh").with_ensure(:absent)
  end
end
