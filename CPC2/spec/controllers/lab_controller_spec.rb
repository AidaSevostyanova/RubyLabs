require 'rails_helper'

RSpec.describe LabsController, type: :controller do
  let(:user) { create :user }
  let(:params) { { user_id: user } }

  describe '#index' do
    subject { get :index, params: params }

    let!(:lab) { create :lab, user: user }

    it 'assigns @labs' do
      subject
      expect(assigns(:labs)).to eq([lab])
    end

    it { is_expected.to render_template('index') }
  end

  describe '#new' do
    subject { get :new, params: params }

    it { is_expected.to render_template(:new) }

    it 'assigns new lab' do
      subject
      expect(assigns(:lab)).to be_a_new Lab
    end
  end

  describe '#edit' do
    let!(:lab) { create :lab, user: user }
    let(:params) { { id: lab, user_id: user } }

    subject { process :edit, method: :get, params: params }

    it { is_expected.to render_template(:edit) }

    it 'assigns server policy' do
      subject
      expect(assigns :lab).to eq lab
    end
  end

  describe '#update' do
    let!(:lab) { create :lab, user: user }
    let(:params) { { id: lab, user_id: user, lab: { title: 'Some title' } } }

    subject { process :update, method: :put, params: params }

    it 'updates lab' do
      expect { subject }.to change { lab.reload.title }.to('Some title')
    end

    context 'with bad params' do
      let(:params) { { id: lab, user_id: user, lab: { title: '' } } }

      it 'does not update lab' do
        expect { subject }.not_to change { lab.reload.title }
      end
    end
  end

  describe '#show' do
    let(:params) { { user_id: user.id, id: lab } }

    subject { get :show, params: params }

    let!(:lab) { create :lab, user: user }

    it 'assigns @lab' do
      subject
      expect(assigns(:lab)).to eq(lab)
    end

    it { is_expected.to render_template(:show) }
  end

  describe '#destroy' do
    let!(:lab) { create :lab, user: user }
    let(:params) { { id: lab, user_id: user } }

    subject { process :destroy, method: :delete, params: params }

    it 'delete post' do
      expect { subject }.to change { Lab.count }.by(-1)
    end
  end

  describe '#mark' do
    let!(:lab) { create :lab, user: user }
    let(:params) { { id: lab, user_id: user } }

    subject { process :mark, method: :get, params: params }

    it { is_expected.to render_template(:mark) }

    it 'assigns server policy' do
      subject
      expect(assigns :lab).to eq lab
    end
  end
end
