class KinousController < ApplicationController
    before_action :authenticate_user!
    def index
      if params[:search] != nil && params[:search] != ''
        #部分検索かつ複数検索
        search = params[:search]
        @kinous = Kinou.where("name LIKE ? OR genre LIKE ?", "%#{search}%", "%#{search}%")
      else
        @kinous = Kinou.all
      end

      if params[:tag_ids]
        @kinous = []
        params[:tag_ids].each do |key, value|      
          @kinous += Tag.find_by(name: key).kinous if value == "1"
        end
        @kinous.uniq!
      end
 
      if params[:tag]
        Tag.create(name: params[:tag])
      end

    end

    

    def new
        @kinou = Kinou.new
    end
    
    def create
        kinou = Kinou.new(kinou_params)
        kinou.user_id = current_user.id
        if kinou.save!
          redirect_to :action => "index"
        else
          redirect_to :action => "new"
        end
    end

    def show
        @kinou = Kinou.find(params[:id])
        @comments = @kinou.comments
        @comment = Comment.new
    end

    
    
    def edit
        @kinou = Kinou.find(params[:id])
    end

    def update
        kinou = Kinou.find(params[:id])
        if kinou.update(kinou_params)
          redirect_to :action => "show", :id => kinou.id
        else
          redirect_to :action => "new"
        end
    end

    def destroy
        kinou = Kinou.find(params[:id])
        kinou.destroy
        redirect_to action: :index
    end

    private
    def kinou_params
        params.require(:kinou).permit(:name, :genre, :about, :image, :age, :sex, :weight, :height, :frequency, :period, tag_ids: [])
    end


end
