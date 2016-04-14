require "spec_helper"

describe "elasticsearch2::service" do
  let(:facts) { default_test_facts }

  it do
    should contain_service("com.boxen.elasticsearch2").with_ensure(:stopped)
    should contain_service("dev.elasticsearch2").with({
      :ensure => :running,
      :enable => true,
      :alias  => 'elasticsearch2'
    })
  end
end
