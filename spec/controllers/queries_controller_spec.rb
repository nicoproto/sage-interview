require "rails_helper"
require "pry"

describe QueriesController do
  describe "#create" do
    context "with valid query" do
      it "responds with facts" do
        post :create, params: { type: "words", query: "cow", format: 'json' }

        binding.pry

        resp = JSON.parse(response.body)
        expect(resp.facts.lenght).to be > 0
      end
    end
  end
end
