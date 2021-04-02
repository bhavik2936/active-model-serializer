module V1
  class ManagerSerializer < ActiveModel::Serializer
    attributes :id, :name, :employees

    def employees
      object.employees.map do |employee|
        {
          id: employee.id,
          name: employee.name,
          email: employee.email,
          designation: employee.designation
        }
      end
    end
  end
end
