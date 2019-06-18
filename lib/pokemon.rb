class Pokemon

    attr_accessor :id, :name, :type, :db
    def initialize(id: , name:, type:, db: nil)
        @id = id 
        @name = name 
        @type = type 
        @db = db 
    end

    def self.save(name, type, db)
        sql = <<-SQL
            INSERT INTO pokemon (name, type)
            VALUES (?, ?)
        SQL

        db.execute(sql, name, type)
    end

    def self.find(idnum, db)

        sql = <<-SQL
            SELECT * FROM pokemon
            WHERE id = ?
        SQL

        x=db.execute(sql, idnum)
        Pokemon.new(id: x[0][0], name: x[0][1], type: x[0][2], db: db)
    end
end
