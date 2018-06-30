function onLogout(cid)
   if isGemActivated(cid) then
   stopEvent(sendGemEffect(cid, storage, interval))
   end
   return true
end

