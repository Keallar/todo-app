# frozen_string_literal: true

class ListsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_list, only: %i[show edit update destroy]
  def index
    @lists = current_user.lists
    @item = Item.new
    @list = List.new
  end

  def show
    @item = Item.new
  end

  def new
    @list = List.new
  end

  def edit; end

  def create
    list = List.new(list_params)
    if list.save
      redirect_to lists_path, notice: "Todo list was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @list.update(list_params)
      redirect_to @list, notice: "Todo list was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @list.destroy
    respond_to do |format|
      format.html { redirect_to lists_url, notice: "Todo list was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

  def set_list
    @list = current_user&.lists&.find(params[:id])
  end

  def list_params
    params.require(:list).permit(:title).merge(user_id: session[:user_id])
  end
end
