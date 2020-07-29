class ReactionsController < InheritedResources::Base

  private

    def reaction_params
      params.require(:reaction).permit(:type, :user_id, :object, :activity_id)
    end

end
