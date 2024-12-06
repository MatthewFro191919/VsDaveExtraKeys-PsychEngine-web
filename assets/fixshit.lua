--puts gh notes in correct places
strumShit = {'A', 'B', 'C', 'D', 'E'}
strumAnimReset = {0, 0, 0, 0, 0}
fuck = {false, false, false, false, false}
function onCreatePost()
  -- luaDebugMode = true
  for i = 0, getProperty('unspawnNotes.length')-1 do --set the textures
		if getPropertyFromGroup('unspawnNotes', i, 'strumTime') >= 76800 and getPropertyFromGroup('unspawnNotes', i, 'strumTime') < 96000 then
			setPropertyFromGroup('unspawnNotes', i, 'texture', 'notes/NOTE_gh')
		end
	end
  addHaxeLibrary('Std')
  addHaxeLibrary('Character')
  addHaxeLibrary('Boyfriend')
  
  makeLuaSprite('GHlinething', 'festival/shredder/ch_highway', 306, -309)
  setProperty('GHlinething.antialiasing', false)
  scaleObject('GHlinething', 1.3076171875, 1.3076171875)
  setObjectCamera('GHlinething', 'hud')
  setProperty('GHlinething.visible', false)
  addLuaSprite('GHlinething')
  --debugPrint('ok')
if boyfriendName == 'shaggy' then
runHaxeCode([[
    var smallBf = new Boyfriend(1047 - 135, 312 - 135, 'haggy');
    smallBf.cameras = [game.camHUD];
    smallBf.scale.set(0.45, 0.45);
    for(offset in smallBf.animOffsets)
    {
      offset[0] *= 0.45;
      offset[1] *= 0.45;
    }
    smallBf.alpha = 0;
    ////trace('small bf pos: ', smallBf.y += 100);
    smallBf.updateHitbox();
    smallBf.playAnim('idle', true);
    smallBf.skipDance = true;
    game.add(smallBf);
    game.modchartSprites.set('smallBf', smallBf);
]])
end
if boyfriendName == 'bf' then
  runHaxeCode([[
    var smallBf = new Boyfriend(1047 - 135, 312 - 135, 'bf');
    smallBf.cameras = [game.camHUD];
    smallBf.scale.set(0.45, 0.45);
    for(offset in smallBf.animOffsets)
    {
      offset[0] *= 0.45;
      offset[1] *= 0.45;
    }
    smallBf.alpha = 0;
    ////trace('small bf pos: ', smallBf.x, smallBf.y);
    smallBf.updateHitbox();
    smallBf.playAnim('idle', true);
    smallBf.skipDance = true;
    game.add(smallBf);
    game.modchartSprites.set('smallBf', smallBf);
]])
end
  runHaxeCode([[
    var smallBamb = new Character(90 - 90, 73 - 80, 'bambi-shredder');
    smallBamb.cameras = [game.camHUD];
    smallBamb.scale.set(0.55, 0.55);
    for(offset in smallBamb.animOffsets)
    {
      offset[0] *= 0.55;
      offset[1] *= 0.55;
    }
    smallBamb.alpha = 0;
    ////trace('small bamb pos: ', smallBamb.x, smallBamb.y);
    smallBamb.updateHitbox();
    smallBamb.playAnim('idle', true);
    smallBamb.skipDance = true;
    game.add(smallBamb);
    game.modchartSprites.set('smallBamb', smallBamb);
    //trace(smallBamb.animOffsets.get('singMIDDLE'));
  ]])
  
  makeLuaSprite('smallBfThing', 'festival/shredder/boyfriend_spot', getProperty('smallBf.x') + 70, getProperty('smallBf.y') + 200)
  setObjectCamera('smallBfThing', 'hud')
  setProperty('smallBfThing.alpha', 0)
  addLuaSprite('smallBfThing')
  
  makeLuaSprite('smallBambThing', 'festival/shredder/boyfriend_spot', getProperty('smallBamb.x') + 30, getProperty('smallBamb.y') + 165)
  setObjectCamera('smallBambThing', 'hud')
  setProperty('smallBambThing.alpha', 0)
  addLuaSprite('smallBambThing')
  
  for i=0,4 do
    local shitName = 'fakeStrum'..tostring(i)
    makeAnimatedLuaSprite(shitName, 'notes/NOTE_gh', 364 + (112*i), getPropertyFromGroup('strumLineNotes', 0, 'y'))
    addAnimationByPrefix(shitName, 'idle', strumShit[i+1]..' Strum', 24, false)
    addAnimationByPrefix(shitName, 'pressed', strumShit[i+1]..' Press', 24, false)
    addAnimationByPrefix(shitName, 'confirm', strumShit[i+1]..' Confirm', 24, false)
    scaleObject(shitName, 0.7, 0.7)
    setObjectCamera(shitName, 'hud')
    setProperty(shitName..'.visible', false)
    addLuaSprite(shitName)
  end
  runHaxeCode([[
    for(note in game.unspawnNotes)
    {
      if(note.strumTime >= 76800 && note.strumTime < 96000)
      {
        var oldData = note.noteData;
        var fuckinOffset = 0;
        if(!note.mustPress)
        {
          if(note.noteData == 2)
          {
            note.noteType = 'middle note'; 
            note.noAnimation = true;
          }
          if(note.noteData > 2 && note.noteData < 4) //theres no notes beyond 4 but just incase
            note.noteData -= 1;
          if(note.noteData == 4)
          {
            note.mustPress = false;
            note.noteData = 3;
          }
        }
        else
        {
          note.noteData = 3;
          note.mustPress = false;
        }
        var colArray = ['A', 'B', 'D', 'E']; //update the textures
        var stupidArray = ['purple', 'blue', 'green', 'red'];
        if (note.noteType == 'middle note')
        {
          colArray[2] = 'C';
        }
        note.animation.remove(stupidArray[oldData]);
        note.animation.remove(stupidArray[oldData] + 'holdend');
        note.animation.remove(stupidArray[oldData] + 'hold');
        note.animation.addByPrefix(stupidArray[oldData] + 'Scroll', colArray[note.noteData] + ' Note'); //add correct animation
        note.animation.addByPrefix(stupidArray[oldData] + 'holdend', colArray[note.noteData] + ' Hold End');
        note.animation.addByPrefix(stupidArray[oldData] + 'hold', colArray[note.noteData] + ' Hold Piece');
        if (note.isSustainNote)
        {
          if(note.prevNote != null)
          {
            note.animation.play(stupidArray[oldData] + 'holdend');
            
            if(note.prevNote.isSustainNote)
            {
              note.prevNote.animation.play(stupidArray[oldData] + 'hold');
            }
          }
          note.offset.y -= 200;
          fuckinOffset += 75;
        }
        else
        {
          note.animation.play(stupidArray[oldData] + 'Scroll');
          note.setGraphicSize(Std.int(note.width * 0.9));
        }
        fuckinOffset += 5;
        note.updateHitbox();
        note.copyX = false;
        note.copyAlpha = false;
        note.x = game.getLuaObject('fakeStrum' + note.noteData).x + fuckinOffset;
        if(note.noteType == 'middle note')
          note.x = game.getLuaObject('fakeStrum2').x;
        else if(note.noteData >= 2)
          note.x = game.getLuaObject('fakeStrum' + (note.noteData + 1)).x;
      }
    }
  ]])
end
singAnims = {'singLEFT', 'singDOWN', 'singUP', 'singRIGHT'}
function opponentNoteHit(id, data, type, sus)
  if curBeat >= 256 and curBeat < 320 then
    local fixedType = data
    if type == 'middle note' then
      playSmallAnim('smallBamb', 'singMIDDLE')
    elseif fixedType >= 2 then
      fixedType = fixedType + 1
    end
    local time = 0.30
    if sus and stringEndsWith(getPropertyFromGroup('notes', id, 'animation.curAnim.name'), 'end') then
      time = time + 0.30
    end
    strumAnim(fixedType, 'confirm')
    ezTimer('resetAnim'..fixedType, time, function()
      strumAnim(fixedType, 'idle')
    end)
    if type ~= 'middle note' then
      playSmallAnim('smallBamb', singAnims[data+1])
    end
    ezTimer('smallAnimReset', 1, function()
      playSmallAnim('smallBamb', 'idle')
    end)
  end
  --updateSmallAnims()
end
function goodNoteHit(id, data)
  playSmallAnim('smallBf', singAnims[data+1])
  ezTimer('smallAnimResetBF', 1, function()
    playSmallAnim('smallBf', 'idle')
  end)
end
function playSmallAnim(who, name)
  runHaxeCode([[
    var smallBf = game.getLuaObject('smallBf');
    var smallBamb = game.getLuaObject('smallBamb');
    
    ]]..who..[[.playAnim(']]..name..[[', true);
  ]])
end
-- function onUpdate(elapsed)
--   for i=0,4 do
--     if strumAnimReset[i+1] > 0 then
--       strumAnimReset[i+1] = strumAnimReset[i+1] - elapsed
--       --debugPrint(strumAnimReset[i+1]..', '..i)
--     elseif strumAnimReset[i+1] <= 0 then
--       strumAnim(i, 'idle')
--     end
--   end
-- end
function strumAnim(i, anim)
  playAnim('fakeStrum'..i, anim, true)
  runHaxeCode([[
    var strum = game.getLuaObject('fakeStrum' + ]]..i..[[);
    if(]]..tostring(anim == 'confirm')..[[)
    {
      strum.offset.set(45 - 13, 45 - 13);
    }
    else
    {
      strum.offset.set(45, 45);
    }
  ]])
end
function strumAnimProperty(i, prop)
  return runHaxeCode([[
    return game.getLuaObject('fakeStrum' + ]]..i..[[).animation.curAnim.]]..prop..[[;
  ]])
end
timers = {blankTags = 0}
function ezTimer(tag, timer, callback)
  if tag == nil then
    tag = 'blank_tags-'..tostring(timers.blankTags)
    timers.blankTags = timers.blankTags + 1
  end
  timers[tag] = callback
  runTimer(tag, timer)
end
function onTimerCompleted(tag)
  if timers[tag] ~= nil then
    timers[tag]()
    timers[tag] = nil
    if stringStartsWith(tag, 'blank_tags-') then
      timers.blankTags = tonumber(stringSplit(tag, '-')[2])
    end
  end
end
--actual gh switch
function onSongStart()
  makeLuaSprite('coolerSTUFF', '', -1000, -1000)
  makeGraphic('coolerSTUFF', 5000, 5000, '000000')
  setScrollFactor('coolerSTUFF', 0, 0)
  setProperty('coolerSTUFF.alpha', 0)
  setObjectCamera('coolerSTUFF', 'HUD')
  addLuaSprite('coolerSTUFF', true)
  
  makeLuaSprite('GHbg', '', -1000, -1000)
  makeGraphic('GHbg', 5000, 5000, '000000')
  setScrollFactor('GHbg', 0, 0)
  setProperty('GHbg.visible', false)
  setProperty('GHbg.alpha', 0.5)
  addLuaSprite('GHbg', true)
end
beatHits = {
  [248] = function()
    for i=0,3 do
      noteTweenAlpha(i, i, 0, 1)
    end
  end,
  [256] = function()
    ghMode = true
    callOnLuas('disableCam', {'cool'})
    setProperty('GHbg.visible', true)
    setProperty('GHlinething.visible', true)
    for i=0,7 do
      setPropertyFromGroup('strumLineNotes', i, 'alpha', 0)
    end
    for i=0,4 do
      setProperty('fakeStrum'..i..'.visible', true)
    end
    --debugPrint('ok yeah i guess')
    setProperty('smallBamb.alpha', 1)
    setProperty('smallBambThing.alpha', 1)
  end,
  [319] = function()
    for i=0,4 do
      doTweenAlpha(i..'strumfakey', 'fakeStrum'..i, 0, 0.25)
    end
    for i=4,7 do
      --debugPrint(_G['defaultPlayerStrumX'..tostring(i-4)] - 321.3)
      setPropertyFromGroup('playerStrums', i-4, 'x', _G['defaultPlayerStrumX'..tostring(i-4)] - 321.3)
      noteTweenAlpha(i, i, 1, 0.25)
    end
  end,
  [320] = function()
    doTweenAlpha('asdf', 'smallBf', 1, 1)
    doTweenAlpha('helloooo', 'smallBfThing', 1, 1)
  end,
  [384] = function()
    ghMode = false
    doTweenAlpha('coolerSTUFF', 'coolerSTUFF', 1, 1)
    ezTimer(nil, 1, function()
      removeLuaSprite('coolerSTUFF', true)
      setProperty('GHbg.visible', false)
      setProperty('GHlinething.visible', false)
      setProperty('smallBamb.visible', false)
      setProperty('smallBambThing.visible', false)
      setProperty('smallBf.visible', false)
      setProperty('smallBfThing.visible', false)
      callOnLuas('enableCam', {'cool'})
      for i=0,3 do
        setPropertyFromGroup('playerStrums', i, 'alpha', 0)
        setPropertyFromGroup('playerStrums', i, 'x', _G['defaultPlayerStrumX'..tostring(i)])
      end
    end)
  end
}
function onBeatHit()
  local imgoingtofuckingkillmyself = not stringStartsWith(getProperty('smallBf.animation.curAnim.name'), 'sing')
  local fuckthisstupidassbullshit = not stringStartsWith(getProperty('smallBamb.animation.curAnim.name'), 'sing')
  if imgoingtofuckingkillmyself then
    runHaxeCode([[
      var boyfriend = game.getLuaObject('smallBf');
      if (boyfriend.animation.curAnim != null)
  		{
        //trace('go dance idiot');
  			boyfriend.playAnim('idle', true);
  		}
    ]])
  end
  if fuckthisstupidassbullshit then
    runHaxeCode([[
    var dad = game.getLuaObject('smallBamb');
    if (dad.animation.curAnim != null)
    {
      //trace('go dance OMG BAMBI');
      dad.playAnim('idle', true);
    }
    ]])
  end
  if beatHits[curBeat] then
    beatHits[curBeat]()
  end
end