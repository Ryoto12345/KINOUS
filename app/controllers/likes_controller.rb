class LikesController < ApplicationController
    def create
        like = current_user.likes.create(kinou_id: params[:kinou_id]) 
        redirect_back(fallback_location: kinous_path)
      end
    
      def destroy
        like = Like.find_by(kinou_id: params[:kinou_id], user_id: current_user.id)
        like.destroy
        redirect_back(fallback_location: kinous_path)
      end

end
