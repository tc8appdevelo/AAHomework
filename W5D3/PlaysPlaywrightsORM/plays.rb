require 'sqlite3'
require 'singleton'

class PlayDBConnection < SQLite3::Database
  include Singleton

  def initialize
    super('plays.db')
    self.type_translation = true
    self.results_as_hash = true
  end
end

class Play
  attr_accessor :id, :title, :year, :playwright_id

  def self.all
    data = PlayDBConnection.instance.execute("SELECT * FROM plays")
    data.map { |datum| Play.new(datum) }
  end

  def initialize(options)
    @id = options['id']
    @title = options['title']
    @year = options['year']
    @playwright_id = options['playwright_id']
  end

  def create
    raise "#{self} already in database" if self.id
    PlayDBConnection.instance.execute(<<-SQL, self.title, self.year, self.playwright_id)
      INSERT INTO
        plays (title, year, playwright_id)
      VALUES
        (?, ?, ?)
    SQL
    self.id = PlayDBConnection.instance.last_insert_row_id
  end

  def update
    raise "#{self} not in database" unless self.id
    PlayDBConnection.instance.execute(<<-SQL, self.title, self.year, self.playwright_id, self.id)
      UPDATE
        plays
      SET
        title = ?, year = ?, playwright_id = ?
      WHERE
        id = ?
    SQL
  end

  def self.find_by_title(title)
    play = PlayDBConnection.instance.execute(<<-SQL, title)
      SELECT *
      FROM plays
      WHERE title = ?
    SQL
    Play.new(play.first)
  end

  def self.find_by_playwright(name)
    play = PlayDBConnection.instance.execute(<<-SQL, name)
      SELECT *
      FROM plays
      WHERE id IN (SELECT id FROM playwrights WHERE name = ?)
    SQL
    # not sure why this next line is here, I think before it was returning
    # the same value wrapped in an array.  But also not sure why you want .first
    # If there were more than one plays by the playwright you may want all of them.
    Play.new(play.first)
  end
end


class Playwright
  attr_accessor :id, :name, :birth_year
  def self.all
    data = PlayDBConnection.instance.execute("SELECT * FROM playwrights")
    data.map { |datum| Playwright.new(datum) }
  end

  def self.find_by_name(name)
    playwright = PlayDBConnection.instance.execute(<<-SQL, name)
      SELECT *
      FROM playwrights
      WHERE name = ?
    SQL
    Playwright.new(playwright.first) # not sure why .first, might want more than one of them in other situations.
  end

  def initialize(options)
    @id = options['id']
    @name = options['name']
    @birth_year  = options['birth_year']
  end

  def create
    raise "#{self} already in database" if self.id
    PlayDBConnection.instance.execute(<<-SQL, self.name, self.birth_year)
      INSERT INTO playwrights (name, birth_year)
      VALUES (?, ?)
    SQL
    self.id = PlayDBConnection.instance.last_insert_row_id
  end

  def update
    raise "#{self} not in database" unless self.id
    PlayDBConnection.instance.execute(<<-SQL, self.name, self.birth_year, self.id)
      UPDATE playwrights
      SET name = ?, birth_year = ?
      WHERE id = ?
    SQL
  end

  def get_plays
    PlayDBConnection.instance.execute(<<-SQL, self.id)
      SELECT *
      FROM plays
      WHERE playwright_id = ?
    SQL
  end

end
