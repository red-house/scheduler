require 'rails_helper'

RSpec.describe Services::Schedule do
  describe "#schedule_session" do
    let(:jam_session_params) { build(:jam_session).attributes }
    subject { described_class.new }

    it "creates a JamSession object" do
      expect { subject.schedule_session(jam_session_params) }.to change(JamSession, :count).by(1)
    end
  end
end
