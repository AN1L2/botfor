local Players = game:GetService("Players")
local TextChatService = game:GetService("TextChatService")

-- YOUR ADMIN I
local ADMIN_ID = 8224952102
local ADMIN_ID = 7224046803

local channel = TextChatService:WaitForChild("TextChannels"):WaitForChild("RBXGeneral")

local COMMANDS_ENABLED = true
local RO_ACTIVE = false
local LOB_ACTIVE = false
local CHAT_DELAY = 3

local BOT_MESSAGE = "__________________________________________________________________H1 SVGxS1Y PAPA 🔥"

local GULAM_MESSAGES = {
"____________________________________________________________________________________________________________________________________________________________________S1R SVGxS1Y PAPA JI is BUILT DIFFERENT 🔥",
"__________________________________________________________________________________________________________________________________________________________S1R SVGxS1Y walks in and the game changes 💪",
"_________________________________________________________________________________________________________________________________________________________________S1R SVGxS1Y PAPA got boss energy ONLY 👑",
"____________________________________________________________________________________________________________________________________________________________________S1R SVGxS1Y mindset = unstoppable 🚀",
"____________________________________________________________________________________________________________________________________________________________________S1R SVGxS1Y carries pure dominance ⚡",
"_______________________________________________________________________________________________________________________________________________________S1R SVGxS1Y isn’t competing — everyone else is 0 😆",
"____________________________________________________________________________________________________________________________________________________________S1R SVGxS1Y = LEGEND MODE ACTIVATED ⭐"
}

local RO_LINES = {
"{ BAP SE PANGA LEGA? 😆 }",
"{ LEAVE MARDE 😂 }",
"{ SVGxS1Y DADA BOL 😝 }",
"{ tmx m sofa }",
"{ mere BOT se xud rha 🤣 }",
"{ pakka tu noob ey 🥀 }",
"{ tera deficiency low hai? 😨 }",
"{ thoda sharm kr le 🤡 }",
"{ HIJRE BAAP SE PANGA NOI 🤣🙏🏻 }",
"{ TERI MAA MARU 🤓 }",
"{ SVGxS1Y PAPA h tere 🔥 }",
"{ TMKX ME BURJ KHALIFA  🤢 }",
"{ aur kitna harega 😂🙏🏻 }",
"{ bol SVGxS1Y IS BEST PAPA 🔥 }"
}

local LOB_LINES = {
"{ Ap S1R SVGxS1Y ke pakke dost ho 😔 }",
"{ Agr apko koi hate dia toh bolna 👺 }",
"{ Ap S1R SVGxS1Y ke bbg ho 😜 }",
"{ Apko dekh kr din acha ho jata h mera 🙃 }",
"{ Ladkia toh apke piche h 🌚 }",
"{ Ap toh kafi charming ho 🥺 }",
"{ Apko dekhkr dil garden garden ho jata  💢 }",
"{ Ap to meri cutie pie ho ywwr😝 }",
"{ S1R SVGxS1Y se apko bohot sara pyar }",
"{ Ap meri Princess ho 😋 }",
"{ 👉🏻👈🏻 aur karu baate 🥺 }"
}

TextChatService.OnIncomingMessage = function(message)
	if not message.TextSource then return end

	local player = Players:GetPlayerByUserId(message.TextSource.UserId)
	if not player then return end

	-- ADMIN ONLY
	if player.UserId ~= ADMIN_ID then return end

	local text = message.Text
	local args = string.split(text, " ")

	-- !stop
	if args[1]:lower() == "!stop" then
		COMMANDS_ENABLED = false
		RO_ACTIVE = false
		LOB_ACTIVE = false
		channel:SendAsync("Stopped.")
		return
	end

	-- !start
	if args[1]:lower() == "!start" then
		COMMANDS_ENABLED = true
		channel:SendAsync("Started.")
		return
	end

	-- !delay
	if args[1]:lower() == "!delay" then
		local d = tonumber(args[2])
		if d and d >= 0.5 then
			CHAT_DELAY = d
			channel:SendAsync("Delay set to "..CHAT_DELAY.." seconds.")
		end
		return
	end

	if not COMMANDS_ENABLED then return end

	-- !say
	if args[1]:lower() == "!say" then
		table.remove(args,1)
		local t = table.concat(args," ")
		if t ~= "" then channel:SendAsync(t) end
	end

	-- !bot
	if args[1]:lower() == "!bot" then
		channel:SendAsync(BOT_MESSAGE)
	end

	-- !gulam
	if args[1]:lower() == "!gulam" then
		task.spawn(function()
			for _,v in ipairs(GULAM_MESSAGES) do
				if not COMMANDS_ENABLED then break end
				channel:SendAsync(v)
				task.wait(CHAT_DELAY)
			end
		end)
	end

	-- !ro NAME
	if args[1]:lower() == "!ro" then
		table.remove(args,1)
		local name = table.concat(args," ")
		if name == "" then return end

		RO_ACTIVE = true
		LOB_ACTIVE = false

		task.spawn(function()
			while RO_ACTIVE and COMMANDS_ENABLED do
				for _,line in ipairs(RO_LINES) do
					if not RO_ACTIVE or not COMMANDS_ENABLED then break end
					channel:SendAsync("_____________________________________________________________________________________"..name.." "..line)
					task.wait(CHAT_DELAY)
				end
			end
		end)
	end

	-- !lob NAME
	if args[1]:lower() == "!lob" then
		table.remove(args,1)
		local name = table.concat(args," ")
		if name == "" then return end

		LOB_ACTIVE = true
		RO_ACTIVE = false

		task.spawn(function()
			while LOB_ACTIVE and COMMANDS_ENABLED do
				for _,line in ipairs(LOB_LINES) do
					if not LOB_ACTIVE or not COMMANDS_ENABLED then break end
					channel:SendAsync("_____________________________________________________________________________________"..name.." "..line)
					task.wait(CHAT_DELAY)
				end
			end
		end)
	end
end
