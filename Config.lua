--[[

EV-STORE
DIS
https://discord.gg/sR373dj7pn
]]
Config = {}
-- [true : تفعيل | false : الغاء تفعيل] --
Config.Main = {
ItemName = "راديو", -- BK اسم الايتم BK --
VoiceMod = "pma-voice", -- mumble-voip او pma-voice --
OpenCommand = "radio", -- الكوماند الي يفتح الراديو --
CommandEnable = true, -- تفعيل كوماند فتح الراديو او الغاءه --
GetPlayersCommand = "rr", -- كوماند الي يجيب معلومات الاعبين في موجة --
GetPlayersPermission = "admin.menu",
TakeItem = true, -- في حال بتخلي الاعب ينسحب منه ايتم --
HotkeyActive = true, -- تفعيل او الغاء فتح الراديو باستخدام الزر --
FirstKey = 21, -- اول زر  حاليا shift --
SecondKey = 38, -- ثاني زر حاليا هو  e --
JoinLog = "", -- لوق دخول موجة --
LeaveLog = "", -- لوق خروج موجة --
OpenRadioLog = "", -- لوق فتح الراديو --
PlayersLog = "" -- لوق استعلام عن معلومات الاعبين في الموجة --
}
Config.Channels = { --الموجات--{Name = "اسم الموجة" , Permission = "البرمشن",Min = اقل عدد للموجات,Max = اعلى عدد للموجات},
{Name = "وزارة الداخلية" , Permission = "admin.menu",Min = 1,Max = 5},
{Name = "امن الطرق" , Permission = "trq.radio",Min = 6,Max = 10},
{Name = "امن الطرق" , Permission = "trq.radio",Min = 6,Max = 10},
{Name = "امن الطرق" , Permission = "trq.radio",Min = 6,Max = 10},
{Name = "امن الطرق" , Permission = "trq.radio",Min = 6,Max = 10},
}
Config.Notify = {
[1] = "تم فتح الراديو بنجاح",
[2] = "يجب عليك كتابة الموجة",
[3] = "لا تملك راديو",
[4] = " لا تملك صلاحية لدخول موجة ",
[5] = "لا تملك صلاحية لتنفيذ هذا الامر",
[6] = "لا يوجد لاعبين في هذه الموجة",
[7] = "الاعبين في هذه الموجة",
[8] = "لا يمكنك فتح الراديو وانتا مقيد",
[9] = "تم الخروج من الموجة ينجاح",
[10] = " تم الدخول لموجة "
}
Notify = function(player, message) -- تريقر الاشعارات في حال بتغيره فقط غير من سطر 46 الى 53 --
TriggerClientEvent("pNotify:SendNotification",player,{
text = message,
type = "success",
timeout = (5000),
layout = "centerRight",
queue = "global"
})
end
return Config
--[[
EV-STORE
DIS
https://discord.gg/sR373dj7pn
]]