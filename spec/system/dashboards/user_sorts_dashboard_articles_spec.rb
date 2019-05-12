require "rails_helper"

RSpec.describe("Sorting Dashboard Articles", type: :system, js: true) do
  let(:user) { create(:user) }
  let(:article1) { create(:article, user_id: user.id, published_at: 10.minutes.ago, created_at: 1.day.ago, positive_reactions_count: 5, page_views_count: 0, comments_count: 100) }
  let(:article2) { create(:article, user_id: user.id, published_at: 1.minute.ago, created_at: 2.days.ago, positive_reactions_count: 1, page_views_count: 10, comments_count: 0) }
  let(:article3) { create(:article, user_id: user.id, published_at: 5.minutes.ago, created_at: 3.days.ago, positive_reactions_count: 0, page_views_count: 1000, comments_count: 50) }

  before do
    article1
    article2
    article3
    sign_in(user)
  end

  it("shows articles sorted by default in created_at DESC") do
    visit("/dashboard")
    values = page.all(".single-article .comments-count span.value").map { |e| e.text.to_i }
    value1 = article1.comments_count
    value2 = article2.comments_count
    value3 = article3.comments_count
    expect(values).to(eql([
      value1,
      value2,
      value3,
    ]))
  end

  it("shows articles sorted by created_at ASC") do
    visit("/dashboard?sort=creation-asc")
    values = page.all(".single-article .comments-count span.value").map { |e| e.text.to_i }
    value3 = article3.comments_count
    value2 = article2.comments_count
    value1 = article1.comments_count
    expect(values).to(eql([
      value3,
      value2,
      value1,
    ]))
  end

  it("shows articles sorted by comments_count DESC") do
    visit("/dashboard?sort=comments-desc")
    values = page.all(".single-article .comments-count span.value").map { |e| e.text.to_i }
    value1 = article1.comments_count
    value3 = article3.comments_count
    value2 = article2.comments_count
    expect(values).to(eql([
      value1,
      value3,
      value2,
    ]))
  end

  it("shows articles sorted by page_views_count ASC") do
    visit("/dashboard?sort=views-asc")
    values = page.all(".single-article .comments-count span.value").map { |e| e.text.to_i }
    value1 = article1.comments_count
    value2 = article2.comments_count
    value3 = article3.comments_count
    expect(values).to(eql([
      value1,
      value2,
      value3,
    ]))
  end

  it("shows articles sorted by positive_reactions_count ASC") do
    visit("/dashboard?sort=reactions-asc")
    values = page.all(".single-article .comments-count span.value").map { |e| e.text.to_i }
    value3 = article3.comments_count
    value2 = article2.comments_count
    value1 = article1.comments_count
    expect(values).to(eql([
      value3,
      value2,
      value1,
    ]))
  end

  it("shows articles sorted by published_at DESC") do
    visit("/dashboard?sort=published-desc")
    values = page.all(".single-article .comments-count span.value").map { |e| e.text.to_i }
    value2 = article2.comments_count
    value3 = article3.comments_count
    value1 = article1.comments_count
    expect(values).to(eql([
      value2,
      value3,
      value1,
    ]))
  end
end
