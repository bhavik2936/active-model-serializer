module V1
  class ManagersController < ApplicationController
    before_action :set_manager, only: [:show, :destroy, :update]

    def index
      managers = Manager.all.includes(:employees)
      render json: {
        data: ActiveModelSerializers::SerializableResource.new(managers, each_serializer: ManagerSerializer),
        message: ['Manager list fetched successfully'],
        status: 200,
        type: 'Success'
      }
    end

    def show
      render json: {
        data: ActiveModelSerializers::SerializableResource.new(@manager, serializer: ManagerSerializer),
        message: ['Manager profile fetched successfully'],
        status: 200,
        type: 'Success'
      }
    end

    def create
      manager = Manager.new(manager_params)

      if manager.save
        render json: manager, status: 201
      else
        render json: { error: manager.errors }, status: 422
      end
    end

    def update
      if @manager.update(manager_params)
        render json: @manager, status: 200
      else
        render json: { error: @manager.errors }, status: 422
      end
    end

    def destroy
      @manager.destroy
      head 204
    end

    private

    def set_manager
      @manager = Manager.find(params[:id])
    end

    def manager_params
      params.require(:manager).permit(:name)
    end
  end
end
