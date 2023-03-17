--Poog Main script


local Rayfield = loadstring(game:HttpGet('https://raw.githubusercontent.com/shlexware/Rayfield/main/source'))()



--poog gui
local Window = Rayfield:CreateWindow({
   Name = "FF2 script",
   LoadingTitle = "POOG FOOG YT",
   LoadingSubtitle = "by Poog Foog",
   ConfigurationSaving = {
      Enabled = true,
      FolderName = Poog, -- Create a custom folder for your hub/game
      FileName = "Poog hub"
   },
   Discord = {
      Enabled = false,
      Invite = "noinvitelink", -- The Discord invite code, do not include discord.gg/. E.g. discord.gg/ABCD would be ABCD.
      RememberJoins = true -- Set this to false to make them join the discord every time they load it up
   },
   KeySystem = false, -- Set this to true to use our key system
   KeySettings = {
      Title = "Sirius Hub",
      Subtitle = "Key System",
      Note = "Join the discord (discord.gg/sirius)",
      FileName = "SiriusKey",
      SaveKey = true,
      GrabKeyFromSite = false, -- If this is true, set Key below to the RAW site you would like Rayfield to get the key from
      Key = "Hello"
   }
})







  




local Main = Window:CreateTab("Main", 4483362458) -- Title, Image
local MainSection = Main:CreateSection("Main")




local Player = Window:CreateTab("Player", 4483362458) -- Title, Image
local PlayerSection = Player:CreateSection("Player")









local MainSlider = Main:CreateSlider({
    Name = "Mag Range",
    Range = {0, 25},
    Increment = 0.1,
    Suffix = "",
    CurrentValue = 18,
    Flag = "Slider1", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
    Callback = function(maxdistance)
        local lp = game:GetService("Players").LocalPlayer
        local stepped = game:GetService("RunService").Stepped
        local user = game:GetService("UserInputService")
        local gui = game:GetService("GuiService")
         
        local maxdistance = 15 --Max distance you can catch a football from, server caps it at some point anyways
        local autoclickoffset = nil --How far off from the max distance to click, nil for no auto
         
        local escmenu = false
         
        autoclickoffset = autoclickoffset and autoclickoffset + maxdistance
         
        local infinite = math.huge
        local workspace = workspace
        local firetouchinterest = firetouchinterest
        local FindFirstChild = game.FindFirstChild
        local FindFirstChildOfClass = game.FindFirstChildOfClass
        local task = task
        local connect = stepped.Connect
        local waitfor = stepped.Wait
        local keypress = keypress
        local keyrelease = keyrelease
        local gettextbox = user.GetFocusedTextBox
        local pairs = pairs
         
        local catchparts = {
           "CatchRight",
           "CatchLeft"
        }
         
        local function resolveShortest(ball, charac)
           local shortest, chosen = infinite, nil
         
           for i, name in pairs(catchparts) do
               local part = FindFirstChild(charac, name)
               local dist = part and (part.Position - ball.Position).Magnitude or infinite
         
               if dist < shortest then
                   shortest = dist
                   chosen = part
               end
           end
         
           return shortest, chosen
        end
         
        local function WaitForChildOfClass(inst, child, maxtime)
           local timer = 0
           maxtime = maxtime or infinite
         
           local found = FindFirstChildOfClass(inst, child)
           while not found and timer < maxtime do
               timer = timer + task.wait()
               found = FindFirstChildOfClass(inst, child)
         
               if found then
                   return found
               end
           end
         
           return found
        end
         
        connect(gui.MenuOpened, function()
           escmenu = true
        end)
         
        connect(gui.MenuClosed, function()
           escmenu = false
        end)
         
        connect(workspace.ChildAdded, function(ball)
           if ball.Name == "Football" and WaitForChildOfClass(ball, "TouchTransmitter", 3) then
               local charac = lp.Character
         
               while ball.Parent == workspace and charac do
                   local dist, part = resolveShortest(ball, charac)
         
                   if part then
                       if autoclickoffset and dist <= autoclickoffset and not (gettextbox(user) or escmenu) then
                           keypress(0x43) --C key, not mouse click cus that can do gay shit like close out roblox
                           keyrelease(0x43)
                       end
         
                       if dist <= maxdistance then
                           firetouchinterest(part, ball, 1)
                           firetouchinterest(part, ball, 0)
                       end
                   end
         
                   waitfor(stepped)
               end
           end
        end)
    -- The variable (Value) is a number which correlates to the value the slider is currently at
    end,
 })


















local PlayerButton = Player:CreateButton({
    Name = "Speed GUI Undetected",
    Callback = function()
        local s_rs = game:GetService("RunService")
    local l_plr = game:GetService("Players").LocalPlayer
    
    
    
    local l_humrp = l_plr.Character and l_plr.Character:FindFirstChild("HumanoidRootPart")
    local l_hum = l_plr.Character and l_plr.Character:FindFirstChild("Humanoid")
    
    local resp_con = l_plr.CharacterAdded:Connect(function(c) 
        l_humrp = c:WaitForChild("HumanoidRootPart",3)
        l_hum = c:WaitForChild("Humanoid",3)
    end)
    
    local function dnec(signal) 
        local s = {}
        for _, con in ipairs(getconnections(signal)) do 
            local func = con.Function
            if (func and islclosure(func)) then
                if (not is_synapse_function(func)) then 
                    s[#s+1] = con
                    con:Disable() 
                end
            end
        end
        return s
    end
    
    
    local speed_amnt = 5
    
    local ui = loadstring(game:HttpGet('https://raw.githubusercontent.com/topitbopit/rblx/main/ui-stuff/jeff_2.lua'))()
    ui:SetColors('streamline')
    
    
    
    local w = ui:NewWindow('speed',250,200)
    
    local m = w:NewMenu('speed')
    local t = m:NewToggle('toggle speed')
    local s = m:NewSlider('speed amount',0.3,20,5)
    
    t:SetTooltip("made special for bwiz")
    s:SetTooltip("speedhack speed")
    
    m:NewLabel()
    m:NewLabel('Made by Poog foog')
    
    s.OnValueChanged:Connect(function(v) 
        speed_amnt = v
    end)
    
    do
        local a,b
        t.OnToggle:Connect(function(t)
            if (t) then
                a = dnec(l_humrp.Changed)
                b = dnec(l_humrp:GetPropertyChangedSignal("CFrame"))
                
                s_rs:BindToRenderStep("speed",2000,function(dt)
                    l_humrp.CFrame += l_hum.MoveDirection*dt*5*speed_amnt
                end)
            else
                s_rs:UnbindFromRenderStep("speed")
                
                for i,v in ipairs(a) do 
                    v:Enable()
                end
                for i,v in ipairs(b) do 
                    v:Enable()
                end
            end
        end)
    end
    
    ui.Exiting:Connect(function() 
        for i,v in ipairs(ui:GetAllToggles()) do 
            if (v:IsEnabled()) then
                v:Disable()
            end
        end
        resp_con:Disconnect()
    end)
    
    ui:Ready()    local s_rs = game:GetService("RunService")
    local l_plr = game:GetService("Players").LocalPlayer
    
    
    
    local l_humrp = l_plr.Character and l_plr.Character:FindFirstChild("HumanoidRootPart")
    local l_hum = l_plr.Character and l_plr.Character:FindFirstChild("Humanoid")
    
    local resp_con = l_plr.CharacterAdded:Connect(function(c) 
        l_humrp = c:WaitForChild("HumanoidRootPart",3)
        l_hum = c:WaitForChild("Humanoid",3)
    end)
    
    local function dnec(signal) 
        local s = {}
        for _, con in ipairs(getconnections(signal)) do 
            local func = con.Function
            if (func and islclosure(func)) then
                if (not is_synapse_function(func)) then 
                    s[#s+1] = con
                    con:Disable() 
                end
            end
        end
        return s
    end
    
    
    local speed_amnt = 5
    
    local ui = loadstring(game:HttpGet('https://raw.githubusercontent.com/topitbopit/rblx/main/ui-stuff/jeff_2.lua'))()
    ui:SetColors('streamline')
    
    
    
    local w = ui:NewWindow('speed',250,200)
    
    local m = w:NewMenu('speed')
    local t = m:NewToggle('toggle speed')
    local s = m:NewSlider('speed amount',0.3,20,5)
    
    t:SetTooltip("made special for bwiz")
    s:SetTooltip("speedhack speed")
    
    m:NewLabel()
    m:NewLabel('Made by Poog foog')
    
    s.OnValueChanged:Connect(function(v) 
        speed_amnt = v
    end)
    
    do
        local a,b
        t.OnToggle:Connect(function(t)
            if (t) then
                a = dnec(l_humrp.Changed)
                b = dnec(l_humrp:GetPropertyChangedSignal("CFrame"))
                
                s_rs:BindToRenderStep("speed",2000,function(dt)
                    l_humrp.CFrame += l_hum.MoveDirection*dt*5*speed_amnt
                end)
            else
                s_rs:UnbindFromRenderStep("speed")
                
                for i,v in ipairs(a) do 
                    v:Enable()
                end
                for i,v in ipairs(b) do 
                    v:Enable()
                end
            end
        end)
    end
    
    ui.Exiting:Connect(function() 
        for i,v in ipairs(ui:GetAllToggles()) do 
            if (v:IsEnabled()) then
                v:Disable()
            end
        end
        resp_con:Disconnect()
    end)
    
    ui:Ready()
end
 })

















local MainButton = Main:CreateButton({
   Name = "Ball predictions",
   Callback = function()
      local Grapher = {}

      --// UI Setup
      
      
      Grapher.Marker = Instance.new("Part")
      Grapher.Marker.Anchored = true
      Grapher.Marker.Transparency = .8
      Grapher.Marker.Color = Color3.fromRGB(255, 0, 255)
      Grapher.Marker.CanCollide = false
      Grapher.Marker.Name = "Marker"
      
      Grapher.Params = RaycastParams.new()
      Grapher.Params.IgnoreWater = true 
      Grapher.Params.FilterType = Enum.RaycastFilterType.Whitelist
      
      Grapher.CastStep = 3 / 60
      
      Grapher.LastSavedPower = 60
      
      function Grapher:GetCollidables()
          local Collidables = {}
          
          for _, BasePart in ipairs(workspace:GetDescendants()) do
              if BasePart:IsA("BasePart") and BasePart.CanCollide == true then
                  table.insert(Collidables, BasePart)
              end
          end
          return Collidables
      end
      
      function Grapher:WipeMarkers()
          for i,v in pairs(workspace:GetChildren()) do
              if v.Name == "Marker" then v:Destroy() end
          end
      end
      
      function Grapher:GetLanding(origin, velocity, c)
          local Elapsed = 0
          local LastPos = origin
          
          self.Params.FilterDescendantsInstances = self:GetCollidables()
          
          local Football_Highlight;
      
          if c then
              Football_Highlight = Instance.new("Highlight", game.CoreGui)
              Football_Highlight.Adornee = c 
              Football_Highlight.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
              Football_Highlight.Enabled = true  
          end
      
          while true do
              Elapsed += Grapher.CastStep
      
              local nPos = origin + velocity * Elapsed - Vector3.new(0, .5 * 28 * Elapsed ^ 2, 0)
              
              local Marker = self.Marker:Clone(); Marker.Parent = workspace; Marker.Position = nPos
              if c and Football_Highlight and c.Parent ~= workspace or c and not c:FindFirstChildOfClass("BodyForce") then
                  Football_Highlight:Destroy()
                  self:WipeMarkers()
                  break
              end
      
              task.wait()
          end
      end
      
      do
          workspace.ChildAdded:Connect(function(child)
              if child.Name == "Football" and child:IsA("BasePart") then
                  local tempCon; tempCon = child:GetPropertyChangedSignal("Velocity"):Connect(function()
                      Grapher:GetLanding(child.Position, child.Velocity, child)
                      tempCon:Disconnect()
                  end)
              end
          end)     
      
          --[[
          Variables.Client.PlayerGui.ChildAdded:Connect(function(child)
              if child.Name == "BallGui" then
                  task.spawn(function()
                      while true do if Variables.CatchingTab.Flags["Grapher_Enabled"] then
                          if child.Parent ~= Variables.Client.PlayerGui then break end 
                          local Frame = child:FindFirstChild("Frame")
                          local Display = Frame and Frame:FindFirstChild("Disp")
                          local Power = Display and tonumber(Display.Text)
                          if Power ~= nil then
                              Grapher.LastSavedPower = Power
                          end 
      
                          Grapher:GetLanding(Variables.Character:FindFirstChild("Head").Position, ((Variables.Client:GetMouse().Hit.Position - Variables.Character:FindFirstChild("Head").Position).Unit * Grapher.LastSavedPower))
                          task.wait(.2)
                          Grapher:WipeMarkers()
                          task.wait()
                      end
                      end
                  end)
              end
          end)
          --]]
      end
      
      
      return Grapher 
   end,
})























local MainButton = Main:CreateButton({
   Name = "Fps boost",
   Callback = function()
      local decalsyeeted = true -- Leaving this on makes games look shitty but the fps goes up by at least 20.
      local g = game
      local w = g.Workspace
      local l = g.Lighting
      local t = w.Terrain
      t.WaterWaveSize = 0
      t.WaterWaveSpeed = 0
      t.WaterReflectance = 0
      t.WaterTransparency = 0
      l.GlobalShadows = false
      l.FogEnd = 9e9
      l.Brightness = 0
      settings().Rendering.QualityLevel = "Level01"
      for i, v in pairs(g:GetDescendants()) do
          if v:IsA("Part") or v:IsA("Union") or v:IsA("CornerWedgePart") or v:IsA("TrussPart") then
              v.Material = "Plastic"
              v.Reflectance = 0
          elseif v:IsA("Decal") or v:IsA("Texture") and decalsyeeted then
              v.Transparency = 1
          elseif v:IsA("ParticleEmitter") or v:IsA("Trail") then
              v.Lifetime = NumberRange.new(0)
          elseif v:IsA("Explosion") then
              v.BlastPressure = 1
              v.BlastRadius = 1
          elseif v:IsA("Fire") or v:IsA("SpotLight") or v:IsA("Smoke") then
              v.Enabled = false
          elseif v:IsA("MeshPart") then
              v.Material = "Plastic"
              v.Reflectance = 0
              v.TextureID = 10385902758728957
          end
      end
      for i, e in pairs(l:GetChildren()) do
          if e:IsA("BlurEffect") or e:IsA("SunRaysEffect") or e:IsA("ColorCorrectionEffect") or e:IsA("BloomEffect") or e:IsA("DepthOfFieldEffect") then
              e.Enabled = false
          end
      end
   end,
})












local MainButton = Main:CreateButton({
   Name = "Skeletons",
   Callback = function()
      game:GetService("StarterGui"):SetCore("SendNotification",{ 	
         Title = "Made By:",  	
         Text = "Poog Foog",
             Icon = "",
             Duration = 20
         })
         
         local camera = workspace.CurrentCamera
         local entities = game:GetService("Players")
         local localplayer = entities.LocalPlayer 
         local runservice = game:GetService("RunService")
         --// Setting \\-- 
         local esp_settings = {
             enabled = true,
             skel = true,
             skel_col = Color3.fromRGB(204,0,204)
         }
         local function draw(player, character)
             -- Head
             local skel_head = Drawing.new("Line")
             skel_head.Visible = false
             skel_head.Thickness = 3
             skel_head.Color = Color3.new(0,0,255)
             -- Torso
             local skel_torso = Drawing.new("Line")
             skel_torso.Visible = false
             skel_torso.Thickness = 2
             skel_torso.Color = Color3.new(255,0,255)
             -- LeftArm
             local skel_leftarm = Drawing.new("Line")
             skel_leftarm.Visible = false
             skel_leftarm.Thickness = 2
             skel_leftarm.Color = Color3.new(255,0,255)
             -- RightArm
             local skel_rightarm = Drawing.new("Line")
             skel_rightarm.Visible = false
             skel_rightarm.Thickness = 2
             skel_rightarm.Color = Color3.new(255,0,255)
             -- LeftLeg
             local skel_leftleg = Drawing.new("Line")
             skel_leftleg.Visible = false
             skel_leftleg.Thickness = 2
             skel_leftleg.Color = Color3.new(255,0,255)
             -- RightLeg
             local skel_rightleg = Drawing.new("Line")
             skel_rightleg.Visible = false
             skel_rightleg.Thickness = 2
             skel_rightleg.Color = Color3.new(255,0,255)
             local function update()
                 local connection
                 connection = runservice.RenderStepped:Connect(function()
                     if workspace:FindFirstChild(character.Name) and
                     character and 
                     character:FindFirstChild("HumanoidRootPart") and 
                     character:FindFirstChild("Humanoid") and 
                     character:FindFirstChild("Humanoid").Health ~= 0 then 
                         local character_rootpart_3d = character.HumanoidRootPart.Position
                         local character_rootpart_2d, rootpart_onscreen = camera:WorldToViewportPoint(character_rootpart_3d)
                         if rootpart_onscreen and character.Humanoid.RigType == Enum.HumanoidRigType.R6 and esp_settings.enabled then
                             local head_2d = camera:WorldToViewportPoint(character.Head.Position)
                                 
                             local torso_upper_2d = camera:WorldToViewportPoint(character.Torso.Position + Vector3.new(0,1,0))
                             local torso_lower_2d = camera:WorldToViewportPoint(character.Torso.Position + Vector3.new(0,-1,0))
                           
                             local leftarm_2d = camera:WorldToViewportPoint(character["Left Arm"].Position + Vector3.new(0,-1,0))
                             local rightarm_2d = camera:WorldToViewportPoint(character["Right Arm"].Position + Vector3.new(0,-1,0))
                             local leftleg_2d = camera:WorldToViewportPoint(character["Left Leg"].Position + Vector3.new(0,-1,0))
                             local rightleg_2d = camera:WorldToViewportPoint(character["Right Leg"].Position + Vector3.new(0,-1,0))
                                 
                             skel_head.From = Vector2.new(head_2d.X, head_2d.Y)
                             skel_head.To = Vector2.new(torso_upper_2d.X, torso_upper_2d.Y)
         
                             skel_torso.From = Vector2.new(torso_upper_2d.X, torso_upper_2d.Y)
                             skel_torso.To = Vector2.new(torso_lower_2d.X, torso_lower_2d.Y)
                             
                             skel_leftarm.From = Vector2.new(torso_upper_2d.X, torso_upper_2d.Y)
                             skel_leftarm.To = Vector2.new(leftarm_2d.X, leftarm_2d.Y)
         
                             skel_rightarm.From = Vector2.new(torso_upper_2d.X, torso_upper_2d.Y)
                             skel_rightarm.To = Vector2.new(rightarm_2d.X, rightarm_2d.Y)
         
                             skel_leftleg.From = Vector2.new(torso_lower_2d.X, torso_lower_2d.Y)
                             skel_leftleg.To = Vector2.new(leftleg_2d.X, leftleg_2d.Y)
         
                             skel_rightleg.From = Vector2.new(torso_lower_2d.X, torso_lower_2d.Y)
                             skel_rightleg.To = Vector2.new(rightleg_2d.X, rightleg_2d.Y)
         
                             skel_head.Visible = esp_settings.skel
                             skel_torso.Visible = esp_settings.skel
                             skel_leftarm.Visible = esp_settings.skel
                             skel_rightarm.Visible = esp_settings.skel
                             skel_leftleg.Visible = esp_settings.skel
                             skel_rightleg.Visible = esp_settings.skel
                         else
                             skel_head.Visible = false
                             skel_torso.Visible = false
                             skel_leftarm.Visible = false
                             skel_rightarm.Visible = false
                             skel_leftleg.Visible = false
                             skel_rightleg.Visible = false
                         end
                     else
                         if player == nil then
                             connection:Disconnect()
                             connection = nil 
                         end
                         skel_head.Visible = false
                         skel_torso.Visible = false
                         skel_leftarm.Visible = false
                         skel_rightarm.Visible = false
                         skel_leftleg.Visible = false
                         skel_rightleg.Visible = false
                     end
                 end)
             end
             coroutine.wrap(update)()
         end
         local function playeradded(player)
             if player.Character then
                 coroutine.wrap(draw)(player, player.Character)
             end
             player.CharacterAdded:Connect(function(character)
                 coroutine.wrap(draw)(player, character)
             end)
         end
         for a,b in next, entities:GetPlayers() do
             if b ~= localplayer then
                 playeradded(b)
             end
         end
         entities.PlayerAdded:Connect(playeradded)
   end,
})




















local PlayerButton = Player:CreateButton({
    Name = "Fake Kick",
    Callback = function()
    --fake kick


for i,v in pairs(game.Players:GetPlayers()) do
    AnimationId = "3695538622"
    local Anim = Instance.new("Animation")
    Anim.AnimationId = "rbxassetid://"..AnimationId
    local k = game.Players.LocalPlayer.Character.Humanoid:LoadAnimation(Anim)
    k:Play()
    k:AdjustSpeed(1)
    end
    end,
 })






 local PlayerButton = Player:CreateButton({
    Name = "Fake Pass",
    Callback = function()
    --fake pass


    for i,v in pairs(game.Players:GetPlayers()) do
        AnimationId = "3695532114"
        local Anim = Instance.new("Animation")
        Anim.AnimationId = "rbxassetid://"..AnimationId
        local k = game.Players.LocalPlayer.Character.Humanoid:LoadAnimation(Anim)
        k:Play()
        k:AdjustSpeed(1)
        end

    end,
 })







 local PlayerButton = Player:CreateButton({
    Name = "Fake Dab",
    Callback = function()
    --fake dab

    for i,v in pairs(game.Players:GetPlayers()) do
        AnimationId = "3695549792"
        local Anim = Instance.new("Animation")
        Anim.AnimationId = "rbxassetid://"..AnimationId
        local k = game.Players.LocalPlayer.Character.Humanoid:LoadAnimation(Anim)
        k:Play()
        k:AdjustSpeed(1)
        end
    end,
 })






 local PlayerButton = Player:CreateButton({
    Name = "Fake Hitstick",
    Callback = function()
    --fake hitstick

    for i,v in pairs(game.Players:GetPlayers()) do
        AnimationId = "3695544849"
        local Anim = Instance.new("Animation")
        Anim.AnimationId = "rbxassetid://"..AnimationId
        local k = game.Players.LocalPlayer.Character.Humanoid:LoadAnimation(Anim)
        k:Play()
        k:AdjustSpeed(1)
        end

    end,
 })







 local PlayerButton = Player:CreateButton({
    Name = "Fake knee",
    Callback = function()
   -- fake knee


   for i,v in pairs(game.Players:GetPlayers()) do
    AnimationId = "3695535660"
    local Anim = Instance.new("Animation")
    Anim.AnimationId = "rbxassetid://"..AnimationId
    local k = game.Players.LocalPlayer.Character.Humanoid:LoadAnimation(Anim)
    k:Play()
    k:AdjustSpeed(1)
    end
    end,
 })








 local PlayerButton = Player:CreateButton({
    Name = "Fair Catch",
    Callback = function()
    -- fair catch
    for i,v in pairs(game.Players:GetPlayers()) do
        AnimationId = "3695548117"
        local Anim = Instance.new("Animation")
        Anim.AnimationId = "rbxassetid://"..AnimationId
        local k = game.Players.LocalPlayer.Character.Humanoid:LoadAnimation(Anim)
        k:Play()
        k:AdjustSpeed(1)
        end
        
        
    end,
 })









 local PlayerButton = Player:CreateButton({
    Name = "Incomplete Pass",
    Callback = function()
    -- incomplete pass

    for i,v in pairs(game.Players:GetPlayers()) do
        AnimationId = "3695542947"
        local Anim = Instance.new("Animation")
        Anim.AnimationId = "rbxassetid://"..AnimationId
        local k = game.Players.LocalPlayer.Character.Humanoid:LoadAnimation(Anim)
        k:Play()
        k:AdjustSpeed(1)
        end

    end,
 })








 local PlayerButton = Player:CreateButton({
    Name = "Fake Block",
    Callback = function()
   --fake block

for i,v in pairs(game.Players:GetPlayers()) do
    AnimationId = "3695551500"
    local Anim = Instance.new("Animation")
    Anim.AnimationId = "rbxassetid://"..AnimationId
    local k = game.Players.LocalPlayer.Character.Humanoid:LoadAnimation(Anim)
    k:Play()
    k:AdjustSpeed(1)
    end
    end,
 })
