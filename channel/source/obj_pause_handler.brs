function obj_pause_handler(object)

	object.onCreate = function(args)
		m.persistent = true
		m.pauseable = false
		m.addLabel("paused", {
			color: &hffffff
			fontSize: 50
			fontName: "default"
			x: 640, y: 350
			text: "Paused"
			enabled: false
		})
	end function

	object.onButton = function(code as integer)
		if code = 13 then
			if not m.game.isPaused() then
				m.labelsAA["press_ok"].enabled = true
				m.game.Pause()
			else
				m.labelsAA["press_ok"].enabled = false
				m.game.Resume()
			end if
			return true
		end if
		return false

		' -------Button Code Reference--------
		' Pressed | Released | Held

		' Back  0  100 1000
		' Up  2  102 1002
		' Down  3  103 1003
		' Left  4  104 1004
		' Right  5  105 1005
		' Select  6  106 1006
		' Instant Replay  7  107 1007
		' Rewind  8  108 1008
		' Fast  Forward  9  109 1009
		' Info  10  110 1010
		' Play  13  113 1013
	end function

end function
