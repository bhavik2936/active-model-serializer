module V1
  class EmployeeSerializer < ActiveModel::Serializer
    attributes :id, :name, :email, :designation, :manager

    def manager
      {
        id: object.manager.id,
        name: object.manager.name
      }
    end
  end
end
