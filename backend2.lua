--backend2.lua
--2020 Rygel Dagenais
--this time, i'll get it right

empty_game = {
	board = {},
	pieces = {},
	tomove = 'none',
	ep_square = 'none',
	history = {}
}

empty_piece = {
	type = 'empty',
	set = 'defaults',
	position = {
		x = nil,
		y = nil
	},
	movefunc = nil,
	has_moved = false,
	letters = {
		none = '?'
	},
	symbols = {
		none = '?'
	},
	on_board = false,
	royal = false,
	owner = 'none',
	id = nil
}


function get_item(game,coords)
	return game.pieces[game.board[gcds(coords)]]
end

function gcds(coords)
	return 'x' .. tostring(coords['x']) .. 'y' .. tostring(coords['y'])
end

function algeb(coords)
	local ret = 'abcdefghijklmnopqrstuvwxyz'
	ret = ret:sub(coords.x,coords.x)
	return ret .. tostring(coords.y)
end

function alg_coords(algebraic)
	--not implemented
end

function inv_gcds(cds)
	local coords = {}
	for x,y in cds:gmatch('x(%d+)y(%d+)') do
		coords['x'] = tonumber(x)
		coords['y'] = tonumber(y)
	end
	return coords
end

function get_sq(game,coords,tomove)
	local tomove = tomove or game.twomove
	local square = get_item(game,coords)
	if square.owner == twomove then
		return 'own_piece'
	elseif square.owner == nil then
		return 'empty_square'
	else
		return 'enemy_piece'
	end
end

function new_piece(game,data)
	local piece = {}
	for k,v in pairs(empty_piece) do
		piece[k] = v
	end
	for k,v in pairs(data) do
		piece[k] = v
	end
	table.insert(game.pieces,piece)
	if piece['id'] == nil then
		piece['id'] = #game.pieces
	end
	if piece['on_board'] == true then
		local a = get_item(game,piece['position'])
		if a ~= nil then
			a[onboard] = false
		end
		game.board[gcds(piece['position'])] = piece['id']
	end
	return piece.id
end

function move_piece(game,piece_id,target_square)
	local f_game = copy_table(game)
	local sq = get_item(f_game,target_square)
	if sq ~= nil then
		sq.onboard = false
	end
	local sq1 = gcds(game.board[piece_id])
	--not done
end

function in_check(game)
	
end


function new_game()

end

function copy_table(table1)
	local table2 = {}
	for k,v in pairs(table1) do
		table2[k] = v
	end
	return table2
end

function replace_char(pos, str, r) --borrowed from stackoverflow question 5249629
    return str:sub(1, pos-1) .. r .. str:sub(pos+1)
end



function to_spb(game) --this is to interface (temporarly) with board.lua, possibly the worst program i've ever written
	local spb = '----------------------------------------------------------------'
	for k,x in pairs(game.board) do
		local v = game.pieces[x]
		local g = inv_gcds(k)
		print(k,g.x + (8 * (8 - g.y)))
		spb = replace_char(g.x + (8 * (8 - g.y)),spb,v.letters[v.owner or 'none'])
	end
	return spb
end


return {to_spb=to_spb,copy_table=copy_table,new_piece=new_piece}