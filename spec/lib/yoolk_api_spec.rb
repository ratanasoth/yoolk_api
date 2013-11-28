require 'spec_helper'

describe YoolkApi do
  context "#with_client" do
    it "use that client within that block" do
      YoolkApi.client = nil

      YoolkApi.with_client(domain_name: 'yp.com.kh') do
        YoolkApi.client.domain_name.should == 'yp.com.kh'
      end

      YoolkApi.client.should == nil
    end

    it "raise exception when without block" do
      expect { YoolkApi.with_client(domain_name: 'yp.com.kh') }.to raise_error(ArgumentError)
    end
  end

  context "setup environment" do
    it "loads domain_name if environment setup" do
      YoolkApi.setup(environment: "staging")

      YoolkApi.client.domain_name.should == "apistaging.yoolk.com"
    end
  end
end
