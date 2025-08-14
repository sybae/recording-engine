-- 커서를 모니터 중앙으로 이동
function moveMouseToScreenCenter()
    local screen = hs.mouse.getCurrentScreen()
    local frame = screen:frame()
    local center = hs.geometry.point(frame.x + frame.w / 2, frame.y + frame.h / 2)
    hs.mouse.setAbsolutePosition(center)
end

-- 현재 활성 창의 중심으로 마우스 이동
function moveMouseToFocusedWindowCenter()
    local win = hs.window.focusedWindow()
    if win then
        local frame = win:frame()
        local center = hs.geometry.point(frame.x + frame.w / 2, frame.y + frame.h / 2)
        hs.mouse.setAbsolutePosition(center)
    else
        hs.notify.show("Hammerspoon", "No focused window", "현재 포커스된 창이 없습니다.")
    end
end

-- 마우스 방향 이동
function moveMouseBy(dx, dy)
    local pos = hs.mouse.getAbsolutePosition()
    hs.mouse.setAbsolutePosition({x = pos.x + dx, y = pos.y + dy})
end

-- 왼쪽 클릭
function clickMouse()
    local pos = hs.mouse.getAbsolutePosition()
    hs.eventtap.leftClick(pos)
end

-- 오른쪽 클릭
function rightClickMouse()
    local mouse_point = hs.mouse.getAbsolutePosition()
    hs.eventtap.rightClick(mouse_point)
end

-- 단축키 바인딩
hs.hotkey.bind({"cmd", "shift"}, "/", moveMouseToFocusedWindowCenter)
hs.hotkey.bind({"cmd", "shift", "ctrl"}, "Up",    function() moveMouseBy(0, -50) end)
hs.hotkey.bind({"cmd", "shift", "ctrl"}, "Down",  function() moveMouseBy(0, 50) end)
hs.hotkey.bind({"cmd", "shift", "ctrl"}, "Left",  function() moveMouseBy(-50, 0) end)
hs.hotkey.bind({"cmd", "shift", "ctrl"}, "Right", function() moveMouseBy(50, 0) end)
hs.hotkey.bind({"cmd", "shift"}, ",", clickMouse)
hs.hotkey.bind({"cmd", "shift"}, ".", rightClickMouse)

