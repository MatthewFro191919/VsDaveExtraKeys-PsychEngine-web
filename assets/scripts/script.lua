--funni script
local kadeUI = false

function onUpdate(elapsed)
  if kadeUI then

    scaleObject('green', 1.965 * getProperty("songPercent"), .035)

    if downscroll then -- downscroll only
        setProperty('black.y', 685)
        setProperty('gray.y', 690)
        setProperty('green.y', 690)
        setProperty('timeTxt.y', 680)
    end
  end
end

function onUpdatePost()
  if kadeUI then
    setTextString('timeTxt', songName)

	  local ratingString = ''
	  if ratingFC == 'SFC' then
	  	ratingString = '(MFC) AAAA:'
	  elseif ratingFC == 'GFC' then
	  	ratingString = '(GFC) AAA:'
	  elseif ratingFC == 'FC' then
	  	ratingString = '(FC) AA:'
	  else
	  	ratingString = '(SDCB) A:'
	  end
	  if hits < 1 and misses < 1 then
	  	setProperty('scoreTxt.text', 'Score: 0 | Combo Breaks: 0 | Accuracy: 0% | N/A')
	  else
	  	setProperty('scoreTxt.text', 'Score: '..score..' | Combo Breaks: '..misses..' | Accuracy: '..math.floor(rating * 10000) / 100 ..'% | '..ratingString)
	  end
  end
end

function onEvent(name, value1, value2)
  if name == 'Change Character' and kadeUI then
    setHealthBarColors('FF0000', '00FF00');
  end
end

function onCreate()
  if songName == 'Supernovae-old' or songName == 'Glitch-old' then
    kadeUI = true
  end
  if kadeUI then
    makeLuaSprite('black', 'black', 297.5, 20)
    makeLuaSprite('gray', 'gray', 303, 25.25)
    makeLuaSprite('green', 'greenreal', 303, 25.25)
    
    addLuaSprite('black', true)
    addLuaSprite('gray', true)
    addLuaSprite('green', true)
    
    setObjectCamera('black', 'hud')
    setObjectCamera('gray', 'hud')
    setObjectCamera('green', 'hud')
    
    scaleObject('black', 2, .065)
    scaleObject('gray', 1.965, .035)
    scaleObject('green', 1.965, .035)

    setProperty('black.alpha', 0)
    setProperty('gray.alpha', 0)
    setProperty('green.alpha', 0)
    setProperty('dad.antialiasing', false)
  end
end

function onCreatePost()
  if kadeUI then
    setTextFont('scoreTxt', 'vcr.ttf')
    setTextFont('timeTxt', 'vcr.ttf')
    setHealthBarColors('FF0000', '00FF00');
    makeLuaSprite('healthbaralt2','ui/fnfengine',getProperty('healthBarBG.x'),getProperty('healthBarBG.y'))
	  addLuaSprite('healthbaralt2')
	  setObjectCamera('healthbaralt2','hud')
	  setObjectOrder('healthbaralt2',getObjectOrder('healthBar')-1)

    setProperty("healthbaralt.visible", false)

    setProperty('songComposerText.alpha', 0)
    setProperty('creditsIcon.alpha', 0)
    setProperty('heading.alpha', 0)
    setTextSize('scoreTxt', 16)
    setTextSize('timeTxt', 24)
    setProperty('timeTxt.y', 15)
    for i = 0, getProperty('unspawnNotes.length')-1 do
      setPropertyFromGroup('unspawnNotes', i, 'noteSplashDisabled', true);
    end
  end
end

function onSongStart()
  if kadeUI then
    setProperty('gray.alpha', 1)
    setProperty('green.alpha', 1)
    setProperty('black.alpha', 1)
  end
end