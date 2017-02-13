require 'rails_helper'

RSpec.describe Link, type: :model do
  describe "validations" do
    context "url" do
      it "link cannot be created without a url" do
        link = Link.new(url: "https://github.com")

        expect(link).to be_invalid
      end
    end

    context "link" do
      it "link cannot be created without a url" do
        link = Link.new(title: "test")

        expect(link).to be_invalid
      end
    end
  end

  describe "relationships" do
    link = Link.new(title: "test", url: "https://github.com")

    it "belongs to a user" do
      expect(link).to respond_to(:user)
    end
  end

  describe "valid_url?" do
    it "validates a good url" do
      link = Link.new(title: "test", url: "https://github.com")

      expect(link.valid_url?(link.url)).to eq(true)
    end

    it "invalidates a wrong url" do
      link = Link.new(title: "test", url: "example.wrong")

      expect(link.valid_url?(link.url)).to eq(false)
    end
  end
end
