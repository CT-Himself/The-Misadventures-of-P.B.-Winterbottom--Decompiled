-- Get the new_actor_archetype function from the _temp table
local ActorArchetype = _temp.new_actor_archetype

-- Initialize the actor's Winterbottom component
function InitializeWinterbottom(actor, parameters)
    local winterbottom = GameplayLib.Winterbottom.instance(GameplayLib.Winterbottom, parameters, false)
    actor.winterbottom = winterbottom
    actor.state_machine = winterbottom.state_machine
end

-- Set the actor archetype's init function to the InitializeWinterbottom function
ActorArchetype.init = InitializeWinterbottom

-- Tick the Winterbottom component
function TickWinterbottom(actor, deltaTime, currentTime)
    actor.winterbottom:tick(deltaTime, currentTime)
end

-- Set the actor archetype's tick function to the TickWinterbottom function
ActorArchetype.tick = TickWinterbottom

-- Set the smack amount for the Winterbottom component
function SetSmackAmount(actor, smackAmount, maxSmackAmount)
    actor.winterbottom:set_smack_amount(smackAmount, maxSmackAmount)
end

-- Set the actor archetype's set_smack_amount function to the SetSmackAmount function
ActorArchetype.set_smack_amount = SetSmackAmount

-- Enable or disable the actor's controls
function SetEnableControls(actor, enabled)
    actor.winterbottom:set_enable_controls(enabled)
end

-- Set the actor archetype's set_enable_controls function to the SetEnableControls function
ActorArchetype.set_enable_controls = SetEnableControls

-- Respawn the actor
function RespawnActor(actor, position, rotation, scale, respawnDelay)
    actor.winterbottom:respawn(position, rotation, scale, respawnDelay)
end

-- Set the actor archetype's respawn function to the RespawnActor function
ActorArchetype.respawn = RespawnActor

-- Check if the actor is in the "idle" state
function IsIdle(actor)
    return actor.state_machine:is_in("idle")
end

-- Set the actor archetype's is_idle function to the IsIdle function
ActorArchetype.is_idle = IsIdle