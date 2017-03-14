require 'rails_helper'
describe User do
	describe '#create' do

		it "is valid with a nickname, email, password, password_confirmation" do
			user = build(:user)
			expect(user).to be_valid
		end

		it "is invalide without name" do
			user = build(:user, name: "")
            user.valid?
            expect(user.errors[:name]).to include("を入力してください。")
		end

		it "is invalid without email" do
			user = build(:user, email: "")
			user.valid?
			expect(user.errors[:email]).to include("を入力してください。")
		end

		it "is invalid without password" do
		   user = build(:user, password: "")
		   user.valid?
		   expect(user.errors[:password]).to include("を入力してください。")
	    end

	    it "is invalid without password_confirmation" do
	    	user = build(:user, password_confirmation: "")
	    	user.valid?
	    	expect(user.errors[:password_confirmation]).to include("とパスワードの入力が一致しません。")
	    end

	    it "is invalid name that has more than 7 character" do
	    	user = build(:user, name: "kdkdkdkdkdkd")
	    	user.valid?
	    	expect(user.errors[:name]).to include("は7文字以内で入力してください。")
	    end

	    it "is valid name that has less than 7 character" do
	    	user = build(:user, name: "yyyyyyy")
	    	expect(user).to be_valid
	    end

	    it "is invalid password that has less than 5 character" do
	    	user = build(:user, password: "dkdkd")
	    	user.valid?
	    	expect(user.errors[:password]).to include("は6文字以上で入力してください。")
	    end

	    it "is valid password that has more than 6 character" do
	    	user = build(:user, password: "00000000")
	    	expect(user).to be_valid
	    end

	    it "is invalid email if your email has already been taken" do
	    	user = create(:user)
	    	another = build(:user)
	    	another.valid?
	    	expect(another.errors[:email]).to include("はすでに存在します。")
	    end


	end
end