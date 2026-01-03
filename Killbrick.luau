local KillBrickInjector = {}

function KillBrickInjector:InjectKillBrick(position, size)
    local killBrick = Instance.new("Part")
    killBrick.Size = size or Vector3.new(5, 1, 5)
    killBrick.Position = position or Vector3.new(0, 10, 0)
    killBrick.Anchored = true
    killBrick.BrickColor = BrickColor.new("Bright red")
    killBrick.Material = Enum.Material.Neon
    killBrick.CanCollide = true
    killBrick.Parent = workspace

    killBrick.Touched:Connect(function(hit)
        if hit:IsA("Player") then
            hit:Destroy()
        end
    end)
end

return KillBrickInjector
