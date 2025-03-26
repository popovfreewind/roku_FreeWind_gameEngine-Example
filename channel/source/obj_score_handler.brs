function obj_score_handler(object)

    object.scores = {
        player: 0
        computer: 0
    }

    object.onCreate = function(args)
		m.addLabel("player_score", {
			color: &hffffff
			fontSize: 50
			fontName: "default"
			x: 440, y: 100
            align: "center"
            text: "0"
		})
		m.addLabel("computer_score", {
			color: &hffffff
			fontSize: 50
			fontName: "default"
			x: 840, y: 100
            align: "center"
            text: "0"
		})
    end function

    object.onGameEvent = function(event as string, data as object)
        if event = "score"
            if data.team = 0
                m.scores.player++
                m.labelsAA["player_score"].text = m.scores.player.ToStr()
            else
                m.scores.computer++
                m.labelsAA["computer_score"].text = m.scores.computer.ToStr()
            end if
        end if
    end function

end function