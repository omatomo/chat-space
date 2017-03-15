require 'rails_helper'


describe MessagesController do

  let(:user)  { create(:user) }
  let(:group) {create(:group)}

    before do
      sign_in user
    end

  describe 'GET #index' do

    before do
      get :index, params: { group_id: group }
    end

    it "assigns the requested @group, @groups, " do

      groups = user.groups

      expect(assigns(:group)).to eq group
      expect(assigns(:groups)).to eq groups
    end

    it "renders the :index template" do

      expect(response).to render_template :index
    end

  end

  describe 'POST #create' do
  let(:valid_attributes) { FactoryGirl.attributes_for(:message) }

  it "saves the new message in the database"do
    expect {
     post :create, params: { group_id: group, message: attributes_for(:message) }
        }.to change(Message, :count).by(1)
  end

  it "render the :create template when message is saved" do
     post :create, params: { group_id: group, message: attributes_for(:message) }
      expect(response).to redirect_to group_messages_path
  end

  it "render the :create template when message doesn't saved" do
    post :create, params: { group_id: group, message: {body: nil}}
      expect(response).to redirect_to group_messages_path
      expect(flash[:alert]).to match "メッセージを入力してください。"
  end
end

end