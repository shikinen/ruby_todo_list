require "csv"
# Classes

class List

	def initialize(list_name, file_type)
		@list_name = list_name.downcase
		@file_type = file_type.match(/txt|csv/i).to_s.downcase
		$dir_name = "todo lists"

		unless File.exists?($dir_name)
			Dir.mkdir($dir_name)
			puts "The todo list folder has been initialized. It is where your lists will be stored."
		end
		Dir.chdir(File.join("todo lists"))

		create_list(@list_name, @file_type)
	end

	def create_list(name="my_todo_list", type="txt")
		file_name = [name, type].join(".")

		if type == "csv"
			CSV.open(file_name, "w", col_sep: ";") do |list|
				file_title = (name.end_with?("list") ? name : name + " list").capitalize
				list << [file_title]
			end
		else
			File.open(file_name, "w") do |list|
				file_title = (name.end_with?("list") ? name : name + " list").capitalize
				list.write(file_title)
			end
		end
		puts "The list #{file_name} has been successfully created!"
	end

	def add_task
	end

	def show_tasks
	end

	def read_task
	end

	def write_list_to_file
	end

	def delete_task
	end

	def update_task
	end
end


class Task
	def create_task_item
	end
end

# actions

if __FILE__ == "list.rb"
	print "What do you want to call your todo list? "
	list_name = gets.chomp
	print "What file type would you like to choose? CSV or txt? "
	file_type = gets.chomp
	my_List = List.new(list_name, file_type)
	puts "You have created a new list"
end
