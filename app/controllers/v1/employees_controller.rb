module V1
  class EmployeesController < ApplicationController
    before_action :set_employee, only: [:show, :destroy, :update]

    def index
      employees = Employee.all.includes(:manager)
      render json: {
        data: ActiveModelSerializers::SerializableResource.new(employees, each_serializer: EmployeeSerializer),
        message: ['Employee list fetched successfully'],
        status: 200,
        type: 'Success'
      }
    end

    def show
      render json: {
        data: ActiveModelSerializers::SerializableResource.new(@employee, serializer: EmployeeSerializer),
        message: ['Employee profile fetched successfully'],
        status: 200,
        type: 'Success'
      }
    end

    def create
      employee = Employee.new(employee_params)

      if employee.save
        render json: employee, status: 201
      else
        render json: { error: employee.errors }, status: 422
      end
    end

    def update
      if @employee.update(employee_params)
        render json: @employee, status: 200
      else
        render json: { error: @employee.errors }, status: 422
      end
    end

    def destroy
      @employee.destroy
      head 204
    end

    private

    def set_employee
      @employee = Employee.find(params[:id])
    end

    def employee_params
      params.require(:employee).permit(:name, :email, :dob, :mobile, :designation, :salary, :manager_id)
    end
  end
end
