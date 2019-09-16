require 'csv'

TEACHERS = ['/home/alexander/my_folder/projects/pbz/lab_1/teachers_table.csv', 'преподаватели']
GROUPS = ['/home/alexander/my_folder/projects/pbz/lab_1/groups.csv', 'группы']
SCHEDULE = ['/home/alexander/my_folder/projects/pbz/lab_1/schedule.csv', 'занятия']
SUBJECTS = ['/home/alexander/my_folder/projects/pbz/lab_1/subjects.csv', 'предметы']

[TEACHERS, GROUPS, SCHEDULE, SUBJECTS].each do |table_data|
  CSV.foreach(table_data.first, headers: true, col_sep: ',', encoding:'ISO-8859-5') do |line|
    columns = line.each_with_object([]) do |key_value, array|
      array.push(key_value.first)
    end.join(', ')

    values = line.each_with_object([]) do |key_value, array|
      array.push("'#{key_value.last}'")
    end.join(', ')

    ActiveRecord::Base.connection.execute <<~SQL
      INSERT INTO #{table_data.last} (#{columns})
      VALUES (#{values})
    SQL
  end
end
