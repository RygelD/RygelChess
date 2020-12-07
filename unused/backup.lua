pieces = {'♔','♚','♕','♛','♖','♜','♗','♝','♘','♞','♙','♟','empty '}
piecel = {'K','k','Q','q','R','r','B','b','N','n','P','p','-'}
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
  fens = split(fens[1],'/')
  local st = ''
  for i = 1,#fens do
    for j = 1,#i do
      if j == '1' then
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
        st = st .. i
      end
    end
  end
  return st
end

print_board('rnbqkbnrpppppppp--------------------------------PPPPPPPPRNBQKBNR')
