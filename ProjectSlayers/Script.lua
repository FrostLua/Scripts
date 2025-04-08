local Fluent = loadstring(game:HttpGet("https://github.com/dawid-scripts/Fluent/releases/latest/download/main.lua"))()

local api = loadstring(game:HttpGet("https://sdkapi-public.luarmor.net/library.lua"))()
--> Returns a table with methods that you can use.
-- You must initialize it with the script ID first.

-- Put your own script ID Below:
-- You can find it in your loadstring URL or projects tab.
api.script_id = "590f1ccc9913df943bdbd88635a9d5ca"


local function checkKey(inputKey)
inputKey = inputKey:gsub("%s+", "");
-- make the API request:
local status = api.check_key(inputKey); -- pass 32-char user key here

-- custom logic below:
if (status.code == "KEY_VALID") then

	writefile("Frosties/Key.txt", inputKey);

    -- fetch basic info about the key (only if KEY_VALID)
	Fluent:Notify({
		Title = "Welcome. Seconds left: " .. (os.time() - status.data.auth_expire);
		Content = "Total executions: " ..  status.data.total_executions;
		SubContent = status.data.note == "Ad Reward" and "Ad Reward" or "Lifetime";
		Duration = 10;
	})
    
    script_key = inputKey; -- SET THE KEY BEFORE LOADSTRINGING.
    
    task.spawn(function() api.load_script(); end); -- Executes the script, based on the script_id you put above.
    -- Alternatively, you can just put the loadstring you got from luarmor website.
    -- You must specify the script_key global either way.
    return true;
    
elseif (status.code == "KEY_HWID_LOCKED") then
    Fluent:Notify({
		Title = "Key locked to other HWID";
		Content = "Get a new key or something";
		Duration = 10;
	})
    return
    
elseif (status.code == "KEY_INCORRECT") then
    Fluent:Notify({
		Title = "Key is incorrect or expired";
		Content = "Get a new key or something";
		Duration = 10;
	})
    return    
else
    Fluent:Notify({
		Title = "Key check failed: " .. tostring(status.code);
		Content = "Try getting a new key if it isn't about it";
		Duration = 10;
	})
end
end;

if isfolder and isfolder("Frosties") and isfile("Frosties/Key.txt") then
	ret = checkKey(readfile("Frosties/Key.txt"));
	if ret == true then
		return;
	end;
end;

-- You can see a full list of possible status codes and status messages below.

local FrostiesVersion = "1.3"

local Window = Fluent:CreateWindow({
	Title = "Frosties "..FrostiesVersion,
	SubTitle = "discord.gg/XUUjpeyc3S",
	TabWidth = 160,
	Size = UDim2.fromOffset(550, 280),
	Acrylic = true,
	Theme = "Cat",
	MinimizeKey = Enum.KeyCode.LeftControl
})

local Tabs1 = {
	Main = Window:AddTab({ Title = "Main", Icon = "" }),
}


Tabs1.Main:AddParagraph({
	Title = "Key System",
	Content = "Get key 🐱";
})

Tabs1.Main:AddButton({
	Title = "Copy key link";
	Description = "This copies the get key link to your clipboard";
	Callback = setclipboard("https://ads.luarmor.net/get_key?for=Frosties_Key_System-ZVhflfaXnikU");
})

Window:SelectTab(1)
local Input = Tabs1.Main:AddInput("Input", {
	Title = "Insert Key Here",
	Default = "",
	Placeholder = "Placeholder",
	Numeric = false, -- Only allows numbers
	Finished = true, -- Only calls callback when you press enter
	Callback = function(Value)
		ret = checkKey(Value);
		if ret == true then
			Window:Destroy();
		end;
	end
})
