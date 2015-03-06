require("naughty")
require("timer")

-- notify every 20 minutes
local NOTIFY_TIME = 20 * 60
local NOTIFY_SCREEN = mouse.screen

local notify_timer

function prompt_notification()
	local notification

	function on_notification_click()
		if notification then
			naughty.destroy(notification)
		end
		notification = nil

		-- resume timer
		notify_timer:start()
	end

	-- stop notification timer until user click on a notification
	notify_timer:stop()

	notification = naughty.notify({title = 'Notification every 20 minutes',
		text = 'Time to take a short break from the monitor ;)',
		timeout = 0, screen = NOTIFY_SCREEN,
		run = on_notification_click})
end

notify_timer = timer({ timeout = NOTIFY_TIME })
notify_timer:add_signal("timeout", prompt_notification)
notify_timer:start()

