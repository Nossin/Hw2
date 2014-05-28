require 'spec_helper'
class Team

  
attr_reader :namet, :numofplayer

def initialize(name)
  @numofplayer = 0
  @array = []
  @namet = name 
  
end

def add_player(name, position)
@numofplayer = @numofplayer + 1
players = Player.new(name, position)
@array << players
end

def remove_Player(name)
  if @numofplayer = 0
     return nil
  elsif
    @numofplayer = @numofplayer - 1
   if @array.any?{|pl| pl.name == name}
   @array.delete_at(@array.find_index{|pl| pl.name == name})  
   end  
   end
end

def filter_by_position(position)
   if @array.any?{|pl| pl.position == position}
      return @array[@array.find_index{|pl| pl.position == position}]
   end
end

def To_s
puts "the Team @namet \n List of Players"
 for i in @array
   if @array[i]!= nil
     puts "@array[i].Output"
   end
 end
end
end

class Player
attr_reader :name,:position

def initialize(name,position)
    @name = name
    @position = position
end

def Output
    puts "Player.Name - Player.Position \n"
end
end

describe Team do
 
   describe "#namet" do
   it "should returm a team name" do
   team = Team.new "Noss"
   expect(team.namet).to eql("Noss")
   end
   end
   
   describe "#add_player" do
  
     it "should let add a new player" do
     team = Team.new "Noss"
     team.add_player("Nossin","3B")
     expect(team.numofplayer).to eql(1)
     end
   end
     
   describe "#remove_Player" do
    context "with the list of player with a least 1 player"do
    it "should remove Player " do
     team = Team.new "Noss"
     team.add_player("Nossin","3B")
     team.remove_Player("Nossin")
     expect(team.numofplayer).to eql(0)
     end
     end
     context "with the list of player empty"do
     it "should throw an error" do
     team = Team.new "Noss"
     expect{team.remove_Player? nil}.to raise_error
     end
     end
    end
    describe "#filter_by_position" do
    
     it "should Return a Player" do
     team = Team.new "Noss"
     team.add_player("Nossin","3B")
     expect(team.filter_by_position("3B")).is_a?(Player)
     end 
    end

end

