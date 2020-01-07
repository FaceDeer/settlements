-- uses simple markov chain generator
local MAXGEN = 100
local NOWORD = "\n"

-- values taken from default's craftitems.lua
local max_text_size = 10000
local max_title_size = 80
local short_title_size = 35
local lpp = 14

function allwords(source_text)
	local file = io.open(source_text, "r")
	if not file then
		return
	end
    local line = file:read()
    local pos = 1
    return function()
        while line do
            local s, e = string.find(line, "%w+", pos)
            if s then
                pos = e + 1
                return string.sub(line, s, e)
            else
                line = file:read()
                pos = 1
				return NOWORD
            end
        end
		file:close()
        return nil
    end
end

function prefix(w1, w2)
    return w1 .. " " .. w2
end

local statetabs = {}

function insert(source_text, index, value)
	local statetab = statetabs[source_text] or {}
	statetabs[source_text] = statetab
    local list = statetab[index]
    if list == nil then
        statetab[index] = {value}
    else
        list[#list+1] = value
    end
end

-- build table
local build_table = function(source_text)
	if statetabs[source_text] then
		return
	end
	local w1, w2 = NOWORD, NOWORD
	for w in allwords(source_text) do
		insert(source_text, prefix(w1, w2), w)
		w1, w2 = w2, w
		if w == NOWORD then
			w1 = NOWORD -- mark the next word as the beginning of a line
		end
	end
end

settlements.generate_line = function(source_text, maxgen)
	maxgen = maxgen or MAXGEN

	build_table(source_text)
	local statetab = statetabs[source_text]

	-- generate text
	local w1, w2 = NOWORD, NOWORD
	local text_table = {}
	for i = 1, maxgen do
		local list = statetab[prefix(w1, w2)]
	
		-- choose random item from list
		local r = math.random(#list)
		local nextword = list[r]
		if nextword == NOWORD then
			break
		end
		table.insert(text_table, nextword)
		w1, w2 = w2, nextword
	end
	
	return table.concat(text_table, " ")
end

settlements.generate_book = function(source_text, title, owner)
	local text_table = {}
	for i = 1, math.random(3,15) do
		table.insert(text_table, settlements.generate_line(source_text))
	end
	local text = table.concat(text_table, ".\n\n")
	
	local book = ItemStack("default:book_written")
	local meta = book:get_meta()
	
	meta:set_string("title", title:sub(1, max_title_size))
	meta:set_string("owner", owner)
	local short_title = title
	-- Don't bother trimming the title if the trailing dots would make it longer
	if #short_title > short_title_size + 3 then
		short_title = short_title:sub(1, short_title_size) .. "..."
	end
	meta:set_string("description", short_title .. " by " .. owner)
	text = text:sub(1, max_text_size)
	text = text:gsub("\r\n", "\n"):gsub("\r", "\n")
	meta:set_string("text", text)
	meta:set_int("page", 1)
	meta:set_int("page_max", math.ceil((#text:gsub("[^\n]", "") + 1) / lpp))
	
	return book
end