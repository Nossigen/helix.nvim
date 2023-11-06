local function create_range_patern(from, to)
  return {
    type = 'r',
    from = from,
    to = to
  }
end

local function create_char_patern(char)
  return {
    type = 'c',
    char = char
  }
end

local function create_isalpha_patern()
  return create_range_patern(97, 122)
end
local function create_isalpha_upper_patern()
  return create_range_patern(65, 90)
end


local function get_paterns()
	local iskeyword = vim.opt_local.iskeyword:get()
  local paterns = {}

	for i = 1, #iskeyword do
			local from, to = string.match(iskeyword[i], "(%d+)-(%d+)")
      -- Range patern
			if from and to then
        table.insert(paterns, create_range_patern(tonumber(from), tonumber(to)))
      -- Special keyword meaning all letters
      elseif iskeyword[i] == '@' then
        table.insert(paterns, create_isalpha_patern())
        table.insert(paterns, create_isalpha_upper_patern())
      -- Character patern
			else
        table.insert(paterns, create_char_patern(iskeyword[i]))
			end
  end
  return paterns
end

return function(char)
  local paterns = get_paterns()
  local char_byte = string.byte(char)

  for i = 1, #paterns do
    if paterns[i].type == 'c' and paterns[i].char == char then
      return true
    end
    if paterns[i].type == 'r' then
      if char_byte >= paterns[i].from and char_byte <= paterns[i].to then
        return true
      end
    end
  end

  return false
end
