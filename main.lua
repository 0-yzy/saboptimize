function optimize(p)
    if p:IsA("BasePart") then
        p.Material = Enum.Material.Plastic
    elseif p:IsA("Decal") or p:IsA("SurfaceAppearance") or p:IsA("MaterialVariant") or p:IsA("ParticleEmitter") or p:IsA("Pants") or p:IsA("Shirt") or p:IsA("Accessory") then
        p:Destroy()
    end
    if p:IsA("MeshPart") then
        p.TextureID = ""
    elseif p:IsA("SpecialMesh") then
        p.TextureId = ""
    end
end
function anims(p)
    if p:IsA("Humanoid") then
        local a = p:FindFirstChildOfClass("Animator")
        if a then
            for _, track in ipairs(a:GetPlayingAnimationTracks()) do
                track:Stop()
            end
        end
    end
end
task.spawn(function()
    while true do
        local l = game.Lighting
        l.Ambient = Color3.fromRGB(255, 255, 255)
        l.Brightness = 0
        l.ColorShift_Bottom = Color3.fromRGB(0, 0, 0)
        l.ColorShift_Top = Color3.fromRGB(0, 0, 0)
        l.EnvironmentDiffuseScale = 0
        l.EnvironmentSpecularScale = 0
        l.GlobalShadows = false
        l.Technology = Enum.Technology.Compatibility
        for i,v in l:GetChildren() do
            v:Destroy()
        end
        for _,p in workspace:GetDescendants() do
            optimize(p)
        end
        for _,p in game.MaterialService:GetDescendants() do
            optimize(p)
        end
        task.wait(1)
    end
end)
task.spawn(function()
    while true do
        local plr = game.Players.LocalPlayer
        if plr.Character and plr.Character:FindFirstChild("Animate") then
            plr.Character.Animate:Destroy()
        end
        for _,p in workspace:GetDescendants() do
            anims(p)
        end
        task.wait(0.1)
    end
end)
