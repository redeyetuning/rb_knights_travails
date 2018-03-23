# Helper class for Board. Creates individual objects for each Knights Move.
class Move
	attr_accessor :coord, :links, :parent

	def initialize coord, parent= nil
		@coord = coord 
		@links = moves(coord)
		@parent = parent
	end

	# For a given start coordinate sets the Moves @links with all posibble move combinations that stay within the 8x8 board.
	def moves coord
		links = []
		moves = [[-1,2],[-1,-2],[-2,1],[-2,-1],[1,2],[1,-2],[2,1],[2,-1]]
		moves.each do |x|
			if coord[0]+x[0] < 9 && coord[0]+x[0] > 0 && coord[1]+x[1] < 9 && coord[1]+x[1] > 0
				links <<[coord[0]+x[0],coord[1]+x[1]] 
			end
		end
	links
	end

end

# Main class following the path taken by a Knight's Moves
class Board
	# Calculates the shortest number of moves a chess Knight can take between the Strt and End Coordinates entered. Board coordinates are from [1,1] to [8,8].	
	def knight_moves strt_coord, end_coord
		return "Coordinates entered should be between [1,1] and [8,8]! Please try again."
		queue = [Move.new(strt_coord)]
		while queue.length >0
			current = queue.pop
			
			if current.links.include?(end_coord)
				trip = list_parents(current)
				puts "You made it in #{@moves} moves!\n\n"
				return "Your path was #{strt_coord} -> #{trip}#{end_coord}"				
			else 
				current.links.each{|link| queue.unshift(Move.new(link, current))}
			end
		
		end
	end

	# Creates a string of the moves taken to reach the end coordinate by using their @parent values.
	def list_parents move
		@moves = 1
		output = ""
		current = move
		until current.parent == nil
			output.insert(0, "#{current.coord} -> ")
			@moves += 1
			current = current.parent 
		end 
		output
	end

end




