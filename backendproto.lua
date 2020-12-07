--Rygel's Prototype Chess Backend

function s_leap(sq,bo,le) --{vertical,horizontal}
  local z = {}
  local y = {{le[1],le[2]},{le[1],-le[2]},{-le[1],le[2]},{-le[1],-le[2]}}
  for i=1,4 do
    local b = {sq[1]+y[i][1],sq[2]+y[i][2]}
    if sib(b,bo) then
      table.insert(z,b)
    end
    local c = {b[2],b[1]}
    if sib(c,bo) then
      table.insert(z,c)
    end
  end
  return unique(z)
end
function sib(sq,bo)
  return in_bounds(sq[1],sq[2],bo[1],bo[2])
end
function in_bounds(x,y,bx,by)
  if x < 1 or x > bx or y < 1 or y > bx then
    return false
  else
    return true
  end
end



function both(c1,c2)
  local c3 = {}
  for i=1,#c1 do
    table.insert(c3,c1[i])
  end
  for i=1,#c2 do
    table.insert(c3,c2[i])
  end
end
function s_lide(sq,bo,le) --{vertical,horizontal}  bishop: 
  
end

function unique(test)
  local hash = {}
  local res = {}
  for _,v in ipairs(test) do
    if (not hash[v]) then
        res[#res+1] = v
        hash[v] = true
    end
  end
  return res
end

function passsss()
--[[
knight: s_leap(<square>,{8,8},{1,2})
bishop: s_lide(<square>,{8,8},{1,1})
]]--
end

