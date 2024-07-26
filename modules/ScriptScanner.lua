local ScriptScanner = {}
local LocalScript = import("objects/LocalScript")

local requiredMethods = {
    ["getGc"] = true,
    ["getSenv"] = true,
    ["getProtos"] = true,
    ["getConstants"] = true,
    ["getScriptClosure"] = true,
    ["isXClosure"] = true
}

local function scan(query)
    local scripts = {}
    query = query or ""

    for _i, v in pairs(getGc()) do
        if type(v) == "function" and not isXClosure(v) then
            local script = rawget(getfenv(v), "script")

            if typeof(script) == "Instance" and 
                not scripts[script] and 
                script:IsA("LocalScript") and 
                script.Name:lower():find(query) then

                local success, closure = pcall(getScriptClosure, script)
                if success and closure then
                    local senvSuccess = pcall(function() getsenv(script) end)
                    if senvSuccess then
                        scripts[script] = LocalScript.new(script)
                    else
                        print("Error getting script environment for:", script)
                    end
                else
                    print("Error in getScriptClosure:", closure)
                end -- credits: https://github.com/Upbolt/Hydroxide/pull/113/files#diff-fdb06651dc12a762a77d8758e1494b15f3f9c2a6838852acf22f5719213d1fc4
            end
        end
    end

    return scripts
end

ScriptScanner.RequiredMethods = requiredMethods
ScriptScanner.Scan = scan
return ScriptScanner