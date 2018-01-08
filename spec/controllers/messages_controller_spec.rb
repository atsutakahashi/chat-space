require 'rails_helper'
#MessageControllerのアクションについて
describe MessagesController do
  let(:group) { create(:group) }
  let(:user) { create(:user) }
  # indexアクションについて
  describe '#index' do
    #ログインしている場合
    context 'log in' do
      before do
        login user
        get :index, params: { group_id: group.id }
      end
      # @messageがMessageクラスのインスタンスかつ未保存のレコードか
      it 'assigns @message' do
        expect(assigns(:message)).to be_a_new(Message)
      end
      # @groupがgroupと同じか
      it 'assigns @group' do
        expect(assigns(:group)).to eq group
      end
      # メッセージが作成された後、indexに遷移するか
      it 'redners index' do
        expect(response).to render_template :index
      end
    end
      # ログインしていない場合
    context 'not log in' do
      before do
        get :index, params: { group_id: group.id }
      end
      # ログインしていない場合にログインページにリダイレクトできるか
      it 'redirect to new_user_session_path' do
        expect(response).to redirect_to(new_user_session_path)
      end
    end
  end
  # createアクションについて
  describe '#create' do
    let(:params) { { group_id: group.id, user_id: user.id, message: attributes_for(:message) } }
    # ログインしている場合
    context 'log in' do
      before do
        login user
      end
      # 保存できるか
      context 'can save' do
        subject {
          post :create,
          params: params
        }
        # レコードの総数が一個増えるか
        it 'count up message' do
          expect{ subject }.to change(Message, :count).by(1)
        end
        # 保存後に意図したビューに遷移するか
        it 'redirects to group_messages_path' do
          subject
          expect(response).to redirect_to(group_messages_path(group))
        end
      end
      # 保存できなかった場合
      context 'can not save' do
        let(:invalid_params) { { group_id: group.id, user_id: user.id, message: attributes_for(:message, body: nil, image: nil) } }

        subject {
          post :create,
          params: invalid_params
        }
        # レコード数が変化しないか
        it 'does not count up' do
          expect{ subject }.not_to change(Message, :count)
        end
        # 保存できなかった後、意図したビューに遷移するか
        it 'renders index' do
          subject
          expect(response).to render_template :index
        end
      end
    end
    # ログインしていない場合
    context 'not log in' do
      # ログインページに遷移するか
      it 'redirects to new_user_session_path' do
        post :create, params: params
        expect(response).to redirect_to(new_user_session_path)
      end
    end
  end
end