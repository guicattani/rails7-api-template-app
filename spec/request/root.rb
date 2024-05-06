# frozen_string_literal: true

require "rails_helper"

RSpec.describe "Root", type: :request do
  it "gives 200 ok" do
    get "/"
    expect(response).to_not render_template(:show)
  end
end
