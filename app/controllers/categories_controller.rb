class CategoriesController < ApplicationController
    #display available classes, find or create by new ones

    def index
        @categories = Category.all
    end

    def new
        @category = Category.new
    end

    def create
        @category = Category.new(category_params)
            if @category.save
                redirect_to categories_path
            else
                redirect_to :new
            end
    end

    def edit                              
        @category = Category.find_by(id: params[:id])
    end

    def update
        @category = Category.find_by(id: params[:id])
        @category.update(category_params)

  
        #binding.pry

        if @category.valid?
            redirect_to categories_path
        else
            render :edit
        end
    end

    def show
        @category = Category.find_by(id: params[:id])
    end


    
    def destroy
        @category = Category.find_by(id: params[:id])
        @category.destroy
        flash[:message] = "Category Deleted"
        redirect_to categories_path
    end
    private

    def category_params
        params.require(:category).permit(:name, :trait, :jills_opinion)
    end

end