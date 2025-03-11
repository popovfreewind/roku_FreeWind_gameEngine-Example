sub Main()
	game = new_game(1280, 720, true) ' This initializes the game engine

	game.setResourcesConfig({
		bitmaps: {
			"ball": { localPath: "pkg:/sprites/ball.png" },
			"paddle": { localPath: "pkg:/sprites/paddle.png" }
		}
		sounds: {
			"hit": { localPath: "pkg:/sounds/hit.wav" },
			"score": { localPath: "pkg:/sounds/score.wav" }
		}
	})

	game.defineRoom("room_main", room_main)
	game.defineObject("ball", obj_ball)
	game.defineObject("player", obj_player)
	game.defineObject("computer", obj_computer)
	game.defineObject("pause_handler", obj_pause_handler)
	game.defineObject("score_handler", obj_score_handler)
	game.changeRoom("room_main")
	game.Play()
	if false then game.compositor.signalBeacon("AppLaunchComplete") ' need for certification only

end sub