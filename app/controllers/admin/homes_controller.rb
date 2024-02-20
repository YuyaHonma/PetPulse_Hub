class Admin::HomesController < ApplicationController
    before_action :authenticate_admin!
    
    def top
        @owners = Owner.page(params[:page]).per(10)
    end
    
    private

    def owner_params
        params.require(:owner).permit(:status)
    end
end
