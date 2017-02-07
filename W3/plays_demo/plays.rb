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
  attr_accessor :title, :year, :playwright_id

  def self.all
    data = PlayDBConnection.instance.execute("SELECT * FROM plays")
    data.map { |datum| Play.new(datum) }
  end

  def self.find_by_title(title)
    data = PlayDBConnection.instance.execute(<<-SQL, title)
      SELECT
        *
      FROM
        plays
      WHERE
        plays.title Like ?
    SQL
    data
  end

  #(returns all plays written by playwright)
  def self.find_by_playwright(name)
    playwright = Playwright.find_by_name(name)
    raise "#{name} is not in the database" unless playwright
    data = PlayDBConnection.instance.execute(<<-SQL, playwright.id)
            SELECT
              *
            FROM
              plays
            WHERE
              playwright_id = ?
          SQL
    data
  end

  def initialize(options)
    @id = options['id']
    @title = options['title']
    @year = options['year']
    @playwright_id = options['playwright_id']
  end

  def create
    raise "#{self} already in database" if @id
    PlayDBConnection.instance.execute(<<-SQL, @title, @year, @playwright_id)
      INSERT INTO
        plays (title, year, playwright_id)
      VALUES
        (?, ?, ?)
    SQL
    @id = PlayDBConnection.instance.last_insert_row_id
  end

  def update
    raise "#{self} not in database" unless @id
    PlayDBConnection.instance.execute(<<-SQL, @title, @year, @playwright_id, @id)
      UPDATE
        plays
      SET
        title = ?, year = ?, playwright_id = ?
      WHERE
        id = ?
    SQL
  end
end

class Playwright
  attr_accessor :name, :id

  def self.all
    data = PlayDBConnection.instance.execute("SELECT * FROM playwright")
    data.map { |datum| Playwright.new(datum) }
  end

  def self.find_by_name(name)
    data = PlayDBConnection.instance.execute(<<-SQL, name)
      SELECT
        *
      FROM
        playwright
      WHERE
        playwright.name Like ?
    SQL

    return nil unless data

    Playwright.new(data.first)
  end

  def initialize(options)
    @name = options['name']
    @id = options['id']
  end

  def create
    raise "#{self} already in database" if @id
    PlayDBConnection.instance.execute(<<-SQL, @id, @name)
      INSERT INTO
        playwright (id, name)
      VALUES
        (?, ?)
    SQL
    @id = PlayDBConnection.instance.last_insert_row_id
  end

  def update
    raise "#{self} not in database" unless @id
    PlayDBConnection.instance.execute(<<-SQL, @name, @id)
      UPDATE
        playwright
      SET
        name = ?
      WHERE
        id = ?
    SQL
  end

  def get_plays  #(returns all plays written by playwright)
    raise "#{self} not in database" unless @id
    PlayDBConnection.instance.execute(<<-SQL, @id)
      SELECT
        playwright
      FROM
        plays
      WHERE
        playwright_id = ?
      SQL
  end
end
