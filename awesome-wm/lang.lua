require "awful"
require "naughty"

-- PRIVATE

local lang = {}

local NOTIFY_SCREEN = mouse.screen

local lang_list = {"us", "lt"}
local curr_lang = 1


-- PUBLIC


function lang.switch()
	curr_lang = curr_lang + 1
	if curr_lang > #lang_list then
		curr_lang = 1
	end

	local lang_name = lang_list[curr_lang]
	awful.util.spawn_with_shell("setxkbmap " .. lang_name)
	naughty.notify({title = 'Keyboard language switched',
		text = lang_name,
		timeout = 5, screen = NOTIFY_SCREEN})
end


return lang
