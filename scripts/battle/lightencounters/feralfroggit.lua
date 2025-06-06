local FeralFroggit, super = Class(LightEncounter)

function FeralFroggit:init()
    super:init(self)

    self.text = "* Feral Froggit blocks the way!"

    if Game:getFlag("randomencounter#evershade1:violent") then
        if Game:getFlag("randomencounter#evershade1:violent") >= 16 then
            self.text = "* You corner the Feral Froggit."
            local enemies_left = 22 - Game:getFlag("randomencounter#evershade1:violent")
            local mus_pitch
            if enemies_left <= 0 then
                mus_pitch = 1
            else
                mus_pitch = (((enemies_left / 7) * 10) * 0.2)
            end
            MUSIC_PITCHES["battle_caught"] = mus_pitch
            self.music = "battle_caught"
        else
            self.music = "battle_evershade"
        end
    else
        self.music = "battle_evershade"
    end

    self:addEnemy("feralfroggit")

    self.can_flee = true

end

return FeralFroggit