require_relative('models/bounty.rb')

cargo_hash1 = { 'name' => 'Jaba', 'species' => 'Hutt', 'bounty_value' => 50000,
'homeworld' => 'Tatooine' }
cargo1 = Bounty.new( cargo_hash1 )
cargo_hash2 = { 'name' => 'Matthew', 'species' => 'Hutt', 'bounty_value' => 50000,
'homeworld' => 'Tatooine' }
cargo2 = Bounty.new( cargo_hash2 )

cargo1.save()
cargo2.save()


p cargo1
puts ""
p cargo2
puts ""

all_cargo = Bounty.all()
p all_cargo
puts ""

first_catch = all_cargo.first
first_catch.name = "Bobo"
first_catch.update()

p Bounty.all()
puts ""

first_catch.delete()

p Bounty.all()
puts ""

Bounty.delete_all()

p Bounty.all()
