FishAlerter = {
  name = "FishAlerter"
}

function FishAlerter:Initialize()
end

function FishAlerter:OnAddOnLoaded(event,addonName)
  if addonName == FishAlerter.name then
    FishAlerter:Initialize()
  end
end

function FishAlerter.ChatterEnd(event)
  FishAlerterIndicator:SetHidden(true)
end

function FishAlerter.PlayerActivated(event, initialActivation)
  FishAlerterIndicator:SetHidden(true)
end

function FishAlerter.DoFish(eventId, bagId, slotId, isNewItem, itemSoundCategory, updateReason)
  if itemSoundCategory ~= ITEM_SOUND_CATEGORY_LURE then return end
  if bagId ~= BAG_BACKPACK and bagId ~= INVENTORY_CRAFT_BAG then return end
  local action, name = GetGameCameraInteractableActionInfo()
  if action == "Reel In" then
    FishAlerterIndicator:SetHidden(false)
  end
end

EVENT_MANAGER:RegisterForEvent(FishAlerter.name, EVENT_ADD_ON_LOADED, FishAlerter.OnAddOnLoaded)
EVENT_MANAGER:RegisterForEvent(FishAlerter.name, EVENT_PLAYER_ACTIVATED, FishAlerter.PlayerActivated)
EVENT_MANAGER:RegisterForEvent(FishAlerter.name, EVENT_CHATTER_END, FishAlerter.ChatterEnd)
EVENT_MANAGER:RegisterForEvent(FishAlerter.name, EVENT_INVENTORY_SINGLE_SLOT_UPDATE, FishAlerter.DoFish)
