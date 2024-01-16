require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end
  describe 'ユーザー新規登録' do
    context '新規登録できる場合' do
      it 'nickname、email、password、password_cofirmation、last_name、first_name、last_name_kana、first_name_kana、birthdayが存在すれば登録できる' do
        expect(@user).to be_valid
      end
    end
    context '新規登録できない場合' do
      it 'nicknameが空では保存できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it 'emailが空では保存できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it 'passwordが空では保存できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it '重複したemailが存在する場合は保存できない' do
        @user.save
        another_user = FactoryBot.build(:user, email: @user.email)
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end
      it 'emailは@を含まないと保存できない' do
        @user.email = 'testmail'
        @user.valid?
        expect(@user.errors.full_messages).to include('Email is invalid')
      end
      it 'passwordが6文字以下では保存できない' do
        @user.password = '12345'
        @user.password_confirmation = '12345'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end
      it 'passwordは半角数字のみの場合保存できない' do
        @user.password = '123456'
        @user.password_confirmation = '123456'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password には英字と数字の両方を含めて設定してください')
      end
      it 'passwordは半角英字のみの場合保存できない' do
        @user.password = 'abcdef'
        @user.password_confirmation = 'abcdef'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password には英字と数字の両方を含めて設定してください')
      end
      it 'passwordには半角英数字以外の文字が含まれている場合保存できない' do
        @user.password = 'abcd漢字123'
        @user.password_confirmation = 'abcd漢字123'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password には英字と数字の両方を含めて設定してください')
      end
      it 'passwordとpassword_confirmationが不一致では登録できない' do
        @user.password = '123456'
        @user.password_confirmation = '1234567'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it 'last_nameが空では保存できない' do
        @user.last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name can't be blank")
      end
      it 'last_nameが漢字、ひらがな、カタカナ以外が含まれていると保存できない'do
      @user.last_name = '漢字eigo123'
      @user.valid?
      expect(@user.errors.full_messages).to include('Last name には全角文字（漢字・ひらがな・カタカナ）を入力してください')
    end
    it 'first_nameが漢字、ひらがな、カタカナ以外が含まれていると保存できない'do
    @user.first_name = '漢字eigo123'
    @user.valid?
    expect(@user.errors.full_messages).to include('First name には全角文字（漢字・ひらがな・カタカナ）を入力してください')
  end
      it 'first_nameが空では保存できない' do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank")
      end
      it 'last_name_kanaは空では保存できない' do
        @user.last_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name kana can't be blank")
      end
      it 'first_name_kanaは空では保存できない' do
        @user.first_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana can't be blank")
      end
      it 'last_name_kanaにはカタカナ以外の文字が含まれていると保存できない'do
      @user.last_name_kana = 'カtaか7'
      @user.valid?
      expect(@user.errors.full_messages).to include('Last name kana には全角カタカナを入力してください')
    end
    it 'first_name_kanaにはカタカナ以外の文字が含まれていると保存できない'do
      @user.first_name_kana = 'カtaか7'
      @user.valid?
      expect(@user.errors.full_messages).to include('First name kana には全角カタカナを入力してください')
    end
      it 'birthdayは空では保存できない' do
        @user.birthday = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end
      pending "add some examples to (or delete) #{__FILE__}"
    end
  end
end
