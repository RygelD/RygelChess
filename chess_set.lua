--chess_set.lua
--2020 Rygel Dagenais
--standard chess pieces for backend2

local backend2 = require 'backend2'

pawn = {
	type = 'pawn',
	set = 'chess',
	letters = {
		black = 'p',
		white = 'P',
		none = '?'
	},
	symbols = {
		black = '♟',
		white = '♙',
		none = '?'
	}
}

knight = {
	type = 'knight',
	set = 'chess',
	letters = {
		black = 'n',
		white = 'N',
		none = '?'
	},
	symbols = {
		black = '♞',
		white = '♘',
		none = '?'
	}
}

bishop = {
	type = 'bishop',
	set = 'chess',
	letters = {
		black = 'b',
		white = 'B',
		none = '?'
	},
	symbols = {
		black = '♝',
		white = '♗',
		none = '?'
	}
}

rook = {
	type = 'rook',
	set = 'chess',
	letters = {
		black = 'r',
		white = 'R',
		none = '?'
	},
	symbols = {
		black = '♜',
		white = '♖',
		none = '?'
	}
}

queen = {
	type = 'queen',
	set = 'chess',
	letters = {
		black = 'q',
		white = 'Q',
		none = '?'
	},
	symbols = {
		black = '♛',
		white = '♕',
		none = '?'
	}
}

king = {
	type = 'king',
	set = 'chess',
	letters = {
		black = 'k',
		white = 'K',
		none = '?'
	},
	symbols = {
		black = '♚',
		white = '♔',
		none = '?'
	}
}

chess_pieces={pawn=pawn,knight=kinght,bishop=bishop,queen=queen,king=king}


local function pawn_move (game,piece_id)
	local piece = game.pieces[piece_id]
end

local function knight_move (game,piece_id)
	local piece = game.pieces[piece_id]
end

local function bishop_move (game,piece_id)
	local piece = game.pieces[piece_id]
end

local function rook_move (game,piece_id)
	local piece = game.pieces[piece_id]
end

local function queen_move (game,piece_id)
	local piece = game.pieces[piece_id]
end

local function king_move (game,piece_id)
	local piece = game.pieces[piece_id]
end

function add_piece(game,piece,colour,cds)
	npiece = backend2.copy_table(piece)
	npiece.owner = colour
	npiece.position = inv_gcds(cds)
	npiece.on_board = true
	npiece.has_moved = false
	backend2.new_piece(game,npiece)
end


function other_side(side)
	if side == 'black' then return 'white' elseif side == 'white' then return 'black' else return 'none' end
end

function start_position()
	local w = {
	board = {},
	pieces = {},
	tomove = 'white',
	ep_square = 'none',
	history = {}
	}
	for i = 1,8 do
		add_piece(w,pawn,'white','x' .. tostring(i) .. 'y2')
		add_piece(w,pawn,'black','x' .. tostring(i) .. 'y7')
	end
	local backrow = {rook,knight,bishop,queen,king,bishop,knight,rook}
	for i = 1,8 do
		add_piece(w,backrow[i],'white','x' .. tostring(i) .. 'y1')
		add_piece(w,backrow[i],'black','x' .. tostring(i) .. 'y8')
	end
	return w
end

return {start_position = start_position}