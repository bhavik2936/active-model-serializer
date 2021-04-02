module V2
  class ManagerSerializer < ActiveModel::Serializer
    attributes :id, :name, :employees

    def employees
      ActiveModelSerializers::SerializableResource.new(object.employees,  each_serializer: EmployeeSerializer)
    end
  end
end
