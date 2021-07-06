class Employee
    attr_reader :salary, :name, :title, :boss
    def initialize(name, title, salary, boss)
        @name = name
        @title = title
        @salary = salary
        @boss = boss
    end

    def bonus(multiplier)
        bonus = (@salary * multiplier)
    end
end

class Manager < Employee
    attr_reader :employees
    def initialize(name, title, salary, boss, employees)
        super(name, title, salary, boss)
        @employees = employees
    end

    def bonus(multiplier)
        sum = 0
        queue = @employees
        while !queue.empty?
            current_employee = queue.shift
            sum += current_employee.salary
            queue += current_employee.employees if current_employee.is_a?(Manager)
        end
        sum * multiplier
    end
end