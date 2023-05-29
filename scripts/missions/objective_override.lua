--Override written by NamesAreHard
--Feel free to @ me about the specfics of this code

--Overrides the lua string of objectives, so that if they get saved into save data,
--they properly save with quotes around the text
--If objectives are not working, this is a good place to look/comment out and test

--Possible issue is that the old one had three integer values when my version only has
--two integer vales. But I don't know what the third integer value should be
--and there's no way to my knowledge to get the keys of Objective

Objective.GetLuaString = function(self)
    return string.format("Objective(%q,%i)",self.text,self.rep)
end
Objective.GetString = Objective.GetLuaString
