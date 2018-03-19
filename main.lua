--require composer that will enable to use composer library commands in the project
local composer = require("composer")
--invoke the composer go to scene
composer.gotoScene("Menu",{effect = fade, time = 5000})