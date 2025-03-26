function room_main(object)

	object.onCreate = function(args)
		m.game.createInstance("pause_handler")
		m.game.createInstance("score_handler")
		m.game.createInstance("player")
		m.game.createInstance("computer")
		m.game_started = false
		m.ball_spawn_timer = CreateObject("roTimespan")
		m.ball_direction = -1
		m.ball = invalid
		m.addLabel("press_ok", {
			color: &hffffff
			fontSize: 50
			fontName: "default"
			x: 640, y: 350
            align: "center"
			text: "Press OK To Play"
			enabled: false
		})
	end function

	object.onUpdate = function(dt)
		m.labelsAA["press_ok"].enabled = not m.game_started
		if m.game_started and m.ball = invalid and m.ball_spawn_timer.TotalMilliseconds() > 1000
			m.ball = m.game.createInstance("ball", {direction: m.ball_direction})
		end if
	end function

	object.onDrawBegin = function(canvas)
		canvas.DrawRect(0, 0, 1280, 50, &hFFFFFFFF)
		canvas.DrawRect(0, 720-50, 1280, 50, &hFFFFFFFF)
	end function

	object.onButton = function(button)
		if button = buttonCodes("back")
			m.game.End()
		end if
		if not m.game_started and button = buttonCodes("ok")
			m.game_started = true
			return true
		end if
		return false
	end function

	object.onGameEvent = function(event as string, data as object)
		if event = "score"
			if data.team = 0
				m.ball_direction = -1
			else
				m.ball_direction = 1
			end if
			m.ball = invalid
			m.ball_spawn_timer.Mark()
		end if
	end function

end function