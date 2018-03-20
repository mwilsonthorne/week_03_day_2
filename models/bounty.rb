require('pg')

class Bounty

  attr_accessor :name, :species, :bounty_value, :homeworld
  attr_reader :id

  def initialize( cargo )
    @name = cargo['name']
    @species = cargo['species']
    @bounty_value = cargo['bounty_value']
    @homeworld = cargo['homeworld']
  end

  def save
    db = PG.connect( {dbname: 'bounty_hunter', host: 'localhost'} )

    cargo_sql = "
    INSERT INTO bountys
    (name, species, bounty_value, homeworld)
    VALUES
      ($1,$2,$3,$4)

    "
    haul = [@name, @species, @bounty_value, @homeworld]
    db.prepare("store_cargo", cargo_sql)
    db.exec_prepared("store_cargo", haul)

    db.close()
  end

  def update
    db = PG.connect ( {dbname: 'bounty_hunter', host: 'localhost'} )

    cargo_sql = "
    UPDATE bountys
    SET (name, species, bounty_value, homeworld)
    = ($1,$2,$3,$4)
    ;
    "

    haul = [@name, @species, @bounty_value, @homeworld]
    db.prepare("store_cargo", cargo_sql)
    db.exec_prepared("store_cargo", haul)

    db.close()

  end

  def delete

  db = PG.connect( { dbname: "bounty_hunter", host: "localhost" })

  cargo_sql = "
  DELETE FROM bountys
  WHERE id = $1
  ;
  "

  haul = [@id]
  db.prepare("delete", cargo_sql)
  db.exec_prepared("delete", haul)

  db.close()

  end

  def Bounty.all()
    db = PG.connect ( {dbname: 'bounty_hunter', host: 'localhost'} )

    cargo_sql = "SELECT * FROM bountys ORDER BY name;"
    db.prepare("get_all_cargo", cargo_sql)
    cargo = db.exec_prepared("get_all_cargo")

    db.close()

    bounty_cargo = cargo.map { |cargo_hash| Bounty.new(cargo_hash)}

    return bounty_cargo

  end
  #
  # def Bounty.remove_all()
  #   db - PG.connect ( {dbname: 'bounty_hunter', host: 'localhost'} )
  #
  #   cargo_sql = "DELETE FROM bountys;"
  #   db.prepare('del_all_cargo', cargo_sql)
  #   db.exec_prepared('del_all_cargo')
  #
  # end











end
