--NO LONGER REQUIRED

--Override written by NamesAreHard
--Feel free to @ me about the specfics of this code

--Overrides the lua string of objectives, so that if they get saved into save data,
--they properly save with quotes around the text
--If objectives are not working, this is a good place to look/comment out and test

Objective.GetLuaString = function(self)
    return string.format("Objective(%q,%i)",self.text,self.rep)
end
Objective.GetString = Objective.GetLuaString


--[[
Possible issue is that the old one had three integer values when my version only has
two integer vales. But I don't know what the third integer value should be
and there's no way to my knowledge to get the keys of Objective

Here's the lua bind if someone wants to figure out what that third argument might be
Probably potential?

luabind::class_<RepObj>("Objective")
			.def(luabind::constructor<string, int>())
			.def(luabind::constructor<string, string, string, int>())
			.def(luabind::constructor<string, int, int>())
			.def(luabind::constructor<string, string, string, int, int>())
			.def(luabind::constructor<string, string>())
			.def(luabind::constructor<string, string, string, string>())
			.def("Failed", &RepObj::Failed)
			.def_readwrite("rep", &RepObj::rep)
			.def_readwrite("potential", &RepObj::potential)
			.def_readwrite("text", &RepObj::objText)
			.def_readwrite("param1", &RepObj::paramText1)
			.def_readwrite("param2", &RepObj::paramText2)
			.def_readwrite("category", &RepObj::category)
			.def("GetLuaString", &RepObj::GetLuaString)
]]
