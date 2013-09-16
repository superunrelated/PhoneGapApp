module.exports = class SoundService

	SOUNDS:
		global:
			off:													'sound_off' #
			on:														'sound_on' #
			click:												'btnClick'
			showGameOver:									'showGameOverView' #

		quiz:
			show:													'showQuizView' #
			question:											'quizQuestion' #
			correct:											'quizCorrect' #
			wrong:												'quizWrong' #

		carpenter:		
			showIntro:										'startSnekkerLoader' #
			hideIntro:										'endSnekkerLoader' #
			showGame:											'showSnekkerView' #
			hideGame:											'snekkerGameEnd' #
			click:												'snekkerScrewClick' #
			rotate:												'snekkerScrewRotate' #
			rotateDone:										'snekkerScrewDone' #
			tap:													'snekkerNailHit' #
			tapDone:											'snekkerNailDone' #

		welder:		
			showIntro:										'startSveiseLoader' #
			hideIntro:										'endSveiseLoader' #
			showGame:											'showSveiseView' #
			hideGame:											'sveiseGameEnd' #
			click:												'sveiseGameClick'
			section:											'sveiseGameWeld' #
			complete:											'sveiseGameWeldCompleted' #
			activate:											'sveiseGameWeldActivate' #
			deactivate:										'sveiseGameWeldDeactivate' #

		plumber:
			showIntro:										'startRorleggerLoader' #
			hideIntro:										'endRorleggerLoader' #
			showGame:											'showRorleggerView' #
			hideGame:											'rorleggerGameEnd' #
			click:												'rorleggerGameTapeClick'
			drop:													'rorleggerGameDropAdd' #
			fall:													'rorleggerGameDropFall' #
			attatch:											'rorleggerGameTapeAttach' #
			complete:											'roreleggerGameFixed' #

		tiler:
			showIntro:										'startFliseleggerLoader' #
			hideIntro:										'endFliseleggerLoader' #
			showGame:											'showFliseleggerView' #
			hideGame:											'fliseleggerGameEnd' #
			swish:												'fliseleggerGameSwish' #
			snap:													'fliseleggerGameSnap' #
			crack:												'fliseleggerGameCrack' #

		sawninja:
			showIntro:										'startSagLoader' #
			hideIntro:										'endSagLoader' #
			showGame:											'showSagView' #
			hideGame:											'savGameEnd' #
			click:												'savGameClick'
			section:											'savGameCut' #
			complete:											'savGameDetach' #




	constructor: () ->
		# This is handled before this game is implemented.
		# dmaf.init("bundles/finnhome/dmaf.finn/").ready(@init)

	init: () =>
		log("dmaf:", dmaf)

	on: () =>
		dmaf.tell(@SOUNDS.global.on)

	off: () =>
		dmaf.tell(@SOUNDS.global.off)

	play: (cat, id) =>
		@playId(@SOUNDS[cat][id])

	playId: (id) =>
		if id and @hasId(id)
			dmaf.tell(id)
			# log('SOUND ID FOUND:', id)
		else
			dmaf.tell('test')
			log('SOUND ID NOT FOUND:', id)

	hasId: (id) =>
		for key, group of @SOUNDS
			for k, n of group
				if id is n
					return true
		return false


# The following public methods are available. 
# dmaf.init(path);
# 	path: string, path to dmaf's project directory

# dmaf.tell(eventName, [eventProperties]);
# 	eventName: string, name of the event 
# 	eventPropeties: object, optional additional data to include with the event (mouse.x,y for example);

# dmaf.addEventListener(eventName, handler);
# 	eventName: string, name of the event 
# 	hander: function, function to be executed when the event occurs. 	
	
# dmaf.once(eventName, handler);
# 	Same as addEventListener, only the handler will only be fired once.

# dmaf.removeEventListener(eventName, handler);
# 	eventName: string, name of the event 
# 	hander: function, handler to be removed

# dmaf.registerObject(id, object);
# 	id: string, a unique identifier for the object to be registered.
# 	object: object, a javascript object to be stored with dmaf

# dmaf.unregisterObject(id);
# 	id: string, id of the object to remove from dmaf's registry

# dmaf.ready(handler);
# 	handler: function, function to be executed when dmaf has loaded all assets and is ready to play sounds.

# dmaf.fail(handler);
# 	hanlder: function, function to be executed if dmaf fails to load.
