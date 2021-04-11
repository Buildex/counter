local e = require(_G.EnoriaPath)
local Widget = require(_G.EnoriaPath.Parent.Widgets.Widget)

local Counter = {}
Counter.__index = Counter
setmetatable(Counter, Widget)

function Counter.new(context, increment, builder)
   local self = Widget.new(nil, nil, context)
   setmetatable(self, Counter)

   self.Counter = 0
   self.Increment = increment or 0
   self.Builder = builder or function()end

   return self
end

function Counter:AddIncrement()
   self:SetState(function()
      self.Counter += self.Increment
   end)
end

function Counter:Build()
   local tree = self:BuildTree(
       self.Builder(self.Counter, self)
   )

   return tree
end

return Counter
