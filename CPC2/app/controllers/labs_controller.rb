class LabsController < ApplicationController
  before_action :find_lab, only: %i[show update destroy edit mark grade]
  before_action :authenticate_admin!
  def index
    @labs = Lab.all
  end

  def show
  end

  def new
    @lab = Lab.new
  end

  def create
    @lab = Lab.new(lab_params)
    @lab.user_id = 1

    if @lab.save
      redirect_to root_url
      flash[:success] = "Лабораторная успешно создана"
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if (@lab.update(lab_params))
      redirect_to root_url
      flash[:success] = "Лабораторная успешно обновлена"
    else
      render 'edit'
    end
  end

  def mark
  end

  def grade
    if (@lab.update(params.permit(:grade)))
      redirect_to root_url
      flash[:success] = "Лабораторная успешно оценена"
    else
      render 'mark'
    end
  end

  def destroy
    @lab.destroy

    redirect_to action: :index
    flash[:success] = "Лабораторная успешно удалена"
  end

  private

  def find_lab
    @lab = Lab.find params[:id]
  end

  def lab_params
    params.require(:lab).permit(:title, :description)
  end
end
