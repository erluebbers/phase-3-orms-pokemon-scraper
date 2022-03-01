class Pokemon
  attr_accessor :name, :type, :db
  attr_reader :id

  def initialize(id: nil, name:, type:, db:)
    @id = id
    @name = name
    @type = type
    @db = db
  end

  def save
    sql = <<-SQL
      INSERT INTO pokemon (name, type, @db)
      values (?, ?, ?)
    SQL
    DB[:conn].execute(sql, self.name, self.type, self.db)
    self.id = DB[:conn].execute("SELECT last_insert_rowid() FROM pokemon")[0][0]
  end


end
