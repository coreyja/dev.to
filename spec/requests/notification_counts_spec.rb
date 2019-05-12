require "rails_helper"

RSpec.describe("NotificationCounts", type: :request) do
  describe("GET /notifications/counts") do

      # stubbed to be 1
    it("returns a number") do
      get("/notifications/counts")
      expect(response.body).to(eq("1"))
    end
  end
end
