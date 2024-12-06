function onCreate()
  makeLuaSprite('stageEFFECT', '', -1000, -1000)
  makeGraphic('stageEFFECT', 5000, 5000, '000000')
  setScrollFactor('stageEFFECT', 0, 0)
  setProperty('stageEFFECT.alpha', 0)
  addLuaSprite('stageEFFECT', true)
  fuckThis = songName:lower() == 'interdimensional'
  -- debugPrint('please')
end
stageMode = false
fuckThis = false
function onEvent(n, v1, v2)
  -- debugPrint('ok dude')
  if n == 'stageMode' then
    -- debugPrint('blah blah swag')
    stageMode = not stageMode
    v1 = tobool(v1)
    v3 = tobool(split(v2, ', ')[2])
    v2 = tobool(split(v2, ', ')[1])
    
    if not v3 then
      cameraFlash('camGame', 'FFFFFF', 1, true)
    end
    
    if v1 and not fuckThis then
      for i=0,7 do
        noteTweenAlpha(i, i, stageMode and 0 or 1, 1)
      end
    end
    if not v2 then
      doTweenAlpha('hello', 'stageEFFECT', stageMode and 0.5 or 0, 1)
    end
  elseif n == 'forceStageModeOff' then
    v1 = tobool(v1)
    v2 = tobool(v2)
    if not v1 and v2 and not fuckThis then
      for i=0,7 do
        setPropertyFromGroup('strumLineNotes', i, 'alpha', 1)
      end
    end
    if v1 then
      setProperty('stageEFFECT.alpha', 0.5)
    else
      setProperty('stageEFFECT.alpha', 0)
    end
    cameraFlash('camGame', 'FFFFFF', 1, true)
    stageMode = v1
  elseif n == 'fadeOutNotes' and not fuckThis then
    for i=0,7 do
      noteTweenAlpha(i, i, v1, 1)
    end
  end
  
end
function tobool(inp)
  return inp == 'true'
end
function split(inputstr, sep)
    if sep == nil then
            sep = "%s"
    end
    local t={}
    for str in string.gmatch(inputstr, "([^"..sep.."]+)") do
            table.insert(t, str)
    end
    return t
end