# Reference
# https://ifrnead.github.io/rubynapratica/contents/programacao_estruturada/arrays.html
# https://dev.to/shahershamroukh/working-with-folders-files-in-ruby-2l97
# https://www.youtube.com/watch?v=W5C1PKODOgU
# https://www.rubyguides.com/2015/05/working-with-files-ruby/
# https://medium.com/codex/ruby-classes-objects-methods-4568b9f443d7

require_relative "person.rb"

def get_list()
    list = []
    list << ["firstname", "lastname", "email", "password"]
    list << ["John", "Doe", "john.doe@domain.com", "1234"]
    list << ["Jane", "Doe", "jane.doe@domain.com", "4321"]

    return list
end

def write_file()
    list = get_list()

    text = render_text(list)     

    file = File.open("database.csv", "w")
    file.write(text)
    file.close # [IMPORTANT!!!] close the file after write
end

def render_text(list)
    text = ""
    for item in list
        fist_name = item[0]
        last_name = item[1]
        email = item[2]
        password = item[3]

        text << fist_name + "," 
        text << last_name + "," 
        text << email + "," 
        text << password + "\r\n" # insert new line
        
        # jump to next line (another version)
        #text << password
        #text <<- ""
    end
    return text
end

def read_file()
    file = File.open("database.csv", "r")
    
    list_array = []
    list_object = []
    file.readlines.each.with_index do |line,index|
        puts index.to_s + ": " + line # print line with index number
        convert_into_data(list_array, line) # convert line and insert into array
        convert_into_object(list_object, line) # convert line in object and insert into array
    end
    file.close # [IMPORTANT!!!] close the file after read
    
    puts " " # print with space
    puts list_array.to_s # print array in string format
    
    puts " " # print with space
    puts list_object.to_s # print array object in string format

    puts " " # print with space
    puts "full name is: " + list_object[1].get_fullname # print second object in array with fullname (John Doe)
end

def convert_into_data(list, line)
    line.sub! "\r\n", "" # remove special character
    data = line.split(/,/) # convert into array
    list << data # insert array data into array list
end

def convert_into_object(list, line)
    line.sub! "\r\n", "" # remove special character
    data = line.split(/,/) # convert into array

    person = Person.new()
    person.firstname = data[0]
    person.lastname = data[1]
    person.email = data[2]
    person.password = data[3]
    
    list << person # insert array data into array list
end

write_file()
read_file()