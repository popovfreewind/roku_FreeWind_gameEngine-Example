function obj_player(object)

	object.x = 50
	object.y = invalid
	object.width = invalid
	object.height = invalid
	object.bounds = { top: 50, bottom: 720 - 50 }

	object.onCreate = function(args)
		m.y = m.game.getCanvas().GetHeight() / 2

		image = m.addRandomNameImage({ bitmapName: "paddle" })

		m.width = image.GetWidth()
		m.height = image.GetHeight()
		m.addColliderRectangle("front", m.width / 2 - 1, -m.height / 2, 1, m.height)
		m.addColliderRectangle("top", -m.width / 2, -m.height / 2, m.width, 1)
		m.addColliderRectangle("bottom", -m.width / 2, m.height / 2 - 1, m.width, 1)

		region = image.GetRegion()
		region.SetPretranslation(-m.width / 2, -m.height / 2)
	end function

	object.onUpdate = function(dt)
		if m.y < m.bounds.top + m.height / 2
			m.y = m.bounds.top + m.height / 2
			m.yspeed = 0
		end if
		if m.y > m.bounds.bottom - m.height / 2
			m.y = m.bounds.bottom - m.height / 2
			m.yspeed = 0
		end if
	end function

	object.onButton = function(code as integer)
		if code = buttonCodes("up")
			m.yspeed = -300
			return true
		else if code = buttonCodes("up", "released")
			m.yspeed = 0
			return true
		else if code = buttonCodes("down")
			m.yspeed = 300
			return true
		else if code = buttonCodes("down", "released")
			m.yspeed = 0
			return true
		end if

		return false
	end function

end function
