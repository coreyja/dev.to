FactoryBot.define do
  factory(:tag_adjustment) do
    user_id { 1 }
    article_id { 1 }
    tag_id { 1 }
    tag_name { "NOTHING" }
    adjustment_type { "removal" }
    reason_for_adjustment { "reason #{rand(10_000)}" }
    status { "committed" }
  end
end
