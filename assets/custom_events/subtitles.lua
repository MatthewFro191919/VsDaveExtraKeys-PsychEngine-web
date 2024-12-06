subNames = {
  ['corn-theft'] = 'ctheft',
  ['exploitation'] = 'exploit',
  ['escape from california'] = 'california',
  ['shredder'] = 'shred'
}
subs = {}
songSubs = {}
subIndex = 1
subObjects = {}
function onCreate() --load the shit
  addHaxeLibrary('Std')
  addHaxeLibrary('String')
  -- luaDebugMode = true
  local subLines = split(getTextFromFile('subtitles.txt'), '\n')
  for k,v in pairs(subLines) do
    if not stringStartsWith(v, '//') and #v > 1 then
      local definethings = split(v, '==')
      subs[definethings[1]] = definethings[2]
    end
  end
  --actually filter the shit
  -- debugPrint('hi')
  
  for k,v in pairs(subs) do
    if tostring(k):startswith(getSubPrefix(songName:lower())..'_sub') then
      -- debugPrint(v)
      local stupidIdiot = split(k, '_sub')
      songSubs[tonumber(stupidIdiot[2])] = v:gsub("[\n\r]", " ") --removes new line
    end
  end
end
function stringIndex(str, index)
  return runHaxeCode([[
    var cool = "]]..str..[[";
    return cool.charAt(]]..tostring(index-1)..[[);
  ]])
end
function onEvent(n, v1, v2)
  if n == 'subtitles' then
    local sub = tostring(songSubs[subIndex])
    local subObj = 'SUB_'..tostring(subIndex)
    --debugPrint('making sub: '..sub)
    
    makeLuaText(subObj, '', 0, 0, 0)
    setTextAlignment(subObj, 'center')
    setTextSize(subObj, 46)
    screenCenter(subObj)
    setProperty(subObj..'.y', getProperty(subObj..'.y') - 200)
    setTextFont(subObj, 'comic.ttf')
    setObjectCamera(subObj, 'other')
    addLuaText(subObj)
    table.insert(subObjects, {
      obj = subObj,
      sub = sub,
      index = 1,
      currentSub = '',
      finished = false,
      customSize = tonumber(v1)
    })
    subIndex = subIndex + 1
    runTimer('update', 0.015)
  end
end
function onTimerCompleted()

end
function getSubPrefix(inp)
  if subNames[inp] ~= nil then
    return subNames[inp]
  end
  return inp
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
  
  if tag == 'update' then --i know loops are a thing but i dont want to use them lol
    for i=1,#subObjects do
      if subObjects[i].currentSub ~= subObjects[i].sub then
        subObjects[i].currentSub = subObjects[i].currentSub..stringIndex(subObjects[i].sub, subObjects[i].index)
        
        local subObj = subObjects[i].obj;
        local dumbSize = (subObjects[i].customSize == nil or subObjects[i].customSize < 16) and 32 or subObjects[i].customSize
        removeLuaText(subObj)
        makeLuaText(subObj, subObjects[i].currentSub, 0, 0, 0)
        setTextAlignment(subObj, 'center')
        setTextSize(subObj, 46)
        screenCenter(subObj)
        setTextFont(subObj, 'comic.ttf')
        setProperty(subObj..'.y', getProperty(subObj..'.y') - 200)
        setObjectCamera(subObj, 'other')
        addLuaText(subObj)
        
        subObjects[i].index = subObjects[i].index + 1
      elseif not subObjects[i].finished then
        ezTimer(subObjects[i].obj, 1, function()
          doTweenAlpha(subObjects[i].obj, subObjects[i].obj, 0, 0.30)
          ezTimer(subObjects[i].obj, 1, function()
            removeLuaText(subObjects[i].obj)
          end)
        end)
        subObjects[i].finished = true;
      end
    end
    runTimer('update', 0.015)
  end
end
string.startswith = function(self, str) --better
    return self:find('^' .. str) ~= nil
end