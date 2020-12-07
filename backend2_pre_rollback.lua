
game = {
	board = {},
	pieces = {}
}

piece = {
	type = 'empty',
	position = {
		x = nil,
		y = nil},
	hasmoved = false,
	letters = {
		black = '?',
		white = '!'
	},
	onboard = false,
	owner = 'none',
	id = nil
}


function game:get_item(coords)
	return self.pieces[self.board[gcds(coords)]]
end

function gcds(coords)
	return 'x' .. tostring(coords['x']) .. 'y' .. tostring(coords['y'])
end

function game:new()
    ngame = {}
    setmetatable(nboard, self)
    self.__index = self
    return ngame
end




function game:new_piece(data)
	local npiece = {}
	for k,v in pairs(empty_piece) do
		npiece[k] = v
	end
	for k,v in pairs(data) do
		npiece[k] = v
	end
	table.insert(self.pieces,npiece)
	if npiece['id'] == nil then
		npiece['id'] = #game.pieces
	end
	if npiece['onboard'] == true then
		local a = get_item(game,npiece['position'])
		if a ~= nil then
			a[onboard] = false
		end
		game.board[gcds(npiece['position'])] = npiece['id']
	end
end

