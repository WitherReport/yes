local module = {}

function module.BruteForce(options, Function)
	if not type(options) == "table" then
		error("options should be a table, but is a "..type(options))
	end
	local ahh = {
		"IncludeNum",
		"IncludeUpp",
		"IncludeSpec",
		"WaitingState",
		"Lenght",
	}
	
	for i, v in pairs(ahh) do
		options[v] = options[i]
	end
	local a = "abcdefghijklmnopqrstuvwxyz"
	local b = "0123456789"
	local c = "*/-+=(){}[]'\"$^!?.:;!"
	local d = ("").upper("abcdefghijklmnopqrstuvwxyz")
	local e = {}
	for i = 1, ("").len(a) do
		e[#e+1] = a:sub(i, i) 
	end
	if options["IncludeNum"] then
		for i = 1, ("").len(b) do
			e[#e+1] = b:sub(i, i) 
		end
	end
	if options["IncludeUpp"] then
		for i = 1, ("").len(d) do
			e[#e+1] = d:sub(i, i) 
		end
	end
	if options["IncludeSpec"] then
		for i = 1, ("").len(c) do
			e[#e+1] = c:sub(i, i) 
		end
	end
	for i = 1, options["Lenght"] do
	end
end

function module.Weld(p1,p2,c0)
	local weld = Instance.new("Weld", p1)
	weld.Part0 = p1
	weld.Part1 = p2
	if typeof(c0) == "CFrame" then
		weld.C0 = c0
	elseif type(c0) == "nil" then
		return weld
	else
		error("3rd argument should be a CFrame or nil, in that case it is a "..typeof(c0))
	end
	return weld
end

function module.SimpleTween(a,b,c)
	game:GetService("TweenService"):Create(a, TweenInfo.new(b), c):Play()
end
function module.Tween(a,b,c)
	game:GetService("TweenService"):Create(a, b, c):Play()
end
function module.Tp(cf)
	game.Players.LocalPlayer.Character.PrimaryPart.CFrame = cf
end
function module.TweenTp(cf, t)
	game:GetService("TweenService"):Create(game.Players.LocalPlayer.Character.PrimaryPart, TweenInfo.new(t), {CFrame = cf}):Play()
end
local NoClipThread;
function module.NoClip()
	NoClipThread = game["Run Service"].RenderStepped:Connect(function()
		local plr = game.Players.LocalPlayer
		for i, v in pairs(plr.Character:GetChildren()) do
			if v:IsA("Part") or v:IsA("MeshPart") then
				v.CanCollide = false
			end
		end
	end)
end
function module.Clip()
	NoClipThread:Disconnect()
end
return module
