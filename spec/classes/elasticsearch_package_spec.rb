require "spec_helper"

describe "elasticsearch2::package" do
  let(:facts) { default_test_facts }

  it do
    should contain_homebrew__formula("elasticsearch2")

    should contain_package("boxen/brews/elasticsearch2").with_ensure("2.2.2-boxen1")
  end
end
