class ItemsController < ApplicationController
  before_action :find_item, only: [:show, :edit, :update, :destroy]
  
  def index
    if user_signed_in?
    @items = Item.where(:user_id => current_user.id).order("created_at DESC")
    end
    #now only the items that a specific user creates will be displayed. 
  end
  
  def show
    # the item is already available cause of the before_action
  end
  
  def new
    @item = current_user.items.build
    #now when a new item is created, it is attached to the current user    
  end
  
  def create
    #now when a new item is created, it is attached to the current user    
    @item = current_user.items.build(item_params)
    if @item.save
      redirect_to root_path
    else
      render 'new' 
      # rendering a new form
    end
    #remember that create happens in the new view
  end

  def edit
    # the item is already available cause of the before_action
  end

  def update
    # the item is already available cause of the before_action
    if @item.update(item_params)
      redirect_to item_path(@item)
      #line 30's argument is the new updated info and the redirect_to is to the show path with respect to the current item.
    else
      render 'edit'
    end
    #remember update happens in the edit view
  end

  def destroy

    @item.destroy
    redirect_to root_path   
  end

  def complete
    @item = Item.find(params[:id])
    @item.update_attribute(:completed_at, Time.now)
    redirect_to root_path, notice: "Item successfully completed!"
  end

  private 

    def item_params
      params.require(:item).permit(:title, :description) 
    end

    def find_item
      @item = Item.find(params[:id])
      
    end
end
