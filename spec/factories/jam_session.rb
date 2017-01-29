FactoryGirl.define do
  factory :jam_session do
    band_id 1
    band_member_id  1
    candidate_id 1
    start_time { 10.hours.ago }
    end_time { 5.hours.ago }
  end
end
