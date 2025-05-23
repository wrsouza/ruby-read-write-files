class Person
    attr_accessor :firstname, :lastname, :email, :password

    def get_fullname
        return self.firstname + " " + self.lastname
    end
end