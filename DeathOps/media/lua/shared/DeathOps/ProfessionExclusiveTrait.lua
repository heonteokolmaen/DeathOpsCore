ProfessionExclusiveTrait = {};
ProfessionExclusiveTrait.List = {};

function ProfessionExclusiveTrait:new(traitName, professions)
    o = {}
    setmetatable(o, self)
    self.__index = self
    o.traitName = traitName 
    o.exclusiveProf = professions

    table.insert(ProfessionExclusiveTrait.List, o)
    return o
end