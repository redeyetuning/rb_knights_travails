
#Assignment
#Your task is to build a function knight_moves that shows the simplest possible way to get from one square to another by outputting all squares the knight will stop on along the way.

#You can think of the board as having 2-dimensional coordinates. Your function would therefore look like:

#knight_moves([0,0],[1,2]) == [[0,0],[1,2]]
#knight_moves([0,0],[3,3]) == [[0,0],[1,2],[3,3]]
#knight_moves([3,3],[0,0]) == [[3,3],[1,2],[0,0]]
#Put together a script that creates a game board and a knight.
#Treat all possible moves the knight could make as children in a tree. Don’t allow any moves to go off the board.
#Decide which search algorithm is best to use for this case. Hint: one of them could be a potentially infinite series.
#Use the chosen search algorithm to find the shortest path between the starting square (or node) and the ending square. Output what that full path looks like, e.g.:
#> knight_moves([3,3],[4,3])
# => You made it in 3 moves!  Heres your path:
#   [3,3]
#  [4,5]
# [2,4]
#[4,3]
class Move
	attr_accessor :coord, :links 

	def initialize coord, links= nil
		@coord = coord 
		@links = moves(coord)
	end

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

class Board

	attr_accessor :squares

	# Polulates the @squares hash with 64 squares named 1A-8H, each containing a Move object.
	def generate_squares
		i=0
		#square_names = [*("a".."h")].product([*("1".."8")]).map{|x, y| x+y} 
		square_coords = [*1..8].repeated_permutation(2).to_a
		@squares = {}
		while i < 64 do 
			@squares[square_coords[i]] = Move.new square_coords[i] 
			i += 1
		end
		puts @squares
	end


		

	def create_move_tree srt_coord, end_coord

	end

end



