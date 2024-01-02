# frozen_string_literal: true

class ItemsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_list
  before_action :set_item, only: %i[update destroy]

  def index
    @items = @list.items
  end

  def new
    @item = @list.items.build
  end

  def create
    @item = @list.items.build(item_params)

    if @item.save
      redirect_to @item.list, notice: 'Todo item was successfully created'
    else
      redirect_to @item.list, notice: 'Error while creating item!!!'
    end
  end

  def update
    if @item.update(item_params)
      redirect_to @item.list
    else
      redirect_to @item.list, notice: 'Error while saving!!!'
    end
  end

  def destroy
    @item.destroy

    redirect_to list_path(@list)
  end

  private

  def set_list
    @list = current_user&.lists&.find(params[:list_id])
  end

  def set_item
    @item = @list.items.find(params[:id])
  end

  def item_params
    params.require(:item).permit(:description, :status, :completed_at, :list_id)
  end
end
