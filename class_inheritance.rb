class Employee

  attr_reader :name, :title, :salary, :boss

  def initialize(name, title, salary, boss)
    @name, @title, @salary, @boss = name, title, salary, boss
    boss.employees << self unless boss.nil?
  end

  def bonus(multiplier)
    bonus = (salary) * multiplier
  end

end

class Manager < Employee
  attr_accessor :employees

  def initialize(name, title, salary, boss)
    super(name, title, salary, boss)
    @employees = []
  end

  def bonus(multiplier)
    bonus = total_salary_of_sub_employees * multiplier
  end

  def total_salary_of_sub_employees
    # return salary if employees.length == 0
    sub_employee_salaries = 0
    employees.each do |employee|
      if employee.is_a?(Manager)
        sub_employee_salaries += employee.total_salary_of_sub_employees
      end

      sub_employee_salaries += employee.salary
    end
    sub_employee_salaries
  end



end

ned = Manager.new("Ned", "Founder", 1_000_000, nil)
darren = Manager.new("Darren", "TA Manager", 78_000, ned)
shawna = Employee.new("Shawna", "TA", 12_000, darren)
david = Employee.new("David", "TA", 10_000, darren)
