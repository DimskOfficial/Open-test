-- Import libraries
local GUI = require("GUI")
local system = require("System")

---------------------------------------------------------------------------------

-- Add a new window to MineOS workspace
local workspace, window, menu = system.addWindow(GUI.filledWindow(1, 1, 60, 20, 0xE1E1E1))

-- Add single cell layout to window
local layout = window:addChild(GUI.layout(1, 1, window.width, window.height, 1, 1))

-- Add input fields for Encode and Decode
local encodeInput = layout:addChild(GUI.input(2, 2, 20, 3, 0xFFFFFF, 0x000000, 0xC3C3C3, 0xFFFFFF, "", "Encode"))
local decodeInput = layout:addChild(GUI.input(2, 6, 20, 3, 0xFFFFFF, 0x000000, 0xC3C3C3, 0xFFFFFF, "", "Decode"))

-- Add "Encode" button
layout:addChild(GUI.button(2, 10, 20, 3, 0xFFFFFF, 0x555555, 0x880000, 0xFFFFFF, "Encode")).onTouch = function()
    local encodedText = encodeBase64(encodeInput.text)
    GUI.alert("Encoded Text: " .. encodedText)
end

-- Add "Decode" button
layout:addChild(GUI.button(2, 14, 20, 3, 0xFFFFFF, 0x555555, 0x880000, 0xFFFFFF, "Decode")).onTouch = function()
    local decodedText = decodeBase64(decodeInput.text)
    GUI.alert("Decoded Text: " .. decodedText)
end

---------------------------------------------------------------------------------

-- Create callback function with resizing rules when window changes its size
window.onResize = function(newWidth, newHeight)
    window.backgroundPanel.width, window.backgroundPanel.height = newWidth, newHeight
    layout.width, layout.height = newWidth, newHeight
end
