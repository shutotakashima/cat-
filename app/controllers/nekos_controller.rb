class NekosController < ApplicationController
    before_action :authenticate_user!, only: [:new, :create]
    def new
        @neko = Neko.new
      
    end
    def index
      if params[:search] == nil
        @nekos= Neko.all
      elsif params[:search] == ''
        @nekos= Neko.all
      else
        @nekos = Neko.where("town LIKE ? or way LIKE ? or thing LIKE ?",'%' + params[:search] + '%' ,'%' + params[:search] + '%' ,'%' + params[:search] + '%')
      end
    end
    
    def create
        neko = Neko.new(neko_params)
        neko.user_id = current_user.id
        if neko.save!
          redirect_to :action => "index"
        else
          redirect_to :action => "new"
        end
    end

    def show
      @neko = Neko.find(params[:id])
      @comments = @neko.comments
      @comment = Comment.new
    end
    
    def edit
      @neko = Neko.find(params[:id])
    end

    def update
      neko = Neko.find(params[:id])
      if neko.update(neko_params)
        redirect_to :action => "show", :id => neko.id
      else
        redirect_to :action => "new"
      end
    end

    def destroy
      neko = Neko.find(params[:id])
      neko.destroy
      redirect_to action: :index
    end

    private
    def neko_params
        params.require(:neko).permit(:town, :way, :thing, :cost, :image)
    end
    
end
