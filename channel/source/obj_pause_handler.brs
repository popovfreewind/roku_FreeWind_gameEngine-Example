function obj_pause_handler(object)

	object.onCreate = function(args)
		m.persistent = true
		m.pauseable = false
		m.addLabel("paused", {
			color: &hffffff
			fontSize: 50
			fontName: "default"
			x: 640, y: 350
			align: "center"
			text: "Paused"
			enabled: false
		})
	end function

	object.onButton = function(code as integer)
		if code = buttonCodes("Play")
			if not m.game.isPaused() then
				m.labelsAA["paused"].enabled = true
				m.game.Pause()
			else
				m.labelsAA["paused"].enabled = false
				m.game.Resume()
			end if
			return true
		end if
		return false
	end function

end function
