require 'rails_helper'

RSpec.describe JamSession, type: :model do
  it "creates an object with valid attribtues" do
    expect { create(:jam_session) }.to change(JamSession, :count).by(1)
  end
end
