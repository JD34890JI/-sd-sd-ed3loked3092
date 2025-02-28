

--- Script 1 ---
return {
	["Garry"] = "Legendary",
	["Knees"] = "Epic",
	["Gentleman"] = "Epic",
	["Default"] = "Rare",
	["Dab"] = "Rare",
	["Parrot"] = "Epic",
	["Whip"] = "Epic",
	["Troll"] = "Legendary",
	["Sheesh"] = "Rare",
	["Headless"] = "Epic",
	["HypeHype"] = "Epic",
	["Break"] = "Epic",
	["TPose"] = "Rare",
	["Moves"] = "Limited",
	["Helicopter"] = "Rare",
	["Confused"] = "Rare",
	["Snowball"] = "Limited",
	["Juggle"] = "Limited",
	["Steps"] = "Limited",
	["Rin"] = "Limited",
	["Sae"] = "Limited",
	["Snowglobe"] = "Limited",
	["Sleigh"] = "Limited",
	["Yum"] = "Limited",
	["Santa Laugh"] = "Limited",
	["Present"] = "Limited",
	["T Pose Walk"] = "Limited",
	["Hitboxes"] = "Limited",
	["Cat!"] = "Limited",
	["Crow!"] = "Limited",
	["Dragon Ride"] = "Limited",
	["ROAR"] = "Limited",
	["Unlimited Strength"] = "Limited",
	["Friendly Heart"] = "Limited",
	["Ultra Instinct"] = "Gamepass",
	["Bizarre"] = "Gamepass",
	["Six Eyes"] = "Gamepass",
	["Ninja Run"] = "Gamepass",
	["Crying"] = "Gamepass",
	["Money Rain"] = "Gamepass",
	["Laugh"] = "Gamepass",
	["L Dance"] = "Gamepass"
}

--- Script 2 ---
local v_u_1 = game:GetService("ReplicatedStorage")
local v_u_2 = game:GetService("UserInputService")
game:GetService("PathfindingService")
local v_u_3 = game:GetService("Players")
local v_u_4 = game:GetService("RunService")
local v_u_5 = game:GetService("TweenService")
local v_u_6 = game:GetService("GuiService")
local v_u_7 = game:GetService("Debris")
game:GetService("CollectionService")
local v_u_8 = require(v_u_1.Packages.Knit)
local v_u_9 = require(v_u_1.Shared.Essentials)
local v_u_10 = require(v_u_1.Shared.Trove)
require(v_u_1.Shared.Popup)
local v_u_11 = game.Players.LocalPlayer
local v_u_12 = v_u_11.Character or v_u_11.CharacterAdded:Wait()
local v_u_13 = v_u_12:WaitForChild("Humanoid")
local v_u_14 = v_u_12:WaitForChild("HumanoidRootPart")
local v_u_15 = workspace.CurrentCamera
local v_u_16 = 50
local v_u_17 = 1
local v_u_18 = 0
local v_u_19 = false
local v_u_20 = false
local v_u_21 = tick()
local v_u_22 = tick()
local v_u_23 = tick()
local v_u_24 = tick()
local v25 = v_u_8.CreateController({
	["Name"] = "BallController"
})
local function v_u_43(p26, p27)
	local v28 = workspace:FindFirstChild("Football")
	local v29
	if v28 then
		v29 = -(workspace.Gravity - 60 - v28.Mass / 20)
	else
		v29 = -(workspace.Gravity - 75)
	end
	local v30 = v29 * 0.5
	local v31 = p26.Y
	local v32 = p27.Y
	local v33 = -v31
	local v34 = v31 * v31 - 4 * v30 * v32
	local v35 = (v33 + math.sqrt(v34)) / (2 * v30)
	local v36 = -v31
	local v37 = v31 * v31 - 4 * v30 * v32
	local v38 = (v36 - math.sqrt(v37)) / (2 * v30)
	if v35 < v38 then
		v35 = v38
	end
	local v39 = p26.x
	local v40 = p26.Z
	local v41 = p27 + Vector3.new(v39, 0, v40) * v35
	local v42 = -p27.Y
	return v41 + Vector3.new(0, v42, 0)
end
local v_u_44 = tick()
function v25.Shoot(p_u_45)
	-- upvalues: (ref) v_u_14, (ref) v_u_44, (ref) v_u_12, (copy) v_u_11, (copy) v_u_5, (ref) v_u_13, (copy) v_u_7, (copy) v_u_1, (ref) v_u_16, (copy) v_u_15, (ref) v_u_19, (ref) v_u_18, (copy) v_u_4
	if v_u_14.AssemblyRootPart == v_u_14 then
		if v_u_44 <= tick() then
			if p_u_45.ShootTrove then
				p_u_45.ShootTrove:Disconnect()
			end
			v_u_44 = tick() + 1
			p_u_45.HoldingShoot = true
			local v_u_46 = v_u_12.Values.HasBall.Value
			p_u_45.Animations:StopAnims()
			p_u_45.Animations.Shots.Shoot:AdjustSpeed(1)
			if v_u_12.Values.Goalie.Value and v_u_12.Values.IsInPenalty.Value then
				p_u_45.Animations.Movement.ThrowBall.Priority = Enum.AnimationPriority.Action3
				p_u_45.Animations.Movement.ThrowBall:Play()
				p_u_45.Animations.Movement.ThrowBall:AdjustSpeed(1.35)
				p_u_45.Animations.Ball.ThrowBall.Priority = Enum.AnimationPriority.Action3
				p_u_45.Animations.Ball.ThrowBall:Play()
				p_u_45.Animations.Ball.ThrowBall:AdjustSpeed(1.35)
			else
				p_u_45.Animations.Shots.Shoot.Priority = Enum.AnimationPriority.Action3
				p_u_45.Animations.Shots.Shoot:Play()
				p_u_45.Animations.Shots.Shoot:AdjustSpeed(1)
			end
			v_u_11.PlayerGui.ForceBar.Enabled = true
			local v47 = v_u_5:Create(v_u_13, TweenInfo.new(0.25, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {
				["CameraOffset"] = Vector3.new(1.25, 1.5, 0)
			})
			v47:Play()
			v_u_7:AddItem(v47, 0.25)
			local v_u_48 = v_u_12:GetDescendants()
			for _, v49 in pairs(v_u_48) do
				if v49.Name ~= "Football" and (v49.Name ~= "TrajectoryLine" and (v49.Name ~= "DiveHitbox" and (v49.Name ~= "Activate" and (v_u_1.Assets.Vfx:FindFirstChild(v49.Name) == nil and (v49.Name:match("ball") == false and (v49.Name ~= "Hitbox" and (v49.Parent.Name ~= "Football" and (v49:IsA("BasePart") and (v49.Name ~= "HumanoidRootPart" and (v49.Parent == v_u_12 or (v49.Parent.Name == "Handle" or v49.Name == "Handle"))))))))))) and not v49:GetAttribute("Invis") then
					v49.Transparency = 0.45
				end
			end
			local function v_u_55(p50)
				-- upvalues: (ref) v_u_44, (ref) v_u_5, (ref) v_u_13, (ref) v_u_7, (ref) v_u_12, (ref) v_u_16, (copy) p_u_45, (ref) v_u_15, (ref) v_u_19, (copy) v_u_46, (ref) v_u_11, (ref) v_u_18, (ref) v_u_48, (ref) v_u_1
				v_u_44 = tick() + 0.4
				local v51 = v_u_5:Create(v_u_13, TweenInfo.new(0.25, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {
					["CameraOffset"] = Vector3.new(0, 0, 0)
				})
				v51:Play()
				v_u_7:AddItem(v51, 0.25)
				if v_u_12.Values.HasBall.Value and not p50 then
					if v_u_12.Values.Goalie.Value and v_u_12.Values.IsInPenalty.Value then
						local v_u_52 = v_u_16
						task.delay(0.2, function()
							-- upvalues: (ref) p_u_45, (copy) v_u_52, (ref) v_u_15
							p_u_45.BallService.Shoot:Fire(v_u_52, nil, nil, v_u_15.CFrame.LookVector)
						end)
					else
						if v_u_19 then
							return
						end
						local v_u_53 = v_u_16
						if v_u_46 == false then
							p_u_45.Animations:StopAnims()
							p_u_45.Animations.Shots.Volley.Priority = Enum.AnimationPriority.Action3
							p_u_45.Animations.Shots.Volley:Play()
							p_u_45.Animations.Shots.Volley:AdjustSpeed(1.15)
							p_u_45.Animations.Ball.Volley.Priority = Enum.AnimationPriority.Action3
							p_u_45.Animations.Ball.Volley:Play()
							p_u_45.Animations.Ball.Volley:AdjustSpeed(1.15)
							task.delay(0.2, function()
								-- upvalues: (ref) p_u_45, (copy) v_u_53, (ref) v_u_15
								p_u_45.BallService.Shoot:Fire(v_u_53, nil, nil, v_u_15.CFrame.LookVector)
							end)
						else
							p_u_45.BallService.Shoot:Fire(v_u_16, nil, nil, v_u_15.CFrame.LookVector)
						end
					end
				end
				v_u_11.PlayerGui.ForceBar.Enabled = false
				p_u_45.Animations.Shots.Shoot:AdjustSpeed(1)
				p_u_45.Animations.Movement.ThrowBall:AdjustSpeed(1)
				p_u_45.Animations.Ball.ThrowBall:AdjustSpeed(1)
				v_u_16 = 50
				v_u_18 = 0
				task.spawn(function()
					-- upvalues: (ref) v_u_48, (ref) v_u_1, (ref) v_u_12
					if v_u_48 then
						for _, v54 in pairs(v_u_48) do
							if v54 ~= nil and (v54.Parent ~= nil and (v54:IsA("BasePart") and (v54.Name ~= "DiveHitbox" and (v54.Name ~= "TrajectoryLine" and (v54.Name ~= "Activate" and (v_u_1.Assets.Vfx:FindFirstChild(v54.Name) == nil and (v54.Name ~= "Hitbox" and (v54.Name ~= "HumanoidRootPart" and (v54.Parent == v_u_12 or (v54.Parent.Name == "Handle" or v54.Name == "Handle")))))))))) and not (v54.Name:match("ball") or v54:GetAttribute("Invis")) then
								v54.Transparency = 0
							end
						end
						table.clear(v_u_48)
						v_u_48 = nil
					end
				end)
				p_u_45.HoldingShoot = false
				p_u_45.ShootTrove:Disconnect()
			end
			local v_u_56 = 0
			p_u_45.ShootTrove = v_u_4.Heartbeat:Connect(function(p57)
				-- upvalues: (ref) v_u_16, (ref) v_u_18, (ref) v_u_56, (copy) p_u_45, (ref) v_u_11, (copy) v_u_46, (ref) v_u_12, (copy) v_u_55
				v_u_16 = v_u_16 + p57 * 125
				v_u_18 = v_u_18 + p57 * 45
				v_u_56 = v_u_56 + p57 * 10
				if v_u_56 >= 2.1 then
					p_u_45.Animations.Movement.ThrowBall:AdjustSpeed(0)
					p_u_45.Animations.Shots.Shoot:AdjustSpeed(0)
					p_u_45.Animations.Ball.ThrowBall:AdjustSpeed(0)
				end
				v_u_11.PlayerGui.ForceBar.ForceBarBackground.BG.Bar.UIGradient.Offset = Vector2.new(0, 1 - (v_u_16 - 50) / 60)
				if v_u_46 == false and v_u_12.Values.HasBall.Value then
					if v_u_12:FindFirstChild("Ring") then
						v_u_12.Ring:Destroy()
					end
					v_u_16 = 110
					v_u_55()
					return
				elseif p_u_45.StatesController.States.Ability == true then
					print("cancel")
					v_u_55(true)
					return
				else
					if v_u_16 >= 110 then
						v_u_16 = 110
					end
					if v_u_18 >= 50 then
						v_u_55()
						return
					elseif p_u_45.HoldingShoot == false then
						v_u_55()
					end
				end
			end)
		end
	else
		return
	end
end
function v25.Pass(p58)
	-- upvalues: (ref) v_u_14, (ref) v_u_12
	if v_u_14.AssemblyRootPart == v_u_14 then
		if p58.Closest == nil then
			return
		elseif v_u_12.Values.HasBall.Value ~= false then
			local _ = p58.Closest
			p58.Animations:StopAnims()
			p58.Animations.Shots.Shoot.Priority = Enum.AnimationPriority.Action4
			p58.Animations.Shots.Shoot:Play()
			p58.BallService.Pass:Fire()
		end
	else
		return
	end
end
function v25.Slide(p_u_59)
	-- upvalues: (ref) v_u_14, (ref) v_u_12, (ref) v_u_22, (copy) v_u_11, (copy) v_u_10, (copy) v_u_1, (copy) v_u_4
	if v_u_14.AssemblyRootPart == v_u_14 then
		if v_u_12.Values.Sliding.Value then
			return
		elseif v_u_12.Values.HasBall.Value then
			return
		elseif v_u_12.Values.Dribbling.Value then
			return
		elseif p_u_59.HoldingShoot then
			return
		elseif v_u_22 > tick() then
			return
		elseif v_u_11.PlayerStats.Stamina.Value > 10 then
			if p_u_59.SlideTrove then
				p_u_59.SlideTrove:Destroy()
			end
			p_u_59.StaminaService.DecreaseStamina:Fire(10)
			p_u_59.Animations:StopAnims()
			p_u_59.Animations.Movement.Slide.Priority = Enum.AnimationPriority.Action2
			p_u_59.Animations.Movement.Slide:Play()
			p_u_59.Animations.Movement.Slide:AdjustSpeed(1.35)
			if v_u_11.PlayerStats.Flow.Value == "Snake" and v_u_11.PlayerStats.InFlow.Value then
				v_u_22 = tick() + 1.8
			else
				v_u_22 = tick() + 3
			end
			p_u_59.SlideTrove = v_u_10.new()
			local v_u_60 = Instance.new("BodyVelocity")
			v_u_60.Parent = v_u_14
			v_u_60.MaxForce = Vector3.new(inf, inf, inf)
			p_u_59.SlideTrove:Add(v_u_60)
			local v61 = Instance.new("BodyGyro")
			v61.Parent = v_u_14
			v61.MaxTorque = Vector3.new(inf, inf, inf)
			p_u_59.SlideTrove:Add(v61)
			local v62 = v_u_14.CFrame.LookVector:Dot((v_u_1.Football.Value.Position - v_u_14.Position).Unit)
			local v63 = math.acos(v62)
			local v64 = v63 < 1.5707963267948966
			local v65 = v63 < 1.9039955476301778
			local v66 = v_u_14.CFrame.LookVector
			local v67 = p_u_59.AbilityController.Mode == "Defensive Mode" and v_u_11.PlayerStats.Style.Value == "Reo" and 75 or 65
			local v_u_68 = v_u_11.PlayerStats.Flow.Value == "Crow" and v_u_11.PlayerStats.InFlow.Value and 72 or v67
			local v69
			if v_u_1.Football.Value.Parent == workspace then
				local v70 = (v_u_1.Football.Value.Position + v_u_1.Football.Value.AssemblyLinearVelocity - v_u_14.Position).Unit * 1
				v69 = v_u_1.Football.Value.Position.Y > 13 and v_u_1.Football.Value.AssemblyLinearVelocity.Magnitude > 10 and Vector3.new(0, 0, 0) or v70
			else
				local v71 = (v_u_1.Football.Value.Position + v_u_1.Football.Value.Char.Value.HumanoidRootPart.AssemblyLinearVelocity - v_u_14.Position).Unit * 1
				local v72 = v_u_1.Football.Value.Position.Y > 11 and v_u_1.Football.Value.Char.Value.HumanoidRootPart.AssemblyLinearVelocity.Magnitude > 10 and Vector3.new(0, 0, 0) or v71
				local v73 = v_u_1.Football.Value.Char.Value.HumanoidRootPart.CFrame.LookVector:Dot((v_u_14.Position - v_u_1.Football.Value.Char.Value.HumanoidRootPart.Position).Unit)
				v69 = math.acos(v73) < 1.5707963267948966 and Vector3.new(0, 0, 0) or v72
			end
			local v74 = v_u_1.Football.Value.AssemblyLinearVelocity.Magnitude <= 20 and Vector3.new(0, 0, 0) or v69
			local v75 = v74.X
			local v76 = v74.Z
			local v77 = Vector3.new(v75, 0, v76)
			if v65 and v64 then
				v66 = v66 + v77
			end
			local v_u_78 = v66.Unit
			p_u_59.BallService.Slide:Fire()
			p_u_59.SlideTrove:Connect(v_u_4.Heartbeat, function(p79)
				-- upvalues: (copy) v_u_60, (ref) v_u_78, (ref) v_u_68, (ref) v_u_12, (copy) p_u_59
				v_u_60.Velocity = v_u_78 * v_u_68
				v_u_68 = v_u_68 - p79 * 60
				if v_u_68 <= 10 or v_u_12.IsRagdoll.Value then
					p_u_59.SlideTrove:Destroy()
					p_u_59.StatesController.States.Running = true
				end
			end)
		end
	else
		return
	end
end
function v25.Dribble(p80)
	-- upvalues: (ref) v_u_12, (ref) v_u_23, (copy) v_u_11, (ref) v_u_17
	if v_u_12.Values.Sliding.Value then
		return
	elseif v_u_12.Values.Dribbling.Value then
		return
	elseif v_u_12.Values.HasBall.Value == false then
		return
	elseif v_u_23 > tick() then
		return
	elseif v_u_11.PlayerStats.Stamina.Value > 10 then
		if p80.SlideTrove then
			p80.SlideTrove:Destroy()
		end
		p80.StaminaService.DecreaseStamina:Fire(10)
		p80.Animations:StopAnims()
		p80.Animations.Dribbles[v_u_11.PlayerStats.Style.Value].Priority = Enum.AnimationPriority.Action3
		p80.Animations.Dribbles[v_u_11.PlayerStats.Style.Value]:Play()
		p80.Animations.Ball[v_u_11.PlayerStats.Style.Value .. "Dribble"].Priority = Enum.AnimationPriority.Action3
		p80.Animations.Ball[v_u_11.PlayerStats.Style.Value .. "Dribble"]:Play()
		local v81 = v_u_11.PlayerStats.Style.Value == "Bachira" and v_u_11.PlayerStats.InAwakening.Value and 2 or 3
		if v_u_11.PlayerStats.Flow.Value == "Monster" and v_u_11.PlayerStats.InFlow.Value then
			v81 = v81 / 1.25
		end
		v_u_17 = v_u_17 - 1
		local v82
		if v_u_17 <= 0 then
			v_u_17 = 1
			if v_u_11.PlayerStats.Flow.Value == "Awakened Genius" and v_u_11.PlayerStats.InFlow.Value then
				v_u_17 = 2
				v82 = 3
			else
				v82 = 3
			end
		else
			v82 = v_u_11.PlayerStats.Flow.Value == "Awakened Genius" and v_u_11.PlayerStats.InFlow.Value and 1 or v81
		end
		v_u_23 = tick() + v82
		p80.BallService.Dribble:Fire()
	end
end
function v25.Flick(p_u_83)
	-- upvalues: (copy) v_u_11, (ref) v_u_19, (ref) v_u_21
	if v_u_11.Character.Values.HasBall.Value == false then
		return
	elseif v_u_11.PlayerStats.Stamina.Value > 20 then
		v_u_19 = true
		v_u_21 = tick()
		p_u_83.Animations:StopAnims()
		p_u_83.Animations.Flicks.Flick.Priority = Enum.AnimationPriority.Action3
		p_u_83.Animations.Flicks.Flick:Play()
		p_u_83.Animations.Ball.Flick.Priority = Enum.AnimationPriority.Action3
		p_u_83.Animations.Ball.Flick:Play()
		if v_u_11.Character.Values.HasBall.Value then
			p_u_83.BallService.Shoot:Fire(50, 25, "Flick")
		end
		task.delay(0.35, function()
			-- upvalues: (ref) v_u_11, (copy) p_u_83, (ref) v_u_19
			if v_u_11.Character.Values.HasBall.Value then
				p_u_83.BallService.Shoot:Fire(50, 25, "FlickKick")
			else
				v_u_19 = false
			end
		end)
	end
end
function v25.Bicycle(p_u_84)
	-- upvalues: (ref) v_u_24, (copy) v_u_11, (ref) v_u_20, (ref) v_u_12
	if v_u_24 > tick() then
		return
	elseif v_u_11.PlayerStats.Stamina.Value > 30 then
		v_u_24 = tick() + 5
		v_u_20 = true
		p_u_84.BallService.Dribble:Fire()
		p_u_84.StatesController.States.Bicycle = true
		p_u_84.Animations:StopAnims()
		p_u_84.Animations.Bicycles.Bicycle.Priority = Enum.AnimationPriority.Action3
		p_u_84.Animations.Bicycles.Bicycle:Play()
		p_u_84.Animations.Ball.Bicycle.Priority = Enum.AnimationPriority.Action3
		p_u_84.Animations.Ball.Bicycle:Play()
		p_u_84.BallService.Shoot:Fire(170, nil, "BicycleState")
		task.delay(0.65, function()
			-- upvalues: (ref) v_u_12, (copy) p_u_84, (ref) v_u_20
			if v_u_12.Values.HasBall.Value then
				p_u_84.BallService.Shoot:Fire(170, 30, "Bicycle")
			else
				v_u_20 = false
			end
		end)
		task.delay(0.85, function()
			-- upvalues: (copy) p_u_84
			p_u_84.StatesController.States.Bicycle = false
		end)
	end
end
function v25.ResetChecks(p_u_85)
	-- upvalues: (copy) v_u_10, (copy) v_u_11, (copy) v_u_2, (ref) v_u_13
	if p_u_85.NewTrove then
		p_u_85.NewTrove:Destroy()
	end
	p_u_85.NewTrove = v_u_10.new()
	p_u_85.NewTrove:Connect(v_u_11.Character.Values:WaitForChild("IsInPenalty"):GetPropertyChangedSignal("Value"), function()
		-- upvalues: (ref) v_u_11
		v_u_11.PlayerGui.Mobile.NoBall.Dive.Visible = false
		if v_u_11.Character.Values.IsInPenalty.Value and v_u_11.Character.Values.Goalie.Value then
			v_u_11.PlayerGui.Mobile.NoBall.Dive.Visible = true
		end
	end)
	p_u_85.NewTrove:Connect(v_u_11.Character.Values.HasBall:GetPropertyChangedSignal("Value"), function()
		-- upvalues: (ref) v_u_11, (ref) v_u_2
		if v_u_11.Character.Values.HasBall.Value then
			if v_u_2.TouchEnabled then
				v_u_11.PlayerGui.Mobile.Enabled = true
				v_u_11.PlayerGui.Mobile.NoBall.Visible = false
				v_u_11.PlayerGui.Mobile.Ball.Visible = true
				return
			end
		elseif v_u_2.TouchEnabled then
			v_u_11.PlayerGui.Mobile.Enabled = true
			v_u_11.PlayerGui.Mobile.NoBall.Visible = true
			v_u_11.PlayerGui.Mobile.Ball.Visible = false
		end
	end)
	p_u_85.NewTrove:Connect(v_u_13.StateChanged, function(_, p86)
		-- upvalues: (copy) p_u_85
		if p86 == Enum.HumanoidStateType.Jumping then
			p_u_85:Flick()
		end
	end)
end
function v25.DragBall(p_u_87, p_u_88)
	-- upvalues: (copy) v_u_4, (copy) v_u_1
	if p_u_87.Drag then
		p_u_87.Drag:Disconnect()
	end
	local v_u_89 = 0.999
	p_u_87.Drag = v_u_4.Heartbeat:Connect(function(p90)
		-- upvalues: (ref) v_u_1, (copy) p_u_87, (copy) p_u_88, (ref) v_u_89
		if v_u_1.Football.Value.Parent == workspace then
			if v_u_1.Football.Value.OnPlayer.Value then
				p_u_87.Drag:Disconnect()
			else
				if p_u_88.Position.Y <= 18 then
					local _ = p_u_88.AssemblyLinearVelocity
					v_u_89 = v_u_89 - p90 / 50
					local v91 = p_u_88
					local v92 = p_u_88.AssemblyLinearVelocity.X * v_u_89
					local v93 = p_u_88.AssemblyLinearVelocity.Y
					local v94 = p_u_88.AssemblyLinearVelocity.Z * v_u_89
					v91.AssemblyLinearVelocity = Vector3.new(v92, v93, v94)
				end
				if p_u_88.Position.Y < 27 and p_u_88.Position.Y > 8 then
					local v95 = p_u_88
					local v96 = v95.AssemblyLinearVelocity
					local v97 = 82 * p90
					v95.AssemblyLinearVelocity = v96 + Vector3.new(0, v97, 0)
				end
				if p_u_88.AssemblyLinearVelocity.Magnitude <= 10 then
					p_u_87.Drag:Disconnect()
				end
			end
		else
			p_u_87.Drag:Disconnect()
			return
		end
	end)
end
function v25.LocalDragBall(p_u_98, p_u_99)
	-- upvalues: (copy) v_u_10, (copy) v_u_4, (copy) v_u_1
	if p_u_98.LocalDrag then
		p_u_98.LocalDrag:Destroy()
	end
	p_u_98.LocalDrag = v_u_10.new()
	local v_u_100 = 0.999
	p_u_98.LocalDrag:Connect(v_u_4.Heartbeat, function(p101)
		-- upvalues: (ref) v_u_1, (copy) p_u_98, (copy) p_u_99, (ref) v_u_100
		if v_u_1.Football.Value.Parent == workspace then
			if v_u_1.Football.Value.OnPlayer.Value then
				p_u_98.LocalDrag:Destroy()
			else
				if p_u_99.Position.Y <= 20 then
					local _ = p_u_99.AssemblyLinearVelocity
					v_u_100 = v_u_100 - p101 / 40
					local v102 = p_u_99
					v102.AssemblyLinearVelocity = v102.AssemblyLinearVelocity * v_u_100
				elseif p_u_99.Position.Y >= 33 then
					local v103 = p_u_99
					local v104 = v103.AssemblyLinearVelocity
					local v105 = 5 * p101
					v103.AssemblyLinearVelocity = v104 + Vector3.new(0, v105, 0)
				end
				if p_u_99.AssemblyLinearVelocity.Magnitude <= 10 then
					p_u_98.LocalDrag:Destroy()
				end
			end
		else
			p_u_98.LocalDrag:Destroy()
			return
		end
	end)
end
function v25.CheckInput(p_u_106)
	-- upvalues: (copy) v_u_8, (copy) v_u_2, (copy) v_u_11, (ref) v_u_12, (copy) v_u_1
	local v_u_107 = tick()
	p_u_106.Awakening = v_u_8.GetController("AwakeningController")
	p_u_106.Effects = v_u_8.GetService("EffectsService")
	p_u_106.Settings = v_u_8.GetController("Settings")
	p_u_106.Camera = v_u_8.GetController("CameraController")
	if v_u_2.TouchEnabled then
		local v108 = v_u_11.PlayerGui:WaitForChild("Mobile"):GetDescendants()
		for _, v_u_109 in pairs(v108) do
			if v_u_109:IsA("ImageButton") ~= false then
				p_u_106.BaseTrove:Connect(v_u_109.MouseButton1Down, function()
					-- upvalues: (copy) p_u_106, (ref) v_u_11, (ref) v_u_12, (copy) v_u_109
					if p_u_106.Camera.Cutscene then
						return
					elseif v_u_11.Team == game.Teams.Visitor then
						return
					elseif v_u_12.IsRagdoll.Value then
						return
					elseif not p_u_106.StatesController.States.Ability then
						if v_u_109.Name == "Shoot" then
							p_u_106:Shoot()
						end
					end
				end)
				p_u_106.BaseTrove:Connect(v_u_109.MouseButton1Click, function()
					-- upvalues: (copy) p_u_106, (ref) v_u_11, (ref) v_u_12, (copy) v_u_109, (ref) v_u_107, (ref) v_u_1
					if p_u_106.Camera.Cutscene then
						return
					elseif v_u_11.Team == game.Teams.Visitor then
						return
					elseif v_u_12.IsRagdoll.Value then
						return
					elseif p_u_106.StatesController.States.Ability then
						return
					else
						local v110 = v_u_12.Values.Goalie.Value
						if v110 then
							v110 = v_u_12.Values.IsInPenalty.Value
						end
						if v_u_109.Name == "Run" then
							p_u_106.StatesController.States.Running = not p_u_106.StatesController.States.Running
							return
						elseif v_u_109.Name == "Bicycle" then
							p_u_106:Bicycle()
							return
						elseif v_u_109.Name == "Pass" then
							p_u_106:Pass()
							return
						elseif v_u_109.Name == "Dribble" and not v110 then
							p_u_106:Dribble()
							return
						elseif v_u_109.Name == "Slide" then
							p_u_106:Slide()
							return
						elseif v_u_109.Name == "Awaken" then
							p_u_106.Awakening:Awakening()
							return
						elseif v_u_109.Name == "Shoot" then
							p_u_106.HoldingShoot = false
						elseif v_u_109.Name == "Request" then
							if v_u_107 > tick() then
								return
							end
							v_u_107 = tick() + 3
							p_u_106.Effects.Vfx:Fire(v_u_1.Effects.Pass, {
								["Char"] = "as"
							})
							p_u_106.Animations:StopAnims()
							p_u_106.Animations.Movement.Request.Priority = Enum.AnimationPriority.Action2
							p_u_106.Animations.Movement.Request:Play()
						end
					end
				end)
				if v_u_109.Name == "Shoot" then
					p_u_106.BaseTrove:Connect(v_u_109.MouseButton1Up, function()
						-- upvalues: (copy) p_u_106
						p_u_106.HoldingShoot = false
					end)
				end
			end
		end
	end
	p_u_106.BaseTrove:Connect(v_u_2.InputBegan, function(p111, p112)
		-- upvalues: (copy) p_u_106, (ref) v_u_11, (ref) v_u_12, (ref) v_u_107, (ref) v_u_1
		if p112 then
			return
		elseif p_u_106.Camera.Cutscene then
			return
		elseif v_u_11.Team == game.Teams.Visitor then
			return
		elseif v_u_12.IsRagdoll.Value then
			return
		elseif not p_u_106.StatesController.States.Ability then
			if p111.KeyCode == Enum.KeyCode.LeftShift or p111.KeyCode == Enum.KeyCode.ButtonL2 then
				if p_u_106.Settings.SettingsData.RunLock == true then
					p_u_106.StatesController.States.Running = not p_u_106.StatesController.States.Running
				else
					p_u_106.StatesController.States.Running = true
				end
			end
			local v113 = v_u_12.Values.Goalie.Value
			if v113 then
				v113 = v_u_12.Values.IsInPenalty.Value
			end
			if p111.UserInputType == Enum.UserInputType.MouseButton1 or p111.KeyCode == Enum.KeyCode.ButtonR2 then
				p_u_106:Shoot()
			elseif p111.UserInputType == Enum.UserInputType.MouseButton2 or p111.KeyCode == Enum.KeyCode.ButtonL1 then
				p_u_106:Pass()
			elseif p111.KeyCode == Enum.KeyCode[p_u_106.Settings.Keybinds.PC.Slide] or p111.KeyCode == Enum.KeyCode[p_u_106.Settings.Keybinds.Console.Slide] then
				p_u_106:Slide()
			end
			if (p111.KeyCode == Enum.KeyCode[p_u_106.Settings.Keybinds.PC.Dribble] or p111.KeyCode == Enum.KeyCode[p_u_106.Settings.Keybinds.Console.Dribble]) and not v113 then
				p_u_106:Dribble()
			elseif p111.KeyCode ~= Enum.KeyCode.F then
				local _ = p111.KeyCode == Enum.KeyCode.ButtonL1
			end
			if p111.KeyCode == Enum.KeyCode[p_u_106.Settings.Keybinds.PC.Request] or p111.KeyCode == Enum.KeyCode[p_u_106.Settings.Keybinds.Console.Request] then
				if v_u_107 > tick() then
					return
				end
				v_u_107 = tick() + 3
				p_u_106.Effects.Vfx:Fire(v_u_1.Effects.Pass, {
					["Char"] = "as"
				})
				p_u_106.Animations:StopAnims()
				p_u_106.Animations.Movement.Request.Priority = Enum.AnimationPriority.Action2
				p_u_106.Animations.Movement.Request:Play()
			end
		end
	end)
	p_u_106.BaseTrove:Connect(v_u_2.InputEnded, function(p114, p115)
		-- upvalues: (copy) p_u_106
		if not p115 then
			if p114.UserInputType == Enum.UserInputType.MouseButton1 or p114.KeyCode == Enum.KeyCode.ButtonR2 then
				p_u_106.HoldingShoot = false
			end
			if (p114.KeyCode == Enum.KeyCode.LeftShift or p114.KeyCode == Enum.KeyCode.ButtonL2) and p_u_106.Settings.SettingsData.RunLock == false then
				p_u_106.StatesController.States.Running = false
			end
		end
	end)
end
function v25.Predict(p_u_116, p117, p118)
	-- upvalues: (ref) v_u_12, (copy) v_u_1, (copy) v_u_43, (copy) v_u_4
	if p_u_116.PredictOBJ then
		p_u_116.PredictOBJ:Destroy()
	end
	if p_u_116.PredictionTrove then
		p_u_116.PredictionTrove:Disconnect()
	end
	if v_u_12.Values.Goalie.Value and v_u_12.Values.IsInPenalty.Value then
		p_u_116.PredictOBJ = v_u_1.Assets.Misc.GkPredict:Clone()
		p_u_116.PredictOBJ.Parent = workspace
		local v119 = p_u_116.PredictOBJ
		local v120 = v_u_43(p117, p118).X
		local v121 = v_u_43(p117, p118).Z
		v119.Position = Vector3.new(v120, 10, v121)
		if p_u_116.PredictOBJ.Position.X < -226 then
			local v122 = p_u_116.PredictOBJ
			local v123 = p_u_116.PredictOBJ.Position.Z
			v122.Position = Vector3.new(-226, 10, v123)
		end
		if p_u_116.PredictOBJ.Position.X > 306 then
			local v124 = p_u_116.PredictOBJ
			local v125 = p_u_116.PredictOBJ.Position.Z
			v124.Position = Vector3.new(306, 10, v125)
		end
		local v_u_126 = tick() + 1
		p_u_116.PredictionTrove = v_u_4.Heartbeat:Connect(function(_)
			-- upvalues: (copy) p_u_116, (copy) v_u_126
			local v127 = workspace:FindFirstChild("Football")
			if v127 == nil then
				p_u_116.PredictOBJ:Destroy()
				p_u_116.PredictionTrove:Disconnect()
				return
			elseif v127.Position.Y <= 10 and v_u_126 < tick() then
				p_u_116.PredictOBJ:Destroy()
				p_u_116.PredictionTrove:Disconnect()
			end
		end)
	else
		p_u_116.PredictOBJ = v_u_1.Assets.Misc.Prediction:Clone()
		p_u_116.PredictOBJ.Parent = workspace
		p_u_116.PredictOBJ.Position = Vector3.new(0, 8, 0)
		local v_u_128 = tick() + 1
		p_u_116.PredictionTrove = v_u_4.Heartbeat:Connect(function(_)
			-- upvalues: (copy) p_u_116, (copy) v_u_128
			local v129 = workspace:FindFirstChild("Football")
			if v129 == nil then
				p_u_116.PredictOBJ:Destroy()
				p_u_116.PredictionTrove:Disconnect()
				return
			else
				local v130 = (v129.Position.Y - 8.5) / 3
				local v131 = math.clamp(v130, 1, 15)
				p_u_116.PredictOBJ.Size = Vector3.new(0.1, v131, v131)
				local v132 = p_u_116.PredictOBJ
				local v133 = v129.Position.X
				local v134 = v129.Position.Z
				v132.Position = Vector3.new(v133, 8.5, v134)
				if v129.Position.Y <= 10 and v_u_128 < tick() then
					p_u_116.PredictOBJ:Destroy()
					p_u_116.PredictionTrove:Disconnect()
				end
			end
		end)
	end
end
function v25.KnitStart(p_u_135)
	-- upvalues: (copy) v_u_8, (ref) v_u_14, (copy) v_u_11, (copy) v_u_10, (copy) v_u_4, (copy) v_u_3, (ref) v_u_19, (ref) v_u_20, (copy) v_u_15, (ref) v_u_13, (copy) v_u_1, (ref) v_u_16, (ref) v_u_17, (ref) v_u_12, (copy) v_u_6, (copy) v_u_9
	p_u_135.BallService = v_u_8.GetService("BallService")
	p_u_135.Animations = require(script.Parent.AnimatonController)
	p_u_135.StatesController = require(script.Parent.StatesController)
	p_u_135.AbilityController = v_u_8.GetController("AbilityController")
	p_u_135.StaminaService = v_u_8.GetService("StaminaService")
	p_u_135.Running = false
	p_u_135.Closest = nil
	p_u_135.Attach0 = Instance.new("Attachment")
	p_u_135.Attach0.Parent = workspace.Terrain
	p_u_135.Attach1 = Instance.new("Attachment")
	p_u_135.Attach1.Parent = workspace.Terrain
	p_u_135.Beam = Instance.new("Beam")
	p_u_135.Beam.Parent = workspace.Terrain
	p_u_135.Beam.Attachment0 = p_u_135.Attach0
	p_u_135.Beam.Attachment1 = p_u_135.Attach1
	p_u_135.BaseTrove:Connect(p_u_135.BallService.Pass, function(p_u_136)
		-- upvalues: (copy) p_u_135, (ref) v_u_14, (ref) v_u_11, (ref) v_u_10, (ref) v_u_4
		local v_u_137 = p_u_135.Closest
		local v138 = v_u_137.HumanoidRootPart.AssemblyLinearVelocity.X
		local v139 = v_u_137.HumanoidRootPart.AssemblyLinearVelocity.Z
		local v_u_140 = Vector3.new(v138, 0, v139)
		local v_u_141 = (v_u_137.HumanoidRootPart.Position + v_u_140 - v_u_14.Position).Unit + Vector3.new(0, 0.1, 0)
		local v142 = (v_u_137.HumanoidRootPart.Position - v_u_14.Position).Magnitude * 2.25
		local v_u_143 = math.clamp(v142, 30, 120)
		if p_u_135.AbilityController.Mode == "Offensive Mode" and v_u_11.PlayerStats.Style.Value == "Reo" then
			v_u_143 = v_u_143 * 1.2
		end
		p_u_136.AssemblyLinearVelocity = v_u_141 * v_u_143
		p_u_135:DragBall(p_u_136)
		local v_u_144 = tick()
		if p_u_135.PassTrove then
			p_u_135.PassTrove:Destroy()
		end
		if (v_u_137.HumanoidRootPart.Position - v_u_14.Position).Magnitude >= 40 then
			p_u_135.PassTrove = v_u_10.new()
			p_u_135.PassTrove:Connect(v_u_4.Heartbeat, function()
				-- upvalues: (copy) p_u_136, (ref) p_u_135, (copy) v_u_144, (ref) v_u_140, (copy) v_u_137, (ref) v_u_141, (ref) v_u_143, (ref) v_u_14, (ref) v_u_11
				if p_u_136.OnPlayer.Value then
					if p_u_135.PassTrove then
						p_u_135.PassTrove:Destroy()
					end
					return
				elseif tick() > v_u_144 + 0.15 then
					if p_u_135.PassTrove then
						p_u_135.PassTrove:Destroy()
					end
				else
					local v145 = v_u_137.HumanoidRootPart.AssemblyLinearVelocity.X
					local v146 = v_u_137.HumanoidRootPart.AssemblyLinearVelocity.Z
					v_u_140 = Vector3.new(v145, 0, v146)
					v_u_141 = v_u_141:Lerp((v_u_137.HumanoidRootPart.Position + v_u_140 - p_u_136.Position).Unit + Vector3.new(0, 0.22, 0), 1.5)
					v_u_143 = (v_u_137.HumanoidRootPart.Position - v_u_14.Position).Magnitude * 1.5
					local v147 = v_u_143
					v_u_143 = math.clamp(v147, 0, 120)
					if p_u_135.AbilityController.Mode == "Offensive Mode" and v_u_11.PlayerStats.Style.Value == "Reo" then
						v_u_143 = v_u_143 * 1.2
					end
					if v_u_11.PlayerStats.InAwakening.Value and v_u_11.PlayerStats.Style.Value == "Ice" then
						v_u_143 = v_u_143 * 1.25
					end
					p_u_136.AssemblyLinearVelocity = p_u_136.AssemblyLinearVelocity:Lerp(v_u_141 * v_u_143, 1)
				end
			end)
		end
	end)
	p_u_135.BaseTrove:Connect(p_u_135.BallService.Shoot, function(p_u_148, p149, p150)
		-- upvalues: (copy) p_u_135, (ref) v_u_3, (ref) v_u_11, (ref) v_u_19, (ref) v_u_14, (ref) v_u_20, (ref) v_u_15, (ref) v_u_13, (ref) v_u_1, (ref) v_u_16, (ref) v_u_4
		if p_u_135.CS then
			p_u_135.CS:Disconnect()
		end
		local v151 = p150 == nil and 0.3 or p150
		local v152 = v_u_3:GetPlayerFromCharacter(p_u_148.Before.Value)
		if v152 then
			if v152.PlayerStats.InFlow.Value and v152.PlayerStats.Flow.Value == "Ice" then
				p149 = p149 * 1.15
			end
			if v152.PlayerStats.InAwakening.Value and v152.PlayerStats.Style.Value == "Hiori" then
				p149 = p149 * 1.2
			end
		end
		if v_u_11.PlayerStats.InAwakening.Value and v_u_11.PlayerStats.Style.Value == "King" then
			p149 = p149 * 1.35
		end
		if p_u_135.AbilityController.Mode == "Offensive Mode" and v_u_11.PlayerStats.Style.Value == "Reo" then
			p149 = p149 * 1.1
		end
		local v153 = p149 * p_u_135.StatesController.ShotPowerMultiplier
		if v_u_19 then
			p_u_148.AssemblyLinearVelocity = (v_u_14.CFrame.LookVector + Vector3.new(0, 0.5, 0)) * v153
		elseif v_u_20 then
			local v154 = -v_u_14.CFrame.LookVector.X
			local v155 = v_u_14.CFrame.LookVector.Y + 0.25
			local v156 = -v_u_14.CFrame.LookVector.Z
			p_u_148.AssemblyLinearVelocity = Vector3.new(v154, v155, v156) * 120
		else
			local v157 = v_u_15.CFrame.LookVector
			if v_u_15.CFrame.LookVector.Y < -0.05 then
				if v_u_15.CFrame.LookVector.Y <= -0.5 then
					p_u_135.BallService.HasShot:Fire(true)
				else
					p_u_135.BallService.HasShot:Fire(false)
				end
				local v158 = v157.X
				local v159 = v157.Z
				v157 = Vector3.new(v158, -0.05, v159)
			else
				p_u_135.BallService.HasShot:Fire(false)
			end
			if v_u_13:GetState() == Enum.HumanoidStateType.Jumping or v_u_13:GetState() == Enum.HumanoidStateType.Freefall then
				if v_u_14.Anchored and v_u_11.PlayerStats.Style.Value == "Shidou" then
					return
				end
				if p_u_135.StatesController.States.Ability == false then
					p_u_135.Animations.Movement.Header.Priority = Enum.AnimationPriority.Action3
					p_u_135.Animations.Movement.Header:Play()
					if v_u_11.PlayerStats.InFlow.Value and v_u_11.PlayerStats.Flow.Value == "Demon Wings" then
						p_u_148.AssemblyLinearVelocity = (v157 + Vector3.new(0, v151, 0)) * v153 * 1.2
					else
						p_u_148.AssemblyLinearVelocity = (v157 + Vector3.new(0, v151, 0)) * v153
					end
				else
					if v_u_11.PlayerStats.Style.Value == "Gagamaru" then
						v_u_1.VfxSpawn:FireServer("Gagamaru header")
					else
						v_u_1.VfxSpawn:FireServer("ShidouHeader")
					end
					if v_u_11.PlayerStats.InFlow.Value and v_u_11.PlayerStats.Flow.Value == "Demon Wings" then
						p_u_148.AssemblyLinearVelocity = (v157 + Vector3.new(0, v151, 0)) * v153 * 1.4
					else
						p_u_148.AssemblyLinearVelocity = (v157 + Vector3.new(0, v151, 0)) * v153 * 1.2
					end
				end
			elseif v_u_11.PlayerStats.InFlow.Value and (v_u_11.PlayerStats.Flow.Value == "Gale Burst" and p_u_135.StatesController.States.Running) then
				p_u_148.AssemblyLinearVelocity = (v157 + Vector3.new(0, v151, 0)) * v153 * 1.25
			elseif v_u_11.PlayerStats.InFlow.Value and v_u_11.PlayerStats.Flow.Value == "Prodigy" then
				local v_u_160 = -(v_u_16 / 2.75)
				local v_u_161
				if v_u_11.Team == game.Teams.Home then
					if v_u_11.Character.HumanoidRootPart.Position.Z > workspace.Goals.Home.Position.Z then
						v_u_161 = v_u_11.Character.HumanoidRootPart.CFrame.RightVector
					else
						v_u_161 = -v_u_11.Character.HumanoidRootPart.CFrame.RightVector
					end
				elseif v_u_11.Character.HumanoidRootPart.Position.Z > workspace.Goals.Home.Position.Z then
					v_u_161 = -v_u_11.Character.HumanoidRootPart.CFrame.RightVector
				else
					v_u_161 = v_u_11.Character.HumanoidRootPart.CFrame.RightVector
				end
				p_u_148.AssemblyLinearVelocity = (v157 + Vector3.new(0, v151, 0) + v_u_161 / 2) * v153
				p_u_135.CS = v_u_4.Heartbeat:Connect(function(p162)
					-- upvalues: (ref) v_u_1, (ref) p_u_135, (ref) v_u_160, (ref) v_u_16, (copy) p_u_148, (ref) v_u_161
					if v_u_1.Football.Value.OnPlayer.Value then
						p_u_135.CS:Disconnect()
					end
					v_u_160 = v_u_160 + v_u_16 / 6 * p162
					if v_u_160 >= -(v_u_16 / 8) then
						p_u_135.CS:Disconnect()
					end
					p_u_148.AssemblyLinearVelocity = p_u_148.AssemblyLinearVelocity:Lerp(p_u_148.AssemblyLinearVelocity + v_u_161 * v_u_160, 6.5 * p162)
				end)
			else
				p_u_148.AssemblyLinearVelocity = (v157 + Vector3.new(0, v151, 0)) * v153
			end
		end
		v_u_19 = false
		v_u_20 = false
		p_u_135:DragBall(p_u_148)
	end)
	p_u_135.BaseTrove:Connect(p_u_135.BallService.Prediction, function(p163, p164)
		-- upvalues: (copy) p_u_135
		p_u_135:Predict(p163, p164)
	end)
	p_u_135.BaseTrove:Connect(v_u_11.PlayerStats.InFlow:GetPropertyChangedSignal("Value"), function()
		-- upvalues: (ref) v_u_11, (ref) v_u_17
		if v_u_11.PlayerStats.Flow.Value == "Awakened Genius" and v_u_11.PlayerStats.InFlow.Value then
			v_u_17 = 2
		end
	end)
	p_u_135.BaseTrove:Connect(v_u_4.Heartbeat, function(_)
		-- upvalues: (ref) v_u_12, (ref) v_u_11, (copy) p_u_135, (ref) v_u_3, (ref) v_u_6, (ref) v_u_9
		if v_u_12:WaitForChild("Values") == nil then
			return
		else
			if v_u_12:FindFirstChild("Football") then
				v_u_11.PlayerGui.Mobile.NoBall.Visible = false
				v_u_11.PlayerGui.Mobile.Ball.Visible = true
			else
				v_u_11.PlayerGui.Mobile.NoBall.Visible = true
				v_u_11.PlayerGui.Mobile.Ball.Visible = false
			end
			if v_u_12.Values.HasBall.Value == false then
				if p_u_135.Closest ~= nil then
					if p_u_135.Closest:FindFirstChild("Highlight") then
						p_u_135.Closest:FindFirstChild("Highlight"):Destroy()
					end
					p_u_135.Closest = nil
				end
				return
			elseif not v_u_12.IsRagdoll.Value then
				local v165 = v_u_3:GetPlayers()
				local v166 = {}
				for _, v167 in pairs(v165) do
					if v167.Character ~= nil and (v167.Team == v_u_11.Team and v167 ~= v_u_11) then
						local v168 = v167.Character
						table.insert(v166, v168)
					end
				end
				local v169 = nil
				local v170 = 9999
				for _, v171 in pairs(v166) do
					if v171.HumanoidRootPart ~= nil then
						local v172, v173 = workspace.CurrentCamera:WorldToScreenPoint(v171.HumanoidRootPart.Position)
						if v173 then
							local v174 = (Vector2.new(v172.X, v172.Y) - Vector2.new(workspace.CurrentCamera.ViewportSize.X / 2, workspace.CurrentCamera.ViewportSize.Y / 2 - v_u_6:GetGuiInset().Y / 2)).Magnitude
							if v169 == nil then
								v170 = v174
								v169 = v171
							elseif v174 < v170 then
								v170 = v174
								v169 = v171
							end
						end
					end
				end
				if p_u_135.Closest ~= nil then
					if p_u_135.Closest:FindFirstChild("Highlight") == nil then
						local v175 = v_u_9:Highlight(p_u_135.Closest)
						v175.Parent = p_u_135.Closest
						v175.OutlineTransparency = 0.5
						v175.FillTransparency = 0.5
					end
					if p_u_135.Closest ~= v169 and p_u_135.Closest:FindFirstChild("Highlight") then
						p_u_135.Closest:FindFirstChild("Highlight"):Destroy()
					end
				end
				p_u_135.Closest = v169
				table.clear(v166)
				table.clear(v165)
			end
		end
	end)
	p_u_135:CheckInput()
end
function v25.KnitInit(p_u_176)
	-- upvalues: (copy) v_u_10, (ref) v_u_16, (copy) v_u_11, (ref) v_u_14, (ref) v_u_12, (ref) v_u_13, (copy) v_u_15
	p_u_176.BaseTrove = v_u_10.new()
	p_u_176.NewTrove = v_u_10.new()
	v_u_16 = 50
	p_u_176.HoldingShoot = false
	v_u_11.PlayerGui.ForceBar.Adornee = v_u_14
	v_u_14:WaitForChild("Running").Volume = 0
	p_u_176.BaseTrove:Connect(v_u_11.CharacterAdded, function(p177)
		-- upvalues: (ref) v_u_12, (ref) v_u_13, (ref) v_u_14, (ref) v_u_11, (ref) v_u_15, (copy) p_u_176
		v_u_12 = p177
		v_u_13 = v_u_12:WaitForChild("Humanoid")
		v_u_14 = v_u_12:WaitForChild("HumanoidRootPart")
		v_u_11.PlayerGui.ForceBar.Adornee = v_u_14
		v_u_15.CameraType = Enum.CameraType.Custom
		v_u_15.CameraSubject = v_u_13
		p_u_176:ResetChecks()
		v_u_14:WaitForChild("Running").Volume = 0
	end)
	p_u_176.BaseTrove:Connect(game.Players.PlayerRemoving, function(p178)
		-- upvalues: (ref) v_u_11, (ref) v_u_12, (ref) v_u_14, (ref) v_u_13, (copy) p_u_176
		if p178 == v_u_11 then
			v_u_12 = nil
			v_u_14 = nil
			v_u_13 = nil
			p_u_176.BaseTrove:Destroy()
		end
	end)
	p_u_176:ResetChecks()
end
return v25

--- Script 3 ---

local v_u_1 = game:GetService("ReplicatedStorage")
local v_u_2 = game:GetService("MarketplaceService")
game:GetService("RunService")
local v_u_3 = game:GetService("Players")
local v_u_4 = v_u_3.LocalPlayer
local v_u_5 = v_u_4.Character or v_u_4.CharacterAdded:Wait()
local v_u_6 = v_u_5:FindFirstChildOfClass("Humanoid")
local v_u_7 = v_u_5:WaitForChild("HumanoidRootPart")
local _ = v_u_7:WaitForChild("RootJoint", 10).C0
local v_u_8 = nil
local v_u_9 = require(v_u_1.Packages.Knit)
local v_u_10 = require(v_u_1.Shared.Essentials)
local v_u_11 = require(v_u_1.Shared.Popup)
local v_u_12 = require(v_u_1.Shared.Trove)
local v_u_13 = require(v_u_1.Shared.PlrStyles)
local v_u_14 = require(v_u_1.Shared.Rarities)
local v_u_15 = require(v_u_1.Shared.SoundManager)
local v_u_16 = require(v_u_1.Shared.SytlesLotteryController)
local v17 = v_u_9.CreateController({
	["Name"] = "Styles"
})
local v_u_18 = {
	["1"] = 1936508687,
	["2"] = 1936508844,
	["3"] = 1936509000
}
local v_u_19 = {
	["1"] = 2671681719,
	["2"] = 2352505264,
	["3"] = 2671681840
}
local v_u_20 = tick()
local v_u_21 = 0
local v_u_22 = {
	["Mythic"] = {},
	["Legendary"] = {},
	["Epic"] = {},
	["Rare"] = {}
}
local v_u_23 = {
	["Rare"] = "rbxassetid://115415949340950",
	["Epic"] = "rbxassetid://99013252868230",
	["Legendary"] = "rbxassetid://111618869458274",
	["Mythic"] = "rbxassetid://111618869458274"
}
function v17.SpinSignals(p_u_24, p_u_25)
	-- upvalues: (copy) v_u_11, (copy) v_u_4, (copy) v_u_2, (ref) v_u_20, (copy) v_u_13, (ref) v_u_21, (copy) v_u_15, (copy) v_u_14, (copy) v_u_1, (ref) v_u_7, (copy) v_u_10
	local v_u_26 = false
	local v_u_27 = false
	local v_u_28 = {
		["Isagi"] = p_u_24.Animations.Awakening.IsagiPlr,
		["Bachira"] = p_u_24.Animations.Dribbles.Bachira,
		["King"] = p_u_24.Animations.Awakening.KingPlr,
		["Nagi"] = p_u_24.Animations.Awakening.NagiPlr,
		["Chigiri"] = p_u_24.Animations.Awakening.ChigiriPlr,
		["Shidou"] = p_u_24.Animations.Awakening.ShidouPlr,
		["Gagamaru"] = p_u_24.Animations.Awakening.GagamaruPlr,
		["Sae"] = p_u_24.Animations.Awakening.SaePlr,
		["Rin"] = p_u_24.Animations.Awakening.RinPlr,
		["Aiku"] = p_u_24.Animations.Awakening.AikuPlr,
		["Reo"] = p_u_24.Animations.Awakening.ReoPlr,
		["Yukimiya"] = p_u_24.Animations.Awakening.YukimiyaPlr,
		["Hiori"] = p_u_24.Animations.Awakening.HioriPlr,
		["Otoya"] = p_u_24.Animations.Awakening.IsagiPlr,
		["Karasu"] = p_u_24.Animations.Awakening.KarasuPlr,
		["Kunigami"] = p_u_24.Animations.Awakening.KunigamiPlr
	}
	local v_u_29 = false
	p_u_24.BaseTrove:Connect(p_u_25:WaitForChild("BG"):WaitForChild("Spin").MouseButton1Click, function()
		-- upvalues: (copy) p_u_24, (ref) v_u_11, (ref) v_u_4, (ref) v_u_26, (ref) v_u_27, (ref) v_u_2, (ref) v_u_20, (ref) v_u_13, (ref) v_u_29, (ref) v_u_21
		if p_u_24.SpinData.StyleSlots.Locked[p_u_24.SpinData.StyleSlots.SlotEquipped] then
			v_u_11.Popup(v_u_4, "This slot is locked!")
			return
		elseif v_u_26 then
			if require(script.Parent.Shop):HasGamepass("SkipSpins") then
				v_u_27 = true
				return
			elseif v_u_2:UserOwnsGamePassAsync(v_u_4.UserId, 965195377) then
				p_u_24.HasSkip = true
				v_u_27 = true
			else
				v_u_2:PromptGamePassPurchase(v_u_4, 965195377)
			end
		elseif v_u_20 > tick() then
			return
		elseif v_u_4.ProfileStats.Spins.Value <= 0 and v_u_4.ProfileStats.Money.Value < 2500 then
			v_u_4.PlayerGui.Style.BuySpins.Visible = true
			return
		elseif (v_u_13[v_u_4.PlayerStats.Style.Value].Rarity == "Mythic" or v_u_13[v_u_4.PlayerStats.Style.Value].Rarity == "Legendary") and v_u_29 == false then
			v_u_29 = true
			v_u_20 = tick() + 1
			v_u_11.Popup(v_u_4, "YOU ARE ABOUT TO SPIN A MYTHIC/LEGENDARY STYLE!")
		else
			v_u_29 = false
			v_u_4.PlayerGui.Style.BG.Close.Visible = false
			v_u_27 = false
			v_u_20 = tick() + 1
			v_u_21 = v_u_21 + 1
			p_u_24.StyleService.Spin:Fire()
		end
	end)
	p_u_24.BaseTrove:Connect(p_u_25.BG.LuckySpins.MouseButton1Click, function()
		-- upvalues: (copy) p_u_24, (ref) v_u_11, (ref) v_u_4, (ref) v_u_20, (ref) v_u_13, (ref) v_u_29, (ref) v_u_27, (copy) p_u_25
		if p_u_24.SpinData.StyleSlots.Locked[p_u_24.SpinData.StyleSlots.SlotEquipped] then
			v_u_11.Popup(v_u_4, "This slot is locked!")
			return
		elseif v_u_20 > tick() then
			return
		else
			v_u_20 = tick() + 1
			if (v_u_13[v_u_4.PlayerStats.Style.Value].Rarity == "Mythic" or v_u_13[v_u_4.PlayerStats.Style.Value].Rarity == "Legendary") and v_u_29 == false then
				v_u_29 = true
				v_u_20 = tick() + 1
				v_u_11.Popup(v_u_4, "YOU ARE ABOUT TO SPIN A MYTHIC/LEGENDARY STYLE!")
				return
			else
				v_u_29 = false
				if p_u_24.SpinData.LuckySpins > 0 then
					v_u_4.PlayerGui.Style.BG.Close.Visible = false
					v_u_27 = false
					p_u_24.StyleService.Spin:Fire(true)
				else
					p_u_25.BuyLucky.Visible = true
				end
			end
		end
	end)
	p_u_24.BaseTrove:Connect(p_u_24.StyleService.Spin, function(p30)
		-- upvalues: (copy) p_u_25, (ref) v_u_20, (ref) v_u_26, (ref) v_u_27, (ref) v_u_15, (ref) v_u_4, (ref) v_u_13, (ref) v_u_14, (copy) p_u_24, (copy) v_u_28, (ref) v_u_11, (ref) v_u_1, (ref) v_u_7, (ref) v_u_10, (ref) v_u_21
		p_u_25.BG.Spin.Text.Text = "SKIP"
		v_u_20 = tick() + 15
		v_u_26 = true
		local v31 = math.random(15, 20)
		for v32 = 1, v31 do
			if v_u_27 then
				break
			end
			v_u_15.SpawnSound("Spin", 0.35, v_u_4.PlayerGui, 1)
			local v33 = 0
			local v34 = ""
			for _, _ in pairs(v_u_13) do
				v33 = v33 + 1
			end
			local v35 = math.random(1, v33)
			local v36 = 1
			for _, v37 in pairs(v_u_13) do
				if v36 == v35 then
					v34 = v37
					break
				end
				v36 = v36 + 1
			end
			p_u_25.BG.StyleTxt.Text = v34.Name
			p_u_25.BG.Desc.Text = v34.Desc
			p_u_25.BG.StyleTxt.TextColor3 = v_u_14[v34.Rarity].Color
			local v38 = v32 / v31 / 2
			local v39 = math.clamp(v38, 0, 1.2)
			task.wait(v39)
		end
		v_u_4.PlayerGui.Style.BG.Close.Visible = true
		p_u_24.Animations:StopAnims()
		v_u_28[v_u_4.PlayerStats.Style.Value].Priority = Enum.AnimationPriority.Action4
		v_u_28[v_u_4.PlayerStats.Style.Value]:Play()
		local v40 = v_u_13[v_u_4.PlayerStats.Style.Value]
		v_u_11.Popup(v_u_4, "Acquired " .. v40.Name)
		v_u_15.SpawnSound("Gain", 0.5, v_u_4.PlayerGui, 1)
		require(v_u_1.Effects.SpawnVFX)({
			["Vfx"] = v_u_1.Assets.Vfx.Unlock,
			["Pos"] = v_u_7.CFrame,
			["Color"] = v_u_14[v40.Rarity].Color
		})
		v_u_26 = false
		v_u_27 = false
		v_u_20 = tick() + 0.5
		p_u_25.BG.Spin.Text.Text = "SPIN"
		p_u_25.BG.StyleTxt.Text = v40.Name
		p_u_25.BG.Desc.Text = v40.Desc
		p_u_25.BG.StyleTxt.TextColor3 = v_u_14[v40.Rarity].Color
		p_u_25.BG.SpinsLeft.Text = "Spins Left: " .. v_u_4.ProfileStats.Spins.Value
		p_u_25.BG.Money.Currency.Text = "$" .. v_u_10:formatNumberWithCommas(v_u_4.ProfileStats.Money.Value)
		if v_u_21 >= 50 then
			v_u_21 = 0
		end
		local v41 = p_u_25.BG.Money.Text
		local v42 = v_u_21
		local v43 = math.round(v42)
		v41.Text = "Pity " .. tostring(v43) .. "/50"
		if v_u_4.ProfileStats.Spins.Value <= 0 then
			p_u_25.BG.SpinsLeft.Text = "$2,500 = 1 Spin"
		end
		p_u_24:StyleSlot(p30)
	end)
end
function v17.StyleSlot(p44, p45)
	-- upvalues: (copy) v_u_4, (copy) v_u_1, (copy) v_u_13, (copy) v_u_14, (copy) v_u_10, (ref) v_u_21, (copy) v_u_23
	local v46 = v_u_4.PlayerGui:WaitForChild("Style")
	if p44.SpinData then
		table.clear(p44.SpinData)
	end
	if p45 then
		p44.SpinData = p45
	else
		p44.SpinData = v_u_1.Data:InvokeServer()
	end
	v46.BG.SpinsLeft.Text = "Spins Left: " .. v_u_4.ProfileStats.Spins.Value
	v46.BG.LuckySpins.Text.Text = "Lucky Spins: " .. p44.SpinData.LuckySpins
	if p44.SpinData.LuckySpins <= 0 then
		v46.BG.LuckySpins.Text.Text = "BUY LUCKY SPINS"
	end
	if v_u_4.ProfileStats.Spins.Value <= 0 then
		v46.BG.SpinsLeft.Text = "$2,500 = 1 Spin"
	end
	local v47 = v_u_13[v_u_4.PlayerStats.Style.Value]
	v46.BG.StyleTxt.Text = v47.Name
	v46.BG.Desc.Text = v47.Desc
	v46.BG.StyleTxt.TextColor3 = v_u_14[v47.Rarity].Color
	v46.BG.SpinsLeft.Text = "Spins Left: " .. v_u_4.ProfileStats.Spins.Value
	v46.BG.Money.Currency.Text = "$" .. v_u_10:formatNumberWithCommas(v_u_4.ProfileStats.Money.Value)
	v_u_21 = p44.SpinData.SpinsDone
	local v48 = v46.BG.Money.Text
	local v49 = v_u_21
	local v50 = math.round(v49)
	v48.Text = "Pity " .. tostring(v50) .. "/50"
	if v_u_4.ProfileStats.Spins.Value <= 0 then
		v46.BG.SpinsLeft.Text = "$2,500 = 1 Spin"
	end
	if p44.SpinData.StyleSlots.MaxSlot < 2 then
		v46.BG.Slots.ScrollingFrame.Slot3.Price.Visible = false
		v46.BG.Slots.ScrollingFrame.Slot3.State.Visible = false
		v46.BG.Slots.ScrollingFrame.Slot2.Price.Visible = true
		v46.BG.Slots.ScrollingFrame.Slot2.State.Visible = true
	end
	if p44.SpinData.StyleSlots.MaxSlot >= 2 then
		v46.BG.Slots.ScrollingFrame.Slot3.Price.Visible = true
		v46.BG.Slots.ScrollingFrame.Slot3.State.Visible = true
		v46.BG.Slots.ScrollingFrame.Slot2.Price.Visible = false
		v46.BG.Slots.ScrollingFrame.Slot2.Text.Text = p44.SpinData.StyleSlots.Slot2
		if p44.SpinData.StyleSlots.Slot2 == "" then
			v46.BG.Slots.ScrollingFrame.Slot2.Text.Text = "None"
		end
		if p44.SpinData.StyleSlots.SlotEquipped == "Slot2" then
			v46.BG.Slots.ScrollingFrame.Slot2.State.Text = "Equipped"
		else
			v46.BG.Slots.ScrollingFrame.Slot2.State.Text = "Equip"
		end
	end
	if p44.SpinData.StyleSlots.MaxSlot >= 3 then
		v46.BG.Slots.ScrollingFrame.Slot4.Price.Visible = true
		v46.BG.Slots.ScrollingFrame.Slot4.State.Visible = true
		v46.BG.Slots.ScrollingFrame.Slot3.Price.Visible = false
		v46.BG.Slots.ScrollingFrame.Slot3.Text.Text = p44.SpinData.StyleSlots.Slot3
		if p44.SpinData.StyleSlots.Slot3 == "" then
			v46.BG.Slots.ScrollingFrame.Slot3.Text.Text = "None"
		end
		if p44.SpinData.StyleSlots.SlotEquipped == "Slot3" then
			v46.BG.Slots.ScrollingFrame.Slot3.State.Text = "Equipped"
		else
			v46.BG.Slots.ScrollingFrame.Slot3.State.Text = "Equip"
		end
	end
	if p44.SpinData.StyleSlots.MaxSlot >= 4 then
		v46.BG.Slots.ScrollingFrame.Slot4.Price.Visible = false
		v46.BG.Slots.ScrollingFrame.Slot4.Text.Text = p44.SpinData.StyleSlots.Slot4
		if p44.SpinData.StyleSlots.Slot4 == "" then
			v46.BG.Slots.ScrollingFrame.Slot4.Text.Text = "None"
		end
		if p44.SpinData.StyleSlots.SlotEquipped == "Slot4" then
			v46.BG.Slots.ScrollingFrame.Slot4.State.Text = "Equipped"
		else
			v46.BG.Slots.ScrollingFrame.Slot4.State.Text = "Equip"
		end
	end
	if p44.SpinData.StyleSlots.MaxSlot >= 5 then
		v46.BG.Slots.ScrollingFrame.Slot5.Price.Visible = false
		v46.BG.Slots.ScrollingFrame.Slot5.Text.Text = p44.SpinData.StyleSlots.Slot5
		if p44.SpinData.StyleSlots.Slot5 == "" then
			v46.BG.Slots.ScrollingFrame.Slot5.Text.Text = "None"
		end
		if p44.SpinData.StyleSlots.SlotEquipped == "Slot5" then
			v46.BG.Slots.ScrollingFrame.Slot5.State.Text = "Equipped"
		else
			v46.BG.Slots.ScrollingFrame.Slot5.State.Text = "Equip"
		end
	end
	v46.BG.Slots.ScrollingFrame.Slot1.Price.Visible = false
	v46.BG.Slots.ScrollingFrame.Slot1.Text.Text = p44.SpinData.StyleSlots.Slot1
	if p44.SpinData.StyleSlots.Slot1 == "" then
		v46.BG.Slots.ScrollingFrame.Slot1.Text.Text = "None"
	end
	if p44.SpinData.StyleSlots.SlotEquipped == "Slot1" then
		v46.BG.Slots.ScrollingFrame.Slot1.State.Text = "Equipped"
	else
		v46.BG.Slots.ScrollingFrame.Slot1.State.Text = "Equip"
	end
	if p44.SpinData.StyleSlots.Locked[p44.SpinData.StyleSlots.SlotEquipped] then
		v46.BG.LockSlot.Image = "rbxassetid://110336058460550"
		v46.BG.LockSlot.Text.Text = "UNLOCK"
	else
		v46.BG.LockSlot.Image = "rbxassetid://72009258674014"
		v46.BG.LockSlot.Text.Text = "LOCK"
	end
	for v51, v52 in pairs(p44.SpinData.StyleSlots) do
		if not v51:match("Equipped") then
			for _, v53 in pairs(v_u_13) do
				if v53.Name == v52 then
					v46.BG.Slots.ScrollingFrame[v51].Image = v_u_23[v53.Rarity]
					if v53.Rarity == "Mythic" then
						v46.BG.Slots.ScrollingFrame[v51].ImageColor3 = Color3.new(1, 0, 0)
					else
						v46.BG.Slots.ScrollingFrame[v51].ImageColor3 = Color3.new(1, 1, 1)
					end
					if p44.SpinData.StyleSlots.Locked[v51] then
						v46.BG.Slots.ScrollingFrame[v51].Lock.Visible = true
					else
						v46.BG.Slots.ScrollingFrame[v51].Lock.Visible = false
					end
				end
			end
		end
	end
end
function v17.KnitStart(p_u_54)
	-- upvalues: (copy) v_u_9, (copy) v_u_2, (copy) v_u_4, (copy) v_u_13, (copy) v_u_22, (copy) v_u_1, (copy) v_u_3, (ref) v_u_20, (copy) v_u_10, (copy) v_u_16, (copy) v_u_18, (copy) v_u_19, (ref) v_u_8, (copy) v_u_11
	p_u_54.StyleService = v_u_9.GetService("StyleService")
	p_u_54.Animations = v_u_9.GetController("AnimationController")
	p_u_54.HasSkip = false
	task.spawn(function()
		-- upvalues: (ref) v_u_2, (ref) v_u_4, (copy) p_u_54
		if v_u_2:UserOwnsGamePassAsync(v_u_4.UserId, 965195377) then
			p_u_54.HasSkip = true
		end
	end)
	local v_u_55 = v_u_4.PlayerGui:WaitForChild("Style")
	for _, v56 in pairs(v_u_13) do
		local v57 = v_u_22[v56.Rarity]
		local v58 = v56.Name
		table.insert(v57, v58)
	end
	p_u_54.SpinData = v_u_1.Data:InvokeServer()
	p_u_54.BaseTrove:Connect(v_u_55:GetPropertyChangedSignal("Enabled"), function()
		-- upvalues: (copy) p_u_54, (copy) v_u_55, (ref) v_u_3, (ref) v_u_4
		p_u_54.Animations:StopAnims()
		p_u_54:StyleSlot()
		if v_u_55.Enabled then
			local v59 = v_u_3:GetPlayers()
			for _, v60 in pairs(v59) do
				if v60 ~= v_u_4 and (v60.Character ~= nil and v60.Character:FindFirstChild("HumanoidRootPart") ~= nil) then
					local v61 = v60.Character:GetDescendants()
					for _, v62 in pairs(v61) do
						if v62.Name ~= "Hitbox" then
							if v62.Name == "BALL" and (v62.Parent.Name == "BallAnims" and v62.Parent.Parent.Name == "Football") or v62.Name == "Ring" then
								v62.Transparency = 0
							else
								if v62:IsA("Decal") and v62.Parent.Name == "Head" then
									v62.Parent = v62.Parent.Mesh
								end
								if v62:IsA("BasePart") ~= false then
									v62.Transparency = 1
								end
							end
						end
					end
					table.clear(v61)
				end
			end
			table.clear(v59)
		else
			local v63 = v_u_3:GetPlayers()
			for _, v64 in pairs(v63) do
				if v64 ~= v_u_4 and (v64.Character ~= nil and v64.Character:FindFirstChild("HumanoidRootPart") ~= nil) then
					local v65 = v64.Character:GetDescendants()
					for _, v66 in pairs(v65) do
						if v66.Name ~= "Hitbox" then
							if v66:IsA("Decal") and v66.Parent.Name == "Mesh" then
								v66.Parent = v66.Parent.Parent
							end
							if v66:IsA("BasePart") ~= false and (v66.Name == "Handle" or (v64.Name == "TrajectoryLine" or (v66.Name:match("Left") ~= nil or (v66.Name:match("Right") ~= nil or (v66.Name == "Head" or v66.Name == "Torso"))))) then
								v66.Transparency = 0
							end
						end
					end
					table.clear(v65)
				end
			end
			table.clear(v63)
		end
	end)
	p_u_54.BaseTrove:Connect(v_u_55.BG.BuyLucky.MouseButton1Click, function()
		-- upvalues: (copy) v_u_55
		v_u_55.BuyLucky.Visible = true
	end)
	p_u_54.BaseTrove:Connect(p_u_54.StyleService.Slot, function()
		-- upvalues: (copy) p_u_54
		p_u_54:StyleSlot()
	end)
	for _, v_u_67 in pairs(v_u_55.BG.Slots.ScrollingFrame:GetChildren()) do
		if v_u_67:IsA("ImageButton") ~= false then
			local v_u_68 = tick()
			p_u_54.BaseTrove:Connect(v_u_67.MouseButton1Click, function()
				-- upvalues: (ref) v_u_20, (ref) v_u_68, (copy) p_u_54, (copy) v_u_67
				if v_u_20 > tick() then
					return
				elseif v_u_68 <= tick() then
					v_u_68 = tick() + 0.25
					p_u_54.StyleService.Slot:Fire(v_u_67.Name)
				end
			end)
		end
	end
	p_u_54.BaseTrove:Connect(v_u_4.ProfileStats.Money:GetPropertyChangedSignal("Value"), function()
		-- upvalues: (copy) v_u_55, (ref) v_u_10, (ref) v_u_4
		local v69 = v_u_55.BG.Money.Text
		local v70 = v_u_10
		local v71 = v_u_4.ProfileStats.Money.Value
		v69.Text = "$" .. v70:formatNumberWithCommas((math.round(v71)))
	end)
	p_u_54.BaseTrove:Connect(v_u_4.ProfileStats.Spins:GetPropertyChangedSignal("Value"), function()
		-- upvalues: (copy) v_u_55, (ref) v_u_4
		v_u_55.BG.SpinsLeft.Text = "Spins Left: " .. v_u_4.ProfileStats.Spins.Value
		if v_u_4.ProfileStats.Spins.Value <= 0 then
			v_u_55.BG.SpinsLeft.Text = "$2,500 = 1 Spin"
		end
	end)
	p_u_54.LastShowingOdds = "None"
	local function v_u_82(p72)
		-- upvalues: (copy) p_u_54, (copy) v_u_55, (ref) v_u_16
		if p_u_54.LastShowingOdds ~= p72 then
			for _, v73 in pairs(v_u_55:WaitForChild("BG"):WaitForChild("Rarities"):WaitForChild("ScrollingFrame"):GetChildren()) do
				if v73:IsA("TextButton") then
					v73:Destroy()
				end
			end
			local v74 = v_u_16[p72] or v_u_16.Odds
			local v75 = {}
			for _, v76 in ipairs(v74) do
				local v77, v78 = unpack(v76)
				v75[v77] = v78
			end
			for _, v79 in ipairs(v_u_55.BG.Rarities.ScrollingFrame:GetChildren()) do
				if v79:IsA("ImageButton") then
					local v80 = v79:GetAttribute("Rarity")
					local v81 = v75[v80] or 0
					v79.Text.Text = ("%* (%*%%)"):format(v80:upper(), v81)
					v79.Visible = v81 > 0
				end
			end
			p_u_54.LastShowingOdds = p72
		end
	end
	v_u_82("Odds")
	for _, v_u_83 in ipairs(v_u_55.BG.Rarities:GetChildren()) do
		if v_u_83:IsA("GuiButton") then
			p_u_54.BaseTrove:Connect(v_u_83.MouseButton1Click, function()
				-- upvalues: (copy) v_u_82, (copy) v_u_83
				local v84 = v_u_83
				v_u_82((tostring(v84)))
			end)
		end
	end
	p_u_54.BaseTrove:Connect(v_u_55.BG.BuySpins.MouseButton1Click, function()
		-- upvalues: (copy) v_u_55
		v_u_55.BuySpins.Visible = not v_u_55.BuySpins.Visible
	end)
	p_u_54.BaseTrove:Connect(v_u_55.BuySpins.Exit.MouseButton1Click, function()
		-- upvalues: (copy) v_u_55
		v_u_55.BuySpins.Visible = false
	end)
	p_u_54.BaseTrove:Connect(v_u_55.BG.Money.MouseButton1Click, function()
		-- upvalues: (copy) v_u_55
		v_u_55.BuyMoney.Visible = not v_u_55.BuyMoney.Visible
	end)
	p_u_54.BaseTrove:Connect(v_u_55.BuyMoney.Exit.MouseButton1Click, function()
		-- upvalues: (copy) v_u_55
		v_u_55.BuyMoney.Visible = false
	end)
	p_u_54.BaseTrove:Connect(v_u_55.BuyLucky.Exit.MouseButton1Click, function()
		-- upvalues: (copy) v_u_55
		v_u_55.BuyLucky.Visible = false
	end)
	for _, v_u_85 in pairs(v_u_55.BuySpins.Frame:GetChildren()) do
		if v_u_85:IsA("Frame") ~= false then
			p_u_54.BaseTrove:Connect(v_u_85.Button.MouseButton1Click, function()
				-- upvalues: (ref) v_u_4, (ref) v_u_2, (ref) v_u_18, (copy) v_u_85
				if not v_u_4.PlayerScripts.HasPolicy.Value then
					v_u_2:PromptProductPurchase(v_u_4, v_u_18[v_u_85.Name])
				end
			end)
		end
	end
	for _, v_u_86 in pairs(v_u_55.BuyMoney.Frame:GetChildren()) do
		if v_u_86:IsA("Frame") ~= false then
			p_u_54.BaseTrove:Connect(v_u_86.Button.MouseButton1Click, function()
				-- upvalues: (ref) v_u_4, (ref) v_u_2, (copy) v_u_86
				if not v_u_4.PlayerScripts.HasPolicy.Value then
					v_u_2:PromptProductPurchase(v_u_4, v_u_86.Button:GetAttribute("ID"))
				end
			end)
		end
	end
	for _, v_u_87 in pairs(v_u_55.BuyLucky.Frame:GetChildren()) do
		if v_u_87:IsA("Frame") ~= false then
			p_u_54.BaseTrove:Connect(v_u_87.Button.MouseButton1Click, function()
				-- upvalues: (ref) v_u_4, (ref) v_u_2, (ref) v_u_19, (copy) v_u_87
				if not v_u_4.PlayerScripts.HasPolicy.Value then
					v_u_2:PromptProductPurchase(v_u_4, v_u_19[v_u_87.Name])
				end
			end)
		end
	end
	for _, v_u_88 in pairs(v_u_55:WaitForChild("BG"):WaitForChild("Rarities"):WaitForChild("ScrollingFrame"):GetChildren()) do
		if v_u_88:IsA("ImageButton") ~= false then
			local v_u_89 = v_u_88.Name:sub(4, v_u_88.Name:len()):gsub(" ", "")
			p_u_54.BaseTrove:Connect(v_u_88.MouseButton1Click, function()
				-- upvalues: (copy) v_u_55, (copy) v_u_88, (ref) v_u_22, (copy) v_u_89, (ref) v_u_1, (ref) v_u_8, (copy) p_u_54, (ref) v_u_11, (ref) v_u_4
				for _, v90 in pairs(v_u_55:WaitForChild("BG"):WaitForChild("Rarities"):WaitForChild("ScrollingFrame"):GetChildren()) do
					if v90:IsA("TextButton") then
						v90:Destroy()
					end
				end
				v_u_55.BG.Rarities.ScrollingFrame["300 Rare"].Arrow.Rotation = 90
				v_u_55.BG.Rarities.ScrollingFrame["400 Epic"].Arrow.Rotation = 90
				v_u_55.BG.Rarities.ScrollingFrame["500 Legendary"].Arrow.Rotation = 90
				v_u_88.Arrow.Rotation = 0
				local v91 = v_u_88.Name
				local v92 = string.sub(v91, 1, 3)
				local v93 = tonumber(v92)
				for _, v_u_94 in pairs(v_u_22[v_u_89]) do
					local v_u_95 = v_u_1.Assets.UI.Item:Clone()
					v_u_95.Text = ("%*"):format(v_u_94)
					if v_u_8 == v_u_94 then
						v_u_95.Text = ("\240\159\159\162 %*"):format(v_u_94)
					end
					local v96 = v93 + 1
					v_u_95.Name = tostring(v96)
					v_u_95.Parent = v_u_55:WaitForChild("BG"):WaitForChild("Rarities"):WaitForChild("ScrollingFrame")
					v_u_95:SetAttribute("style", v_u_94)
					v_u_95.Activated:Connect(function()
						-- upvalues: (ref) p_u_54, (copy) v_u_94, (ref) v_u_8, (ref) v_u_11, (ref) v_u_4, (ref) v_u_55, (copy) v_u_95
						p_u_54.StyleService:SetTargetRollStyle(v_u_94)
						v_u_8 = v_u_94
						v_u_11.Popup(v_u_4, (("Selected \"%*\"! Chances increased slightly."):format(v_u_94)))
						for _, v97 in v_u_55:WaitForChild("BG"):WaitForChild("Rarities"):WaitForChild("ScrollingFrame"):GetChildren() do
							if v97:IsA("TextButton") then
								if v97 == v_u_95 then
									v97.Text = ("\240\159\159\162 %*"):format(v_u_94)
								else
									v97.Text = v97:GetAttribute("style")
								end
							end
						end
					end)
				end
			end)
		end
	end
	p_u_54.BaseTrove:Connect(v_u_55.BG.LockSlot.Activated, function()
		-- upvalues: (copy) p_u_54, (ref) v_u_11, (ref) v_u_4
		if p_u_54.SpinData.StyleSlots.Locked[p_u_54.SpinData.StyleSlots.SlotEquipped] then
			v_u_11.Popup(v_u_4, (("Unlocked %*"):format(p_u_54.SpinData.StyleSlots.SlotEquipped)))
			p_u_54.StyleService.LockSlot:Fire(p_u_54.SpinData.StyleSlots.SlotEquipped, false)
		else
			v_u_11.Popup(v_u_4, (("Locked %*"):format(p_u_54.SpinData.StyleSlots.SlotEquipped)))
			p_u_54.StyleService.LockSlot:Fire(p_u_54.SpinData.StyleSlots.SlotEquipped, true)
		end
	end)
	p_u_54:SpinSignals(v_u_55)
end
function v17.KnitInit(p_u_98)
	-- upvalues: (copy) v_u_12, (copy) v_u_4, (ref) v_u_5, (ref) v_u_6, (ref) v_u_7
	p_u_98.BaseTrove = v_u_12.new()
	p_u_98.BaseTrove:Connect(v_u_4.CharacterAdded, function(p99)
		-- upvalues: (ref) v_u_5, (ref) v_u_6, (ref) v_u_7
		v_u_5 = p99
		v_u_6 = v_u_5:WaitForChild("Humanoid")
		v_u_7 = v_u_5:WaitForChild("HumanoidRootPart")
	end)
	p_u_98.BaseTrove:Connect(game.Players.PlayerRemoving, function(p100)
		-- upvalues: (ref) v_u_4, (ref) v_u_5, (ref) v_u_7, (ref) v_u_6, (copy) p_u_98
		if p100 == v_u_4 then
			v_u_5 = nil
			v_u_7 = nil
			v_u_6 = nil
			p_u_98.BaseTrove:Destroy()
		end
	end)
end
return v17

--- Script 4 ---

local v1 = game:GetService("ReplicatedStorage")
game:GetService("RunService")
local v_u_2 = game:GetService("Players")
local v_u_3 = game:GetService("TweenService")
local v_u_4 = v_u_2.LocalPlayer
local v_u_5 = v_u_4.Character or v_u_4.CharacterAdded:Wait()
local v_u_6 = v_u_5:FindFirstChildOfClass("Humanoid")
local v_u_7 = v_u_5:WaitForChild("HumanoidRootPart")
local _ = v_u_7:WaitForChild("RootJoint").C0
local v_u_8 = require(v1.Packages.Knit)
local v_u_9 = require(v1.Shared.Essentials)
local v_u_10 = require(v1.Shared.Trove)
local v_u_11 = require(v1.Shared.SoundManager)
local v12 = v_u_8.CreateController({
	["Name"] = "PostMatch"
})
function v12.KnitStart(p13)
	-- upvalues: (copy) v_u_8, (copy) v_u_4, (copy) v_u_3, (copy) v_u_9, (copy) v_u_11, (copy) v_u_2
	p13.MatchService = v_u_8.GetService("MatchService")
	p13.BaseTrove:Connect(p13.MatchService.SendStats, function(p14, p15)
		-- upvalues: (ref) v_u_4, (ref) v_u_3, (ref) v_u_9, (ref) v_u_11
		v_u_4.PlayerGui.HUD.Enabled = false
		task.spawn(function()
			workspace.gamepass.BillboardGui.Enabled = false
			workspace.VIP.BillboardGui.Enabled = false
			workspace.VIP.BillboardGui1.Enabled = false
			workspace.VIP.BillboardGui2.Enabled = false
		end)
		local v_u_16 = v_u_4.PlayerGui.PostMatch
		v_u_16.Enabled = true
		if p14 then
			local v17 = math.random(15, 25) / 10
			local v_u_18 = Instance.new("NumberValue")
			local v_u_19 = v_u_3:Create(v_u_18, TweenInfo.new(v17, Enum.EasingStyle.Cubic, Enum.EasingDirection.Out), {
				["Value"] = v_u_4.ProfileStats.Money.Value
			})
			v_u_19:Play()
			local v_u_20 = Instance.new("NumberValue")
			local v_u_21 = v_u_3:Create(v_u_20, TweenInfo.new(v17, Enum.EasingStyle.Cubic, Enum.EasingDirection.Out), {
				["Value"] = v_u_4.ProfileStats.Exp.Value
			})
			v_u_21:Play()
			local v_u_22 = Instance.new("NumberValue")
			local v_u_23 = v_u_3:Create(v_u_22, TweenInfo.new(v17, Enum.EasingStyle.Cubic, Enum.EasingDirection.Out), {
				["Value"] = v_u_4.ProfileStats.Level.Value
			})
			v_u_23:Play()
			local v_u_24 = v_u_3:Create(v_u_4.PlayerGui.PostMatch.Currencies.Level.Exp.Bar, TweenInfo.new(v17, Enum.EasingStyle.Cubic, Enum.EasingDirection.Out), {
				["Size"] = UDim2.new(v_u_4.ProfileStats.Exp.Value / (v_u_4.ProfileStats.Level.Value * 80), 0, 1, 0)
			})
			v_u_24:Play()
			task.spawn(function()
				-- upvalues: (copy) v_u_18, (ref) v_u_4, (ref) v_u_9, (copy) v_u_22, (copy) v_u_20, (copy) v_u_19, (copy) v_u_21, (copy) v_u_23, (copy) v_u_24
				while v_u_18.Value < v_u_4.ProfileStats.Money.Value - 1 do
					task.wait()
					v_u_4.PlayerGui.PostMatch.Currencies.Yen.Amount.Text = v_u_9:formatNumberWithCommas(v_u_18.Value)
					local v25 = v_u_4.PlayerGui.PostMatch.Currencies.Level.LevelAmount
					local v26 = v_u_22.Value
					local v27 = math.round(v26)
					v25.Text = "Level " .. tostring(v27)
					local v28 = v_u_4.PlayerGui.PostMatch.Currencies.Level.EXPAmount
					local v29 = v_u_20.Value
					local v30 = math.round(v29)
					local v31 = tostring(v30)
					local v32 = v_u_4.ProfileStats.Level.Value * 80
					local v33 = math.round(v32)
					v28.Text = v31 .. "/" .. tostring(v33)
				end
				v_u_19:Destroy()
				v_u_18:Destroy()
				v_u_20:Destroy()
				v_u_21:Destroy()
				v_u_22:Destroy()
				v_u_23:Destroy()
				v_u_24:Destroy()
			end)
			local v34 = v_u_4.GameStats:GetChildren()
			for _, v_u_35 in pairs(v34) do
				if v_u_35.Name == "Goals" or (v_u_35.Name == "Assists" or (v_u_35.Name == "Steals" or v_u_35.Name == "Saves")) then
					local v_u_36 = Instance.new("NumberValue")
					local v_u_37 = v_u_3:Create(v_u_36, TweenInfo.new(math.random(15, 25) / 10, Enum.EasingStyle.Cubic, Enum.EasingDirection.Out), {
						["Value"] = v_u_35.Value
					})
					v_u_37:Play()
					task.spawn(function()
						-- upvalues: (copy) v_u_36, (copy) v_u_35, (ref) v_u_11, (ref) v_u_4, (copy) v_u_16
						while v_u_36.Value < v_u_35.Value - 0.1 do
							task.wait()
							v_u_11.SpawnSound("Hover", 0.3, v_u_4.PlayerGui, 1)
							local v38 = v_u_16.InGame[v_u_35.Name].Value
							local v39 = v_u_36.Value
							local v40 = math.round(v39)
							v38.Text = tostring(v40)
						end
						task.wait(0.2)
						local v41 = v_u_16.InGame[v_u_35.Name].Value
						local v42 = v_u_36.Value
						local v43 = math.round(v42)
						v41.Text = tostring(v43)
					end)
					task.delay(3, function()
						-- upvalues: (copy) v_u_36, (copy) v_u_37
						v_u_36:Destroy()
						v_u_37:Destroy()
					end)
				end
			end
			table.clear(v34)
			v_u_16.Total.Goals.old.Text = p14.Goals
			v_u_16.Total.Assists.old.Text = p14.Assists
			for v_u_44, v_u_45 in pairs(p15) do
				if v_u_44 == "Goals" or (v_u_44 == "Assists" or v_u_44 == "MVP") then
					local v_u_46 = Instance.new("NumberValue")
					local v_u_47 = v_u_3:Create(v_u_46, TweenInfo.new(math.random(15, 25) / 10, Enum.EasingStyle.Cubic, Enum.EasingDirection.Out), {
						["Value"] = v_u_45
					})
					v_u_47:Play()
					task.spawn(function()
						-- upvalues: (copy) v_u_46, (copy) v_u_45, (ref) v_u_11, (ref) v_u_4, (copy) v_u_16, (copy) v_u_44
						while v_u_46.Value < v_u_45 - 1 do
							task.wait()
							v_u_11.SpawnSound("Hover", 0.2, v_u_4.PlayerGui, 1)
							local v48 = v_u_16.Total[v_u_44].new
							local v49 = v_u_46.Value
							local v50 = math.round(v49)
							v48.Text = tostring(v50)
						end
						task.wait(0.2)
						local v51 = v_u_16.Total[v_u_44].new
						local v52 = v_u_46.Value
						local v53 = math.round(v52)
						v51.Text = tostring(v53)
					end)
					task.delay(3, function()
						-- upvalues: (copy) v_u_46, (copy) v_u_47
						v_u_46:Destroy()
						v_u_47:Destroy()
					end)
				end
			end
			table.clear(p14)
			table.clear(p15)
		end
	end)
	p13.BaseTrove:Connect(v_u_4.PlayerGui.PostMatch:GetPropertyChangedSignal("Enabled"), function()
		-- upvalues: (ref) v_u_4, (ref) v_u_2
		if v_u_4.PlayerGui.PostMatch.Enabled == false then
			task.wait(0.1)
			task.spawn(function()
				workspace.gamepass.BillboardGui.Enabled = true
				workspace.VIP.BillboardGui.Enabled = true
				workspace.VIP.BillboardGui1.Enabled = true
				workspace.VIP.BillboardGui2.Enabled = true
			end)
			local v54 = v_u_2:GetPlayers()
			for _, v55 in pairs(v54) do
				if v55 ~= v_u_4 and (v55.Character ~= nil and v55.Character:FindFirstChild("HumanoidRootPart") ~= nil) then
					local v56 = v55.Character:GetDescendants()
					for _, v57 in pairs(v56) do
						if v57.Name ~= "Hitbox" then
							if v57:IsA("Decal") and v57.Parent.Name == "Mesh" then
								v57.Parent = v57.Parent.Parent
							end
							if v57:IsA("BasePart") ~= false and (v57.Name == "Handle" or (v57.Name:match("Left") ~= nil or (v57.Name:match("Right") ~= nil or (v57.Name == "Head" or v57.Name == "Torso")))) then
								v57.Transparency = 0
							end
						end
					end
					table.clear(v56)
				end
			end
			table.clear(v54)
			game.Workspace.CurrentCamera.CameraType = Enum.CameraType.Custom
		else
			local v58 = v_u_2:GetPlayers()
			for _, v59 in pairs(v58) do
				if v59 ~= v_u_4 and (v59.Character ~= nil and v59.Character:FindFirstChild("HumanoidRootPart") ~= nil) then
					local v60 = v59.Character:GetDescendants()
					for _, v61 in pairs(v60) do
						if v61.Name ~= "Hitbox" and v61.Name ~= "TrajectoryLine" then
							if v61:IsA("Decal") and v61.Parent.Name == "Head" then
								v61.Parent = v61.Parent.Mesh
							end
							if v61:IsA("BasePart") ~= false then
								v61.Transparency = 1
							end
						end
					end
					table.clear(v60)
				end
			end
			table.clear(v58)
		end
	end)
	p13.BaseTrove:Connect(v_u_4.PlayerGui.PostMatch.ReturnButtonFrame.CloseButton.MouseButton1Click, function()
		-- upvalues: (ref) v_u_4
		v_u_4.PlayerGui.PostMatch.Enabled = false
		if v_u_4.Team == game.Teams.Visitor then
			v_u_4.PlayerGui.HUD.Enabled = true
		else
			v_u_4.PlayerGui.HUD.Enabled = false
			v_u_4.PlayerGui.InGameUI.Enabled = true
		end
	end)
end
function v12.KnitInit(p_u_62)
	-- upvalues: (copy) v_u_10, (copy) v_u_4, (ref) v_u_5, (ref) v_u_6, (ref) v_u_7
	p_u_62.BaseTrove = v_u_10.new()
	p_u_62.BaseTrove:Connect(v_u_4.CharacterAdded, function(p63)
		-- upvalues: (ref) v_u_5, (ref) v_u_6, (ref) v_u_7
		v_u_5 = p63
		v_u_6 = v_u_5:WaitForChild("Humanoid")
		v_u_7 = v_u_5:WaitForChild("HumanoidRootPart")
	end)
	p_u_62.BaseTrove:Connect(game.Players.PlayerRemoving, function(p64)
		-- upvalues: (ref) v_u_4, (ref) v_u_5, (ref) v_u_7, (ref) v_u_6, (copy) p_u_62
		if p64 == v_u_4 then
			v_u_5 = nil
			v_u_7 = nil
			v_u_6 = nil
			p_u_62.BaseTrove:Destroy()
		end
	end)
end
return v12

--- Script 5 ---

local v1 = game:GetService("ReplicatedStorage")
game:GetService("ServerScriptService")
game:GetService("Players")
game:GetService("RunService")
game:GetService("TweenService")
game:GetService("RunService")
require(v1.Shared.Essentials)
require(v1.Shared.Trove)
require(v1.Shared.SoundManager)
require(v1.Shared.Popup)
require(v1.Shared.VfxManager)
return function(p_u_2, p_u_3, p4)
	if p_u_2.AbilityThree > tick() then
		return
	elseif p4.Values.HasBall.Value == false then
		return
	elseif p_u_3.PlayerStats.InAwakening.Value ~= false then
		if p_u_2.ABC then
			p_u_2.ABC:Clean()
		end
		p_u_2.AbilityController:AbilityCooldown("3", 60)
		p_u_2.Animations:StopAnims()
		p_u_2.StatesController.States.Ability = true
		p_u_2.StatesController.OwnWalkState = true
		p_u_2.StatesController.SpeedBoost = 20
		p_u_2.AbilityService.Ability:Fire("InfiniteDribbles")
		p_u_2.Animations.Abilities.KingsRun.Priority = Enum.AnimationPriority.Action3
		p_u_2.Animations.Abilities.KingsRun:Play()
		local v_u_5 = tick()
		p_u_2.ABC:Connect(p4.Hitbox.Touched, function(p6)
			-- upvalues: (ref) v_u_5, (copy) p_u_3, (copy) p_u_2
			if v_u_5 > tick() then
				return
			elseif p6.Parent:FindFirstChild("Humanoid") == nil then
				return
			elseif p6.Parent.Name == p_u_3.Character.Name then
				return
			else
				v_u_5 = tick() + 0.8
				if p_u_2.Animations.Abilities[("InfiniteDribble%*"):format(1)].IsPlaying then
					return
				elseif p_u_2.Animations.Abilities[("InfiniteDribble%*"):format(2)].IsPlaying then
					return
				elseif not p_u_2.Animations.Abilities[("InfiniteDribble%*"):format(3)].IsPlaying then
					local v7 = math.random
					local v8 = tostring(v7(1, 3))
					p_u_2.Animations.Abilities[("InfiniteDribble%*"):format(v8)].Priority = Enum.AnimationPriority.Action4
					p_u_2.Animations.Abilities[("InfiniteDribble%*"):format(v8)]:Play()
					p_u_2.Animations.Ball[("InfiniteDribble%*"):format(v8)].Priority = Enum.AnimationPriority.Action4
					p_u_2.Animations.Ball[("InfiniteDribble%*"):format(v8)]:Play()
				end
			end
		end)
		task.delay(5, function()
			-- upvalues: (copy) p_u_2
			if p_u_2.ABC then
				p_u_2.Animations.Abilities.KingsRun:Stop()
				p_u_2.StatesController.States.Ability = false
				p_u_2.StatesController.OwnWalkState = false
				p_u_2.StatesController.SpeedBoost = 0
				p_u_2.ABC:Clean()
			end
		end)
	end
end

--- Script 6 ---

local v1 = game:GetService("ReplicatedStorage")
game:GetService("ServerScriptService")
game:GetService("Players")
game:GetService("RunService")
game:GetService("TweenService")
game:GetService("RunService")
require(v1.Shared.Essentials)
require(v1.Shared.Trove)
require(v1.Shared.SoundManager)
local v_u_2 = require(v1.Shared.Popup)
require(v1.Shared.VfxManager)
return function(p_u_3, p4, p5)
	-- upvalues: (copy) v_u_2
	if p_u_3.AbilityTwo > tick() then
		return
	elseif p5.Values.HasBall.Value then
		v_u_2.Popup(p4, "Only usable without ball")
	else
		if p_u_3.ABC then
			p_u_3.ABC:Clean()
		end
		v_u_2.Popup(p4, "Hitbox activated! Be close to another player for ability to work! (3 seconds)")
		p_u_3.AbilityController:AbilityCooldown("2", 25)
		p_u_3.Animations:StopAnims()
		p_u_3.StatesController.States.Ability = true
		p_u_3.StatesController.OwnWalkState = true
		p_u_3.StatesController.SpeedBoost = 20
		p_u_3.AbilityService.Ability:Fire("CrowTheft")
		p_u_3.Animations.Abilities.KingsRun.Priority = Enum.AnimationPriority.Action3
		p_u_3.Animations.Abilities.KingsRun:Play()
		local v_u_6 = false
		p_u_3.ABC:Connect(p_u_3.AbilityService.Ability, function()
			-- upvalues: (copy) p_u_3, (ref) v_u_6
			p_u_3.ABC:Clean()
			p_u_3.AbilityController:AbilityCooldown("2", 80)
			p_u_3.Animations.Abilities.KingsRun:Stop()
			v_u_6 = true
			p_u_3.StatesController.States.Ability = false
			p_u_3.StatesController.OwnWalkState = false
			p_u_3.StatesController.SpeedBoost = 0
		end)
		task.delay(3, function()
			-- upvalues: (ref) v_u_6, (copy) p_u_3
			if v_u_6 == false then
				p_u_3.Animations.Abilities.KingsRun:Stop()
				p_u_3.StatesController.States.Ability = false
				p_u_3.StatesController.OwnWalkState = false
				p_u_3.StatesController.SpeedBoost = 0
				p_u_3.ABC:Clean()
			end
		end)
	end
end
