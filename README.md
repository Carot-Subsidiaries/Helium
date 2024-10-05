## Script
```luau
local owner = "Carot-Subsidiaries"
local branch = "revision"

local function webImport(file)
    return loadstring(game:HttpGetAsync(("https://raw.githubusercontent.com/%s/Helium/%s/%s.lua"):format(owner, branch, file)), file .. '.lua')()
end

webImport("init")
webImport("ui/main")
```

# Helium
<i>Lua runtime introspection and network capturing tool for games on the Roblox engine.</i>

~~Report issues to our Discord server: https://discord.gg/DJxBwAX~~

<ins>New Discord server will be established when the next major release is ready for use</ins>

<p align="center">
    <img src="https://cdn.discordapp.com/attachments/633472429917995038/722143730500501534/Helium_Logo.png"/>
    </br>
    <img src="https://raw.githubusercontent.com/Carot-Subsidiaries/Helium/revision/github-assets/ui.png" width="677px"/>
</p>

## Features
* Upvalue Scanner
    * View/Modify Upvalues
    * View first-level values in table upvalues
    * View information of closure
* Constant Scanner
    * View/Modify Constants
    * View information of closure
* Script Scanner
    * View general information of scripts (source, protos, constants, etc.)
    * Retrieve all protos found in GC
* Module Scanner
    * View general information of modules (return value, source, protos, constants, etc.)
    * Retrieve all protos found in GC
* RemoteSpy
    * Log calls of remote objects (RemoteEvent, RemoteFunction, BindableEvent, BindableFunction)
    * Ignore/Block calls based on parameters passed
    * Traceback calling function/closure
* ClosureSpy
    * Log calls of closures
    * View general information of closures (location, protos, constants, etc.)

### Planned
* RequestSpy
    * Log calls of requests (request, http.request, game:HttpGet, etc.)
    * View general information of requests (url, headers, body, etc.)
    * Ignore/Block calls based on parameters passed
* Attribute Scanner
    * View/Modify Attributes
    * See latest changes and where the change was called from?

## Images/Videos
<p align="center">
    <img src="https://i.gyazo.com/63afdd764cdca533af5ebca843217a7e.gif" />
</p>

