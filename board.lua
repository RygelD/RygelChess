--board.lua
--2020 Rygel Dagenais
--it is awful

pieces = {'♔','♚','♕','♛','♖','♜','♗','♝','♘','♞','♙','♟','empty '}
piecel = {'K','k','Q','q','R','r','B','b','N','n','P','p','-'}

spacers = {'1','2','3','4','5','6','7','8'}

chb = '45'
chw = '47'

function print_board(spb)
  local npb = m_npb(spb)
  local board={}
  for word in npb:gmatch("[\33-\127\192-\255]+[\128-\191]*") do
    table.insert(board,word)
  end
  local ticker = 0
  local blacks = false
  for i = 1,#board do
    if blacks then
      io.write('\27[1;'..chb..'m')
      blacks = false
    else
      io.write('\27[1;'..chw..'m')
      blacks = true
    end
    if board[i] ~= 'empty' then
      io.write(board[i]..' ')
    else
      io.write('  ')
    end
    ticker = ticker + 1
    if ticker == 8 then
      io.write('\27[0m\n')
      ticker = 0
      blacks = not blacks
    end
  end
  io.write('\27[0m\n')
end

function m_npb(spb)
  local npb = spb
  for i = 1,#pieces do
    npb = npb:gsub(piecel[i],pieces[i])
  end
  return npb
end

function split(source, sep)
    local result, i = {}, 1
    while true do
        local a, b = source:find(sep)
        if not a then break end
        local candidat = source:sub(1, a - 1)
        if candidat ~= "" then 
            result[i] = candidat
        end i=i+1
        source = source:sub(b + 1)
    end
    if source ~= "" then 
        result[i] = source
    end
    return result
end

function fen_spb(fen)
  local fens = split(fen,' ')
  local st = ''
  local str = "text"
  local t = {}
  for i = 1, #fens[1] do
    t[i] = fens[1]:sub(i, i)
  end
  for i = 1,#t do
    local j = t[i]
    if j == '/' then
      st = st
    elseif j == '1' then
      st = st .. '-'
    elseif j == '2' then
      st = st .. '--'
    elseif j == '3' then
      st = st .. '---'
    elseif j == '4' then
      st = st .. '----'
    elseif j == '5' then
      st = st .. '-----'
    elseif j == '6' then
      st = st .. '------'
    elseif j == '7' then
      st = st .. '-------'
    elseif j == '8' then
      st = st .. '--------'
    else
      st = st .. j
    end
  end
  return st
end

return {fen_spb=fen_spb,print_board=print_board}

--print_board(fen_spb('r4rk1/2p2ppp/5n2/6N1/5P2/2b1PK2/3q1q1P/8 w - - 0 37'))