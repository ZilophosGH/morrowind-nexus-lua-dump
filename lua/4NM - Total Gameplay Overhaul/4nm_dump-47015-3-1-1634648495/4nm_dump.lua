local cf = mwse.loadConfig("4NM", {en = true, m = false, m1 = false, m2 = false, m3 = false, m4 = false, m5 = false, m6 = false, m7 = false, m8 = false, m9 = false, m10 = false, m11 = false,
scroll = true, lab = true, spmak = true, lin = 15, UIsp = false, UIen = false, UIcol = 7,
full = true, pmult = 1, min = 80, max = 120, skillp = true, levmod = true, trmod = true, enchlim = true, durlim = true, alc = true, barter = true, stels = true, Spd = true, hit = true, traum = true, Proj = true,
spellhit = true, aspell = true, ammofix = false, AIsec = 2,
dash = 100, charglim = 100, moment = 100, metlim = 100, mshmax = 100, rfmax = 100, col = 0, crit = 30, impmin = 20, agr = true, smartcw = true, autoammo = true, mcs = true, maniac = false,
autoshield = true, smartpoi = true, raycon = true, metret = true, mbkik = 3, mbdod = 4, mbret = 4, mbhev = 2, mbmet = 3, mbcharg = 2, mbray = 4, mbsum = 4, mbshot = 2, mbarc = 2,
autoarb = false, autokik = true, autocharg = false, ray = true,
kikkey = {keyCode = 28}, pkey = {keyCode = 60}, ekey = {keyCode = 42}, dwmkey = {keyCode = 29}, gripkey = {keyCode = 56},
magkey = {keyCode = 157}, tpkey = {keyCode = 54}, cpkey = {keyCode = 207}, telkey = {keyCode = 209}, cwkey = {keyCode = 211},
poisonkey = {keyCode = 25}, totkey = {keyCode = 44}, bwkey = {keyCode = 45}, reflkey = {keyCode = 46}, detkey = {keyCode = 47}, markkey = {keyCode = 48},
q1 = {keyCode = 79}, q2 = {keyCode = 80}, q3 = {keyCode = 81}, q4 = {keyCode = 75}, q5 = {keyCode = 76}, q6 = {keyCode = 77}, q7 = {keyCode = 71}, q8 = {keyCode = 72}, q9 = {keyCode = 73}, q0 = {keyCode = 156}})

local p, mp, inv, p1, p3, ad, pp, D, P, DM, MB, AC, mc, rf, n, md, pow, wc, ic, QS		local MT = {__index = function(t, k) t[k] = {} return t[k] end}		local AF = setmetatable({}, MT)		local FR = {}
--local SS = setmetatable({}, MT)		local BS = setmetatable({}, MT)		local SSN = {}
local M = {}	local B = {}	local S = {}	local SN = {}	local SNC = {}		local Matr = tes3matrix33.new()		local W = {}	local N = {}	local MP = {}
local V = {up = tes3vector3.new(0,0,1), down = tes3vector3.new(0,0,-1), nul = tes3vector3.new(0,0,0)}	local KSR = {}	local PRR = {}		local R = {}	local G = {cpg = 0}		
local com, last, pred, arm, arp		local A = {}		local ID33 = tes3matrix33.new(1,0,0,0,1,0,0,0,1)
local AT = {[0] = {t="l",s=21,p="lig0",snd="Light Armor Hit"}, [1] = {t="m",s=2,p="med0",snd="Medium Armor Hit"}, [2] = {t="h",s=3,p="hev0",snd="Heavy Armor Hit"}, [3] = {t="u",s=17}}
local WT = {[-1]={s=26,p1="hand1",p2="hand2",p3="hand3",p4="hand4",p5="hand5",p6="hand6",p8="hand8",pc="hand12"},
[0]={s=22,p1="short1",p2="short2",p3="short3",p4="short4",p5="short5",p6="short6",p7="short7",p8="short8",p="short0",pc="short9",h1=true,dw=true},
[1]={s=5,p1="long1a",p2="long2a",p3="long3a",p4="long4a",p5="long5a",p6="long6a",p7="long7a",p8="long8a",p="long0",pc="long9",h1=true,dw=true},
[2]={s=5,p1="long1b",p2="long2b",p3="long3b",p4="long4b",p5="long5b",p6="long6b",p7="long7b",p8="long8b",p="long0"},
[3]={s=4,p1="blu1a",p2="blu2a",p3="blu3a",p4="blu4a",p5="blu5a",p6="blu6a",p7="blu7a",p8="blu8a",p="blu0a",h1=true,dw=true},
[4]={s=4,p1="blu1b",p2="blu2b",p3="blu3b",p4="blu4b",p5="blu5b",p6="blu6b",p7="blu7b",p8="blu8b",p="blu0a"},
[5]= {s=4,p1="blu1c",p2="blu2c",p3="blu3c",p4="blu4c",p5="blu5c",p6="blu6c",p7="blu7c",p8="blu8c",p="blu0c",pc="blu10"},
[-3]={s=4,p1="blu1c",p2="blu2c",p3="blu3c",p4="blu4c",p5="blu5c",p6="blu6c",p7="blu7c",p8="blu8c",p="blu0c",pc="blu10",h1=true,dw=true},
[6]={s=7,p1="spear1",p2="spear2",p3="spear3",p4="spear4",p5="spear5",p6="spear6",p7="spear7",p8="spear8",p="spear0"},
[-2]={s=7,p1="spear1a",p2="spear2a",p3="spear3a",p4="spear4a",p5="spear5a",p6="spear6a",p7="spear7a",p8="spear8a",p="spear0",h1=true,dw=true},
[7]={s=6,p1="axe1a",p2="axe2a",p3="axe3a",p4="axe4a",p5="axe5a",p6="axe6a",p7="axe7a",p8="axe8a",p="axe0",h1=true,dw=true},
[8]={s=6,p1="axe1b",p2="axe2b",p3="axe3b",p4="axe4b",p5="axe5b",p6="axe6b",p7="axe7b",p8="axe8b",p="axe0"},
[9]={s=23,p1="mark1a",p2="mark2a",p3="mark3a",p4="mark4a",p5="mark5a",p6="mark6a",p="mark0a"},
[10]={s=23,p1="mark1b",p2="mark2b",p3="mark3b",p4="mark4b",p5="mark5b",p6="mark6b",p="mark0b"},
[11]={s=23,p1="mark1c",p2="mark2c",p3="mark3c",p4="mark4c",p5="mark5c",p6="mark6c",p="mark0c",h1=true}}

local T = {Fire = timer, Frost = timer, Shock = timer, Poison = timer, Vital = timer, Heal = timer, Prok = timer, AUR = timer, DC = timer, Ray = timer, TS = timer, DET = timer, PCT = timer, MCT = timer, QST = timer,
LI = timer, Dash = timer, Dod = timer, Kik = timer, CT = timer, CST = timer, Shield = timer, Comb = timer, POT = timer, Run = timer, AoE = timer, Tot = timer, WaterB = timer, Arb = timer, Met = timer}
local L = {ATR = {[0] = "strength", [1] = "intelligence", [2] = "willpower", [3] = "agility", [4] = "speed", [5] = "endurance", [6] = "personality", [7] = "luck"},
ATRIC = {[0] = "icons/k/attribute_strength.dds", [1] = "icons/k/attribute_int.dds", [2] = "icons/k/attribute_wilpower.dds", [3] = "icons/k/attribute_agility.dds", [4] = "icons/k/attribute_speed.dds",
[5] = "icons/k/attribute_endurance.dds", [6] = "icons/k/attribute_personality.dds", [7] = "icons/k/attribute_luck.dds"},
S = {"armorer", "mediumArmor", "heavyArmor", "bluntWeapon", "longBlade", "axe", "spear", "athletics", "enchant", "destruction", "alteration", "illusion", "conjuration", "mysticism", "restoration",
"alchemy", "unarmored", "security", "sneak", "acrobatics", "lightArmor", "shortBlade", "marksman", "mercantile", "speechcraft", "handToHand", [0] = "block"},
SK = {[4] = "skw", [5] = "skw", [6] = "skw", [7] = "skw", [22] = "skw", [23] = "skw", [26] = "skw", [18] = "sksec", [0] = "skarm", [2] = "skarm", [3] = "skarm", [17] = "skarm", [21] = "skarm", [10] = "skmag", [11] = "skmag",
[12] = "skmag", [13] = "skmag", [14] = "skmag", [15] = "skmag"}, MENSK = {[8] = true, [1] = "skcraft", [16] = "skcraft", [24] = "sksoc", [25] = "sksoc"}, skmag = 1, sken = 1, skw = 1, skarm = 1, sksec = 1,
BS = {["Wombburned"] = "atronach", ["Fay"] = "mage", ["Beggar's Nose"] = "tower", ["Blessed Touch Sign"] = "ritual", ["Charioteer"] = "steed", ["Elfborn"] = "apprentice", ["Hara"] = "thief",
["Lady's Favor"] = "lady", ["Mooncalf"] = "lover", ["Moonshadow Sign"] = "shadow", ["Star-Cursed"] = "serpent", ["Trollkin"] = "lord", ["Warwyrd"] = "warrior"},
SA = {0,5,5,0,0,0,3,5,2,2,1,1,2,1,2,1,4,3,3,3,4,4,3,6,6,4,[0]=3}, SA2 = {3,3,0,5,3,5,0,4,1,1,2,2,1,2,1,3,2,1,4,4,3,3,0,1,1,0,[0]=5}, SS = {0,0,0,0,0,0,0,0,1,1,1,1,1,1,1,1,1,2,2,2,2,2,2,2,2,2,[0]=0},
CHP = {10, -10, 0, 30, 10, -30, -10, 0, 20, 50, 30, 0, -20, -50, -50, -40, -30, 0, 0, 20, 40, 30, -20, 0, [0] = 0}, RHP = {Orc = 20, Nord = 20, Argonian = 10, Imperial = 10, Redguard = 10},
CARM = {5, 0, 0, 10, 5, 0, 0, 0, 5, 30, 20, 10, 0, 0, 0, 0, 0, 0, 0, 0, 10, 10, 0, 0, [0] = 0},
CSP = {"01","02","03","04","05","06","07","08","09","10","11","12","13","14","15","16","17","18","19","20","21","22","23","24"},
CRU = {"Боец","Маг","Вор","Воин","Боевой маг","Заклинатель","Агент","Ловкач","Скаут","Варлорд","Паладин","Спеллсворд","Шаман","Архимаг","Магициан","Найтблейд","Трикстер","Ассасин","Плут","Дуэлист","Варвар",
"Герой","Искатель","Странник", m1 = "Вы больше не зеленый новичок и стали довольно сильны. Какой путь вы хотите избрать?", m2 = "Вы достигли значительных высот. Каким путем вы продолжите идти к вершине?",
m3 = "В своем могуществе вы сравнились с богами, а ваши подвиги будут воспеты в легендах. Какое место вы в них займете?", [0] = "Мне надо подумать", leg = "Очков легендарности: %d"},
CEN = {"Fighter","Mage","Thief","Warrior","Battle mage","Sorcerer","Agent","Dodger","Scout","Warlord","Paladin","Spellsword","Shaman","Archmage","Magician","Night blade","Trickster","Assassin","Rogue","Duelist","Barbarian",
"Hero","Seeker","Wanderer", m1 = "You are no longer a green rookie and have become quite strong. Which path do you want to take?", m2 = "You have reached significant heights. Which way will you continue to go to the top?",
m3 = "You have been compared with the gods in your power, and your deeds will be sung in legends. What place will you take in them?", [0] = "I need to think", leg = "Legendary points: %d"},
CV = {{4,5,9}, {6,5,7}, {8,7,9}, {10,11,12,20,21,22}, {11,12,13,22,23}, {14,12,13,15,16,23}, {15,16,17,23,24}, {18,16,17,19,20,24}, {19,20,21,22,24}, [0] = {1,2,3}},
LEG = {TR_SothaSil = 100, BM_WildHunt = 100, HH_WinCamonna = 100, HR_Archmaster = 100, HT_Archmagister = 100, TG_KillHardHeart = 100, FG_KillHardHeart = 100, MG_Guildmaster = 100,
IL_Grandmaster = 100, TT_Assarnibibi = 100, MT_Grandmaster = 100, IC29_Crusher = 50},
PRL = {{"strength", "icons/k/attribute_strength.dds", 0}, {"endurance", "icons/k/attribute_endurance.dds", 5}, {"speed", "icons/k/attribute_speed.dds", 4}, {"agility", "icons/k/attribute_agility.dds", 3}, {"intelligence", "icons/k/attribute_int.dds", 1},
{"willpower", "icons/k/attribute_wilpower.dds", 2}, {"personality", "icons/k/attribute_personality.dds", 6}, {"luck", "icons/k/attribute_luck.dds", 7}, {"longBlade", "icons/k/combat_longblade.dds", 5}, {"axe", "icons/k/combat_axe.dds", 6},
{"bluntWeapon", "icons/k/combat_blunt.dds", 4}, {"spear", "icons/k/combat_spear.dds", 7}, {"mediumArmor", "icons/k/combat_mediumarmor.dds", 2}, {"heavyArmor", "icons/k/combat_heavyarmor.dds", 3}, {"block", "icons/k/combat_block.dds", 0},
{"athletics", "icons/k/combat_athletics.dds", 8}, {"armorer", "icons/k/combat_armor.dds", 1}, {"destruction", "icons/k/magic_destruction.dds", 10}, {"alteration", "icons/k/magic_alteration.dds", 11}, {"mysticism", "icons/k/magic_mysticism.dds", 14},
{"restoration", "icons/k/magic_restoration.dds", 15}, {"illusion", "icons/k/magic_illusion.dds", 12}, {"conjuration", "icons/k/magic_conjuration.dds", 13}, {"enchant", "icons/k/magic_enchant.dds", 9}, {"alchemy","icons/k/magic_alchemy.dds", 16},
{"unarmored", "icons/k/magic_unarmored.dds", 17}, {"shortBlade", "icons/k/stealth_shortblade.dds", 22}, {"marksman", "icons/k/stealth_marksman.dds", 23}, {"handToHand", "icons/k/stealth_handtohand.dds", 26}, {"lightArmor", "icons/k/stealth_lightarmor.dds", 21},
{"acrobatics", "icons/k/stealth_acrobatics.dds", 20}, {"sneak", "icons/k/stealth_sneak.dds", 19}, {"security", "icons/k/stealth_security.dds", 18}, {"mercantile", "icons/k/stealth_mercantile.dds", 24}, {"speechcraft", "icons/k/stealth_speechcraft.dds", 25}},


NSU = {["4as_atr4"] = {en = "Elemental triumvirate", ru = "Стихийный триумвират", c = 10, f = 4, d = 10, m = 10, ma = 20, {556}, {557}, {558}},
["4as_atr5"] = {en = "Elemental wave", ru = "Стихийная волна", c = 30, rt = 1, d = 1, m = 8, ma = 12, r = 5, {536}, {537}, {538}},
["4as_atr6"] = {en = "Elemental stream", ru = "Стихийный поток", c = 30, rt = 1, d = 1, m = 5, ma = 5, r = 5, {546}, {547}, {548}},
["4as_atr7"] = {en = "Elemental spread", ru = "Стихийный шквал", c = 50, rt = 1, d = 1, m = 10, ma = 20, r = 10, {536}, {537}, {538}},
["4as_atr8"] = {en = "Elemental ray", ru = "Стихийный луч", c = 50, rt = 1, d = 1, m = 10, ma = 10, r = 3, {546}, {547}, {548}},
["4as_atr9"] = {en = "Elemental charge", ru = "Стихийный заряд", c = 30, d = 30, m = 10, ma = 20, {511}, {512}, {513}}},
PA = {atb1={117,5,"long01","Мастер меча","Sword master"}, atb2={117,5,"axe01","Мастер топора","Ax master"}, atb3={117,5,"blu01","Мастер булавы","Mace master"}, atb4={117,5,"spear01","Мастер копья","Spear master"},
atb5={117,5,"short01","Мастер ножа","Knife master"}, atb6={117,5,"mark01","Мастер стрельбы","Shooting master"}, atb7={117,5,"hand01","Мастер кулака","Fist master"}, atb8={117,5,"spd01","Быстрая атака","Fast attack"},
atb9={117,5,"agi01","Ловкая атака","Dexterous attack"}, atb10={117,5,"luc01","Удачная атака","Lucky attack"},
san1 = {42,5,"una01","Мастер без брони","Master without armor"}, san2 = {42,5,"lig01","Легкое уклонение","Easy evasion"}, san3 = {42,5,"bloc01","Парирование","Parry"}, san4 = {42,5,"short02","Воровской уворот","Thief evasion"}, 
san5 = {42,5,"hand02","Отклонение атак","Deflecting attacks"}, san6 = {42,5,"acr01","Боевая акробатика","Combat acrobatics"}, san7 = {42,5,"sec01","Чувство опасности","Sense of danger"},
san8 = {42,5,"spd02","Быстрое уклонение","Fast evasion"}, san9 = {42,5,"agi02","Ловкое уклонение","Dexterous evasion"}, san10 = {42,5,"luc02","Удачное уклонение","Lucky evasion"},
mag1 = {84,2,"res04","Мастер Восстановления","Master of Restoration"}, mag2 = {84,2,"des04","Мастер Разрушения","Master of Destruction"}, mag3 = {84,2,"alt04","Мастер Изменения","Master of Alteration"},
mag4 = {84,2,"ill04","Мастер Иллюзий","Illusion master"}, mag5 = {84,2,"con04","Мастер Колдовства","Master of Conjuration"}, mag6 = {84,2,"mys04","Мастер Мистицизма","Master of Mysticism"},
mag7 = {84,2,"enc01","Душа мага","Magician soul"}, mag8 = {84,2,"una02","Чистый разум","Clear mind"}, mag9 = {84,2,"int01","Разум мага","Magician mind"}, mag10 = {84,2,"wil01","Дух мага","Magician spirit"}, 
fea1 = {8,20,"med01","Привыкание к нагрузке","Addictive to encumrance"}, fea2 = {8,20,"hev01","Привыкание к перегрузке","Addictive to overload"}, fea3 = {8,20,"atl01","Тренированные мышцы","Trained muscles"},
fea4 = {8,20,"str01","Мул","Mule"}, fea5 = {8,20,"end01","Крепкий хребет","Strong ridge"},
stam1 = {77,2,"med02","Привыкание к доспехам","Addictive to armor"}, stam2 = {77,2,"hev02","Привыкание к броне","Addictive to heavy armor"}, stam3 = {77,2,"atl02","Тренировка дыхания","Breathing training"},
stam4 = {77,2,"str02","Сильные мышцы","Strong muscles"}, stam5 = {77,2,"end02","Источник сил","Source of strength"}, stam6 = {77,2,"axe02","Сила топорщика","Power of axeman"}, stam7 = {77,2,"blu02","Сила дубинщика","Power of clubman"},
stam8 = {77,2,"spear02","Сила копейщика","Power of spearman"}, stam9 = {77,2,"hand03","Сила бойца","Power of fighter"}, stam10 = {77,2,"arm01","Сила кузнеца","Power of blacksmith"},
mpr1 = {76,0,"mys05","Глубокая медитация","Deep meditation",m=1}, mpr2 = {76,0,"enc02","Душевная медитация","Soul meditation",m=1},
mpr3 = {76,0,"int02","Осознанная медитация","Mindful meditation",m=1}, mpr4 = {76,0,"wil02","Духовная медитация","Spiritual meditation",m=1},
hpr1 = {75,0,"res05","Бессмертие","Immortality",m=1}, hpr2 = {75,0,"end03","Источник жизни","Life source",m=1},
abs1 = {67,5,"alt05","Энерготрансформатор","Energy transformer"}, abs2 = {67,5,"mys06","Энергоабсорбатор","Energy absorber"}, ref1 = {68,5,"mys07","Энергореверсор","Energy reverser"},
dete = {65,100,"enc03","Магическое чутье","Magical sense"}, deta = {64,100,"sec03","Воровское чутье","Thief's instinct"}, detk = {66,100,"sec02","Жадность","Greed"}, nig = {43,20,"mark02","Глаз-алмаз","Diamond eye"}},
AA = {["4a_long"] = {p = "long00", s = 5}, ["4a_short"] = {p = "short00", s = 22}, ["4a_axe"] = {p = "axe00", s = 6}, ["4a_blu"] = {p = "blu00", s = 4}, ["4a_spear"] = {p = "spear00", s = 7}, ["4a_mark"] = {p = "mark00", s = 23},
["4a_hand"] = {p = "hand00", s = 26}, ["4a_lig"] = {p = "lig00", s = 21}, ["4a_med"] = {p = "med00", s = 2}, ["4a_hev"] = {p = "hev00", s = 3}, ["4a_una"] = {p = "una00", s = 17}, ["4a_bloc"] = {p = "bloc00", s = 0}, 
["4a_acr"] = {p = "acr00", s = 20}, ["4a_atl"] = {p = "atl00", s = 8}, ["4a_arm"] = {p = "arm00", s = 1}, ["4a_enc"] = {p = "enc00", s = 9}, ["4a_alc"] = {p = "alc00", s = 16}, ["4a_snek"] = {p = "snek00", s = 19},
["4a_sec"] = {p = "sec00", s = 18}, ["4a_spec"] = {p = "spec00", s = 25}, ["4a_merc"] = {p = "merc00", s = 24},
["4a_des1"] = {p = "des01"}, ["4a_des2"] = {p = "des02"}, ["4a_des3"] = {p = "des03"}, ["4a_alt1"] = {p = "alt01"}, ["4a_alt2"] = {p = "alt02"}, ["4a_alt3"] = {p = "alt03"},
["4a_res1"] = {p = "res01"}, ["4a_res2"] = {p = "res02"}, ["4a_res3"] = {p = "res03"}, ["4a_mys1"] = {p = "mys01", s = 14}, ["4a_mys2"] = {p = "mys02"}, ["4a_mys3"] = {p = "mys03"},
["4a_ill1"] = {p = "ill01"}, ["4a_ill2"] = {p = "ill02"}, ["4a_ill3"] = {p = "ill03", s = 12}, ["4a_con1"] = {p = "con01"}, ["4a_con2"] = {p = "con02", s = 13}, ["4a_con3"] = {p = "con03", s = 13},
["4a_str"] = {p = "str00"}, ["4a_end"] = {p = "end00"}, ["4a_agi"] = {p = "agi00"}, ["4a_spd"] = {p = "spd00"}, ["4a_int"] = {p = "int00"}, ["4a_wil"] = {p = "wil00"}, ["4a_per"] = {p = "per00"}},
STAR = {["4as_atr4"]=true,["4nm_star_apprentice1a"]=true,["4nm_star_lady1a"]=true, ["4nm_star_lord1a"]=true, ["4nm_star_lover1a"]=true, ["4nm_star_mage1a"]=true, ["4nm_star_steed1a"]=true, ["4nm_star_thief1a"]=true,
["4nm_star_warrior1a"]=true, ["4nm_star_ritual1a"]=true, ["4nm_star_ritual2a"]=true, ["4nm_star_ritual3a"]=true, ["4nm_star_serpent3a"]=true, ["4nm_star_shadow1a"]=true, ["4nm_star_shadow2a"]=true, ["4nm_star_shadow3a"]=true},
NEWSP = {{600,0,600,10,20,0,10,10,"Dash"},	{500,2,500,0,0,0,0,10,"Teleport"},
{501,0,501,5,10,0,5,30,"Recharge"},			{502,0,502,10,20,0,5,30,"Repair weapon"},	{503,0,503,20,30,0,5,30,"Repair armor"},		{504,2,504,8,12,0,60,5,"Lantern"},			{505,0,505,0,0,0,0,100,"Town teleport"},
{506,0,506,0,0,0,60,5,"Magic control"},		{507,0,507,5,10,0,30,20,"Reflect spells"},	{508,0,508,5,10,0,30,20,"Kinetic shield"},		{509,0,509,20,30,0,20,20,"Life leech"},		{510,0,510,20,30,0,10,20,"Time shift"},
{601,0,601,0,0,0,60,5,"Bound ammo"},		{602,2,602,20,30,20,0,10,"Kinetic strike"},	{603,0,603,0,0,0,60,30,"Bound weapon"},			{"504a",0,504,8,12,0,60,5,"Lantern (smart)"},
{511,0,511,8,12,0,30,10,"Charge fire"},		{512,0,512,8,12,0,30,10,"Charge frost"},	{513,0,513,8,12,0,30,10,"Charge lightning"},	{514,0,514,8,12,0,30,10,"Charge poison"},	{515,0,515,8,12,0,30,10,"Charge magic"},
{516,0,516,8,12,0,30,10,"Aura fire"},		{517,0,517,8,12,0,30,10,"Aura frost"},		{518,0,518,8,12,0,30,10,"Aura lightning"},		{519,0,519,8,12,0,30,10,"Aura poison"},		{520,0,520,8,12,0,30,10,"Aura magic"},
{521,2,521,8,12,20,10,30,"AoE fire"},		{522,2,522,8,12,20,10,30,"AoE frost"},		{523,2,523,8,12,20,10,40,"AoE lightning"},		{524,2,524,8,12,20,10,50,"AoE poison"},		{525,2,525,8,12,20,10,40,"AoE magic"},
{526,2,526,40,60,15,1,15,"Rune fire"},		{527,2,527,40,60,15,1,15,"Rune frost"},		{528,2,528,40,60,15,1,20,"Rune lightning"},		{529,2,529,40,60,15,1,25,"Rune poison"},	{530,2,530,40,60,15,1,20,"Rune magic"},
{531,0,531,10,20,0,20,10,"Prok fire"},		{532,0,532,10,20,0,20,10,"Prok frost"},		{533,0,533,10,20,0,20,10,"Prok lightning"},		{534,0,534,10,20,0,20,10,"Prok poison"},	{535,0,535,10,20,0,20,10,"Prok magic"},
{536,1,536,10,30,10,1,30,"Spread fire"},	{537,1,537,10,30,10,1,30,"Spread frost"},	{538,1,538,10,30,10,1,40,"Spread lightning"},	{539,1,539,10,30,10,1,50,"Spread poison"},	{540,1,540,10,30,10,1,40,"Spread magic"},
{541,1,541,50,100,15,1,30,"Discharge fire"},{542,1,542,50,100,15,1,30,"Discharge frost"}, {543,1,543,50,100,15,1,40,"Discharge lightning"}, {544,1,544,50,100,15,1,50,"Discharge poison"},{545,1,545,50,100,15,1,40,"Discharge magic"},
{546,1,546,6,6,5,1,15,"Ray fire"},			{547,1,547,6,6,5,1,15,"Ray frost"},			{548,1,548,6,6,5,1,20,"Ray lightning"},			{549,1,549,6,6,5,1,25,"Ray poison"},		{550,1,550,6,6,5,1,20,"Ray magic"},
{551,2,551,10,20,5,20,10,"Totem fire"},		{552,2,552,10,20,5,20,10,"Totem frost"},	{553,2,553,10,20,5,20,10,"Totem lightning"},	{554,2,554,10,20,5,20,10,"Totem poison"},	{555,2,555,10,20,5,20,10,"Totem magic"},
{556,0,556,10,20,0,30,30,"Empower fire"},	{557,0,557,10,20,0,30,30,"Empower frost"},	{558,0,558,10,20,0,30,30,"Empower lightning"},	{559,0,559,10,20,0,30,30,"Empower poison"},	{560,0,560,10,20,0,30,30,"Empower magic"},
{561,0,561,5,10,0,30,20,"Reflect fire"},	{562,0,562,5,10,0,30,20,"Reflect frost"},	{563,0,563,5,10,0,30,20,"Reflect lightning"},	{564,0,564,5,10,0,30,20,"Reflect poison"},	{565,0,565,5,10,0,30,20,"Reflect magic"}},
SFS = {500,501,502,503,504,"504a",505,506,507,508,509,510,511,512,513,514,515,516,517,518,519,520,521,522,523,524,525,526,527,528,529,530,531,532,533,534,535,536,537,538,539,540,541,542,543,544,545,546,547,548,549,550,
551,552,553,554,555,556,557,558,559,560,561,562,563,564,565,600,601,602,603},
SSEL = {["marayn dren"] = {"flame", "fire bite", "fireball", "firefist", "Fireball_large", "firebloom", "flamebolt", "shard", "frostbite", "frostball", "frostfist", "Frostball_large", 
"frostbloom", "frost bolt", "spark", "shock", "shockball", "stormhand", "shockball_large", "shockbloom", "lightning bolt", "disintegrate armor", "disintegrate weapon", "burden touch", "open", "great open", "jump", 
"fierce frost shield", "fierce fire shield", "fierce shock shield"},
["sharn gra-muzgob"] = {"strong heal companion", "great heal companion", "great resist shock", "cure poison touch", "Cure Blight Disease", "blessed touch", "blessed word"},
["estirdalin"] = {"deadly poison [ranged]", "potent poison [ranged]", "cruel earwig", "noise"},
["scelian plebo"] = {"daedric luck", "daedric intelligence", "daedric personality", "daedric endurance", "daedric speed", "daedric strength", "daedric agility"}, 
["aunius autrus"] = {"absorb spell points", "absorb spell points [ranged]", "absorb health [ranged]", "absorb intelligence [ranged]", "absorb willpower [ranged]", "absorb endurance [ranged]", "absorb agility [ranged]", "absorb luck [ranged]"},
["erer darothril"] = {"burning touch", "fire storm", "cruel firebloom", "wizard's fire", "freezing touch", "frost storm", "brittlewind", "wizard rend", "shocking touch", "wild shockbloom", "dire shockball", "god's spark", "frenzy humanoid", "frenzy creature"},
["felen maryon"] = {"command beast", "commanding touch", "drain heavy armor", "drain illusion", "drain light armor", "drain long blade", "drain marksman", "drain medium armor", "drain mercantile"},
},
ING = {["4nm"]=true, ["4nm_met"]=true, ["4nm_tet"]=true, ["Enchant_right"]=true, ["Enchant_left"]=true, ["Blur"]=true, ["Rally"]=true, ["Electroshock"]=true, ["KO"]=true, ["Spawn_buff"]=true, ["Summon"]=true, ["Dodge"]=true},
BREG = {"CW","RF","RFS","RAY","SG","PR","ElSh","AUR","RUN","TOT","AOE","DC","TS"},	--SREG = {"DC"},
BU = {{n="aureal",{2,13,20,30,10,1}}, {n="goldaura",{0,3,10,20,0,180}}, {n="elemaura",{0,4,10,20,0,180}, {0,556,10,20,0,180}, {0,561,10,20,0,180}},
{n="Fire_arrow",{2,14,5,10,1,1}},	{n="Fire_ball",{2,14,10,20,5,1}},	{n="Fire_bolt",{2,14,20,30,10,1}},	{n="Fire_touch",{1,14,5,10,1,1}},
{n="Frost_arrow",{2,16,5,10,1,1}},	{n="Frost_ball",{2,16,10,20,5,1}},	{n="Frost_bolt",{2,16,20,30,10,1}},	{n="Frost_touch",{1,16,5,10,1,1}},
{n="Shock_arrow",{2,15,5,10,1,1}},	{n="Shock_ball",{2,15,10,20,5,1}},	{n="Shock_bolt",{2,15,20,30,10,1}},	{n="Shock_touch",{1,15,5,10,1,1}},
{n="Poison_arrow",{2,27,1,2,1,5}},	{n="Poison_ball",{2,27,2,4,5,5}},	{n="Poison_bolt",{2,27,4,6,10,5}},
{n="Chaos_arrow",{2,23,5,10,1,1}},	{n="Chaos_ball",{2,23,10,20,5,1}},	{n="Chaos_bolt",{2,23,20,30,10,1}},	{n="Chaos_touch",{1,23,5,10,1,1}},
{n="Elemental_touch",{1,14,5,10,1,1},{1,16,5,10,1,1},{1,15,5,10,1,1}},	{n="Storm_touch",{1,15,5,10,1,1},{1,16,5,10,1,1}},	{n="Eerie_touch",{1,23,5,10,1,1},{1,16,5,10,1,1}}, {n="Filth_touch",{1,23,5,10,1,1},{1,27,5,10,1,1}},
{n="Poison_bite",{0,27,1,2,0,5},w=1}, {n="Spider_bite",{0,27,2,3,0,10},{0,45,1,1,0,3},w=1}},
CLEN = {200,300,300,1000,300,300,300,1000,1000,[0]=300}, AREN = {500,100,100,200,300,500,500,500,400,400,[0]=1000}, ARW = {6,2,2,3,3,1,1,5,[0]=2}, AltW = {2, 1, 4, 3, 3, 1, 8, 7},	AG = {[34] = "KO", [35] = "KO"},
Traum = {"strength", "endurance", "agility", "speed", "intelligence"},	HealStat = {"endurance", "strength", "agility", "speed", "intelligence", "willpower", "personality", "fatigue"},
BW = {{"dagger", "tanto", "kris", "knife", "knuckle", "shortsword", "wakizashi", "machete"},
{"longsword", "broadsword", "sword", "katana", "saber", "scimitar", "shamshir", "rapier", "waraxe", "axe", "mace", "club"},
{"claymore", "bastard", "daikatana", "kreigmesser", "battleaxe", "grandaxe", "warhammer", "spear", "longspear", "halberd", "bardiche", "glaive", "warscythe", "pitchfork", "staff"},
{"longbow", "crossbow"}},
CStats = {"strength", "endurance", "agility", "speed", "intelligence", "willpower", "luck", "personality", "combat", "magic", "stealth"},
CrBlackList = {["BM_hircine_straspect"] = true,["BM_hircine_spdaspect"] = true,["BM_hircine_huntaspect"] = true,["BM_hircine"] = true,["vivec_god"] = true,["Almalexia_warrior"] = true,["almalexia"] = true,
["dagoth_ur_1"] = true,["dagoth_ur_2"] = true,["Imperfect"] = true,["lich_barilzar"] = true,["lich_relvel"] = true,["yagrum bagarn"] = true,["bm_frost_giant"] = true,["dagoth araynys"] = true,["dagoth endus"] = true,
["dagoth gilvoth"] = true,["dagoth odros"] = true,["dagoth tureynul"] = true,["dagoth uthol"] = true,["dagoth vemyn"] = true,["heart_akulakhan"] = true, ["mudcrab_unique"] = true, ["scamp_creeper"] = true,
["4nm_target"] = true},
CID = {["bonewalker"] = "zombirise", ["bonewalker_weak"] = "zombirise", ["Bonewalker_Greater"] = "zombirise", ["golden saint"] = "auril", ["golden saint_summon"] = "auril",
["BM_bear_black"] = "bear", ["BM_bear_brown"] = "bear", ["BM_bear_snow_unique"] = "bear", ["BM_wolf_grey"] = "wolf", ["BM_wolf_red"] = "wolf", ["BM_wolf_snow_unique"] = "wolf", ["BM_wolf_grey_lvl_1"] = "wolf",
["centurion_spider"] = "dwem", ["centurion_sphere"] = "dwem", ["centurion_steam"] = "dwem", ["centurion_projectile"] = "dwem", ["centurion_steam_advance"] = "dwem",
["centurion_spider_miner"] = "dwem", ["centurion_spider_tower"] = "dwem", ["centurion_sword"] = "dwem", ["centurion_weapon"] = "dwem", ["centurion_tank"] = "dwem",
},
CAR = {["atronach_flame"] = 20, ["atronach_flame_summon"] = 20, ["atronach_frost"] = 40, ["atronach_frost_summon"] = 40, ["atronach_storm"] = 60, ["atronach_storm_summon"] = 60, ["atronach_frost_BM"] = 50,
["atronach_flame_lord"] = 60, ["atronach_frost_lord"] = 100, ["atronach_storm_lord"] = 120,

["dremora"] = 50, ["dremora_summon"] = 50, ["dremora_lord"] = 80, ["dremora_mage"] = 10, ["dremora_mage_s"] = 10, ["xivkyn"] = 60, ["xivkyn_s"] = 60, ["skaafin"] = 40, ["skaafin_archer"] = 25, ["skaafin_archer_s"] = 25,
["golden saint"] = 40, ["golden saint_summon"] = 40, ["mazken"] = 30, ["mazken_s"] = 30,
["clannfear"] = 15, ["clannfear_summon"] = 15, ["vermai"] = 10, ["hunger"] = 10, ["hunger_summon"] = 10, ["ogrim"] = 30, ["ogrim titan"] = 40, ["daedroth"] = 20, ["daedroth_summon"] = 20,
["winged twilight"] = 5, ["winged twilight_summon"] = 5, ["daedraspider"] = 5, ["daedraspider_s"] = 5, ["xivilai"] = 40, ["xivilai_s"] = 40,


["skeleton"] = 10, ["skeleton_summon"] = 10, ["skeleton entrance"] = 10, ["skeleton_weak"] = 5, ["skeleton archer"] = 15, ["skeleton_archer_s"] = 15, ["skeleton_mage"] = 10, ["skeleton_mage_s"] = 10, 
["skeleton warrior"] = 30, ["skeleton champion"] = 40, ["skeleton_knight"] = 50, ["bm skeleton champion gr"] = 60,
["bonewalker"] = 5, ["bonewalker_weak"] = 5, ["Bonewalker_Greater"] = 5, ["Bonewalker_Greater_summ"] = 5, ["bonewalker_summon"] = 5, ["bonelord"] = 15, ["bonelord_summon"] = 15,
["lich"] = 20, ["lich_elder"] = 30, ["BM_wolf_skeleton"] = 5, ["BM_wolf_bone_summon"] = 5,

["BM_draugr01"] = 15, ["draugr"] = 15, ["draugr_fem"] = 30, ["draugr_soldier"] = 40, ["draugr_warrior"] = 50, ["draugr_general"] = 70, ["draugr_priest"] = 30,


["corprus_stalker"] = 5, ["corprus_lame"] = 15, ["ash_slave"] = 10, ["ash_zombie"] = 5, ["ash_ghoul"] = 20, ["ash_ghoul_high"] = 25,
["ash_revenant"] = 40, ["ash_zombie_warrior"] = 40, ["ash_ghoul_warrior"] = 50, ["ascended_sleeper"] = 40,

["centurion_spider"] = 70, ["centurion_sphere"] = 80, ["centurion_sphere_summon"] = 80, ["centurion_steam"] = 90, ["centurion_projectile"] = 80, ["centurion_steam_advance"] = 100,
["centurion_spider_miner"] = 70, ["centurion_spider_tower"] = 70, ["centurion_sword"] = 90, ["centurion_weapon"] = 80, ["centurion_tank"] = 150,


["alit"] = 10, ["alit_diseased"] = 10, ["alit_blighted"] = 10, ["dreugh"] = 30, ["dreugh_soldier"] = 50, ["dreugh_land"] = 40, ["guar"] = 10, ["guar_feral"] = 10, ["guar_pack"] = 20,
["kagouti"] = 15, ["kagouti_diseased"] = 15, ["kagouti_blighted"] = 15, ["kagouti_dire"] = 20,
["kwama worker"] = 25, ["kwama worker diseased"] = 25, ["kwama worker blighted"] = 25, ["kwama worker entrance"] = 30, ["kwama warrior"] = 30, ["kwama warrior blighted"] = 30, ["mudcrab"] = 30, ["mudcrab-Diseased"] = 30,
["netch_bull"] = 10, ["netch_bull_ranched"] = 10, ["netch_betty"] = 5, ["netch_betty_ranched"] = 5, ["nix-hound"] = 10, ["nix-hound blighted"] = 10, ["nix_mount"] = 15,
["shalk"] = 15, ["shalk_diseased"] = 15, ["shalk_blighted"] = 15,
["durzog_wild"] = 15, ["durzog_wild_weaker"] = 10, ["durzog_war"] = 20, ["durzog_war_trained"] = 20, ["durzog_diseased"] = 15,
["goblin_grunt"] = 5, ["goblin_footsoldier"] = 15, ["goblin_bruiser"] = 25, ["goblin_handler"] = 20, ["goblin_officer"] = 35, ["goblin_shaman"] = 5,
["fabricant_verminous"] = 40, ["fabricant_summon"] = 40, ["fabricant_hulking"] = 60,
["BM_wolf_grey"] = 10, ["BM_wolf_red"] = 10, ["BM_wolf_snow_unique"] = 10, ["BM_wolf_grey_summon"] = 10, ["BM_bear_black"] = 20, ["BM_bear_brown"] = 20, ["BM_bear_snow_unique"] = 20, ["BM_bear_black_summon"] = 20,

["BM_riekling"] = 15, ["BM_riekling_berserk"] = 20, ["BM_riekling_hunter"] = 15, ["BM_riekling_warrior"] = 30, ["BM_riekling_heavy"] = 60, ["BM_riekling_chieftain"] = 40, ["BM_riekling_shaman"] = 15, 
["BM_riekling_mounted"] = 15, ["BM_riekling_mounted_war"] = 30, 
["BM_frost_boar"] = 15, ["BM_spriggan"] = 30, ["BM_ice_troll"] = 30, ["BM_ice_troll_tough"] = 40},

CDIS = {["corprus_lame"] = "black-heart blight", ["corprus_stalker"] = "ash-chancre", ["ash_ghoul"] = "ash woe blight", ["ash_slave"] = "ash woe blight", ["ash_zombie"] = "ash woe blight",
["ash_ghoul_high"] = "ash woe blight", ["ash_ghoul_warrior"] = "ash woe blight", ["ash_zombie_warrior"] = "ash woe blight", ["ascended_sleeper"] = "ash woe blight", ["ash_revenant"] = "ash-chancre", 
["alit_blighted"] = "black-heart blight", ["nix-hound blighted"] = "black-heart blight", ["rat_blighted"] = "black-heart blight", ["cliff racer_blighted"] = "ash-chancre", ["kagouti_blighted"] = "chanthrax blight",
["shalk_blighted"] = "ash woe blight",

["alit_diseased"] = "ataxia", ["cliff racer_diseased"] = "helljoint", ["kagouti_diseased"] = "yellow tick", ["mudcrab-Diseased"] = "swamp fever", ["rat_diseased"] = "witbane",
["scrib diseased"] = "droops", ["kwama worker diseased"] = "droops", ["shalk_diseased"] = "collywobbles",
["BM_wolf_red"] = "rattles", ["BM_bear_brown"] = "rust chancre", ["durzog_diseased"] = "rotbone",

["kagouti_dire"] = "rockjoint", ["nix_mount"] = "dampworm", ["dreugh_land"] = "wither", ["netch_bull"] = "serpiginous dementia", ["netch_betty"] = "serpiginous dementia", ["slaughterfish"] = "greenspore",
["bonewalker"] = "brown rot", ["Bonewalker_Greater"] = "brown rot", ["bonewalker_weak"] = "brown rot"},

CPOI = {["alit"] = {"Poison_bite",50}, ["alit_diseased"] = {"Poison_bite",80}, ["alit_blighted"] = {"Poison_bite",80},
["kwama forager"] = {"Poison_bite",30}, ["kwama forager blighted"] = {"Poison_bite",50}, ["netch_bull"] = {"Poison_bite",30},
["vermai"] = {"Poison_bite",30}, ["daedraspider"] = {"Spider_bite",30}, ["daedraspider_s"] = {"Spider_bite",10}, ["daedroth"] = {"Poison_bite",50}, ["daedroth_summon"] = {"Poison_bite",30}},

CMAG = {["atronach_flame"] = {"Fire_touch",100}, ["atronach_flame_summon"] = {"Fire_touch",100}, ["atronach_flame_lord"] = {"Fire_touch",100}, 
["atronach_frost"] = {"Frost_touch",100}, ["atronach_frost_summon"] = {"Frost_touch",100}, ["atronach_frost_lord"] = {"Frost_touch",100}, ["atronach_frost_BM"] = {"Frost_touch",100}, 
["atronach_storm"] = {"Shock_touch",100}, ["atronach_storm_summon"] = {"Shock_touch",100}, ["atronach_storm_lord"] = {"Shock_touch",100},
["winged twilight"] = {"Storm_touch",30}, ["winged twilight_summon"] = {"Storm_touch",20},
["dremora_mage"] = {"Elemental_touch",50}, ["dremora_mage_s"] = {"Elemental_touch",30}, ["golden saint"] = {"Elemental_touch",20}, ["golden saint_summon"] = {"Elemental_touch",20},
["skeleton_mage"] = {"Elemental_touch",20}, ["skeleton_mage_s"] = {"Elemental_touch",20},
["bonelord"] = {"Chaos_touch",100}, ["bonelord_summon"] = {"Chaos_touch",50}, ["lich"] = {"Filth_touch",100}, ["lich_elder"] = {"Eerie_touch",100}, ["draugr_priest"] = {"Chaos_touch",50},
["ancestor_ghost"] = {"Frost_touch",50}, ["ancestor_ghost_summon"] = {"Frost_touch",30}, ["ancestor_ghost_greater"] = {"Eerie_touch",50}, ["dwarven ghost"] = {"Frost_touch",80}, 
["shalk"] = {"Fire_touch",30}, ["shalk_diseased"] = {"Fire_touch",20}, ["shalk_blighted"] = {"Fire_touch",40}, ["netch_betty"] = {"Shock_touch",30},
["BM_wolf_snow_unique"] = {"Frost_touch",20}, ["BM_bear_snow_unique"] = {"Frost_touch",20}, ["slaughterfish_electro"] = {"Shock_touch",50}},

MAC = {[0] = {"Fire_arrow","Frost_arrow","Shock_arrow","Chaos_arrow"},
["atronach_flame"] = {"Fire_ball","Fire_bolt"}, ["atronach_flame_summon"] = {"Fire_ball","Fire_bolt"}, ["atronach_flame_lord"] = {"Fire_bolt"},
["atronach_frost"] = {"Frost_ball","Frost_bolt"}, ["atronach_frost_summon"] = {"Frost_ball","Frost_bolt"}, ["atronach_frost_lord"] = {"Frost_bolt"}, ["atronach_frost_BM"] = {"Frost_ball","Frost_bolt"},
["atronach_storm"] = {"Shock_ball","Shock_bolt"}, ["atronach_storm_summon"] = {"Shock_ball","Shock_bolt"}, ["atronach_storm_lord"] = {"Shock_bolt"},
["dremora"] = {"Fire_arrow","Fire_ball"}, ["dremora_summon"] = {"Fire_arrow","Fire_ball"}, ["dremora_lord"] = {"Fire_ball","Fire_bolt"},
["golden saint"] = {"Fire_bolt","Frost_bolt","Shock_bolt"}, ["golden saint_summon"] = {"Fire_bolt","Frost_bolt","Shock_bolt"},
["mazken"] = {"Chaos_bolt","Frost_bolt","Shock_bolt"}, ["mazken_s"] = {"Chaos_bolt","Frost_bolt","Shock_bolt"},
["hunger"] = {"Chaos_arrow","Chaos_ball"}, ["hunger_summon"] = {"Chaos_arrow","Chaos_ball"},
["scamp"] = {"Fire_arrow"}, ["scamp_summon"] = {"Fire_arrow"}, ["daedroth"] = {"Poison_arrow","Poison_ball"}, ["daedroth_summon"] = {"Poison_arrow","Poison_ball"},
["winged twilight"] = {"Frost_arrow","Frost_ball","Shock_arrow","Shock_ball"}, ["winged twilight_summon"] = {"Frost_arrow","Frost_ball","Shock_arrow","Shock_ball"},
["dremora_mage"] = {"Fire_ball","Frost_ball","Shock_ball","Fire_bolt","Frost_bolt","Shock_bolt"}, ["dremora_mage_s"] = {"Fire_ball","Frost_ball","Shock_ball","Fire_bolt","Frost_bolt","Shock_bolt"},
["daedraspider"] = {"Poison_ball","Poison_bolt","Chaos_ball","Chaos_bolt"}, ["daedraspider_s"] = {"Poison_ball","Poison_bolt","Chaos_ball","Chaos_bolt"},
["xivilai"] = {"Fire_ball","Chaos_ball"}, ["xivilai_s"] = {"Fire_ball","Chaos_ball"},
["xivkyn"] = {"Fire_ball","Fire_bolt","Shock_ball","Shock_bolt"}, ["xivkyn_s"] = {"Fire_ball","Fire_bolt","Shock_ball","Shock_bolt"},

["ancestor_ghost"] = {"Chaos_arrow","Frost_arrow"}, ["ancestor_ghost_summon"] = {"Chaos_arrow","Frost_arrow"}, ["ancestor_ghost_greater"] = {"Chaos_arrow","Chaos_ball","Frost_arrow","Frost_ball"},
["Bonewalker_Greater"] = {"Chaos_arrow"}, ["Bonewalker_Greater_summ"] = {"Chaos_arrow"},
["bonelord"] = {"Chaos_ball","Chaos_bolt","Frost_ball","Frost_bolt"}, ["bonelord_summon"] = {"Chaos_ball","Chaos_bolt","Frost_ball","Frost_bolt"},
["skeleton_mage"] = {"Fire_arrow","Frost_arrow","Shock_arrow","Chaos_arrow","Fire_ball","Frost_ball","Shock_ball","Chaos_ball"},
["skeleton_mage_s"] = {"Fire_arrow","Frost_arrow","Shock_arrow","Chaos_arrow","Fire_ball","Frost_ball","Shock_ball","Chaos_ball"},
["lich"] = {"Frost_ball","Poison_ball","Chaos_ball","Frost_bolt","Poison_bolt","Chaos_bolt"}, ["lich_elder"] = {"Frost_bolt","Shock_bolt","Poison_bolt","Chaos_bolt"},
["ash_revenant"] = {"Poison_ball","Chaos_ball"}, ["draugr_priest"] = {"Frost_ball","Chaos_ball"},

["ash_slave"] = {"Fire_arrow","Frost_arrow","Shock_arrow"}, ["ash_ghoul"] = {"Chaos_ball","Chaos_bolt"}, ["ash_ghoul_warrior"] = {"Chaos_arrow","Chaos_ball"},
["ash_ghoul_high"] = {"Fire_bolt","Frost_bolt","Shock_bolt","Poison_bolt","Chaos_bolt"}, ["ascended_sleeper"] = {"Fire_bolt","Frost_bolt","Shock_bolt","Poison_bolt","Chaos_bolt"},

["centurion_spider_tower"] = {"Shock_arrow"}, ["centurion_spider_miner"] = {"Fire_arrow"},
["kwama warrior"] = {"Poison_arrow","Poison_ball"}, ["kwama warrior blighted"] = {"Poison_arrow","Poison_ball"},
["netch_bull"] = {"Poison_arrow","Poison_ball"}, ["netch_betty"] = {"Shock_arrow","Shock_ball"},
["goblin_handler"] = {"Fire_arrow"}, ["goblin_officer"] = {"Fire_arrow"}, ["goblin_shaman"] = {"Fire_arrow","Frost_arrow","Shock_arrow","Fire_ball","Frost_ball","Shock_ball"},
["BM_riekling_shaman"] = {"Fire_arrow","Frost_arrow","Shock_arrow","Fire_ball","Frost_ball","Shock_ball"},
["BM_spriggan"] = {"Frost_ball","Poison_ball"}},
Summon = {["atronach_flame_summon"] = true,["atronach_frost_summon"] = true,["atronach_storm_summon"] = true,["golden saint_summon"] = true,["daedroth_summon"] = true,["dremora_summon"] = true,["scamp_summon"] = true,
["winged twilight_summon"] = true,["clannfear_summon"] = true,["hunger_summon"] = true,["Bonewalker_Greater_summ"] = true,["ancestor_ghost_summon"] = true,["skeleton_summon"] = true,["bonelord_summon"] = true,
["daedraspider_s"] = true,["dremora_mage_s"] = true,["skaafin_archer_s"] = true,["xivkyn_s"] = true,["xivilai_s"] = true,["mazken_s"] = true,["skeleton_mage_s"] = true,["skeleton_archer_s"] = true,
["BM_bear_black_summon"] = true,["BM_wolf_grey_summon"] = true,["BM_wolf_bone_summon"] = true,["bonewalker_summon"] = true,["centurion_sphere_summon"] = true,["fabricant_summon"] = true},
UndMinion = {"skeleton_weak", "bonewalker_weak", "skeleton", "bonewalker", "skeleton archer", "skeleton warrior", "skeleton champion", "Bonewalker_Greater"},
Blight = {"ash woe blight", "black-heart blight", "chanthrax blight", "ash-chancre"},
atrbot = {["atronach_flame"] = {4,556,561}, ["atronach_flame_summon"] = {4,556,561}, ["atronach_flame_lord"] = {4,556,561,114},
["atronach_frost"] = {6,557,562}, ["atronach_frost_summon"] = {6,557,562}, ["atronach_frost_lord"] = {6,557,562,115},
["atronach_storm"] = {5,558,563}, ["atronach_storm_summon"] = {5,558,563}, ["atronach_storm_lord"] = {5,558,563,116}},
BlackItem = {["4nm_poisonbottle"] = true, ["4nm_boundarrow"] = true, ["4nm_boundbolt"] = true, ["4nm_boundstar"] = true},
BlackAmmo = {["4nm_poisonbottle"] = true, ["4nm_boundarrow"] = true, ["4nm_boundbolt"] = true, ["4nm_boundstar"] = true, ["4nm_stone"] = true},
MEDUR = {["waterbreath"] = 5,["tx_s_water_walk"] = 10,["tx_s_jump"] = 5,["tx_s_slowfall"] = 10,["tx_s_chameleon"] = 10,["tx_s_charm"] = 10,["tx_s_soultrap"] = 10,
["tx_s_drain_attrib"] = 10,["tx_s_drain_fati"] = 10,["tx_s_drain_health"] = 10,["tx_s_drain_magic"] = 10,["tx_s_drain_skill"] = 10,["tx_s_cmd_crture"] = 10,["tx_s_cmd_hunoid"] = 10,["command"] = 10,["tx_s_turn_undead"] = 10,
["tx_s_sanctuary"] = 10,["tx_s_detect_animal"] = 10,["tx_s_detect_enchtmt"] = 10,["tx_s_detect_key"] = 10,
["tx_s_wknstofire"] = 10,["tx_s_wknstofrost"] = 10,["tx_s_wknstoshock"] = 10,["tx_s_wknstopoison"] = 10,["tx_s_wknstomagic"] = 10,["tx_s_wknstonmlwpns"] = 10,["tx_s_wknstoblghtdise"] = 10,["tx_s_wknstocomdise"] = 10,["tx_s_wknstocpsdise"] = 10,
["tx_s_rst_fire"] = 10,["tx_s_rst_frost"] = 10,["tx_s_rst_shock"] = 10,["tx_s_rst_poison"] = 10,["tx_s_rst_magic"] = 10,["tx_s_rst_nmlwpn"] = 10,["tx_s_rst_bghtdise"] = 10,["tx_s_rst_comdise"] = 10,["tx_s_rst_cpsdise"] = 10,
["tx_s_cm_crture"] = 10,["tx_s_cm_hunoid"] = 10,["tx_s_demorl_crture"] = 10,["tx_s_demorl_hunoid"] = 10,["tx_s_frzy_crture"] = 10,["tx_s_frzy_hunoid"] = 10,["tx_s_rlly_crture"] = 10,["tx_s_rlly_hunoid"] = 10,
["tx_s_ftfy_attack"] = 10,["tx_s_ftfy_attrib"] = 10,["tx_s_ftfy_fati"] = 10,["tx_s_ftfy_health"] = 10,["tx_s_ftfy_magic"] = 10,["tx_s_ftfy_mgcmtplr"] = 10,["tx_s_ftfy_skill"] = 10,["tx_s_ab_attrib"] = 10,["tx_s_ab_skill"] = 10,
["tx_s_smmn_anctlght"] = 10,["tx_s_smmn_bear"] = 10,["tx_s_smmn_bnlord"] = 10,["tx_s_smmn_bonewolf"] = 10,["tx_s_smmn_clnfear"] = 10,["tx_s_smmn_daedth"] = 10,["tx_s_smmn_drmora"] = 10,["tx_s_smmn_fabrict"] = 10,
["tx_s_smmn_flmatrnh"] = 10,["tx_s_smmn_frstatrnh"] = 10,["tx_s_smmn_gldsaint"] = 10,["tx_s_smmn_grtrbnwlkr"] = 10,["tx_s_smmn_hunger"] = 10,["tx_s_smmn_lstbnwlkr"] = 10,["tx_s_smmn_scamp"] = 10,["tx_s_smmn_skltlmnn"] = 10,
["tx_s_smmn_stmatnh"] = 10,["tx_s_smmn_wngtwlght"] = 10,["tx_s_smmn_wolf"] = 10,
["sum_daedraspider"] = 10,["sum_mazken"] = 10,["sum_dremora_mage"] = 10,["sum_skaafin"] = 10,["sum_skeleton_mage"] = 10,["sum_xivkyn"] = 10,["sum_xivilai"] = 10,
["lifeleech"] = 10,["recharge"] = 10,["repairarmor"] = 10,["repairweapon"] = 10},
DurKF = {[14]=3,[15]=3,[16]=3,[23]=3,[27]=3,[22]=3,[24]=3,[25]=3,[26]=3,[37]=5,[38]=5,[74]=3,[75]=3,[76]=3,[77]=3,[78]=3,[86]=3,[87]=3,[88]=3},
nomag = {[39] = true, [45] = true, [46] = true, [69] = true, [70] = true, [72] = true, [73] = true},
--SID = {["4s_DC"] = "discharge", ["4s_CWT"] = "CWT", ["4s_rune1"] = "rune", ["4s_totem1"] = "totem", ["4s_totem2"] = "totem", ["4s_totemexp"] = "totem"},
CME = {[4] = "frost", [6] = "fire", [5] = "shock", [73] = "shock", [72] = "poison", [57] = "vital", [516] = "frost", [517] = "fire", [518] = "shock"},
ELSH = {[4] = {id = 14, ts = 0}, [5] = {id = 15, ts = 0}, [6] = {id = 16, ts = 0}},
LID = {[0] = {255,0,128}, [1] = {255,128,0}, [2] = {0,255,255}, [3] = {128,0,255}, [4] = {0,128,64}}, MEC = {3, 3, 4, 5, 4, [0] = 4},
RES = {[14] = "resistFire", [16] = "resistFrost", [15] = "resistShock", [27] = "resistPoison"},
UItcolor = {{0,0,0},{0,0,1},{0,1,0},{0,1,1},{1,0,0},{1,0,1},{1,1,0},{1,1,1}},
TPP = {{-23000, -15200, 700}, {-14300, 52400, 2300}, {30000, -77600, 2000}, {150300, 31800, 900}, {17800, -101900, 500}, {-11200, 20000, 1500}, {53800, -51000, 400}, {-86800, 92300, 1200},
{1900, -56800, 1700}, {125000, -105200, 1000}, {125200, 45200, 1800}, {109500, 116000, 600}, {-21600, 103200, 2200}, {109300, -62000, 2200}, {60200, 183300, 500}, {-11100, -71000, 500},
{-46600, -38100, 400}, {-60100, 26700, 400}, {-68400, 140400, 400}, {-85400, 125600, 1200}, {94600, 115800, 1800}, {87500, 118100, 3700}},
AoEmod = {[0] = "4nm_aoe_vitality", [1] = "4nm_aoe_fire", [2] = "4nm_aoe_frost", [3] = "4nm_aoe_shock", [4] = "4nm_aoe_poison"},
BotQ = {"bargain", "cheap", "standard", "quality", "exclusive"},
BotIc = {["m\\Tx_potion_bargain_01.tga"] = "bargain", ["m\\Tx_potion_cheap_01.tga"] = "cheap", ["m\\Tx_potion_fresh_01.tga"] = "cheap",
["m\\Tx_potion_standard_01.tga"] = "standard", ["m\\Tx_potion_quality_01.tga"] = "quality", ["m\\Tx_potion_exclusive_01.tga"] = "exclusive"},
BotMod = {["m\\misc_potion_bargain_01.nif"] = {"w\\4nm_bottle1.nif", "m\\Tx_potion_bargain_01.tga"}, ["m\\misc_potion_cheap_01.nif"] = {"w\\4nm_bottle2.nif", "m\\Tx_potion_cheap_01.tga"},
["m\\misc_potion_fresh_01.nif"] = {"w\\4nm_bottle2.nif", "m\\Tx_potion_fresh_01.tga"}, ["m\\misc_potion_standard_01.nif"] = {"w\\4nm_bottle3.nif", "m\\Tx_potion_standard_01.tga"},
["m\\misc_potion_quality_01.nif"] = {"w\\4nm_bottle4.nif", "m\\Tx_potion_quality_01.tga"}, ["m\\misc_potion_exclusive_01.nif"] = {"w\\4nm_bottle5.nif", "m\\Tx_potion_exclusive_01.tga"}},
DWOBT = {[tes3.objectType.light] = true, [tes3.objectType.lockpick] = true, [tes3.objectType.probe] = true},
CF = {}, APP = {}}
local SP = {[0] = {s = 11, p1 = "alt1", p2 = "alt2", p3 = "alt3", p4 = "alt4"}, [1] = {s = 13, p1 = "con1", p2 = "con2", p3 = "con3", p4 = "con4"}, [2] = {s = 10, p1 = "des1", p2 = "des2", p3 = "des3", p4 = "des4"},
[3] = {s = 12, p1 = "ill1", p2 = "ill2", p3 = "ill3", p4 = "ill4"}, [4] = {s = 14, p1 = "mys1", p2 = "mys2", p3 = "mys3", p4 = "mys4"}, [5] = {s = 15, p1 = "res1", p2 = "res2", p3 = "res3", p4 = "res4"}}
local MEP = {[14] = {s = 11, p0 = "des1a", p = "alt0"}, [16] = {s = 11, p0 = "des1b", p = "alt0"}, [15] = {s = 11, p0 = "des1c", p = "alt0"}, [27] = {s = 15, p0 = "des1d"}, p = "res5",
[85] = {s = 15, p = "res7"}, [86] = {s = 15, p = "res7"}, [87] = {s = 15, p = "res7"}, [88] = {s = 15, p = "res7"}, [89] = {s = 15, p = "res7"}, [64] = {s = 12, p = "ill7"}, [65] = {s = 12, p = "ill7"}, [66] = {s = 12, p = "ill7"}}
local ME = {[102]=0,[103]=0,[104]=0,[105]=0,[106]=0,[107]=0,[108]=0,[109]=0,[110]=0,[111]=0,[112]=0,[113]=0,[114]=0,[115]=0,[116]=0,[134]=0,[137]=0,[138]=0,[139]=0,[140]=0,[141]=0,[142]=0,
[120]=3,[121]=3,[122]=3,[123]=3,[124]=3,[125]=3,[127]=3,[128]=3,[129]=3,[130]=3,[131]=3,[601]=3,[603]=3, [14]=1, [15]=1, [16]=1, [75]=2, [76]=2, [77]=2,
[79]=4, [80]=4, [81]=4, [82]=4, [83]=4, [84]=4, [117]=4, [90]=5, [91]=5, [92]=5, [93]=5, [94]=5, [95]=5, [97]=5, [98]=5, [99]=5,
[17]=6, [18]=6, [19]=6, [20]=6, [21]=6, [28]=7, [29]=7, [30]=7, [31]=7, [32]=7, [33]=7, [35]=7, [36]=7,
[3] = "shield", [4] = "shield", [5] = "shield", [6] = "shield", [61] = "teleport", [62] = "teleport", [63] = "teleport",
[511] = "charge", [512] = "charge", [513] = "charge", [514] = "charge", [515] = "charge", [516] = "aura", [517] = "aura", [518] = "aura", [519] = "aura", [520] = "aura",
[521] = "aoe", [522] = "aoe", [523] = "aoe", [524] = "aoe", [525] = "aoe", [526] = "rune", [527] = "rune", [528] = "rune", [529] = "rune", [530] = "rune",
[531] = "prok", [532] = "prok", [533] = "prok", [534] = "prok", [535] = "prok", [536] = "shotgun", [537] = "shotgun", [538] = "shotgun", [539] = "shotgun", [540] = "shotgun",
[541] = "discharge", [542] = "discharge", [543] = "discharge", [544] = "discharge", [545] = "discharge", [546] = "ray", [547] = "ray", [548] = "ray", [549] = "ray", [550] = "ray",
[551] = "totem", [552] = "totem", [553] = "totem", [554] = "totem", [555] = "totem", [556] = "empower", [557] = "empower", [558] = "empower", [559] = "empower", [560] = "empower",
[561] = "reflect", [562] = "reflect", [563] = "reflect", [564] = "reflect", [565] = "reflect"}
local MID = {[0] = 23, [1] = 14, [2] = 16, [3] = 15, [4] = 27, [5] = 23}
local EMP = {[14] = {e = 556, p = "des6a", p1 = "des5a", p2 = "wil9a", p3 = "end7a"}, [16] = {e = 557, p = "des6b", p1 = "des5b", p2 = "wil9b", p3 = "end7b"},
[15] = {e = 558, p = "des6c", p1 = "des5c", p2 = "wil9c", p3 = "end7c"}, [27] = {e = 559, p = "des6d", p1 = "des5d", p2 = "wil9d", p3 = "end7d"}, [23] = {e = 560, p = "des6e", p1 = "des5e", p2 = "wil9e"}}
local function adds(...) local splist = rf.object.spells	for i,s in ipairs{...} do splist:add(s) end end
local function rems(...) local splist = rf.object.spells	for i,s in ipairs{...} do splist:remove(s) end end
local function Mod(cost, m) local stat = (m or mp).magicka	stat.current = stat.current - cost 	if not m or m == mp then M.Mana.current = stat.current end end
local function Mag(id, r) return (tes3.getEffectMagnitude{reference = r or p, effect = id}) end
local function TFR(n, f) if n == 0 then f() else timer.delayOneFrame(function() TFR(n - 1, f) end) end end
local function Cpow(m, s1, s2) return 100 + m.willpower.current/((m ~= mp or P.wil1) and 5 or 10) + m:getSkillValue(SP[s1].s)/((m ~= mp or P[SP[s1].p1]) and 5 or 10) + ((m ~= mp or P[SP[s2].p1]) and m:getSkillValue(SP[s2].s)/10 or 0)
- (50 + ((m ~= mp or P.wil2) and 0 or 10) + ((m ~= mp or P[SP[s1].p3]) and 0 or 20)) * (1 - math.min(m.fatigue.normalized,1)) end

L.SetGlobal = function()	local w = mp.readiedWeapon		w = w and w.object
G.stop = tes3.findGlobal("4nm_stoptraining")	G.leskoef = P.int0 and 5 or 3		if p.object.level * G.leskoef > D.L.les and G.stop.value == 1 then G.stop.value = 0 end
G.potlim = 50 + mp.endurance.base*(P.end9 and 0.7 or 0.5)		
G.spdodge = P.spd15 and 120 or 100
G.maxcomb = P.spd7 and 10 or 4

tes3.findGMST("fMajorSkillBonus").value = P.int0 and 0.75 or 0.5
tes3.findGMST("fMinorSkillBonus").value = P.int0 and 1 or 0.75
tes3.findGMST("fMiscSkillBonus").value = P.int0 and 1.25 or 1

tes3.findGMST("fUnarmoredBase2").value = P.una0 and 0.02 or 0.01
G.HandReach.value = (P.hand11 or w or not mp.weaponDrawn) and 0.7 or 0.5
if mp.readiedShield and mp.weaponDrawn then G.BlockMult.value = P.bloc1 and 2 or 0.5
	if P.bloc9 then G.BlockMax.value = 100			G.BlockLeft.value = -1			G.BlockRight.value = 0.5 end
else G.BlockMax.value = 90	G.BlockMult.value = 2	G.BlockLeft.value = -0.666		G.BlockRight.value = 0.333 end

tes3.findGMST("fHoldBreathTime").value = (10 + mp.endurance.base/5 + mp.athletics.base/5) * (P.atl4 and 2 or 1)
tes3.findGMST("fSwimRunAthleticsMult").value = mp.athletics.base/(P.atl5 and 500 or 1000)

tes3.findGMST("fJumpEncumbranceBase").value = P.atl6 and 0.1 or -0.2
tes3.findGMST("fJumpEncumbranceMultiplier").value = P.atl6 and 0.4 or 0.7
tes3.findGMST("fJumpAcroMultiplier").value = P.acr1 and 4 or 3
tes3.findGMST("fJumpMoveMult").value = P.acr3 and 0.5 or 0.1
tes3.findGMST("fFallDamageDistanceMin").value = P.acr5 and 500 or 400
tes3.findGMST("fFallAcroBase").value = P.acr7 and 0.5 or 1
tes3.findGMST("fFatigueJumpBase").value = P.acr2 and math.max(20 - mp.acrobatics.base/10, 10) or 20
tes3.findGMST("fFatigueJumpMult").value = P.atl6 and math.max(30 - mp.athletics.base/10, 20) or 30

tes3.findGMST("fMagicItemRechargePerSecond").value = mp.enchant.base/(P.enc12 and 1000 or 2000)
tes3.findGMST("iSoulAmountForConstantEffect").value = P.enc9 and 200 or 400
tes3.findGMST("fEnchantmentChanceMult").value = P.enc14 and 2 or 3
tes3.findGMST("fEnchantmentConstantChanceMult").value = P.luc9 and 1 or 0.5
tes3.findGMST("fWeaponDamageMult").value = P.arm3 and math.max(0.1 - mp.armorer.base/2000, 0.05) or 0.1

tes3.findGMST("fSneakSpeedMultiplier").value = P.snek2 and math.min(0.75 + mp.sneak.base/400, 1) or 0.75
tes3.findGMST("fPickLockMult").value = P.sec1 and -1 or -2
tes3.findGMST("fTrapCostMult").value = P.sec2 and -1 or -2

tes3.findGMST("iTrainingMod").value = P.merc1 and 10 or 20
tes3.findGMST("fRepairMult").value = P.merc6 and 1 or 2
tes3.findGMST("fSpellMakingValueMult").value = P.merc7 and 10 or 20
tes3.findGMST("fEnchantmentValueMult").value = P.merc8 and 100 or 200
tes3.findGMST("fBarterGoldResetDelay").value = P.merc5 and 12 or 24

tes3.findGMST("iBarterSuccessDisposition").value = P.spec2 and 3 or 1
tes3.findGMST("iBarterFailDisposition").value = P.spec2 and -1 or -3
tes3.findGMST("iPerMinChance").value = P.spec1 and 10 or 0
tes3.findGMST("iPerMinChange").value = P.spec1 and 10 or 0
tes3.findGMST("fPerDieRollMult").value = P.spec6 and 0.2 or 0.1
tes3.findGMST("fBribe10Mod").value = P.spec4 and 20 or 10
tes3.findGMST("fBribe100Mod").value = P.spec4 and 50 or 30
tes3.findGMST("fBribe1000Mod").value = P.spec4 and 100 or 50
tes3.findGMST("fCrimeGoldTurnInMult").value = P.spec7 and math.max(1 - mp.mercantile.base/200, 0.5) or 1
tes3.findGMST("fCrimeGoldDiscountMult").value = P.spec8 and math.max(0.5 - mp.mercantile.base*0.003, 0.2) or 0.5
tes3.findGMST("iCrimeThreshold").value = P.sec4 and 3000 or 1000

tes3.findGMST("fDispPersonalityBase").value = P.per1 and 50 or 100
tes3.findGMST("fDispPersonalityMult").value = P.per1 and 0.5 or 0.3
tes3.findGMST("fDispFactionMod").value = P.per2 and 5 or 2
tes3.findGMST("fDispRaceMod").value = P.per5 and 30 or 5
tes3.findGMST("fDispCrimeMod").value = P.per6 and 0 or 0.02

tes3.findGMST("fPersonalityMod").value = P.per4 and 5 or 10
tes3.findGMST("fLuckMod").value = P.per4 and 10 or 20
tes3.findGMST("fReputationMod").value = P.per8 and 1 or 0.5
tes3.findGMST("fLevelMod").value = P.spec9 and 5 or 2

tes3.findGMST("fSleepRandMod").value = P.luc6 and 0.1 or 0.5
tes3.findGMST("fDiseaseXferChance").value = math.max(25 - mp.luck.base/(P.luc7 and 5 or 10), 1)
tes3.findGMST("fProjectileThrownStoreChance").value = P.luc8 and 100 or 75
tes3.findGlobal("WerewolfClawMult").value = 5
end
L.HPUpdate = function()	mp.shield = (P.end14 and mp.endurance.base/20 or 0) + (P.una2 and mp.unarmored.base/20 or 0) + L.CARM[D.PCL] + tes3.getEffectMagnitude{reference = p, effect = 3}
	tes3.setStatistic{reference = p, name = "health", base = math.max(mp.endurance.base*(P.end13 and 0.65 or 0.5) + mp.strength.base*(P.str10 and 0.4 or 0.25) 
	+ mp.willpower.base*(P.wil12 and 0.35 or 0.25) + (P.atl9 and mp.athletics.base*0.1 or 0) + L.CHP[D.PCL] + (L.RHP[p.object.race.id] or 0) + tes3.getEffectMagnitude{reference = p, effect = 80}, 20)}
end
L.Choise = function(e) if e.button ~= 0 then for i, s in ipairs(L.CSP) do mwscript.removeSpell{reference = p, spell = "4nm_class_"..s} end
D.PCL = L.CV[D.PCL][e.button]	mwscript.addSpell{reference = p, spell = "4nm_class_" .. L.CSP[D.PCL]}		L.HPUpdate() end end
L.ClassSelect = function() local LP = p.object.level + p.object.factionIndex/5		if tes3.getJournalIndex{id = "C3_DestroyDagoth"} >= 50 then LP = LP + 30 end	local t = cf.en and L.CEN or L.CRU
for id, ind in pairs(L.LEG) do if tes3.getJournalIndex{id = id} >= ind then LP = LP + 10 end end	tes3.messageBox(t.leg, LP)
if (LP >= 20 and D.PCL == 0) or (LP >= 50 and D.PCL > 0 and D.PCL < 4) or (LP >= 100 and D.PCL > 3 and D.PCL < 10) then
tes3.messageBox{message = t[D.PCL == 0 and "m1" or D.PCL < 4 and "m2" or "m3"], buttons = {t[0], t[L.CV[D.PCL][1]], t[L.CV[D.PCL][2]], t[L.CV[D.PCL][3]], t[L.CV[D.PCL][4]], t[L.CV[D.PCL][5]], t[L.CV[D.PCL][6]]}, callback = L.Choise} end
end
L.ClassReset = function() local day = wc.daysPassed.value - (D.resetday or 0)	if day > 6 and D.PCL ~= 0 then D.resetday = wc.daysPassed.value
	D.PCL = 0	for i, s in ipairs(L.CSP) do mwscript.removeSpell{reference = p, spell = "4nm_class_"..s} end		L.HPUpdate()
else tes3.messageBox(cf.en and "Too early - only %d days have passed since the last reset" or "Слишком рано - с последнего сброса прошло только %d дней", day) end end
L.PerkReset = function() local day = wc.daysPassed.value - (D.resetday or 0)	if day > 6 then D.resetday = wc.daysPassed.value
	for id, _ in pairs(L.PA) do mwscript.removeSpell{reference = p, spell = "4p_"..id} end		for id, _ in pairs(L.AA) do mwscript.removeSpell{reference = p, spell = id} end
	QS = nil	D.perks = {}	 P = D.perks	D.QSP = {}	DM.cpt = nil	DM.cpm = nil	DM.cp = nil		L.GetArmT()		L.GetWstat()	L.HPUpdate()	L.SetGlobal()
else tes3.messageBox(cf.en and "Too early - only %d days have passed since the last reset" or "Слишком рано - с последнего сброса прошло только %d дней", day) end end
L.PerkSpells = function() for id, t in pairs(L.PA) do if P[t[3]] then mwscript.addSpell{reference = p, spell = "4p_"..id} end end	for id, t in pairs(L.AA) do if P[t.p] then mwscript.addSpell{reference = p, spell = id} end end end
L.KEY = function(k) if k < 8 then return ic:isMouseButtonDown(k) else return ic:isKeyDown(k) end end
L.GetRad = function(m) return (50 + m.willpower.current/2 + m:getSkillValue(11))/((m ~= mp or P.alt13) and 20 or 40) end
L.Rcol = function(x) local c = {{math.random(x,255),x,255}, {math.random(x,255),255,x}, {x,math.random(x,255),255}, {255,math.random(x,255),x}, {x,255,math.random(x,255)}, {255,x,math.random(x,255)}}	return c[math.random(6)] end
L.GetPCmax = function() return (mp.willpower.base + mp.enchant.base) * (P.enc6 and 10 or 5) * (1 - math.min(M.ENL.normalized,1)*(P.enc15 and 0.5 or 0.75)) end
L.CrimeAt = function(m) if not m.inCombat and tes3.getCurrentAIPackageId(m) ~= 3 then tes3.triggerCrime{type = 1, victim = m}		m:startCombat(mp)	m.actionData.aiBehaviorState = 3 end end
L.durbonus = function(dur, koef)		if dur < 1 or not P.int9 then return 1 else return 1 + koef/100 * dur^0.5 end end
L.Hitp = function(x) local pos = tes3.getPlayerEyePosition()	local vec = tes3.getPlayerEyeVector()	local hit = tes3.rayTest{position = pos, direction = vec, maxDistance = 4800, ignore = {p}}
return hit and hit.intersection - vec * (x or 60) or pos + vec*4800 end
L.TPComp = function() if D.NoTPComp then return false else		local num = 0		local cost = 0		G.TPList = {}
	for m in tes3.iterate(mp.friendlyActors) do if m ~= mp then num = num + 1
		cost = cost + (L.Summon[m.object.baseObject.id] and 10 or 20)	G.TPList[m.reference] = true		--tes3.messageBox("Name = %s  num = %s  cost = %d", m.object.name, num, cost)
	end end
	if not P.mys22 then cost = cost * 3 end		
	if num > 0 then if mp.magicka.current >= cost then Mod(cost)	tes3.messageBox("Companions = %s  manacost = %d", num, cost) return true
		else tes3.messageBox("Not enough mana! Companions = %s  manacost = %d", num, cost)	return false end
	else return false end
end end
L.TownTP = function(e) if not e:trigger() then return end		if e.effectInstance.target == p and e.effectInstance.resistedPercent < 50 and not wc.flagTeleportingDisabled then -- Телепорт в город (505) 32 максимум, 22 щас
	tes3.messageBox{message = "Where to go?", buttons = {"Nothing", "Balmora", "Ald-ruhn", "Vivec", "Sadrith Mora", "Ebonheart", "Caldera", "Suran", "Gnisis",
	"Pelagiad", "Tel Branora", "Tel Aruhn", "Tel Mora", "Maar Gan", "Molag Mar", "Dagon Fel", "Seyda Neen", "Hla Oad", "Gnaar Mok", "Khuul", "Ald Velothi", "Vos", "Tel Vos"},
	callback = function(e) if e.button ~= 0 then tes3.positionCell{reference = p, teleportCompanions = false, position = L.TPP[e.button], cell = tes3.getCell{x = 0, y = 0}}
		if L.TPComp() then timer.start{duration = 0.1, callback = function() for r, _ in pairs (G.TPList) do tes3.positionCell{reference = r, position = pp, cell = p.cell} end end} end
	end end}
	e.effectInstance.state = tes3.spellState.retired
end end
L.GetOri = function(vec1, vec2) vec1 = vec1:normalized()	vec2 = vec2:normalized()	local axis = vec1:cross(vec2)	local norm = axis:length()
	if norm < 1e-5 then return ID33:toEulerXYZ() end
	local angle = math.asin(norm)	if vec1:dot(vec2) < 0 then angle = math.pi - angle end		axis:normalize()
	local m = ID33:copy()	m:toRotation(-angle, axis.x, axis.y, axis.z)	return m:toEulerXYZ()	--return m
end
L.Sector = function(t)	local p1, d, d1, dd, ref	local dd1 = t.lim or 2000		local pos = t.pos or tes3.getPlayerEyePosition()		local v = t.v or tes3.getPlayerEyeVector()
	for r, tab in pairs(N) do p1 = r.position:copy()	p1.z = p1.z + tab.m.height/2		d = pos:distance(p1)
		if d < t.d then dd = p1:distance(pos + v*d)
			if dd < dd1 and tes3.testLineOfSight{reference1 = p, reference2 = r} and tes3.getCurrentAIPackageId(tab.m) ~= 3 then ref = r	dd1 = dd	d1 = d end
		end
	end		--if ref then tes3.messageBox("%s  Dist = %d   Dif = %d", ref, d1, dd1) end
	return ref, d1
end

L.CF.atr = function(m) local r = m.reference	local d = r.data.spawn	if d ~= 0 and m.health.normalized < d/10 - 0.2 then	local id = r.baseObject.id
	B.elemaura.effects[1].id = L.atrbot[id][1]	B.elemaura.effects[1].min = d*2	B.elemaura.effects[1].max = d*3		B.elemaura.effects[2].id = L.atrbot[id][2]	B.elemaura.effects[2].min = d*2	B.elemaura.effects[2].max = d*3
	B.elemaura.effects[3].id = L.atrbot[id][3]	B.elemaura.effects[3].min = d	B.elemaura.effects[3].max = d*2		tes3.applyMagicSource{reference = r, source = B.elemaura}	r.data.spawn = 0
end end
L.CF.dremoralord = function(m) local r = m.reference	local ch = math.random(8 - r.data.spawn*0.3)	if ch == 1 then
	tes3.applyMagicSource{reference = r, name = "Summon", effects = {{id = table.choice{105,105,105,140}, duration = 30}}}
end end
L.CF.atrlord = function(m) local r = m.reference	local d = r.data.spawn + 10		local id = r.baseObject.id
	if d > 10 and m.health.normalized < d/20 then	
		B.elemaura.effects[1].id = L.atrbot[id][1]	B.elemaura.effects[1].min = d*2	B.elemaura.effects[1].max = d*3		B.elemaura.effects[2].id = L.atrbot[id][2]	B.elemaura.effects[2].min = d*2	B.elemaura.effects[2].max = d*3
		B.elemaura.effects[3].id = L.atrbot[id][3]	B.elemaura.effects[3].min = d	B.elemaura.effects[3].max = d*2		tes3.applyMagicSource{reference = r, source = B.elemaura}	r.data.spawn = 0
	end
	if d + 5 > math.random(100) then tes3.applyMagicSource{reference = r, name = "Summon", effects = {{id = L.atrbot[id][4], duration = 30}}} end
end
L.CF.auril = function(m) local r = m.reference	local d = r.data.spawn	if d ~= 0 and m.health.normalized < 0.5 then
	if d > 8 then B.goldaura.effects[1].id = 4 elseif d < 3 then B.goldaura.effects[1].id = 6 elseif d == 3 or d == 4 then B.goldaura.effects[1].id = 5 elseif d == 5 or d == 6 then B.goldaura.effects[1].id = 3 end
	B.goldaura.effects[1].min = math.random(5,10)		B.goldaura.effects[1].max = math.random(10,30)		tes3.applyMagicSource{reference = r, source = B.goldaura}	r.data.spawn = 0
end end
L.CF.lichelder = function(m) local r = m.reference	local ch = math.random(7 - r.data.spawn*0.3)
	if ch == 1 then for ref in tes3.iterate(r.cell.actors) do if ref.object.objectType == tes3.objectType.creature and ref.object.type == 2 and ref.mobile.isDead and r.position:distance(ref.position) < 1000 then
		if 100 - ref.object.level * 5 > math.random(100) then tes3.runLegacyScript{command = "resurrect", reference = ref}	tes3.playSound{sound = "conjuration hit", reference = ref} end end end
	elseif ch == 2 then for ref in tes3.iterate(r.cell.actors) do if ref.object.objectType == tes3.objectType.creature and ref.object.type == 2 and r.position:distance(ref.position) < 1000 then
		tes3.applyMagicSource{reference = ref, source = "p_restore_health_s"} end end
	elseif ch == 3 then tes3.applyMagicSource{reference = r, name = "Summon", effects = {{id = table.choice{108,108,109,110,142,142}, duration = 60}}} end
end
L.CF.lich = function(m) local r = m.reference	local ch = math.random(7 - r.data.spawn*0.3)	if ch == 1 then
	tes3.applyMagicSource{reference = r, name = "Summon", effects = {{id = table.choice{107,107,106,109,142}, duration = 30}}}
	--tes3.createReference{object = L.UndMinion[math.random(4)], position = (r.position + r.orientation*300), cell = r.cell}		tes3.playSound{sound = "conjuration hit", reference = r}
elseif ch == 2 then tes3.applyMagicSource{reference = r, source = "p_restore_health_c"} end end
L.CF.ashascend = function(m) if mwscript.getSpellEffects{reference = p, spell = "corprus immunity"} == false and m.position:distance(pp) < 1000 then local ch = math.random(6)
	if ch < 5 then mwscript.addSpell{reference = p, spell = L.Blight[ch]}	tes3.messageBox("The blight aura emitted by this creature has hit you!") end
end end
L.CFF = {["atronach_flame"] = L.CF.atr, ["atronach_flame_summon"] = L.CF.atr, ["atronach_frost"] = L.CF.atr, ["atronach_frost_summon"] = L.CF.atr, ["atronach_storm"] = L.CF.atr, ["atronach_storm_summon"] = L.CF.atr,
["atronach_flame_lord"] = L.CF.atrlord, ["atronach_frost_lord"] = L.CF.atrlord, ["atronach_storm_lord"] = L.CF.atrlord,	["dremora_lord"] = L.CF.dremoralord,
["golden saint"] = L.CF.auril, ["golden saint_summon"] = L.CF.auril, ["lich"] = L.CF.lich, ["lich_elder"] = L.CF.lichelder, ["ascended_sleeper"] = L.CF.ashascend}

L.TTAR = function() local tt = tes3ui.createTooltipMenu():createBlock{}	tt.autoHeight = true	tt.autoWidth = true		tt.flowDirection = "top_to_bottom"
tt:createLabel{text = ("%s: %d  %s"):format(cf.en and "lightness:" or "Легкость:", math.max(-mp.encumbrance.currentRaw,0), cf.en and "Armor parts:" or "Части брони:")}
tt:createLabel{text = ("%s: %d"):format(cf.en and "Light" or "Легкие", D.AR.l)}
tt:createLabel{text = ("%s: %d"):format(cf.en and "Medium" or "Средние", D.AR.m)}
tt:createLabel{text = ("%s: %d"):format(cf.en and "Heavy" or "Тяжелые", D.AR.h)}
tt:createLabel{text = ("%s: %d"):format(cf.en and "Unarmored" or "Бездоспешные", D.AR.u)}
tt:createLabel{text = cf.en and "Speed:" or "Скорость:"}
tt:createLabel{text = ("%s: %d"):format(cf.en and "Base" or "База", (100 + mp.speed.current) * (mp.alwaysRun and (3 + mp:getSkillValue(8)/100) or 1))}
tt:createLabel{text = ("%s: %d%%"):format(cf.en and "Armor" or "Доспехи", math.min(D.AR.ms + math.max(-mp.encumbrance.currentRaw,0)/2000, 1)*100)}
tt:createLabel{text = ("%s: %d%%"):format(cf.en and "Encumbrance" or "Нагрузка", 100 * (1 - mp.encumbrance.normalized/2) * (P.atl3 and 1 or 1 - mp.encumbrance.normalized/3))}
tt:createLabel{text = ("%s: %d%%"):format(cf.en and "Fatigue" or "Усталость", 100 * (mp.alwaysRun and (1 - (1 - math.min(mp.fatigue.normalized,1)) * (P.atl2 and 0.25 or 0.5)) or 1))}
tt:createLabel{text = ("%s: %d%%"):format(cf.en and "Move type" or "Тип движения", 100
* (mp.alwaysRun and (ad.animationAttackState == 2 and (P.spd10 and 0.8 or 2/3) or 1) * (P.atl1 and mp.isMovingForward and not (mp.isMovingLeft or mp.isMovingRight) and 1 or 0.75) or 1)
* (mp.isMovingBack and (P.agi16 and math.min(0.5 + mp.agility.current/400, 0.75) or 0.5) or ((mp.isMovingLeft or mp.isMovingRight) and not mp.isMovingForward and 0.75 or 1))		)}
end
L.GetArStat = function()
local w = mp.readiedWeapon	w = w and w.object		local wt = W.wt		local WS = mp:getSkillValue(WT[wt].s)		--(W.wt < -1 and W.wt) or (w and w.type) or -1	
local agi = mp.agility.current	local enc = mp.encumbrance.normalized	local lig = math.max(-mp.encumbrance.currentRaw,0)/2000		local stam = math.min(mp.fatigue.normalized,1)
local sp = mp.currentSpell or tes3.getObject("flame")	local sc = sp.magickaCost and sp:getLeastProficientSchool(mp) or sp.effects[1].object.school	local MS = mp:getSkillValue(SP[sc].s)	local eid = sp.effects[1].id

M.ST11.text = ("%s/%s/%s/%s"):format(D.AR.l, D.AR.m, D.AR.h, D.AR.u)
M.ST12.text = math.ceil(	(100 + mp.speed.current) * math.min(D.AR.ms + lig, 1) * (1 - enc/2) * (P.atl3 and 1 or 1 - enc/3)
* (mp.alwaysRun and (3 + mp:getSkillValue(8)/100) * (1 - (1 - stam) * (P.atl2 and 0.25 or 0.5)) * (ad.animationAttackState == 2 and (P.spd10 and 0.8 or 2/3) or 1)
* (P.atl1 and mp.isMovingForward and not (mp.isMovingLeft or mp.isMovingRight) and 1 or 0.75) or 1)
* (mp.isMovingBack and (P.agi16 and math.min(0.5 + agi/400, 0.75) or 0.5) or ((mp.isMovingLeft or mp.isMovingRight) and not mp.isMovingForward and 0.75 or 1))		)


local Kstr = 100 + mp.strength.current/2
local K2 = WS * ((P[WT[wt].p1] and 0.2 or 0.1) + (P[WT[wt].h1 and "agi5" or "str2"] and 0.1 or 0.05)) + mp.attackBonus/5
- (50 + (P.end1 and 0 or 10) + (P[WT[wt].p2] and 0 or 20)) * (1 - stam)
+ (w and w.weight == 0 and mp:getSkillValue(13)*(P.con8 and 0.5 or 0.2) or 0)

M.ST21.text = ("%d%%"):format(w and Kstr * (1 + K2/100) or Kstr + K2)
M.ST22.text = ("%d%% / %d"):format(100 * (0.9 + mp.speed.current/(P.spd1 and 1000 or 2000) + mp:getSkillValue(WT[wt].s)/(P[WT[wt].p4] and 1000 or 2000)
- math.max(D.AR.as + enc * (P.spd18 and 0.1 or 0.2) - lig, 0)),
(P[WT[wt].pc] and 4 or 3) + math.floor(WS/50) + (P.spd14 and W.DWM and 1 or 0))


local Cfocus = mp.spellReadied and P.wil5 and 1 + mp.magicka.current/(100 + mp.magicka.current/10)/100 or 1
local Cstam = (50 + (P.wil2 and 0 or 10) + ((P[sp.objectType == tes3.objectType.enchantment and "enc5" or SP[sc].p3]) and 0 or 20)) * (1 - stam)
local Cbonus = MS/(P[MEP[eid] and MEP[eid].p0 or SP[sc].p1] and 5 or 10) + (P[MEP[eid] and MEP[eid].p or "mys0"] and mp:getSkillValue(MEP[eid] and MEP[eid].s or 14)/10 or 0)
if sp.objectType == tes3.objectType.enchantment then Cbonus = Cbonus/3 + mp:getSkillValue(9)/(P.enc1 and 5 or 10) end
if ME[eid] == "shield" and P.una7 then Cbonus = Cbonus + D.AR.u * mp:getSkillValue(17)/100 end
Cbonus = Cbonus + mp.willpower.current/(P.wil1 and 5 or 10)


M.ST31.text = ("%d%%"):format((100 + Cbonus - Cstam) * Cfocus)
M.ST32.text = ("%d%%"):format(sp.alwaysSucceeds and 100 or 100 * math.max(1 - (P.int15 and math.max((0.5 - mp.magicka.normalized)*0.1, 0) or 0)
- MS/(P[SP[sc].p4] and 1000 or 2000) - (P.mys10 and 0.05 or 0) + (D.AR.mc > 0 and math.max(D.AR.mc - lig, 0) or D.AR.mc), 0.5))
M.ST33.text = math.ceil( (P[SP[sc].p2] and MS/5 or 0) + (P.int8 and mp.spellReadied and (mp.intelligence.current + MS)/10 or 0) + (P.int6 and mp.intelligence.current/10 or 0) + (P.luc13 and mp.luck.current/10 or 0)
- (P.wil10 and 0 or M.MCB.normalized*20) + (D.AR.cc > 0 and D.AR.cc or math.min(D.AR.cc + lig*2, 0)) - enc * (P.end17 and 10 or 20) )

--(2 + (mp.willpower.current + agi)/(P.wil15 and 100 or 200) - enc*(P.end15 and 0.5 or 1) + D.AR.cs) * 10		-- скорость зарядки спеллов

local sanct = mp.sanctuary/5 * (1+(P.una11 and D.AR.u*0.01 or 0))
M.ST41.text = ("%d/%d/%d"):format(math.min(stam * (D.AR.dk > 1 and D.AR.dk or math.min(D.AR.dk + lig*2, 1)) * (agi*(P.agi20 and 0.3 or 0.2) + (P.luc3 and mp.luck.current/10 or 0))
+ sanct + (P.acr6 and mp.isJumping and mp:getSkillValue(20)/5 or 0), 100),
(agi/(1+agi/400)/(P.agi2 and 8 or 16) + (P.lig2 and D.AR.l * mp:getSkillValue(21)/100 or 0) + (P.agi23 and W.DWM and 10 or 0) + sanct) * (P.spd2 and 2 or 1),
(P.agi4 and 40 or 50) * (1 + enc*(P.agi14 and 0.5 or 1) + (D.AR.dc < 0 and D.AR.dc or math.max(D.AR.dc - lig*2,0))))

M.ST42.text = ("%d/%d/%d"):format(10 + 10 * enc + (w and w.weight or 0) - (P[WT[wt].p3] and WS/20 or 0) - (P.end6 and math.min(mp.endurance.current/20, 5) or 0),
tes3.findGMST("fFatigueJumpBase").value + tes3.findGMST("fFatigueJumpMult").value * enc, 10 + 30 * enc)
end

L.GetWstat = function() local w = mp.readiedWeapon		w = w and w.object		local wt = w and w.type or -1		local wid = w and w.id		W.wt = wt		W.w = w
G.CriticalMult.value = 2 + (P.snek3 and 1 or 0) + (((wt == 0 and P.short12) or (not w and P.hand18)) and 1 or 0)
if w then	W.v = mp.readiedWeapon.variables	local en = w.enchantment
	if not D.lw then D.lw = {id = wid, r = w.reach} end		if wid == D.lw.id then
	if wid:sub(1,2) == "4_" then local Old = tes3.getObject(wid:sub(3))	if Old then
		if wt == 1 then	if Old.type == 6 then wt = -2	W[wid] = -2 end		elseif wt == 3 then	if Old.type == 5 then wt = -3	W[wid] = -3 end end		W.wt = wt
	end end
	if wt < 9 then w.reach = D.lw.r + math.floor(((P.agi3 and mp.agility.base/2000 or 0) + (P[WT[wt].p7] and 0.05 or 0))*100)/100 end
	if en and en.castType == 1 and wt < 11 then	W.ob = w		W.en = en		W.BAR.visible = true	W.bar.max = W.en.maxCharge	W.f = nil
		for i, eff in ipairs(W.en.effects) do if wt < 9 then if (eff.rangeType == 2 or ME[eff.id] == "shotgun" or ME[eff.id] == "ray") then W.f = 1 break end elseif eff.rangeType == 1 then W.f = 1 break end end
		if not W.f and wt > 8 then W.f = 2 end
	end
	if cf.m8 then tes3.messageBox("%s  Reach = %.2f (%.2f)  Crit = %.1f    %s", w.name, w.reach, D.lw.r, G.CriticalMult.value, W.f and (W.f == 2 and "Explode arrow!" or "Enchant strike!") or "") end
end end end

L.GetArmT = function() D.AR = {l=0,m=0,h=0,u=0}	for i, val in pairs(L.ARW) do	local s = tes3.getEquippedItem{actor = p, objectType = tes3.objectType.armor, slot = i}
if (i == 6 or i == 7) and not s then s = tes3.getEquippedItem{actor = p, objectType = tes3.objectType.armor, slot = i+3} end	s = AT[s and s.object.weightClass or 3].t		D.AR[s] = D.AR[s] + val end
local Sl, Sm, Sh, Su = mp.lightArmor.base, mp.mediumArmor.base, mp.heavyArmor.base, mp.unarmored.base
D.AR.ms = 1 - D.AR.m*0.005*(1 - Sm/(P.med2 and 200 or 400)) - D.AR.h*0.01*(1 - Sh/(P.hev2 and 200 or 400))
D.AR.as = D.AR.m*0.005*(1 - Sm/(P.med3 and 200 or 400)) + D.AR.h*0.01*(1 - Sh/(P.hev3 and 200 or 400))
D.AR.dk = 1 + D.AR.u*0.01*Su/(P.una5 and 100 or 200) - D.AR.l*0.02*(1 - Sl/(P.lig5 and 100 or 200)) - D.AR.m*0.02*(1 - Sm/(P.med5 and 200 or 400)) - D.AR.h*0.04*(1 - Sh/(P.hev5 and 200 or 400))
D.AR.dc = 0 - D.AR.u*0.01*Su/(P.una6 and 100 or 200) + D.AR.l*0.02*(1 - Sl/(P.lig6 and 100 or 200)) + D.AR.m*0.02*(1 - Sm/(P.med6 and 200 or 400)) + D.AR.h*0.04*(1 - Sh/(P.hev6 and 200 or 400))
D.AR.cs = D.AR.u*0.04*Su/(P.una4 and 100 or 200) - D.AR.l*0.02*(1 - Sl/(P.lig4 and 100 or 200)) - D.AR.m*0.03*(1 - Sm/(P.med4 and 100 or 200)) - D.AR.h*0.04*(1 - Sh/(P.hev4 and 100 or 200))
D.AR.cc = (P.una12 and D.AR.u > 19 and 25 or 0) + D.AR.u*Su/(P.una1 and 100 or 500) - D.AR.l*(1 - Sl/(P.lig1 and 100 or 200)) - D.AR.m*(1 - Sm/(P.med1 and 200 or 400)) - D.AR.h*2*(1 - Sh/(P.hev1 and 200 or 400))
D.AR.mc = 0 - (P.una12 and D.AR.u > 19 and -0.05 or 0) - (P.una3 and D.AR.u*Su/50000 or 0) + D.AR.l*0.002*(1 - Sl/(P.lig15 and 100 or 200)) + D.AR.m*0.004*(1 - Sm/(P.med15 and 200 or 400)) + D.AR.h*0.006*(1 - Sh/(P.hev15 and 200 or 400))
--L.GetWstat()
L.GetArStat()
end

L.M180 = tes3matrix33.new()		L.M180:toRotationX(math.rad(180))
L.MagefAdd = function()		p1 = tes3.player1stPerson.sceneNode
G.arm1 = p1:getObjectByName("Bip01 R Finger2")	G.arm1:attachChild(L.magef:clone())		G.arm1 = G.arm1:getObjectByName("magef")	G.arm1.appCulled = true
G.arm2 = p1:getObjectByName("Bip01 L Finger2")	G.arm2:attachChild(L.magef:clone())		G.arm2 = G.arm2:getObjectByName("magef")	G.arm2.appCulled = true		end
L.Cul = function(x) W.w1.appCulled = x	W.w3.appCulled = x	W.wl1.appCulled = not x		W.wl3.appCulled = not x		W.wr1.appCulled = not x		W.wr3.appCulled = not x	end
L.GetConEn = function(arm, en) local E = arm == 1 and "ER" or "EL"	if en and en.castType == 3 then W[E] = {[1]={},[2]={},[3]={},[4]={},[5]={},[6]={},[7]={},[8]={}}
	for i, ef in ipairs(en.effects) do W[E][i].id = ef.id	W[E][i].min = ef.min	W[E][i].max = ef.max	W[E][i].radius = ef.radius	W[E][i].duration = 36000	W[E][i].attribute = ef.attribute	W[E][i].skill = ef.skill end	
else W[E] = nil end end
L.DWNEW = function(o, od, left)	if left then
	W.wl1 = tes3.loadMesh(o.mesh):clone()	W.wl1.translation = W.w1.translation:copy()		W.wl1.translation.z = W.wl1.translation.z*-1	W.wl1.rotation = W.w1.rotation:copy() * L.M180	W.wl3 = W.wl1:clone()
	W.WL = o	W.DL = od	W.DL.tempData.DW = 2	L.GetConEn(2, o.enchantment)	if cf.m then tes3.messageBox("Left weapon remembered: %s", o.name)	end		if W.WR then L.DWMOD(true) end
else W.wr1 = tes3.loadMesh(o.mesh):clone()	W.wr1.translation = W.w1.translation:copy()		W.wr1.rotation = W.w1.rotation:copy()	W.wr3 = W.wr1:clone()
	W.WR = o	W.DR = od	W.DR.tempData.DW = 1	L.GetConEn(1, o.enchantment)	if W.WL then L.DWMOD(true) end
end end
L.ClearEn = function() local si	if D.DWER then si = tes3.getMagicSourceInstanceBySerial{serialNumber = D.DWER}	if si then si.state = 6 end D.DWER = nil end
if D.DWEL then si = tes3.getMagicSourceInstanceBySerial{serialNumber = D.DWEL}	if si then si.state = 6 end D.DWEL = nil end end
L.DWESound = function(e) if W.snd and (e.item == W.WR or e.item == W.WL) then W.snd = nil return false end end
L.DWMOD = function(st) if st then 
	if not W.DWM then if W.WR and W.WL and inv:contains(W.WR, W.DR) and W.DR.condition > 0 and inv:contains(W.WL, W.DL) and W.DL.condition > 0 then
		tes3.loadAnimation{reference = tes3.player1stPerson, file = "dw_merged.nif"}		L.MagefAdd()
		p1 = tes3.player1stPerson.sceneNode		W.l1 = p1:getObjectByName("Bip01 L Hand")	W.r1 = p1:getObjectByName("Bip01 R Hand")	W.w1 = p1:getObjectByName("Weapon Bone")
		local w = mp.readiedWeapon	local wd = w and w.variables	w = w and w.object		mp:unequip{armorSlot = 8}	mp:unequip{type = tes3.objectType.light}	L.ClearEn()
		W.l1:attachChild(W.wl1)		W.wl1:updateNodeEffects()	W.l3:attachChild(W.wl3)		W.wl3:updateNodeEffects()	W.r1:attachChild(W.wr1)		W.wr1:updateNodeEffects()	W.r3:attachChild(W.wr3)		W.wr3:updateNodeEffects()
		L.Cul(true)		W.DWM = true	event.register("playItemSound", L.DWESound, {priority = 10000})		if cf.m then tes3.messageBox("Double weapons! %s and %s", W.WR, W.WL) end
		if W.ER then D.DWER = (tes3.applyMagicSource{reference = p, name = "Enchant_right", effects = W.ER}).serialNumber end
		if W.EL then D.DWEL = (tes3.applyMagicSource{reference = p, name = "Enchant_left", effects = W.EL}).serialNumber end
		if W.ER and w == W.WR and wd == W.DR then mp:equip{item = W.WL, itemData = W.DL} elseif W.EL and w == W.WL and wd == W.DL or (w ~= W.WR and w ~= W.WL) then mp:equip{item = W.WR, itemData = W.DR} end
	else if cf.m then tes3.messageBox("Weapons not prepared! %s and %s", W.WR, W.WL) end		W.WL = nil	 W.DL = nil	end end
elseif W.DWM then L.ClearEn()		tes3.loadAnimation{reference = tes3.player1stPerson, file = nil}		L.MagefAdd()
	W.l1:detachChild(W.wl1)		W.l3:detachChild(W.wl3)		W.r1:detachChild(W.wr1)		W.r3:detachChild(W.wr3)
	L.Cul(false)	W.DWM = false	event.unregister("playItemSound", L.DWESound, {priority = 10000})	if cf.m then tes3.messageBox("DW mod off") end
end end



local function DETERMINEACTION(e)	if e.session.selectedAction ~= 0 and L.CFF[e.session.mobile.reference.baseObject.id] then L.CFF[e.session.mobile.reference.baseObject.id](e.session.mobile)
--tes3.messageBox("ФУНКЦИЯ! %s  выбор = %s", e.session.mobile.reference, e.session.selectedAction)
end end		if cf.full then event.register("determineAction", DETERMINEACTION) end
local function COMBATSTART(e) if e.target == mp then
	if L.CID[e.actor.reference.baseObject.id] == "dwem" and tes3.isAffectedBy{reference = p, object = "summon_centurion_unique"} then return false end
end end		event.register("combatStart", COMBATSTART)
local function DEATH(e) local r = e.reference
	if L.CID[r.baseObject.id] == "zombirise" and r.data.spawn ~= 0 then 
		if r.object.level * 5 > math.random(100) then timer.start{duration = math.random(5,10), callback = function() if r.mobile.isDead then
			tes3.runLegacyScript{command = "resurrect", reference = r}		tes3.playSound{sound = "bonewalkerSCRM", reference = r}		r.data.spawn = 0
			e.mobile.health.current = e.mobile.health.base/2	e.mobile.magicka.current = e.mobile.magicka.base/2	e.mobile.fatigue.current = e.mobile.fatigue.base/2
		end end} end
	end
end		event.register("death", DEATH)




L.CWF = function(r, rt, k, pos)		k = r == p and (P.mys7e and k*0.8 or k) or k/3
	local M = {tes3.getEffectMagnitude{reference = r, effect = 511}, tes3.getEffectMagnitude{reference = r, effect = 512}, tes3.getEffectMagnitude{reference = r, effect = 513},
	tes3.getEffectMagnitude{reference = r, effect = 514}, (tes3.getEffectMagnitude{reference = r, effect = 515})}
	local mc = (M[1]*0.3 + M[2]*0.3 + M[3]*0.4 + M[4]*0.5 + M[5]*0.4) * k		local mob = r.mobile
	if mc == 0 then r.data.CW = nil elseif mob.magicka.current > mc then local rad = rt == 2 and L.GetRad(mob)		local E = B.CW.effects
		for i, m in ipairs(M) do if m > 0 then E[i].id = MID[i]  E[i].min = m   E[i].max = m	E[i].rangeType = rt		E[i].duration = 1	E[i].radius = rad or 0	else E[i].id = -1	E[i].rangeType = 0 end end
		if pos then MP[tes3.applyMagicSource{reference = r, source = B.CW}] = {pos = pos, exp = true} else tes3.applyMagicSource{reference = r, source = B.CW} end
		Mod(mc, mob)		if cf.m then tes3.messageBox("CW = %d + %d + %d + %d + %d   Manacost = %.1f (%d%%)", M[1], M[2], M[3], M[4], M[5], mc, k*100) end
	end
end

local BAM = {[9] = "4nm_boundarrow", [10] = "4nm_boundbolt", ["met"] = "4nm_boundstar", ["4nm_boundarrow"] = 9, ["4nm_boundbolt"] = 10, ["4nm_boundstar"] = true}		BAM.f = function() return P.con10 and 10 or 15 end
local DER = {}	local function DEDEL() for r, ot in pairs(DER) do if r.sceneNode then r.sceneNode:detachChild(r.sceneNode:getObjectByName("detect"))	r.sceneNode:update()	r.sceneNode:updateNodeEffects() end end		DER = {} end
local TSK = 1	local function SIMTS() wc.deltaTime = wc.deltaTime * TSK end
local function CMSFrost(e) e.speed = e.speed * (FR[e.reference] or 1) end
local function ConstEnLim()	D.ENconst = 0
	for _, s in pairs(p.object.equipment) do if s.object.enchantment and s.object.enchantment.castType == 3 then
		if s.object.objectType == tes3.objectType.clothing then D.ENconst = D.ENconst + math.max(L.CLEN[s.object.slot] or 0, s.object.enchantCapacity)
		elseif s.object.objectType == tes3.objectType.armor then D.ENconst = D.ENconst + math.max(L.AREN[s.object.slot] or 0, s.object.enchantCapacity) end
	end end		M.ENL.current = D.ENconst		M.PC.max = L.GetPCmax()
end


L.METW = function(e) if not e:trigger() then return end		local si = e.sourceInstance	local dmg, wd	local r = e.effectInstance.target		local m = r.mobile
	if V.MET[si] then dmg = V.MET[si].dmg	wd = V.MET[si].r.attachments.variables		V.MET[si] = nil elseif si == W.TETsi then dmg = W.TETdmg * Cpow(mp,0,4)/100		W.TETsi = nil	W.TETmod = 3
		if M.MCB.normalized > 0 then dmg = dmg * (1 + M.MCB.normalized * (P.wil7 and 0.2 or 0.1))		M.MCB.current = 0 end	wd = W.TETR.object.hasDurability and W.TETR.attachments.variables
	end
	if dmg then local CritC = mp.attackBonus/5 + mp:getSkillValue(23)/(P.mark6c and 10 or 20) + mp.agility.current/(P.agi1 and 10 or 20) + (P.luc1 and mp.luck.current/20 or 0)
		+ (m.isMovingForward and 10 or 0) - (m.endurance.current + m.agility.current + m.luck.current)/20 - m.sanctuary/10 + math.max(1-m.fatigue.normalized,0)*(P.agi11 and 20 or 10) - 10
		local Kcrit = CritC - math.random(100)	if Kcrit < 0 then Kcrit = 0 else Kcrit = Kcrit + 20 + (P.agi8 and 10 or 0) + (P.mark5c and 20 or 0) end
		if Kcrit > 0 then dmg = dmg * (1 + Kcrit/100)		tes3.playSound{reference = r, sound = "critical damage"} end
		dmg = m:applyDamage{damage = dmg, applyArmor = true, playerAttack = true}
		if wd then wd.condition = math.max(wd.condition - dmg * tes3.findGMST("fWeaponDamageMult").value, 0) end
		if cf.m3 then tes3.messageBox("Throw! %s  dmg = %d  Crit = %d%% (%d%%)", r.object.name, dmg, Kcrit, CritC) end
	end		e.effectInstance.state = tes3.spellState.retired
end

L.SimMET = function(e)
for r, t in pairs(V.METR) do if t.f then
	r.position = r.position:interpolate(pp, wc.deltaTime * (P.alt19 and 1500 or 1000))
	if pp:distance(r.position) < 150 then local ob = r.object	p:activate(r)		if not mp.readiedWeapon	then timer.delayOneFrame(function() mp:equip{item = ob} end) end	V.METR[r] = nil end
end end
if table.size(V.METR) == 0 then event.unregister("simulate", L.SimMET)	W.metflag = nil end
end

local function SIMTEL(e) if W.TETR then
	if W.TETmod == 1 then W.TETR.position = tes3.getPlayerEyePosition() + tes3.getPlayerEyeVector()*150 + tes3vector3.new(0,0,-30)		W.TETR.orientation = p.orientation
	elseif W.TETmod == 2 then W.TETR.position = W.TETP.position		W.TETR.orientation = p.orientation
	elseif W.TETmod == 3 then W.TETR.position = W.TETR.position:interpolate(pp, wc.deltaTime* (P.alt19 and 1500 or 1000))
		if pp:distance(W.TETR.position) < 150 then W.TETmod = 1	tes3.playSound{sound = "enchant fail"}		local ob = W.TETR.object		if ob.hasDurability and W.TETR.attachments.variables then
		W.TETdmg = math.max(math.max(ob.slashMax, ob.chopMax, ob.thrustMax) * math.max(W.TETR.attachments.variables.condition/ob.maxCondition, P.arm2 and 0.3 or 0.1), ob.weight/2) end end
	end
else event.unregister("simulate", SIMTEL) 	W.TETP = nil	W.TETmod = nil	end end

local function TELnew(r)
if W.TETmod then local hit = tes3.rayTest{position = W.TETR.position, direction = V.down}	if hit then W.TETR.position = hit.intersection + tes3vector3.new(0,0,5) end
if cf.m then tes3.messageBox("%s no longer under control", W.TETR.object.name) end		event.unregister("simulate", SIMTEL) 	W.TETmod = nil	W.TETR = nil	W.TETP = nil	W.TETsi = nil end		
if r.stackSize == 1 and tes3.isAffectedBy{reference = p, effect = 506} then	local ob = r.object		local wd = r.attachments.variables
	W.TETcost = 5 + ob.weight		W.TETR = r		W.TETmod = 1	event.register("simulate", SIMTEL)
	if not tes3.hasOwnershipAccess{target = r} then tes3.triggerCrime{value = ob.value, type = 5, victim = wd.owner} end
	W.TETdmg = (ob.objectType == tes3.objectType.weapon and (ob.type < 9 or ob.type > 10) or ob.objectType == tes3.objectType.ammunition) and
	math.max(math.max(ob.slashMax, ob.chopMax, ob.thrustMax) * (wd and math.max(wd.condition/ob.maxCondition, P.arm2 and 0.3 or 0.1) or 1), ob.weight/2) or math.max(ob.weight/2, 1)
	if cf.m then tes3.messageBox("%s under control!  weight = %.1f  dmg = %.1f", ob.name, ob.weight, W.TETdmg) end
end end


local LI = {R = {}}
LI.SIM = function()	if LI.r then if LI.r.cell ~= p.cell then LI.r:delete()	LI.New(T.LI.iterations, pp)
else local pos = pp:copy()	pos.z = pos.z + 200 + LI.l.radius/50	LI.r.position = LI.r.position:interpolate(pos, 5 + LI.r.position:distance(pos)/20) end end end
LI.New = function(dur, spos) if LI.r then LI.l.radius = Mag(504) else event.register("simulate", LI.SIM) end
	LI.r = tes3.createReference{object = "4nm_light", scale = math.min(1+LI.l.radius/1000, 9), position = spos, cell = p.cell}	LI.r.modified = false
	if not T.LI.timeLeft then T.LI = timer.start{duration = 1, iterations = dur, callback = function()
		if T.LI.iterations == 1 then event.unregister("simulate", LI.SIM)	LI.r:delete()	T.LI:cancel()	LI.r = nil else LI.r:disable()	LI.r:enable()	LI.r.modified = false end
	end} end
end

local function LightCollision(e) if e.sourceInstance.caster == p then -- Фонарь (504)
local ef = e.sourceInstance.source.effects[e.effectIndex + 1]	local pos = e.collision.point:copy()	pos.z = pos.z + 5	local col = L.Rcol(cf.col)
LI.l.color[1] = col[1]		LI.l.color[2] = col[2]		LI.l.color[3] = col[3]		LI.l.radius = math.random(ef.min, ef.max) * Cpow(mp,0,0) * (SN[e.sourceInstance.serialNumber] or 1)
local LTR = tes3.createReference{object = "4nm_light", scale = math.min(1+LI.l.radius/1000, 9), position = pos, cell = p.cell}	LTR.modified = false	LI.R[LTR] = true
timer.start{duration = ef.duration, callback = function() LI.R[LTR] = nil	LTR:delete() end}
if cf.m then tes3.messageBox("Light active! Radius = %d   Time = %d	  Total = %d", LI.l.radius, ef.duration, table.size(LI.R)) end
end end


L.AuraTik = function()	local M = {tes3.getEffectMagnitude{reference = p, effect = 516}, tes3.getEffectMagnitude{reference = p, effect = 517}, tes3.getEffectMagnitude{reference = p, effect = 518},
tes3.getEffectMagnitude{reference = p, effect = 519}, (tes3.getEffectMagnitude{reference = p, effect = 520})}		local mc = (M[1]*0.3 + M[2]*0.3 + M[3]*0.4 + M[4]*0.5 + M[5]*0.4) * (P.mys7c and 2.5 or 3)
if mc > 0 then if not D.Aurdis then local E = B.AUR.effects		local MTab = {}		local rad = (50 + mp.willpower.current/2 + mp:getSkillValue(11)) * (P.alt12 and 3 or 2)
	for i, mag in ipairs(M) do if mag > 0 then E[i].id = MID[i]  E[i].min = mag		E[i].max = mag	E[i].duration = 3 else E[i].id = -1 end end
	for _, m in pairs(tes3.findActorsInProximity{reference = p, range = rad}) do if m ~= mp and (cf.agr or m.actionData.target == mp) and tes3.getCurrentAIPackageId(m) ~= 3 then MTab[m.reference] = m end end
	local num = table.size(MTab)
	if num > 0 then local mcs = mc * num/(1 + (num-1)/(alt5a and 3 or 5))		if mp.magicka.current > mcs then Mod(mcs)
		for r, m in pairs(MTab) do SNC[(tes3.applyMagicSource{reference = r, source = B.AUR}).serialNumber] = mp		L.CrimeAt(m) end
		if cf.m then tes3.messageBox("Aura = %d + %d + %d + %d + %d   Rad = %d  Cost = %.1f (%.1f  %d targets)", M[1], M[2], M[3], M[4], M[5], rad, mcs, mc, num) end
	end end
end else T.AUR:cancel()		D.AUR = nil end
end

L.ProkTik = function()	local M = {tes3.getEffectMagnitude{reference = p, effect = 531}, tes3.getEffectMagnitude{reference = p, effect = 532}, tes3.getEffectMagnitude{reference = p, effect = 533},
tes3.getEffectMagnitude{reference = p, effect = 534}, (tes3.getEffectMagnitude{reference = p, effect = 535})}		local mc = (M[1]*0.3 + M[2]*0.3 + M[3]*0.4 + M[4]*0.5 + M[5]*0.4) * (P.mys7d and 1.2 or 1.5)
if mc > 0 then if not D.Prokdis and mp.magicka.current > mc then	local rad = math.random(5) + L.GetRad(mp)		local E = B.PR.effects
	for i, mag in ipairs(M) do if mag > 0 then E[i].id = MID[i]  E[i].min = mag   E[i].max = mag	E[i].radius = rad	E[i].duration = 1	E[i].rangeType = 2 else E[i].id = -1	E[i].rangeType = 0 end end
	tes3.applyMagicSource{reference = p, source = B.PR}		Mod(mc)
	if cf.m then tes3.messageBox("Prok = %d + %d + %d + %d + %d + %s + %s   Cost = %.1f", M[1], M[2], M[3], M[4], M[5],M[6],M[7], mc) end
end else T.Prok:cancel()	D.Prok = nil end
end

L.RechargeTik = function() if G.REI then	local mag = Mag(501)	if mag == 0 then AF[p].T501:cancel()	AF[p].T501 = nil else		pow = mag * (1 + (P.enc4 and mp:getSkillValue(9)/400 or 0))
	if W.ob and W.v.charge < W.en.maxCharge then W.v.charge = math.min(W.v.charge + pow, W.en.maxCharge)
		if cf.m2 then tes3.messageBox("Pow = %.1f (%.1f mag)  %s charges = %d/%d", pow, mag, W.ob.name, W.v.charge, W.en.maxCharge) end
	else	local cen = mp.currentEnchantedItem		local cida = cen and cen.itemData
		if cida and cida.charge < cen.object.enchantment.maxCharge then cida.charge = math.min(cida.charge + pow, cen.object.enchantment.maxCharge)
			if cf.m2 then tes3.messageBox("Pow = %.1f (%.1f mag)  %s charges = %d/%d", pow, mag, cen.object.name, cida.charge, cen.object.enchantment.maxCharge) end
		else
			if not (G.REI.ob and inv:contains(G.REI.ob, G.REI.ida)) then	G.REI = {}
				for i, ri in pairs(wc.rechargingItems) do if inv:contains(ri.object, ri.itemData) then G.REI = {ob = ri.object, ida = ri.itemData, max = ri.enchantment.maxCharge}	break end end
			end
			if G.REI.ob then	G.REI.ida.charge = math.min(G.REI.ida.charge + pow, G.REI.max)
				if cf.m2 then tes3.messageBox("Pow = %.1f (%.1f mag)  %s charges = %d/%d", pow, mag, G.REI.ob.name, G.REI.ida.charge, G.REI.max) end
				if G.REI.max == G.REI.ida.charge then G.REI = {} end
			else G.REI = nil end
		end
	end
end end end


L.RechargeNPC = function(m, t) local mag = Mag(501,t)	if mag == 0 then AF[t].T501:cancel()	AF[t].T501 = nil else
	local w = m.readiedWeapon	local v = w and w.variables		local en = w and w.object.enchantment
	if v and en and v.charge < en.maxCharge then v.charge = math.min(v.charge + mag, en.maxCharge)
		if cf.m2 then tes3.messageBox("Pow = %.1f  %s charges = %d/%d", mag, w.object.name, v.charge, en.maxCharge) end
	else for _, st in pairs(t.object.equipment) do v = st.variables		en = st.object.enchantment	if v and en and v.charge < en.maxCharge then v.charge = math.min(v.charge + mag, en.maxCharge)
		if cf.m2 then tes3.messageBox("Pow = %.1f  %s charges = %d/%d", mag, st.object.name, v.charge, en.maxCharge) end break
	end end end	
end end

local function SIMULATE(e)
	if G.LastMana and (G.LastInt ~= mp.intelligence.current or G.LastMM ~= mp.magickaMultiplier.current) and G.LastMana < mp.magicka.current then mp.magicka.current = G.LastMana		M.Mana.current = G.LastMana end
	G.LastMana = mp.magicka.current		G.LastInt = mp.intelligence.current		G.LastMM = mp.magickaMultiplier.current
end		event.register("simulate", SIMULATE)


local function ABSORBEDMAGIC(e)	if e.mobile == mp then	local pow	local s = e.source	local si = e.sourceInstance			local num = s:getActiveEffectCount()
if s.weight then pow = 0	for i, ef in ipairs(s.effects) do if ef.id ~= -1 then pow = pow + (ef.min + ef.max) * ef.cost * ef.duration/40 end end
else pow = e.absorb end
if not (P.mys21 and mp.spellReadied) then pow = pow/2 end		e.absorb = pow/num
if cf.m then tes3.messageBox("ABS %s  Mana + %.1f  (%d / %d eff)", s.name or s.id, e.absorb, pow, num) end
end end		event.register("absorbedMagic", ABSORBEDMAGIC)

local function SPELLRESIST(e)	local c, resist, Cbonus, Cstam, CritC, CritD		local t = e.target	local m = t.mobile	local s = e.source	local ef = e.effect		local dur = ef.duration		local rt = ef.rangeType
local eid = ef.id	local sc = ef.object.school		local si = e.sourceInstance		local sn = si.serialNumber		local wg = s.weight		local RP = 0	--local ei = e.effectInstance
if e.caster then if wg then if wg == 0 then	-- для алхимии с весом кастера нет
	if rt == 0 then		if e.resistAttribute == 28 then c = e.caster.mobile else c = SNC[sn] end
	else c = e.caster.mobile end
end else c = e.caster.mobile end end
local MKF = L.DurKF[eid] and (c ~= mp or P.int9) and dur > 1 and 1 + L.DurKF[eid]/100 * (dur - 1)^0.5 or 1
if c then 	local Emp = 0	local will = c.willpower.current
	if EMP[eid] and c.reference.data.EMP then Emp = tes3.getEffectMagnitude{reference = c.reference, effect = EMP[eid].e} if Emp > 0 then MKF = MKF + Emp/200 else c.reference.data.EMP = nil end end
	Cstam = (50 + ((c ~= mp or P.wil2) and 0 or 10) + ((c ~= mp or P[s.objectType == tes3.objectType.enchantment and "enc5" or SP[sc].p3]) and 0 or 20)) * math.max(1-c.fatigue.normalized,0)
	Cbonus = c:getSkillValue(SP[sc].s)/((c ~= mp or P[MEP[eid] and MEP[eid].p0 or SP[sc].p1]) and 5 or 10) + ((c ~= mp or P[MEP[eid] and MEP[eid].p or "mys0"]) and c:getSkillValue(MEP[eid] and MEP[eid].s or 14)/10 or 0)
	if s.objectType == tes3.objectType.enchantment then Cbonus = Cbonus/3 + c:getSkillValue(9)/((c ~= mp or P.enc1) and 5 or 10) end	Cbonus = Cbonus + will/((c ~= mp or P.wil1) and 5 or 10)
	if ME[eid] == "shield" and m == mp and P.una7 then Cbonus = Cbonus + D.AR.u * m:getSkillValue(17)/100 end
	CritC = will/(1+will/400)/((c ~= mp or P.wil4) and 8 or 16) + ((c ~= mp or P.luc1) and c.luck.current/20 or 0)
	+ (c == mp and (P.int5 and mp.spellReadied and 5 or 0) or c.object.level + 10) + ((c ~= mp or P.des7) and Emp/10 or 0)
	- (e.resistAttribute == 28 and 10 or ((m.spellReadied and (m ~= mp or P.mys5) and m:getSkillValue(14)/10 or 0) + m.willpower.current/((m ~= mp or P.wil6) and 10 or 20) + ((m ~= mp or P.luc2) and m.luck.current/20 or 0)
	- ((c ~= mp or P.wil8) and c.attackBonus/10 or 0) - ((c ~= mp or P.des0) and c:getSkillValue(10)/20 or 0) - math.max(1-m.fatigue.normalized,0)*((c ~= mp or P.int1) and 20 or 10) ))
	CritD = CritC - math.random(100)	if CritD < 0 then CritD = 0 else CritD = CritD + 10 + ((c ~= mp or P.wil11) and 10 or 0) + (EMP[eid] and (c ~= mp or P[EMP[eid].p]) and c:getSkillValue(10)/10 or 0) end
	if c == mp then	local Koef = SN[sn]		if Koef then	if Koef > 1 then MKF = MKF + Koef - 1 else MKF = MKF * Koef end end end
else	Cbonus = 0	Cstam = 0	CritC = 0	CritD = 0 end -- Обычные зелья, обычные яды, алтари, ловушки и прочие кастующие активаторы
if e.resistAttribute == 28 then -- Магия с позитивными эффектами
	if s.objectType == tes3.objectType.spell and s.castType == 0 then -- Не влияет  на пост.эффекты, powers(5), всегда успешные
		if not s.alwaysSucceeds then RP = Cstam - Cbonus - CritD		if MKF ~= 1 then RP = 100 - (100 - RP) * MKF end
			if cf.m1 then tes3.messageBox("%s  %.1f%% spell power (+ %.1f bonus + %.1f crit (%.1f%%) - %.1f stam) x%.2f mult", s.name, 100 - RP, Cbonus, CritD, CritC, Cstam, MKF) end
		elseif L.AA[s.id] and c == mp and ME[eid] ~= 0 then
			RP = 100 - math.min((P.end18 and 50 or 20) + c.fatigue.normalized*100, 100) - math.min(L.AA[s.id].s and c:getSkillValue(L.AA[s.id].s) or t.object.level,100)*(P.agi21 and 1 or 0.5)
			if cf.m1 then tes3.messageBox("%s  %d%% technique power", s.name, 100 - RP) end
		elseif L.STAR[s.id] then RP = - t.object.level	if cf.m1 then tes3.messageBox("%s  %d%% Star power", s.name, 100 - RP) end end
	elseif wg then
		if wg == 0 then
			if s.icon == "" and m == mp and not L.ING[s.name] then RP = P.alc2 and 75 or 90	if cf.m1 then tes3.messageBox("%s  ingred power = %.1f for %d seconds", s.name, ef.max*(100-RP)/100, dur) end end
		else MKF = m == mp and 1 - math.max((D.potcd and D.potcd - 40 - G.potlim/(P.alc11 and 2 or 4) or 0)/G.potlim, 0) or 1
			RP = 0 - m.willpower.current/10 - m:getSkillValue(16)/((m ~= mp or P.alc1) and 5 or 10) - (m == mp and P.alc12 and (D.potcd or 0) < 35 and 20 or 0)
			if MKF ~= 1 then RP = 100 - (100 - RP) * MKF end
			if cf.m1 then tes3.messageBox("%s  %.1f%% alchemy power   x%.2f mult", s.name, 100 - RP, MKF) end
		end
	elseif s.objectType == tes3.objectType.enchantment then -- Сила зачарований castType 0=castOnce, 1=onStrike, 2=onUse, 3=constant
		if s.castType ~= 3 then	RP = Cstam - Cbonus - CritD		if MKF ~= 1 then RP = 100 - (100 - RP) * MKF end
			if eid == 76 and t == p and s.castType ~= 0 then RP = math.max(RP, 90) end
			if cf.m1 then tes3.messageBox("%s  %.1f%% enchant power (+ %.1f bonus + %.1f crit (%.1f%%) - %.1f stam) x%.2f mult", s.id, 100 - RP, Cbonus, CritD, CritC, Cstam, MKF) end
		elseif t == p then ConstEnLim()	if cf.enchlim then
			if W.DWM and si.item.objectType == tes3.objectType.weapon then e.resistedPercent = 100 return end
			if M.ENL.normalized > 1 then e.resistedPercent = 100	tes3.messageBox("Enchant limit exceeded! %d / %d", M.ENL.current, M.ENL.max)	tes3.playSound{sound = "Spell Failure Conjuration"} return
			elseif ef.min ~= ef.max and ME[eid] ~= 2 then RP = 50	tes3.messageBox("Anti-exploit! Enchant power reduced by half!") end
		end end
	end
	if RP < 100 then
	if ef.object.school == 1 then L.conjpower = 1 - RP/200	L.conjp = t == p or nil		L.conjagr = t ~= p and m.fight > 80 or nil
		if ME[eid] == 3 and (t ~= p or P.con14 or RP > 0) then
			timer.delayOneFrame(function() local ei = si:getEffectInstance(e.effectIndex, t)	 if ei then ei.timeActive = dur * RP/100 end end)
		elseif ME[eid] == 0 then
			if t == p then
				if P.con11 then
					if wg == 0 and s.name == "Summon" or (s.objectType == tes3.objectType.enchantment and s.castType == 3) then e.resistedPercent = RP		L.conjpower = L.conjpow1	return
					else tes3.applyMagicSource{reference = p, name = "Summon", effects = {{id = eid, duration = dur * ((P.con16 or RP > 0) and 1 - RP/100 or 1)}}}
						L.conjpow1 = L.conjpower		e.resistedPercent = 100		return
					end
				elseif P.con16 or RP > 0 then timer.delayOneFrame(function() local ei = si:getEffectInstance(e.effectIndex, t)	 if ei then ei.timeActive = dur * RP/100 end end) end
			else timer.delayOneFrame(function() local ei = si:getEffectInstance(e.effectIndex, t)	 if ei then ei.timeActive = dur * RP/100 end end) end
		end
	end
	if eid < 500 then
		if ME[eid] == 4 and c == mp and P.res10 and RP < 0 then
			timer.delayOneFrame(function() local ei = si:getEffectInstance(e.effectIndex, p)	 if ei then ei.timeActive = dur * math.max(RP/500, -0.2) end end)
		elseif ME[eid] == 5 and c == mp and P.res11 and RP < 0 then
			timer.delayOneFrame(function() local ei = si:getEffectInstance(e.effectIndex, p)	 if ei then ei.timeActive = dur * math.max(RP/500, -0.2) end end)
		elseif eid == 75 then pow = math.random(ef.min, ef.max) * dur * (1 - RP/100) * ((c ~= mp or P.res6) and 1 or 0.5)
		--	timer.delayOneFrame(function() for _, aef in pairs(mp:getActiveMagicEffects{effect = eid, serial = sn}) do aef.effectInstance.timeActive = aef.duration - 5		aef.effectInstance.state = 6
		--	tes3.messageBox("%s (%s)   dur = %.1f / %.1f", aef.instance.source.name or aef.instance.source.id, e.effectIndex == aef.effectIndex, aef.effectInstance.timeActive, aef.duration) end end)
			if AF[t].vital and AF[t].vital > 0 then AF[t].vital = AF[t].vital - pow		pow = - AF[t].vital end
			if pow > 0 then AF[t].heal = (AF[t].heal or 0) + pow	if not T.Heal.timeLeft then
				T.Heal = timer.start{duration = 3, iterations = -1, callback = function()	local fin = true
					for r, a in pairs(AF) do if a.heal and a.heal > 0 then fin = nil	a.heal = a.heal - a.heal^0.5*3	if a.heal < 3 then a.heal = nil
						else for i, s in ipairs(L.HealStat) do if i ~= 8 and r.mobile[s].current < r.mobile[s].base then tes3.modStatistic{reference = r, name = s, current = a.heal^0.5/2, limitToBase = true}	
							if cf.m2 then tes3.messageBox("%s Healing = %d (+%d stat)", r, a.heal, a.heal^0.5/2) end	break end
							if i == 8 and r.mobile.fatigue.normalized <= 1 then r.mobile.fatigue.current = r.mobile.fatigue.current	+ a.heal^0.5 * ((r ~= p or P.res13) and 5 or 3)
								if cf.m2 then tes3.messageBox("%s Healing = %d (+%d stamina)", r, a.heal, a.heal^0.5 * ((r ~= p or P.res13) and 5 or 3)) end
							end
						end end
					else a.heal = nil end end	if fin then	T.Heal:cancel() end
				end}
			end end
		elseif L.CME[eid] and AF[t][L.CME[eid]] then
			AF[t][L.CME[eid]] = AF[t][L.CME[eid]] - (ef.object.hasNoMagnitude and 100 or math.random(ef.min, ef.max) * dur) * (1 - RP/100) * ((m ~= mp or P.alt14) and 1 + m:getSkillValue(11)/100 or 1)
		elseif eid == 10 and rt ~= 0 and t ~= p then resist = RP + math.max(m.resistMagicka,-100) + m.willpower.current + m:getSkillValue(14)/2	-- Левитация
			if cf.m then tes3.messageBox("%s  %.1f%% levitation resist", s.name or s.id, resist) end		if resist >= math.random(100) then RP = 100 end
		elseif eid == 39 and t == p and s.name ~= "Blur" then	-- Невидимость
			if P.ill10 and RP < 0 then tes3.applyMagicSource{reference = p, name = "Blur", effects = {{id = 39, duration = dur * (P.ill17 and 1 - RP/100 or 1)}, 
				{id = 40, min = -RP/4, max = -RP/2, duration = dur}}}
			elseif P.ill17 or RP > 0 then timer.delayOneFrame(function() local ei = si:getEffectInstance(e.effectIndex, p)	 if ei then ei.timeActive = dur * RP/100 end end) end
		elseif eid == 118 or eid == 119 then RP = RP + math.max(m.resistMagicka,0) + (m.willpower.current + m:getSkillValue(14)/2)*(P.ill9 and 0.5 or 1) -- Приказы
			if cf.m then tes3.messageBox("%s  %.1f%% mind control resist", s.name or s.id, RP) end
			if R[t] then timer.start{duration = 0.1, callback = function() if tes3.isAffectedBy{reference = t, effect = eid} then R[t] = nil if cf.m4 then tes3.messageBox("CONTROL! %s", t) end end end} end
		elseif eid == 60 and t == p then local mmax = (1 + mp.willpower.base/200 + mp.intelligence.base/100 + mp.alteration.base/200 + mp.mysticism.base/50) * (P.mys11 and 2 or 1) -- Пометка
			local mtab = {}		for i = 1, 10 do if mmax >= i then mtab[i] = i.." - "..(DM["mark"..i] and DM["mark"..i].id or "empty") end end
			tes3.messageBox{message = "Which slot to remember the mark?", buttons = mtab, callback = function(e) DM["mark"..(e.button+1)] = {id = p.cell.id, x = pp.x, y = pp.y, z = pp.z} end}
		elseif eid == 0 and t == p then		-- Водное дыхание
			local WBR = mp.holdBreathTime
			timer.delayOneFrame(function() local ei = si:getEffectInstance(e.effectIndex, p)	 if ei then ei.timeActive = dur * RP/100 end
			timer.delayOneFrame(function() mp.holdBreathTime = WBR end) end)
			if not T.WaterB.timeLeft then T.WaterB = timer.start{iterations = -1, duration = 1, callback = function()
				if mp.waterBreathing > 0 then mp.holdBreathTime = math.min(math.max(mp.holdBreathTime, 0) + mp.waterBreathing/2 - 0.3, tes3.findGMST("fHoldBreathTime").value)
				else T.WaterB:cancel()	if not mp.underwater then mp.holdBreathTime = tes3.findGMST("fHoldBreathTime").value end end		-- tes3ui.findHelpLayerMenu("MenuSwimFillBar")
			end} end
		elseif eid == 2 and t == p then	-- Хождение по воде
			timer.delayOneFrame(function() local ei = si:getEffectInstance(e.effectIndex, p)	 if ei then ei.timeActive = dur * RP/100 end end)
		elseif ME[eid] == "teleport" then
			if L.TPComp() then timer.start{duration = 0.1, callback = function() for r, _ in pairs (G.TPList) do tes3.positionCell{reference = r, position = pp, cell = p.cell} end end} end
		end
	elseif eid == 501 and AF[t].T501 == nil then -- Перезарядка зачарованного (501)
		if t == p then AF[t].T501 = timer.start{duration = 1, iterations = -1, callback = L.RechargeTik} 	G.REI = {}
		else AF[t].T501 = timer.start{duration = 1, iterations = -1, callback = function() L.RechargeNPC(m, t) end} end
	elseif eid == 502 and AF[t].T502 == nil then -- Починка оружия (502)
		AF[t].T502 = timer.start{duration = 1, iterations = -1, callback = function() local mag = Mag(502,t)	if mag == 0 then AF[t].T502:cancel()	AF[t].T502 = nil else
			pow = mag * (1 + ((m ~= mp or P.arm6) and m:getSkillValue(1)/400 or 0))		local w = m.readiedWeapon
			if w and w.object.type ~= 11 and w.variables.condition < w.object.maxCondition then w.variables.condition = math.min(w.variables.condition + pow, w.object.maxCondition)
				if cf.m1 then tes3.messageBox("Pow = %.1f (%.1f mag)  %s condition = %d/%d", pow, mag, w.object.name, w.variables.condition, w.object.maxCondition) end
			end
		end end}
	elseif eid == 503 and AF[t].T503 == nil then -- Починка брони (503)
		AF[t].T503 = timer.start{duration = 1, iterations = -1, callback = function() local mag = Mag(503,t)	if mag == 0 then AF[t].T503:cancel()	AF[t].T503 = nil else
			pow = mag * (1 + ((m ~= mp or P.arm6) and m:getSkillValue(1)/400 or 0))	
			for _, st in pairs(t.object.equipment) do if st.object.objectType == tes3.objectType.armor and st.variables and st.variables.condition < st.object.maxCondition then
				st.variables.condition = math.min(st.variables.condition + pow, st.object.maxCondition)
				if cf.m1 then tes3.messageBox("Pow = %.1f (%.1f mag)  %s condition = %d/%d", pow, mag, st.object.name, st.variables.condition, st.object.maxCondition) end	break
			end end
		end end}
	elseif ME[eid] == "charge" then t.data.CW = true	-- Зарядить оружие. Эффекты 511, 512, 513, 514, 515
	elseif ME[eid] == "empower" then t.data.EMP = true
	elseif ME[eid] == "reflect" and not t.data.RFN then t.data.RFN = {} -- Отражения стихиями 
	elseif eid == 507 and not t.data.RFS then t.data.RFS = {} -- Отражение заклинаний
	elseif eid == 508 then t.data.KS = true	-- Кинетический щит
	elseif eid == 509 then t.data.LL = true	-- Лайф лич
	elseif ME[eid] == "aura" and t == p then D.AUR = true		if not T.AUR.timeLeft then T.AUR = timer.start{duration = P.alt11 and math.max(3 - mp:getSkillValue(11)/200, 2.5) or 3, iterations = -1, callback = L.AuraTik} end
		if AF[t][L.CME[eid]] then AF[t][L.CME[eid]] = AF[t][L.CME[eid]] - math.random(ef.min, ef.max) * dur * (1 - RP/100) * ((m ~= mp or P.alt14) and 1 + m:getSkillValue(11)/100 or 1) end
	elseif ME[eid] == "prok" and t == p then D.Prok = true		if not T.Prok.timeLeft then T.Prok = timer.start{duration = P.alt11 and math.max(3 - mp:getSkillValue(11)/100, 2) or 3, iterations = -1, callback = L.ProkTik} end
	elseif eid == 601 and t == p and cf.autoammo then	mc = BAM.f()	if m.readiedWeapon then BAM.am = BAM[m.readiedWeapon.object.type] or BAM.met else BAM.am = BAM.met end
		if m.magicka.current > mc and mwscript.getItemCount{reference = t, item = BAM.am} == 0 then tes3.addItem{reference = t, item = BAM.am, count = 1, playSound = false}
			mwscript.equip{reference = t, item = BAM.am}	Mod(mc)
		end
	elseif eid == 510 and t == p and not T.TS.timeLeft then event.register("simulate", SIMTS)	-- Замедление времени (510)
		pow = Mag(510) + math.random(ef.min, ef.max) * (1 - RP/100)		TSK = math.max(1 - pow/(pow + 40), P.ill8 and 0.1 or 0.2)
		T.TS = timer.start{duration = 1.1, iterations = -1, callback = function()	pow = Mag(510)
			if pow == 0 then T.TS:cancel()	event.unregister("simulate", SIMTS)	TSK = 1		--tes3.playSound{reference = p, sound = "illusion cast"}
			else TSK = math.max(1 - pow/(pow + 40), P.ill8 and 0.1 or 0.2) end
		end}
	elseif eid == 504 and t == p then D.ligspawn = true		local col = L.Rcol(cf.col)
		LI.l.color[1] = col[1]		LI.l.color[2] = col[2]		LI.l.color[3] = col[3]		LI.l.radius = 100 * math.random(ef.min, ef.max) * (1 - RP/100)
		if T.LI.timeLeft then	event.unregister("simulate", LI.SIM)	T.LI:cancel()	LI.r:delete()	LI.r = nil end		LI.New(dur, pp)
		if cf.m then tes3.messageBox("Light active! Radius = %d  Time = %d   Total = %d", LI.l.radius, dur, table.size(LI.R)) end
	end
	end
elseif wg or rt ~= 0 then local Tarmor, Tbonus, IsPois		-- Любые негативные эффекты с дальностью касание и удаленная цель ИЛИ пвсевдоалхимия ИЛИ обычные яды ИЛИ ингредиенты
	if e.caster == t then
		if rt ~= 0 then MKF = MKF * math.max(1 - (m:getSkillValue(14) + m.willpower.current)/((m ~= mp or P.mys15) and 400 or 800), 0.25)		-- Отражение или эксплод спелл будут ослаблены
		elseif wg > 0 or s.icon == "" then if L.ING[s.name] then e.resistedPercent = 0 return end		IsPois = true		Cbonus = 0	Cstam = 0	CritC = 0	CritD = 0 end
	end
	if not IsPois and rt ~= 0 then
		if m ~= mp and L.Summon[c and c.object.baseObject.id] then MKF = MKF/2 end
		if t.data.RFS then if t.data.RFS.num == sn then MKF = MKF * (1 - t.data.RFS.pow)	if MKF == 0 then e.resistedPercent = 100 return end else local RFSM = Mag(507,t) * ((m ~= mp or P.mys14) and 1.2 or 1)
			if RFSM == 0 then t.data.RFS = nil else	local pow = 0
				for i, eff in ipairs(s.effects) do if eff.id ~= -1 and eff.rangeType ~= 0 then pow = pow + (eff.min + eff.max) * eff.object.baseMagickaCost * eff.duration/20 end end
				pow = pow * (100 + Cbonus + CritD - Cstam)*MKF/100
				if m ~= mp or DM.refl then
					if RFSM > pow then mc = pow * ((m ~= mp or P.mys7g) and 2 or 2.5)			if m.magicka.current > mc then local rad = L.GetRad(m)	local E = B.RFS.effects
						for i, eff in ipairs(s.effects) do if eff.rangeType ~= 0 then	E[i].id = eff.id	E[i].radius = math.min(eff.radius, rad)		E[i].duration = eff.duration
						E[i].min = eff.min	E[i].max = eff.max	E[i].rangeType = eff.rangeType		E[i].attribute = eff.attribute		E[i].skill = eff.skill	else E[i].id = -1	E[i].rangeType = 0 end end
						tes3.applyMagicSource{reference = t, source = B.RFS}		Mod(mc,m)		t.data.RFS.pow = 1		t.data.RFS.num = sn		e.resistedPercent = 100	
						if cf.m then tes3.messageBox("Reflect = %.1f / %.1f  Cost = %.1f  Radius = %.1f", RFSM, pow, mc, rad) end	return
					end else if cf.m then tes3.messageBox("Fail! Reflect = %.1f  Power = %.1f", RFSM, pow) end end
				else	local RFSK = math.min(RFSM/pow, cf.mshmax/100)		mc = RFSK * pow * ((m ~= mp or P.mys7g) and 1.5 or 2)
					if m.magicka.current > mc then	Mod(mc,m)	MKF = MKF * (1 - RFSK)		t.data.RFS.pow = RFSK		t.data.RFS.num = sn
					if cf.m then tes3.messageBox("Manashield = %.1f / %.1f  Koef = %d%%  Cost = %.1f", RFSM, pow, RFSK*100, mc) end		if MKF == 0 then e.resistedPercent = 100 return end end
				end
			end
		end end
		if t.data.RFN then if t.data.RFN.num == sn then MKF = MKF * (1 - t.data.RFN.pow)	if MKF == 0 then e.resistedPercent = 100 return end else
			local RFM = {tes3.getEffectMagnitude{reference = t, effect = 561}, tes3.getEffectMagnitude{reference = t, effect = 562}, tes3.getEffectMagnitude{reference = t, effect = 563},
			tes3.getEffectMagnitude{reference = t, effect = 564}, (tes3.getEffectMagnitude{reference = t, effect = 565})}
			local Koef = (m ~= mp or P.mys14) and 1.2 or 1		for i, mag in ipairs(RFM) do if mag ~= 0 then RFM[i] = RFM[i] * Koef end end		local RFMS = RFM[1] + RFM[2] + RFM[3] + RFM[4] + RFM[5]
			if RFMS == 0 then t.data.RFN = nil else	local pow = 0
				for i, eff in ipairs(s.effects) do if eff.rangeType ~= 0 and eff.id ~= -1 then pow = pow + (eff.min + eff.max) * eff.duration * eff.object.baseMagickaCost/20 end end
				pow = pow * MKF		local pow2 = pow * (100 + Cbonus + CritD - Cstam)/100		local RFK = math.min(RFMS/pow2, cf.rfmax/100)		mc = RFK * pow2 * ((m ~= mp or P.mys7g) and 2.5 or 3)
				if m.magicka.current > mc then	local rad = L.GetRad(m)	local MAG	local E = B.RF.effects
					for i, mag in ipairs(RFM) do if mag ~= 0 then MAG = pow * RFK * mag/RFMS * 10 / L.MEC[i]	E[i].id = MID[i]	E[i].min = MAG	E[i].max = MAG	E[i].radius = rad	E[i].rangeType = 2	E[i].duration = 1
					else E[i].id = -1	E[i].rangeType = 0 end end
					tes3.applyMagicSource{reference = t, source = B.RF}		Mod(mc,m)	MKF = MKF * (1 - RFK)	t.data.RFN.pow = RFK	t.data.RFN.num = sn
					if cf.m then tes3.messageBox("NewRefl = %.1f / %.1f (base %.1f)  Koef = %d%%  Cost = %.1f  Radius = %.1f", RFMS, pow2, pow, RFK*100, mc, rad) end		if MKF == 0 then e.resistedPercent = 100 return end
				end
			end
		end end
	end
	local NormR = math.max(m[L.RES[eid] or (IsPois and "resistPoison" or "resistMagicka")],-100)
	if ME[eid] == 1 then Tarmor = m.armorRating * ((m ~= mp or P.end21) and 0.2 or 0.1)
		Tbonus = (math.min(m.endurance.current,100)/5 + math.min(m.willpower.current,100)/5) * ((m ~= mp or P[EMP[eid].p3]) and 1 or 0.5) + ((m ~= mp or P.des9) and math.min(m:getSkillValue(10),100)/10 or 0)
		if c == mp and ((P.mys9 and m.object.type == 1) or (P.res9 and m.object.type == 2)) then Cbonus = Cbonus + 10 end
		if m.readiedShield and (m ~= mp or mp.actionData.animationAttackState == 2) then Tbonus = Tbonus + m:getSkillValue(0)/((m ~= mp or P.bloc7) and 5 or 10) end
	end
	if eid == 14 then	local frostbonus	local burst = AF[t].fire and AF[t].fire^0.5*2 or 0
		if AF[t].frost and AF[t].frost > 0 then frostbonus = AF[t].frost^0.5*5		AF[t].frost = math.max(AF[t].frost - math.random(ef.min, ef.max) * dur, 0) else frostbonus = 0 end
		resist = NormR + Tarmor + Tbonus - Cbonus - CritD + Cstam - burst + frostbonus
		if resist > 300 and m.health.normalized < 1 and (m ~= mp or P.alt9) then RP = resist - 200 elseif resist > 200 then RP = 100 elseif resist > 0 then RP = resist/(1 + resist/200) else RP = resist end
		if MKF ~= 1 then RP = 100 - (100 - RP) * MKF end
		if cf.m1 then tes3.messageBox("%s  %.1f%% fire resist (%.1f = %.1f norm + %.1f target + %.1f armor - %.1f caster - %.1f crit (%.1f%%) + %.1f stam - %.1f burst + %.1f frost) x%.2f mult",
		s.name or s.id, RP, resist, NormR, Tbonus, Tarmor, Cbonus, CritD, CritC, Cstam, burst, frostbonus, MKF) end
		if RP < 100 then AF[t].fire = (AF[t].fire or 0) + math.random(ef.min, ef.max) * dur * (1 - RP/100) *
			((c ~= mp or P.wil14) and 1.25 or 1) * ((c ~= mp or P[EMP[eid].p1]) and 1 or 0.5) * ((m ~= mp or P.end19) and 0.8 or 1) * (m == mp and P[EMP[eid].p2] and 0.5 or 1)
			if not T.Fire.timeLeft then T.Fire = timer.start{duration = 1, iterations = -1, callback = function()	local fin = true
				for r, a in pairs(AF) do if a.fire and a.fire > 0 then fin = nil
					a.fire = a.fire - a.fire^0.5	if a.fire < 3 then a.fire = nil elseif cf.m2 then tes3.messageBox("%s Fire = %d (%d%% burst)", r, a.fire, a.fire^0.5*2) end
				else a.fire = nil end end	if fin then	T.Fire:cancel() end
			end} end
		end
	elseif eid == 16 then	local firebonus		if AF[t].fire and AF[t].fire > 0 then firebonus = AF[t].fire^0.5*5		AF[t].fire = math.max(AF[t].fire - math.random(ef.min, ef.max) * dur, 0) else firebonus = 0 end
		resist = NormR + Tarmor + Tbonus - Cbonus - CritD + Cstam + firebonus
		if resist > 300 and m.health.normalized < 1 and (m ~= mp or P.alt9) then RP = resist - 200 elseif resist > 200 then RP = 100 elseif resist > 0 then RP = resist/(1 + resist/200) else RP = resist end
		if MKF ~= 1 then RP = 100 - (100 - RP) * MKF end
		if cf.m1 then tes3.messageBox("%s  %.1f%% frost resist (%.1f = %.1f norm + %.1f target + %.1f armor - %.1f caster - %.1f crit (%.1f%%) + %.1f stam + %.1f fire) x%.2f mult",
		s.name or s.id, RP, resist, NormR, Tbonus, Tarmor, Cbonus, CritD, CritC, Cstam, firebonus, MKF) end
		if RP < 100 then AF[t].frost = (AF[t].frost or 0) + math.random(ef.min, ef.max) * dur * (1 - RP/100) *
			((c ~= mp or P.wil14) and 1.25 or 1) * ((c ~= mp or P[EMP[eid].p1]) and 1 or 0.5) * ((m ~= mp or P.end19) and 0.8 or 1) * (m == mp and P[EMP[eid].p2] and 0.5 or 1)
			if not T.Frost.timeLeft then event.register("calcMoveSpeed", CMSFrost)	T.Frost = timer.start{duration = 1, iterations = -1, callback = function()	local fin = true
				for r, a in pairs(AF) do if a.frost and a.frost > 0 then fin = nil		a.frost = a.frost - a.frost^0.5	
					if a.frost < 3 then a.frost = nil FR[r] = nil else FR[r] = math.max(1 - a.frost^0.5*0.04, 0.1)		if cf.m2 then tes3.messageBox("%s Frost = %d (%d%% frozen speed)", r, a.frost, FR[r]*100) end end
				else a.frost = nil FR[r] = nil end end	if fin then event.unregister("calcMoveSpeed", CMSFrost)	T.Frost:cancel() end
			end} end
		end
	elseif eid == 15 then
		resist = NormR + Tarmor + Tbonus - Cbonus - CritD + Cstam
		if resist > 300 and m.health.normalized < 1 and (m ~= mp or P.alt9) then RP = resist - 200 elseif resist > 200 then RP = 100 elseif resist > 0 then RP = resist/(1 + resist/200) else RP = resist end
		if MKF ~= 1 then RP = 100 - (100 - RP) * MKF end
		if cf.m1 then tes3.messageBox("%s  %.1f%% lightning resist (%.1f = %.1f norm + %.1f target + %.1f armor - %.1f caster - %.1f crit (%.1f%%) + %.1f stam) x%.2f mult",
		s.name or s.id, RP, resist, NormR, Tbonus, Tarmor, Cbonus, CritD, CritC, Cstam, MKF) end
		if RP < 100 then AF[t].shock = (AF[t].shock or 0) + math.random(ef.min, ef.max) * dur * (1 - RP/100) *
			((c ~= mp or P.wil14) and 1.25 or 1) * ((c ~= mp or P[EMP[eid].p1]) and 1 or 0.5) * ((m ~= mp or P.end19) and 0.8 or 1) * (m == mp and P[EMP[eid].p2] and 0.5 or 1)
			if not T.Shock.timeLeft then T.Shock = timer.start{duration = 1, iterations = -1, callback = function()	local fin = true
				for r, a in pairs(AF) do if a.shock and a.shock > 0 then fin = nil	a.shock = a.shock - a.shock^0.5	if a.shock < 3 then a.shock = nil
					else Mod(0.5*a.shock^0.5, r.mobile)		if cf.m2 then tes3.messageBox("%s Shock = %d (-%d mana  %d%% tremor)", r, a.shock, a.shock^0.5/2, a.shock^0.5*5) end
					if a.shock^0.5*5 >= math.random(100) then
						local ShSi = tes3.applyMagicSource{reference = r, name = "Electroshock", effects = {{id = 45, min = 1, max = 1, duration = 1}}}
						timer.start{duration = math.min(0.3 + a.shock^0.5/100, 0.9), callback = function() ShSi.state = 6 end}
					end end
				else a.shock = nil end end	if fin then	T.Shock:cancel() end
			end} end
		end
	elseif eid == 27 then Tbonus = (math.min(m.endurance.current,100)*0.3 + math.min(m.willpower.current,100)*0.1) * ((m ~= mp or P[EMP[eid].p3]) and 1 or 0.5) + ((m ~= mp or P.alc10) and math.min(m:getSkillValue(16),100)/10 or 0)
		resist = NormR + Tbonus - Cbonus - CritD + Cstam
		if resist > 300 and m.health.normalized < 1 and (m ~= mp or P.alt9) then RP = resist - 200 elseif resist > 200 then RP = 100 elseif resist > 0 then RP = resist/(1 + resist/200) else RP = resist end
		if MKF ~= 1 then RP = 100 - (100 - RP) * MKF end
		if cf.m1 then tes3.messageBox("%s  %.1f%% poison resist (%.1f = %.1f norm + %.1f target - %.1f caster - %.1f crit (%.1f%%) + %.1f stam) x%.2f mult",
		s.name or s.id, RP, resist, NormR, Tbonus, Cbonus, CritD, CritC, Cstam, MKF) end	
		if RP < 100 then AF[t].poison = (AF[t].poison or 0) + math.random(ef.min, ef.max) * dur * (1 - RP/100) *
			((c ~= mp or P.wil14) and 1.25 or 1) * ((c ~= mp or P[EMP[eid].p1]) and 1 or 0.5) * ((m ~= mp or P.end19) and 0.8 or 1) * (m == mp and P[EMP[eid].p2] and 0.5 or 1)
			if not T.Poison.timeLeft then T.Poison = timer.start{duration = 1, iterations = -1, callback = function()	local fin = true
				for r, a in pairs(AF) do if a.poison and a.poison > 0 then fin = nil	a.poison = a.poison - a.poison^0.5	if a.poison < 3 then a.poison = nil 
					else r.mobile.fatigue.current = r.mobile.fatigue.current - a.poison^0.5		if cf.m2 then tes3.messageBox("%s Poison = %d (-%d stamina)", r, a.poison, a.poison^0.5) end end
				else a.poison = nil end end	if fin then	T.Poison:cancel() end
			end} end
		end
	else	Tbonus = (math.min(m.endurance.current,100)*0.1 + math.min(m.willpower.current,100)*0.3) * ((m ~= mp or P.wil3) and 1 or 0.5) + ((m ~= mp or P.mys6) and math.min(m:getSkillValue(14),100)/10 or 0)
		if eid == 45 or eid == 46 then local Extra = m:getSkillValue(12) * ((m ~= mp or P.ill6) and 0.3 or 0.1) > math.random(100) and 100 or 0			-- Паралич и молчание считаем отдельно
			resist = NormR + m.resistParalysis + Tbonus - Cbonus - CritD + Cstam + Extra
			RP = resist > 0 and resist/(1 + resist/200) or resist		if MKF ~= 1 then RP = 100 - (100 - RP) * MKF end
			if cf.m1 then tes3.messageBox("%s  %.1f%% paralysis resist (%.1f = %.1f paral + %.1f magic + %.1f target - %.1f caster - %.1f crit (%.1f%%) + %.1f stam + %d extra) x%.2f mult",
			s.name or s.id, RP, resist, m.resistParalysis, NormR, Tbonus, Cbonus, CritD, CritC, Cstam, Extra, MKF) end
			if RP >= 100 then RP = 100 elseif RP > 0 or (RP < 0 and (c ~= mp or P.ill18)) then
			timer.delayOneFrame(function() local ei = si:getEffectInstance(e.effectIndex, t)	 if ei then ei.timeActive = dur * RP/100 end end) end
		elseif eid == 55 or eid == 56 then local Extra = P.per9 and mp.personality.current/5 or 0
			RP = Cstam - Cbonus - CritD	- Extra		if MKF ~= 1 then RP = 100 - (100 - RP) * MKF end		-- Ралли
			local koef = 1 - RP/100		local min = ef.min*koef		local max = ef.max*koef		local k1 = P.ill14 and 1 or 0.5		local k2 = P.ill15 and 0.02 or 0	local k3 = P.ill16 and 0.05 or 0
			tes3.applyMagicSource{reference = t, name = "Rally", effects = {{id = 79, min = min*k1, max = max*k1, attribute = math.random(0,5), duration = dur},
			{id = 77, min = min*k1/2, max = max*k1/2, duration = dur}, {id = 75, min = min*k2, max = max*k2, duration = dur}, {id = 76, min = min*k3, max = max*k3, duration = dur}}}
			if cf.m1 then tes3.messageBox("%s  %.1f%% Rally power (+ %.1f bonus + %.1f crit (%.1f%%) - %.1f stam + %d extra) x%.2f mult", s.name or s.id, 100 - RP, Cbonus, CritD, CritC, Cstam, Extra, MKF) end
		else resist = NormR + Tbonus - Cbonus - CritD + Cstam	-- Всё остальное негативное кроме паралича и ралли
			if resist > 200 then RP = 100 elseif resist > 0 then RP = resist/(1 + resist/200) else RP = resist end		if MKF ~= 1 then RP = 100 - (100 - RP) * MKF end
			if cf.m1 then tes3.messageBox("%s  %.1f%% magic resist (%.1f = %.1f norm + %.1f target - %.1f caster - %.1f crit (%.1f%%) + %.1f stam) x%.2f mult",
			(s.name or s.id), RP, resist, NormR, Tbonus, Cbonus, CritD, CritC, Cstam, MKF) end
			if eid == 23 and RP < 100 then AF[t].vital = (AF[t].vital or 0) + math.random(ef.min, ef.max) * dur * (1 - RP/100) *
				((c ~= mp or P.wil14) and 1.25 or 1) * ((c ~= mp or P[EMP[eid].p1]) and 1 or 0.5) * ((m ~= mp or P.end19) and 0.8 or 1) * (m == mp and P[EMP[eid].p2] and 0.5 or 1)
				if not T.Vital.timeLeft then T.Vital = timer.start{duration = 1, iterations = -1, callback = function()	local fin = true
					for r, a in pairs(AF) do if a.vital and a.vital > 0 then fin = nil	a.vital = a.vital - a.vital^0.5
						if a.vital < 3 then a.vital = nil else
						if a.vital^0.5*5 > math.random(100) then tes3.modStatistic{reference = r, name = L.Traum[math.random(5)], current = -0.5*a.vital^0.5}	if cf.m then tes3.messageBox("%s  %.1f trauma damage!", r, a.vital^0.5*0.5) end end
						if cf.m2 then tes3.messageBox("%s Trauma = %d (%d%% chance)", r, a.vital, a.vital^0.5*5) end end
					else a.vital = nil end end	if fin then	T.Vital:cancel() end
				end} end
			elseif ME[eid] == 6 and RP < 100 then
				if t == p and P.res12 then timer.delayOneFrame(function() local ei = si:getEffectInstance(e.effectIndex, p)	 if ei then ei.timeActive = dur * (0.1 + math.max(RP/500, 0)) end end)
				elseif c == mp and P.des10 then timer.delayOneFrame(function() local ei = si:getEffectInstance(e.effectIndex, t)	 if ei then ei.timeActive = dur * (math.min(RP/1000, 0) - 0.1) end end) end
			elseif ME[eid] == 7 and RP < 100 then
				if t == p and P.res12 then timer.delayOneFrame(function() local ei = si:getEffectInstance(e.effectIndex, p)	 if ei then ei.timeActive = dur * (0.1 + math.max(RP/500, 0)) end end)
				elseif c == mp and P.des11 then timer.delayOneFrame(function() local ei = si:getEffectInstance(e.effectIndex, t)	 if ei then ei.timeActive = dur * (math.min(RP/1000, 0) - 0.1) end end) end
			elseif eid == 51 or eid == 52 then	local koef = 1 - RP/100		local mag = math.random(ef.min, ef.max) * dur		local rad = mag * (P.ill12 and 2 or 1)		-- Френзи
				pow = mag * koef * (P.ill11 and 1.5 or 1)	local minp = 1000 + t.object.level*100
				if P.ill14 then tes3.applyMagicSource{reference = t, name = "Rally", effects = {{id = 117, min = ef.min*koef, max = ef.max*koef, duration = dur}}} end
				if pow > minp then	m.actionData.aiBehaviorState = 3
					if P.ill13 then		for _, mob in pairs(tes3.findActorsInProximity{reference = t, range = rad}) do if mob ~= m then m:startCombat(mob) end end
					else	local tar, dist		local md = rad
						for _, mob in pairs(tes3.findActorsInProximity{reference = t, range = rad}) do if mob ~= m then dist = t.position:distance(mob.position)	if dist < md then md = dist		tar = mob end end end
						if tar then m:startCombat(tar) end
					end
				end
				if cf.m then tes3.messageBox("%s Frenzy! power = %d/%d  rad = %d", t, pow, minp, rad) end
			elseif eid == 49 or eid == 50 then	-- Calm
				pow = math.random(ef.min, ef.max) * (1 - RP/100)	* (P.ill20 and 1.5 or 1)	local minp = math.max(t.object.aiConfig.fight/2 + t.object.level * (P.per10 and 5 or 10), 50)
				if pow > minp then	if R[t] then R[t] = nil		if cf.m4 then tes3.messageBox("CALM! %s", t) end end	else RP = 100 end
				if cf.m then tes3.messageBox("%s Calm! power = %d/%d  basefight = %d", t, pow, minp, t.object.aiConfig.fight) end
			end
		end
	end
else e.resistedPercent = 0	return end -- Любые негативные эффекты с дальностью на себя, включая постоянные и баффо-дебаффы и болезни, будут действовать на 100% силы.
e.resistedPercent = RP
local bid = t.baseObject.id
if L.CID[bid] then
	if bid == "golden saint" or bid == "golden saint_summon" then
		if ME[eid] == 1 and not t.data.retcd then	for _, eff in ipairs(B.aureal.effects) do eff.id = -1 end
			for i, eff in ipairs(s.effects) do if ME[eff.id] == 1 then B.aureal.effects[i].id = eff.id		B.aureal.effects[i].min = eff.min/3		B.aureal.effects[i].max = eff.max/3
				B.aureal.effects[i].radius = 10		B.aureal.effects[i].duration = eff.duration		B.aureal.effects[i].rangeType = 2
			end end
			tes3.applyMagicSource{reference = t, source = B.aureal}	t.data.retcd = true		timer.start{duration = 0.1, callback = function() t.data.retcd = nil end}
		end
	elseif L.CID[bid] == "wolf" and s.id == "BM_summonwolf" then e.resistedPercent = -2000 elseif L.CID[bid] == "bear" and s.id == "BM_summonbear" then e.resistedPercent = -2000 end
end
--if m == mp and SSN[sn] then tes3.getMagicSourceInstanceBySerial{serialNumber = sn}.state = 6	tes3.messageBox("Resist! SNum = %s", sn) SSN[sn] = nil end
--tes3.messageBox("%s  id = %s  Respr = %.2f   mag = %d  Cummag = %d", s.name or s.id, eid, e.effectInstance.resistedPercent, e.effectInstance.magnitude, e.effectInstance.cumulativeMagnitude)
-- e.effectInstance ещё не полностью построена во время эвента. Далее она меняется на полноценный effectInstance которые НЕ равен предыдущему и может быть получен из активных эффектов
end		event.register("spellResist", SPELLRESIST)


local AOE = {}	local RUN = {}	local TOT = {}	-- АОЕ (521-525)	РУНЫ (526-530)		ТОТЕМЫ (551-555)
L.RunExp = function(n) local E = B.RUN.effects		local t = RUN[n]		--tes3.messageBox("Rune %d  exploded  id = %s", n, t.s.effects[1].id)
	for i, ef in ipairs(t.ef) do if ef.id > -1 then E[i].id = ef.id		E[i].min = ef.min	E[i].max = ef.max	E[i].duration = ef.duration		E[i].radius = ef.radius		E[i].rangeType = 2
	else E[i].id = -1	E[i].rangeType = 0 end end
	MP[tes3.applyMagicSource{reference = p, source = B.RUN}] = {pos = t.r.position + tes3vector3.new(0,0,50), exp = true}		t.r:delete()	RUN[n] = nil
end
L.TotExp = function(n) local E = B.TOT.effects		local t = TOT[n]
	if t.dur > 9 then	for i, ef in ipairs(t.ef) do if ef.id > -1 then E[i].id = ef.id		E[i].min = ef.min	E[i].max = ef.max	E[i].radius = ef.radius		E[i].duration = 1	E[i].rangeType = 2
	else E[i].id = -1	E[i].rangeType = 0 end end
	MP[tes3.applyMagicSource{reference = p, source = B.TOT}] = {pos = t.r.position:copy(), exp = true} end		t.r:delete()	TOT[n] = nil
end

local function AOEcol(e) local cp = e.collision.point	if math.abs(cp.x) < 9000000 and e.sourceInstance.caster == p then local n	local s = e.sourceInstance.source		local ef = s.effects[e.effectIndex + 1]
local alt = mp:getSkillValue(11)		local koef = L.durbonus(ef.duration - 1, 5) * (SN[e.sourceInstance.serialNumber] or 1)		tes3.getObject(L.AoEmod[ef.id%5]).radius = ef.radius * 50
local r = tes3.createReference{object = L.AoEmod[ef.id%5], position = cp + tes3vector3.new(0,0,10), cell = p.cell, scale = math.min(ef.radius * (P.alt12 and 0.075 + alt/4000 or 0.075), 9.99)}	r.modified = false
local max = math.ceil((50 + mp.intelligence.current/2 + alt)/(P.alt5b and 20 or 40))		for i = 1, max do if not AOE[i] then n = i break end end
if not n then n = 1	local md = AOE[1].tim		for i, t in pairs(AOE) do if t.tim < md then md = t.tim		n = i end end end
if AOE[n] then AOE[n].r:delete()	AOE[n] = nil end
AOE[n] = {r = r, tim = ef.duration, id = MID[ef.id%5], min = ef.min * koef, max = ef.max * koef}
if cf.m10 then  tes3.messageBox("AoE %d/%d  Power = %d%%  Scale = %.2f  Time: %d", n, max, koef*100, AOE[n].r.scale, AOE[n].tim) end
if not T.AoE.timeLeft then local dur = P.alt11 and math.max(2 - alt/200, 1.5) or 2	T.AoE = timer.start{duration = dur, iterations = -1, callback = function() local fin = true		local E = B.AOE.effects[1]
	for i, t in pairs(AOE) do	t.tim = t.tim - dur		if t.tim > 0 then	fin = false		E.id = t.id		E.min = t.min	E.max = t.max	E.duration = 2
		for _, m in pairs(tes3.findActorsInProximity{position = t.r.position, range = 300 * t.r.scale}) do if m ~= mp then
			SNC[(tes3.applyMagicSource{reference = m.reference, source = B.AOE}).serialNumber] = mp		L.CrimeAt(m)
		end end
	else t.r:delete()	AOE[i] = nil end end		if fin then T.AoE:cancel()	if cf.m10 then tes3.messageBox("All AoE ends") end end
end} end
end end

local function RUNcol(e) if G.RunSN ~= e.sourceInstance.serialNumber then	local cp = e.collision.point	if math.abs(cp.x) < 9000000 then	local n		local s = e.sourceInstance.source
local ef = s.effects[e.effectIndex + 1]		G.RunSN = e.sourceInstance.serialNumber		local koef = SN[G.RunSN] or 1	local alt = mp:getSkillValue(11)		local vel = e.sourceInstance.projectile.velocity		
local hit = tes3.rayTest{position = cp - vel:normalized()*100, direction = vel}
local r = tes3.createReference{object = "4nm_rune", position = cp + tes3vector3.new(0,0,5), orientation = hit and L.GetOri(V.up, hit.normal), cell = p.cell, scale = math.min(ef.radius * (P.alt12 and 0.15 + alt/2000 or 0.15), 9.99)}
local light = niPointLight.new()	light:setAttenuationForRadius(ef.radius/2)		light.diffuse = tes3vector3.new(L.LID[ef.id%5][1], L.LID[ef.id%5][2], L.LID[ef.id%5][3])	--tes3vector3.new(ef.object.lightingRed, ef.object.lightingGreen, ef.object.lightingBlue)
r.sceneNode:attachChild(light)		light:propagatePositionChange()		r:getOrCreateAttachedDynamicLight(light, 0)		r.modified = false
local max = math.ceil((50 + mp.intelligence.current/2 + alt)/(P.alt5c and 10 or 20))		for i = 1, max do if not RUN[i] then n = i break end end
if not n then n = 1	local md = RUN[1].tim		for i, t in pairs(RUN) do if t.tim < md then md = t.tim		n = i end end	L.RunExp(n) end
local E = {{id=-1},{id=-1},{id=-1},{id=-1},{id=-1},{id=-1},{id=-1},{id=-1}}
for i, ef in ipairs(s.effects) do if ME[ef.id] == "rune" then E[i].id = MID[ef.id%5]	E[i].min = ef.min * koef	E[i].max = ef.max * koef	E[i].duration = ef.duration		E[i].radius = ef.radius end end
RUN[n] = {r = r, ef = E, tim = (100 + alt + mp:getSkillValue(14))*(P.mys20 and 0.4 or 0.2)}
if cf.m10 then  tes3.messageBox("Rune %d/%d  Power = %d%%  Scale = %.2f  Time: %d", n, max, koef*100, RUN[n].r.scale, RUN[n].tim) end
if not T.Run.timeLeft then T.Run = timer.start{duration = 1, iterations = -1, callback = function() local fin = true
	for i, t in pairs(RUN) do	t.tim = t.tim - 1	if t.tim > 0 then	fin = false
		for _, m in pairs(tes3.findActorsInProximity{position = t.r.position, range = 80 * t.r.scale}) do if m ~= mp then L.RunExp(i)	break end end
	else L.RunExp(i) end end	if fin then T.Run:cancel()	if cf.m10 then tes3.messageBox("All runes ends") end end
end} end
end end end

local function TOTcol(e) if G.TotSN ~= e.sourceInstance.serialNumber then	local cp = e.collision.point	if math.abs(cp.x) < 9000000 then	local n		local s = e.sourceInstance.source
local ef = s.effects[e.effectIndex + 1]		local tdur = ef.duration		G.TotSN = e.sourceInstance.serialNumber		local koef = SN[G.TotSN] or 1	local alt = mp:getSkillValue(11)
local r = tes3.createReference{object = "4nm_totem", position = cp + tes3vector3.new(0,0,60*(1 + ef.radius/50)), cell = p.cell, scale = 1 + ef.radius/50}
local light = niPointLight.new()	light:setAttenuationForRadius((1 + ef.radius/50)*3)		light.diffuse = tes3vector3.new(L.LID[ef.id%5][1], L.LID[ef.id%5][2], L.LID[ef.id%5][3])
r.sceneNode:attachChild(light)		light:propagatePositionChange()		r:getOrCreateAttachedDynamicLight(light, 0)		r.modified = false
local max = math.ceil((50 + mp.intelligence.current/2 + alt)/(P.alt5d and 20 or 40))		for i = 1, max do if not TOT[i] then n = i break end end
if not n then n = 1	local md = TOT[1].tim		for i, t in pairs(TOT) do if t.tim < md then md = t.tim		n = i end end	L.TotExp(n) end
local E = {{id=-1},{id=-1},{id=-1},{id=-1},{id=-1},{id=-1},{id=-1},{id=-1}}		mc = 0
for i, ef in ipairs(s.effects) do if ME[ef.id] == "totem" and tdur <= ef.duration then E[i].id = MID[ef.id%5]	E[i].min = ef.min * koef	E[i].max = ef.max * koef	E[i].radius = ef.radius
mc = mc + (E[i].min + E[i].max)	* L.MEC[ef.id%5] * (P.mys7f and 0.04 or 0.05) * (1+E[i].radius^2/(10*E[i].radius+200)) end end
TOT[n] = {r = r, ef = E, tim = tdur, dur = tdur, mc = mc}
if cf.m10 then  tes3.messageBox("Totem %d/%d  Power = %d%%  Cost = %.1f  Scale = %.2f  Time: %d", n, max, koef*100, TOT[n].mc, TOT[n].r.scale, TOT[n].tim) end
if not T.Tot.timeLeft then local dur = P.alt11 and math.max(2 - alt/200, 1.5) or 2		T.Tot = timer.start{duration = dur, iterations = -1, callback = function()	local BE = B.TOT.effects
	local fin = true	local maxdist = (100 + mp.intelligence.current + alt + mp:getSkillValue(14)) * (P.alt12 and 20 or 10)		local tar, pos, fpos, mindist, dist
	for i, t in pairs(TOT) do	t.tim = t.tim - dur		if t.tim > 0 then	fin = false
		if not D.Totdis and AC[t.r.cell] and mp.magicka.current > t.mc then fpos = nil	mindist = maxdist
			for _, m in pairs(tes3.findActorsInProximity{position = t.r.position, range = maxdist}) do if m ~= mp and (cf.agr or m.actionData.target == mp) and tes3.getCurrentAIPackageId(m) ~= 3 then 
				pos = m.position + tes3vector3.new(0,0,m.height/2)		dist = t.r.position:distance(pos)
				if dist < mindist and tes3.testLineOfSight{position1 = t.r.position, position2 = pos} then mindist = dist	tar = m		fpos = pos end
			end end
			if fpos then
				for i, ef in ipairs(t.ef) do if ef.id > -1 then BE[i].id = ef.id	BE[i].min = ef.min		BE[i].max = ef.max		BE[i].radius = ef.radius	BE[i].duration = 1	BE[i].rangeType = 2
				else BE[i].id = -1	BE[i].rangeType = 0 end end
				MP[tes3.applyMagicSource{reference = p, source = B.TOT}] = {pos = t.r.position:copy(), vel = (fpos - t.r.position):normalized()}
				Mod(t.mc)		if cf.m10 then tes3.messageBox("Totem %s   Target = %s   Manacost = %.1f", i, tar.object.name, t.mc) end
			end
		end
	else L.TotExp(i) end end	if fin then T.Tot:cancel()	if cf.m10 then tes3.messageBox("All totems ends") end end
end} end
end end end

--L.Dash = function(e) p.sceneNode.velocity = V.d		V.dfr = V.dfr + 1	if V.dfr == 7 then event.unregister("simulate", L.Dash)	V.dfr = nil end end
L.Dash = function(e) if e.reference == p then	if V.djf then	mp.isJumping = true end			mp.impulseVelocity = V.d*(1/30/wc.deltaTime)*TSK	V.dfr = V.dfr - TSK
if V.dfr <= 0 then event.unregister("calcMoveSpeed", L.Dash)	V.dfr = nil
	if V.djf then V.djf = nil	mp.isJumping = false end
	if V.daf then mp.animationController.weaponSpeed = V.daf	V.daf = nil end
	if V.dkik then V.dkik = nil		L.KIK() end
end
end end

L.BLAST = function(e)	local r = e.reference	if KSR[r] then e.mobile.impulseVelocity = KSR[r].v*(1/30/wc.deltaTime) * math.clamp(KSR[r].f/30,0.2,1)*TSK	KSR[r].f = KSR[r].f - TSK	e.speed = 0 --KSR[r].v.z = KSR[r].v.z - 0.04
if KSR[r].f <= 0 then KSR[r] = nil 	if table.size(KSR) == 0 then event.unregister("calcMoveSpeed", L.BLAST)		V.bcd = nil end end end end

L.KIK = function() if mp.hasFreeAction and mp.paralyze < 1 then	local climb, foot, r, m		local dist = 1000	local maxd = 50 + math.min(mp.agility.current/2, 50)
local ClAb = (mp.isJumping or mp.velocity:length() > 0) and not V.dfr		local cldist = maxd + (P.acr9 and 30 or 0)		local kikdist = maxd + (P.hand11 and 30 or 0)

local vdir = tes3.getPlayerEyeVector()		local hit = tes3.rayTest{position = tes3.getPlayerEyePosition(), direction = vdir, maxDistance = 130, ignore={p}}
if hit then dist = hit.distance 	r = hit.reference	m = N[r] and N[r].m		maxd = m and kikdist or (ClAb and cldist) or 0 end

if dist > maxd and ClAb then foot = true
	local ori = p.orientation		Matr:fromEulerXYZ(ori.x, ori.y, ori.z)	local pdir = Matr:transpose().y
	hit = tes3.rayTest{position = pp + tes3vector3.new(0,0,10), direction = pdir, maxDistance = 130, ignore={p}}
	if hit then dist = hit.distance 	r = hit.reference	m = N[r] and N[r].m		maxd = m and kikdist or cldist end
	if dist > maxd then hit = mp.isMovingLeft and 1 or (mp.isMovingRight and -1)		if hit then Matr:fromEulerXYZ(ori.x, ori.y, ori.z)		vdir = Matr:transpose().x * hit
		hit = tes3.rayTest{position = pp + tes3vector3.new(0,0,10), direction = vdir, ignore={p}}
		if hit then dist = hit.distance 	r = hit.reference	m = N[r] and N[r].m		maxd = m and kikdist or cldist end
	end end
end

if dist > maxd then maxd = kikdist	local md = kikdist
	for _, mob in pairs(tes3.findActorsInProximity{reference = p, range = 150}) do if mob ~= mp and mob.playerDistance < md and math.abs(mp:getViewToActor(mob)) < 100 then md = mob.playerDistance		m = mob end end
	if m then dist = md		r = m.reference		vdir = (r.position - pp):normalized() end
end
	

if dist <= maxd then
if ClAb then	local s = mp:getSkillValue(20)		local stc = math.max(20 + mp.encumbrance.normalized*(P.atl6 and (30 - mp:getSkillValue(8)/10) or 30) - (P.acr11 and s/10 or 0), 10)
	if mp.fatigue.current > stc then local ang = 0
		if mp.isMovingForward then if foot then if mp.isMovingLeft then ang = 315 elseif mp.isMovingRight then ang = 45 end else V.d = V.up end
		elseif mp.isMovingBack then if mp.isMovingLeft then ang = 45 elseif mp.isMovingRight then ang = 315 end
		elseif mp.isMovingLeft then ang = 270 elseif mp.isMovingRight then ang = 90 else V.d = V.up end
		if V.d ~= V.up then Matr:toRotationZ(math.rad(ang))		V.d = Matr * tes3.getPlayerEyeVector()
			if mp.isMovingBack then V.d = V.d*-1 elseif ang == 90 or ang == 270 then V.d.x = V.d.x/(1 - V.d.z^2)^0.5		V.d.y = V.d.y/(1 - V.d.z^2)^0.5 end		V.d.z = 1
		end
		local imp = (100 + mp.strength.current/2 + s/2) * (P.acr12 and 5 or 3) * (0.5 + math.min(mp.fatigue.normalized,1)/2)		if P.acr10 then mp.velocity = V.nul end		mp.isSwimming = false
		V.d = V.d * imp		V.dfr = 7	event.register("calcMoveSpeed", L.Dash)		mp.fatigue.current = mp.fatigue.current - stc		mp:exerciseSkill(20,0.2)
		climb = true	tes3.playSound{sound = math.random(2) == 1 and "LeftS" or "LeftM"}
		if cf.m then tes3.messageBox("Climb-jump! impuls = %d  jump = %s  dist = %d   cost = %d", imp, mp.isJumping, dist, stc) end
	end
end
if not T.Kik.timeLeft and m then	local s = mp:getSkillValue(26)		local bot = mp:getBootsWeight()
	local sc = math.max(30 + (bot + mp.encumbrance.normalized*20)*(P.atl6 and (1 - mp:getSkillValue(8)/200) or 1) - (P.end20 and 10 or 0) - (P.hand14 and s/10 or 0), 10) - (climb and 10 or 0)
	if mp.fatigue.current > sc then	local arm = m.armorRating		if not climb then vdir.z = math.min(vdir.z + 0.5, 1) end
		local cd = math.max((P.spd12 and 1.5 or 2) - mp.speed.current/100 + math.max(D.AR.as + mp.encumbrance.normalized * (P.spd18 and 0.1 or 0.2) - math.max(-mp.encumbrance.currentRaw,0)/2000, 0)*2, (P.hand15 and 0.5 or 1))
		T.Kik = timer.start{duration = cd, callback = function() end}
		local Kskill = s * ((P.hand1 and 0.2 or 0.1) + (P.str2 and 0.1 or 0.05))		local Kbonus = mp.attackBonus/5		local Kstr = mp.strength.current/(P.str1 and 1 or 2)
		local Kdash = (P.str9 and (T.Dash.timeLeft or 0) > 2 and V.dd/50 or 0)			local ko = L.AG[m.actionData.currentAnimationGroup]
		local Kstam = (50 + (P.end1 and 0 or 10) + (P.hand2 and 0 or 20)) * (1 - math.min(mp.fatigue.normalized,1))
		local CritC = Kbonus + s/(P.hand6 and 10 or 20) + mp.agility.current/(P.agi1 and 10 or 20) + (P.luc1 and mp.luck.current/20 or 0) + (mp.isMovingForward and P.spd3 and 10 or 0) + (m.isMovingForward and 10 or 0)
		+ (math.min(com, G.maxcomb) * (P.agi6 and 5 or 3)) + (mp.isJumping and P.acr4 and mp:getSkillValue(20)/10 or 0)
		- (m.endurance.current + m.agility.current + m.luck.current)/20 - arm/10 - m.sanctuary/10 + math.max(1-m.fatigue.normalized,0)*(P.agi11 and 20 or 10) - 10
		local Kcrit = CritC - math.random(100)	if Kcrit < 0 then Kcrit = 0 else Kcrit = Kcrit + 20 + (P.agi8 and 10 or 0) + (P.hand5 and 20 or 0) end
		local Koef = 100 + Kstr + Kskill + Kdash + Kbonus + Kcrit - Kstam
		local DMag = math.min(tes3.getEffectMagnitude{reference = p, effect = 600}, cf.moment)	local mc = 0	local Kkin = 0
		if DMag > 0 then mc = DMag * (P.alt17 and 0.5 or 1)		if mp.magicka.current > mc then Kkin = DMag * (Cpow(mp,0,4) + (P.alt16 and 50 or 0))/200 	Mod(mc) end end
		local dmg = (((P.hand19 and 4 or 2) + (P.hand13 and bot*(s/500) or 0)) * Koef/100 + Kkin) * (ko and 1.5 + (P.hand10 and 0.5 or 0) or 1)	--local fdmg = dmg*dmg/(arm + dmg)
		local sdmg = (P.hand16 and 10 or 5) * Koef/100		if not ko then m.fatigue.current = m.fatigue.current - sdmg end
		local fdmg = m:applyDamage{damage = dmg, applyArmor = true, playerAttack = true}	L.CrimeAt(m)

		if T.Comb.timeLeft then T.Comb:reset() end		mp.fatigue.current = mp.fatigue.current - sc
		L.skw = math.max((m.object.level * 4 + 20 - p.object.level/2) / (m.object.level + 20) * (fdmg+sdmg)/30, 0)		mp:exerciseSkill(26, 1)
		local mass = math.max(m.height, 60)^2 * ((m.actorType == 1 or m.object.biped) and 0.5 or 0.8) * (100 + arm/2)/5000
		local imp = math.min((100 - Kstam + Kstr + Kdash*2.5 + Kkin*20 - m.endurance.current) * 1000/mass, 10000)
		if imp > 100 then if not V.bcd then event.register("calcMoveSpeed", L.BLAST)	V.bcd = 0 end
		tes3.applyMagicSource{reference = r, name = "4nm", effects = {{id = 10, min = 1, max = 1, duration = 0.1}}}	KSR[r] = {v = vdir * imp, f = 30} end
		if cf.m then tes3.messageBox([[Kick! dmg = %d (%d / %d arm) + %d stam  K = %d%% (+%d%% str +%d%% skill +%d%% atb -%d%% stam +%d%% crit (%d%%) +%d%% dash +%d kin) 
		impuls = %d  mass = %d  dist = %d  cd = %.1f  cost = %d + %d  up = %.2f  %s]],
		fdmg, dmg, arm, sdmg, Koef, Kstr, Kskill, Kbonus, Kstam, Kcrit, CritC, Kdash, Kkin, imp, mass, dist, cd, sc, mc, vdir.z, ko and "KO!" or "") end
	end
end
end
end end

L.KBlast = function(pos, rad, dam) local dist, r, mass, pow, KO, dmg		local maxpow = p.cell.isInterior and not p.cell.behavesAsExterior and 8000 or 15000
for _, m in pairs(tes3.findActorsInProximity{position = pos, range = rad}) do if m ~= mp then r = m.reference	dist = pos:distance(r.position)	if dist < rad then 
	mass = math.max(m.height, 60)^2 * ((m.actorType == 1 or m.object.biped) and 0.5 or 0.8) * (100 + m.armorRating/2)/5000		
	pow = math.min((rad - dist) * 400 / mass, maxpow)		KO = pow/40 - m.agility.current
	if pow > 100 then	tes3.applyMagicSource{reference = r, name = "4nm", effects = {{id = 10, min = 1, max = 1, duration = 0.1}}}
	KSR[r] = {v = ((r.position + tes3vector3.new(0, 0, m.height*0.8)) - pos):normalized() * pow, f = (KSR[r] and KSR[r].f/2 or 0) + 30}		if not V.bcd then event.register("calcMoveSpeed", L.BLAST)	V.bcd = 0 end end
	if dam then dmg = m:applyDamage{damage = dam*(rad - dist)/rad, applyArmor = true, playerAttack = true}	L.CrimeAt(m) end
	if KO > math.random(100) then tes3.applyMagicSource{reference = r, name = "KO", effects = {{id = 20, min = 2000, max = 2000, duration = 1}}} end
	if cf.m then tes3.messageBox("Blast! %s  Impuls = %d (%d - %d) Mass = %d  Dmg = %d  KO chance = %d%%", r.object.name, pow, rad, dist, mass, dmg or 0, KO) end	--m.actionData.animationAttackState = 15
end end end
end

local function KSCollision(e) local dist, dam, pow, r, mass, arm, KO
local ef = e.sourceInstance.source.effects[e.effectIndex + 1]	local koef = Cpow(mp,0,2)/100 * (SN[e.sourceInstance.serialNumber] or 1)
local rad = (ef.radius + L.GetRad(mp)) * math.random(ef.min, ef.max) * koef
local dam = math.random(ef.min, ef.max) * koef
L.KBlast(e.collision.point, rad, dam)
end

L.runTeleport = function(pos)	local TPdist = pp:distance(pos)		local TPmdist = (100 + mp.intelligence.current + mp:getSkillValue(11) + mp:getSkillValue(14)) * 20		if TPdist > 200 then
	if TPdist > TPmdist then  pos = pp:interpolate(pos, TPmdist)		TPdist = TPmdist end	mc = (20 + TPdist/50) * (P.mys7a and 1 or 1.5)
	if mc < mp.magicka.current then 
		Mod(mc)		tes3.playSound{sound = "Spell Failure Destruction"}		p.position = pos	--mp.isSwimming = true	--tes3.positionCell{reference = p, position = pos, cell = p.cell}		
		tes3.applyMagicSource{reference = p, name = "4nm", effects = {{id = 10, min = 1, max = 1, duration = 0.1}}}
		if cf.m then tes3.messageBox("Distance = %d  Manacost = %.1f", TPdist, mc) end
	end
end end
local function TeleportCollision(e) if e.sourceInstance.caster == p then L.runTeleport(e.collision.point - e.sourceInstance.projectile.velocity:normalized()*70) end end


local function SPELLMAGICKAUSE(e) 	if e.caster == p then local sp = e.spell	if not sp.alwaysSucceeds then	local sc = sp:getLeastProficientSchool(mp)
	G.MCKoef = (G.LastQS == sp and not P.int11 and 1.2 or 1) - (P.int15 and math.max((0.5 - mp.magicka.normalized)*0.1, 0) or 0)
	- mp:getSkillValue(SP[sc].s)/(P[SP[sc].p4] and 1000 or 2000) - (P.mys10 and 0.05 or 0) + (D.AR.mc > 0 and math.max(D.AR.mc - math.max(-mp.encumbrance.currentRaw,0)/2000, 0) or D.AR.mc)
	e.cost = e.cost * math.max(G.MCKoef, 0.5)
	--if G.LastQS == sp then G.LastQsn = e.instance.serialNumber end
	--tes3.messageBox("%s  Cost = %d (%d base)  School = %s", sp.name, e.cost, sp.magickaCost, sc)
end if mp.magicka.current < e.cost then G.LastQS = nil end end end		event.register("spellMagickaUse", SPELLMAGICKAUSE)

local function SPELLCAST(e)	local sp = e.source		local c = e.caster		if sp.castType == 0 or sp.castType == 5 then	if c == p then	local extra = 0		local cost = sp.magickaCost		local sc = e.weakestSchool
if G.LastQS == sp then ad.animationAttackState = 0		if not P.int2 then extra = cost end		for i, ef in ipairs(sp.effects) do if ef.id ~= -1 then tes3.removeSound{sound = ef.object.castSoundEffect, reference = p} end end
else
	if P.spd6 then if mp.speed.current > 99 then 
		if ad.animationAttackState == 11 then if ic:keybindTest(tes3.keybind.readyMagic) then timer.start{duration = 0.1, callback = function() ad.animationAttackState = 0 end} else ad.animationAttackState = 0 end end
	else timer.start{duration = math.clamp((100 - mp.speed.current)/100, 0.01, 0.99), callback = function()
		if ad.animationAttackState == 11 then if ic:keybindTest(tes3.keybind.readyMagic) then timer.start{duration = 0.1, callback = function() ad.animationAttackState = 0 end} else ad.animationAttackState = 0 end end
	end} end end
end
if sc < 6 then local s = mp:getSkillValue(SP[sc].s)
	local stam = math.min(cost * (G.MCKoef or 1) * math.min((P.end16 and 0.25 or 0) + (P.una9 and D.AR.u * 0.01 or 0), 0.5), mp.fatigue.base - mp.fatigue.current)
	if stam > 0 then mp.fatigue.current = mp.fatigue.current + stam end
	e.castChance = e.castChance + (P[SP[sc].p2] and s/5 or 0) + (P.int6 and mp.intelligence.current/10 or 0) + (P.luc13 and mp.luck.current/10 or 0) + (P.int8 and mp.spellReadied and (mp.intelligence.current + s)/10 or 0)
	+ (D.AR.cc > 0 and D.AR.cc or math.min(D.AR.cc + math.max(-mp.encumbrance.currentRaw,0)/1000, 0)) - mp.encumbrance.normalized * (P.end17 and 10 or 20) - (P.wil10 and 0 or M.MCB.normalized*20) - extra
	if cf.m10 then tes3.messageBox("Spellcast! School = %s  chance = %.1f   stam + %.1f", sc, e.castChance, stam) end
end		
elseif (c.mobile.actorType == 1 or c.object.biped) then c.mobile.actionData.animationAttackState = 0 end end end		event.register("spellCast", SPELLCAST)

--[[local function SPELLCASTED(e) if e.caster == p and e.expGainSchool < 6 then
	local sc = e.expGainSchool		tes3.messageBox("CAST! School = %s   cost = %s", sc, e.source.magickaCost)
end end		event.register("spellCasted", SPELLCASTED)	--]]
local function SPELLCASTEDFAILURE(e) if e.caster == p and e.expGainSchool < 6 then M.MCB.current = 0	G.LastQS = nil
	if P.int7 then tes3.modStatistic{reference = p, name = "magicka", current = e.source.magickaCost * math.min((mp.intelligence.current + mp:getSkillValue(SP[e.expGainSchool].s))/500,0.5)} end
end end		event.register("spellCastedFailure", SPELLCASTEDFAILURE)


local function ENCHANTCHARGEUSE(e)	if e.isCast and e.caster == p then	local en = e.source		local cost = en.chargeCost		L.sken = cost * 5 / (cost + 80)
	if en.castType == 1 then e.charge = D.NoEnStrike and 50000 or cost * math.max(1 - mp:getSkillValue(9)*((P.enc8 and 0.002 or 0.001) + (P.enc19 and 0.003 or 0.001)), 0.5)
		if W.ob and W.v.charge < e.charge then timer.delayOneFrame(function() tes3.removeSound{sound = en.effects[1].object.spellFailureSoundEffect, reference = p} end) end
	elseif en.castType == 2 then e.charge = cost * (math.max(1 - mp:getSkillValue(9)*(P.enc8 and 0.002 or 0.001), 0.8) + M.MCB.normalized*(P.enc20 and 0.4 or 0.2)*(P.enc21 and 0.5 or 1)) end
	if cf.m10 then tes3.messageBox("En cast! %s  Cost = %d (%d base)", en.id, e.charge, cost) end
end end		event.register("enchantChargeUse", ENCHANTCHARGEUSE)


local function RaySim() if L.KEY(G.ck) and mp.magicka.current > G.rayc then	G.raysim = G.raysim + wc.deltaTime
	if G.raysim > G.raydt then G.raysim = G.raysim - G.raydt	tes3.applyMagicSource{reference = p, source = B.RAY}		Mod(MB[cf.mbray] == 128 ~= cf.ray and G.rayc or G.sprc) end
else event.unregister("simulate", RaySim)	G.raysim = nil end end

local function Shot(n, x) tes3.applyMagicSource{reference = p, source = B.SG} 	if n > 1 then timer.delayOneFrame(function()
Shot(n-1, x)	timer.delayOneFrame(function() ic.mouseState.x = ic.mouseState.x + math.random(-2*x,2*x)	ic.mouseState.y = ic.mouseState.y + math.random(-x,x) end) end) end end


local function MAGICCASTED(e) if e.caster == p then	local s = e.source	local si = e.sourceInstance		local sn = si.serialNumber		local id1 = s.effects[1].id		local cost	local n = s.name	local MC = M.MCB.normalized
local KF = 1		local ct = s.castType
local Focus = P.wil5 and mp.spellReadied and mp.magicka.current/(100 + mp.magicka.current/10)/100 or 0
if s.effects[1].rangeType == 2 and P.alt18 and MB[cf.mbhev] == 128 and not MP[si] and n ~= "4b_RAY" then V.BAL[sn] = 1 + MC		KF = KF + 0.05 end

if s.objectType == tes3.objectType.spell and ct == 0 then cost = s.magickaCost		local mc = 0
	KF = KF + Focus
	local char = MC*(P.wil7 and 0.2 or 0.1)		if char > 0 then mc = cost * char * (P.int14 and 0.5 or 1)		if mp.magicka.current > mc then Mod(mc) else char = 0 end end
	if G.LastQS == s then KF = (KF + (P.int13 and char or 0)) * math.clamp(M.QB.normalized*(P.wil13 and 2 or 1.25), 0.2, 1)	G.LastQS = nil
	elseif char > 0 then KF = KF + char end
	M.MCB.current = 0		L.skmag = cost * 5 / (cost + 80)
	if cf.m10 then tes3.messageBox("%s  Spell power = %d%%   Charge = %d%% (%.1f cost)", n, KF*100, char*100, mc) end
elseif s.objectType == tes3.objectType.enchantment and ct < 3 then cost = s.chargeCost
	KF = KF + Focus
	if (ct == 1 and si.item.type < 11) or ct == 2 then	local PCcost = cost - M.PC.max/(P.enc11 and 200 or 400)		G.REI = {}
		if MC > 0 then KF = KF + MC*(P.enc20 and 0.2 or 0.1)		M.MCB.current = 0 end
		if PCcost > 0 then	if M.PC.normalized < (P.enc10 and 0.5 or 0.8) then KF = KF * math.max(P.enc2 and 0.1 or 0.03, M.PC.normalized*(P.enc10 and 2 or 1.25), 1-PCcost/(M.PC.max/100)) end
			M.PC.current = math.max(M.PC.current - PCcost, 0)	M.Bar4.visible = true	D.PCcur = M.PC.current		if not T.PCT.timeLeft then T.PCT:reset() end
		end
		if cf.m10 then tes3.messageBox("%s  Enc power = %d%%  Potencial charge cost = %.1f (%.1f base)  Limit = %d/%d", s.id, KF*100, PCcost, cost, M.PC.current, M.PC.max) end
	elseif P.enc17 and ct == 0 then KF = KF + M.PC.normalized/10 end
elseif n == "4b_RAY" then	KF = KF + Focus		if T.MCT.timeLeft then KF = KF + MC*(P.wil7 and 0.2 or 0.1)		M.MCB.current = math.max(M.MCB.current - (P.mys19 and 0.5 or 1), 0) end
end
if KF ~= 1 then SN[sn] = KF end

if ME[id1] == "shotgun" then	local E = B.SG.effects		local num = (P.alt6 and 4 or 3) + math.floor(mp:getSkillValue(11)/200 + mp.intelligence.current/1000 + mp:getSkillValue(14)/200)
	for i, ef in ipairs(s.effects) do if ME[ef.id] == "shotgun" then E[i].id = MID[ef.id%5]	E[i].min = ef.min*KF	E[i].max = ef.max*KF		E[i].radius = ef.radius		E[i].duration = ef.duration		E[i].rangeType = 2
	else E[i].id = -1	E[i].rangeType = 0 end end
	if cf.m10 then tes3.messageBox("Shotgun cast! %s   Koef = %.2f  Balls = %d", n or s.id, KF, num) end		Shot(num, 50 * (1 - math.min(mp.agility.current + mp:getSkillValue(23),200)/(P.mark12 and 250 or 400)))	
elseif ME[id1] == "ray" and not s.weight then	G.rayc = cost * (P.mys7b and 0.09 or 0.1) 	G.sprc = cost * (P.mys7b and 0.06 or 0.07)
	local k = math.min(KF, 1)		local E = B.RAY.effects		local num = (P.alt7 and 20 or 15) + math.min(math.floor(mp:getSkillValue(11)/25 + mp.intelligence.current/50 + mp:getSkillValue(14)/25),10)
	for i, ef in ipairs(s.effects) do if ME[ef.id] == "ray" then E[i].id = MID[ef.id%5]		E[i].min = ef.min*k		E[i].max = ef.max*k		E[i].radius = ef.radius		E[i].duration = ef.duration		E[i].rangeType = 2
	else E[i].id = -1	E[i].rangeType = 0 end end
	if not G.raysim then event.register("simulate", RaySim)		G.raydt = 1/num		G.raysim = G.raydt end
	if cf.m10 then tes3.messageBox("Ray cast! %s   Koef = %.2f   Cost = %.2f / %.2f  Balls = %d", n or s.id, k, G.rayc, G.sprc, num) end
elseif ME[id1] == "discharge" then	local E = B.DC.effects		local rad = L.GetRad(mp)/2		-- Разряд. Эффекты 541, 542, 543, 544, 545
	for i, ef in ipairs(s.effects) do if ME[ef.id] == "discharge" then E[i].id = MID[ef.id%5]	E[i].min = ef.min*KF	E[i].max = ef.max*KF	E[i].radius = rad+ef.radius		E[i].duration =	ef.duration		E[i].rangeType = 2
	else E[i].id = -1	E[i].rangeType = 0 end end
	MP[tes3.applyMagicSource{reference = p, source = B.DC}] = {pos = p.position + tes3vector3.new(0,0,10), exp = true}
end
end end		event.register("magicCasted", MAGICCASTED)


local function MCStart(e) if e.button == 0 then M.MCB.current = 0 	T.MCT:cancel()	G.arm1.appCulled = true	G.arm2.appCulled = true	event.unregister("mouseButtonUp", MCStart) end
if cf.mcs then tes3.removeSound{sound = "destruction bolt", reference = p} end end

L.ArcSim = function(e) if mp.weaponDrawn and MB[1] == 128 then	local AS = ad.animationAttackState
	if G.arcf then
		if AS == 2 then	-- АС превращается из 2 в 4 а в следующем фрейме в 5 так как ЛКМ зажата.	Происходит выстрел и существующий nockedProjectile становится нил в следущем фрейме
			if ad.nockedProjectile and G.arcf < 5 then		ad.attackSwing = 0.5	ad.animationAttackState = 4		mp.animationController.weaponSpeed = 0.0001		G.arcf = G.arcf + 1
			else G.arcf = nil 	mp.animationController.weaponSpeed = G.arcspd 	ad.nockedProjectile = nil 	MB[1] = 0 end
			local MS = ic.mouseState	local x = (30 + mp.readiedWeapon.object.weight*2) * (1 - (math.min(mp.agility.current,200)/(P.mark12 and 250 or 500)))
			MS.x = MS.x + math.random(-2*x,2*x)		MS.y = MS.y + math.random(-x,x)
		elseif AS == 4 then		mp.animationController.weaponSpeed = G.arcspd
		elseif AS == 5 then ad.animationAttackState = 0	end		-- АС превращается из 5 в 0 а следующем фрейме в 2 так как ЛКМ зажата. nockedProjectile в этом фрейме нил но заряжается новый в следующем фрейме
		--tes3.messageBox("%s   AS = %s --> %s   %s   %s   Swing = %d", G.arcf, AS, ad.animationAttackState, ad.nockedProjectile and ad.nockedProjectile.reference, mp.readiedAmmoCount, ad.attackSwing*100)
	elseif AS == 2 then local dt = wc.deltaTime
		if MB[cf.mbarc] == 128 and mp.fatigue.current > 10 then mp.fatigue.current = mp.fatigue.current - dt * (P.atl4 and 10 or 20)	dt = -dt end	G.artim = math.clamp((G.artim or 0) + dt,0,4)
		if G.artim > 0 then	local MS = ic.mouseState	local x = (5 + mp.readiedWeapon.object.weight/2) * (1 - (math.min(mp.agility.current + mp:getSkillValue(23),200)/(P.mark12 and 250 or 400))) * G.artim/4
			MS.x = MS.x + math.random(-2*x,2*x)		MS.y = MS.y + math.random(-x,x)
		end
	else G.artim = nil end
else event.unregister("simulate", L.ArcSim)	G.artim = nil	if G.arcf then G.arcf = nil		mp.animationController.weaponSpeed = G.arcspd end end end


L.MetSim = function(e) if mp.weaponDrawn and MB[1] == 128 and G.met < G.metmax then	local AS = ad.animationAttackState
	if AS == 0 then mp.animationController.weaponSpeed = 1000000
	elseif AS == 2 then	
		if ad.nockedProjectile then	ad.attackSwing = G.metsw		ad.animationAttackState = 4		G.met = G.met + 1		--if G.met == 0 then mp.animationController.weaponSpeed = 1000000	end
		else	mp.animationController.weaponSpeed = 1000000 end
		local MS = ic.mouseState	local x = 30 * (1 - (math.min(mp.agility.current,200)/(P.mark12 and 250 or 500)))		MS.x = MS.x + math.random(-2*x,2*x)		MS.y = MS.y + math.random(-x,x)
	elseif AS == 4 then		mp.animationController.weaponSpeed = 1000000
	elseif AS == 5 then		
		if ad.nockedProjectile then ad.animationAttackState = 0 else	 mp.animationController.weaponSpeed = 1000000 end
	end
	--tes3.messageBox("%s   AS = %s --> %s   %s    Swing = %d", G.met, AS, ad.animationAttackState, ad.nockedProjectile and ad.nockedProjectile.reference, ad.attackSwing*100)
else event.unregister("simulate", L.MetSim)		G.met = nil		mp.animationController.weaponSpeed = G.arcspd end end


L.MetSim1 = function(e) if mp.weaponDrawn and MB[1] == 128 then	local AS = ad.animationAttackState
if G.met > 0 then
	if G.met == 1 then
	else
		if AS == 2 then
			if ad.nockedProjectile and G.met < 5 then	ad.attackSwing = 0.8		ad.animationAttackState = 4		G.met = G.met + 1		--if G.met == 0 then mp.animationController.weaponSpeed = 1000000	end
				mp.animationController.weaponSpeed = 0.0001
			else	event.unregister("simulate", L.MetSim)		G.met = nil		mp.animationController.weaponSpeed = G.arcspd 	--MB[1] = 0	
			end
		elseif AS == 4 then		mp.animationController.weaponSpeed = G.met == 1 and 1000000 or G.arcspd
		elseif AS == 5 then		
			if ad.nockedProjectile then ad.animationAttackState = 0 else mp.animationController.weaponSpeed = 1000000
			end
		end
	end
	if G.met then tes3.messageBox("%s   AS = %s --> %s   %s    Swing = %d", G.met, AS, ad.animationAttackState, ad.nockedProjectile and ad.nockedProjectile.reference, ad.attackSwing*100) end
end
else event.unregister("simulate", L.MetSim)		G.met = nil		mp.animationController.weaponSpeed = G.arcspd end end



L.AS = {[0]=2, [2]=2, [3]=0, [4]=0, [5]=1, [6]=1, [7]=1}
L.Swap = function(w, wd) if (mp.isMovingLeft or mp.isMovingRight) and not (mp.isMovingForward or mp.isMovingBack) then
	if w == W.WR and wd == W.DR then
		if inv:contains(W.WL, W.DL) and W.DL.condition > 0 then
			ad.animationAttackState = 0		ad.attackDirection = 0			if W.Wsim then event.unregister("simulate", L.WSim)	W.Wsim = nil end
			W.snd = 1	mp:equip{item = W.WL, itemData = W.DL}
		else L.DWMOD(false) W.WL = nil W.DL = nil end
	end
else
	if w == W.WL and wd == W.DL then
		if inv:contains(W.WR, W.DR) and W.DR.condition > 0 then
			if mp.isRunning or mp.isWalking then MB[1] = 0 end	ad.animationAttackState = 0		if W.Wsim then event.unregister("simulate", L.WSim)	W.Wsim = nil end
			W.snd = 1	mp:equip{item = W.WR, itemData = W.DR}
		else L.DWMOD(false) W.WR = nil W.DR = nil end
	end
end end
L.DWSim = function(e) if W.DWM and mp.weaponDrawn and MB[1] == 128 then
	if L.AS[ad.animationAttackState] == 2 or (L.AS[ad.animationAttackState] == 1 and ad.attackSwing >= W.DWlim) then
		local w = mp.readiedWeapon	local wd = w and w.variables	w = w and w.object		L.Swap(w, wd)	event.unregister("simulate", L.DWSim)		W.DWsim = nil
	end
else event.unregister("simulate", L.DWSim)	W.DWsim = nil end end

L.WComb = function(d, one) local m1 = (mp.isMovingForward or mp.isMovingBack)	local m2 = (mp.isMovingLeft or mp.isMovingRight)		local mov = m1 and (m2 and 3 or 1) or (m2 and 2 or 0)
	--MB[1] = 0		mp.animationController.weaponSpeed = 10		MB[1] = 0		ad.animationAttackState = 2		ad.physicalAttackType = 2
	if d == 1 then	-- Режущая
		if mov == 3 then if one then MB[1] = 0 end	ad.animationAttackState = 0									-- наискосок рубящая (отмена только с двуручем и возможно с кулаком)
		elseif mov == 0 then if one then MB[1] = 0 end	ad.animationAttackState = 0		ad.attackDirection = 2		-- стоять рубящая (отмена только с двуручем)
		elseif mov == 1 then MB[1] = 0		ad.animationAttackState = 0 end										-- вперед колющая, странная отмена только с кулаком
	elseif d == 3 then	-- Колющая
		if mov == 2 then ad.animationAttackState = 0	ad.attackDirection = 0					-- вбок режущая с отменой
		elseif mov == 3 then if one == 0 then MB[1] = 0 end		ad.animationAttackState = 0		-- наискосок рубящая с отменой (отмена только с оружием)
		elseif mov == 0 then if one == 0 then MB[1] = 0 end		ad.animationAttackState = 0		ad.attackDirection = one == 0 and 0 or 2 end	-- стоять рубящая с отменой (отмена только с оружием)
	elseif d == 2 then	-- Рубящая
		if mov == 2 then if not one then MB[1] = 0 end	ad.animationAttackState = 0		ad.attackDirection = 0		-- вбок режущая (отмена только с одноручем или кулаком)
		elseif mov == 1 then if one ~= 0 then MB[1] = 0	end		ad.animationAttackState = 0						-- вперед колющая (отмена только с кулаком)
		elseif mov == 0 then if one == 0 then ad.animationAttackState = 0		ad.attackDirection = 3 end end		-- стоять колющая только для кулака
	end
end
L.WSim = function(e) if mp.weaponDrawn and MB[1] == 128 then	--tes3.messageBox("AS = %s   Dir = %s / %s", ad.animationAttackState, ad.attackDirection, ad.physicalAttackType)
	if L.AS[ad.animationAttackState] == 1 then
		L.WComb(ad.attackDirection, not mp.readiedWeapon and 0 or mp.readiedWeapon.object.isOneHanded) 	event.unregister("simulate", L.WSim)	W.Wsim = nil
	end
else event.unregister("simulate", L.WSim)	W.Wsim = nil end end


L.ARBSIM = function(e) if not tes3ui.menuMode() and mp.weaponDrawn and MB[3] == 128 then
--	if G.arbf then if ad.animationAttackState == 2 then G.arbf = nil else return end end
--	if ad.animationAttackState == 2 then MB[1] = 0		ad.animationAttackState = 0		G.arbf = true end
	--mp.animationController.weaponSpeed = 0.5
	if ad.animationAttackState == 5 then 	--mp.animationController.weaponSpeed = 0.0001
		ad.animationAttackState = 0		tes3.messageBox("AS = 5 ---> %s   %s   %s", ad.animationAttackState, ad.nockedProjectile and ad.nockedProjectile.reference, mp.readiedAmmoCount)
		--MB[1] = 0		tes3.messageBox("AS = 5 ---> %s", ad.animationAttackState)
	elseif ad.animationAttackState == 2	then 	--MB[1] = 0		tes3.messageBox("AS = %s   MOUSE = 0", ad.animationAttackState)
		
		--if not ad.nockedProjectile then ad.nockedProjectile = G.PR end
		
		--mp.animationController.weaponSpeed = 0.0001
		ad.animationAttackState = 4		tes3.messageBox("AS = 2 ---> %s   %s   %s", ad.animationAttackState, ad.nockedProjectile and ad.nockedProjectile.reference, mp.readiedAmmoCount)
--	elseif ad.animationAttackState == 4	then		ad.animationAttackState = 2		tes3.messageBox("AS = 4 ---> %s", ad.animationAttackState)
--	elseif ad.animationAttackState == 0	then		ad.animationAttackState = 2		tes3.messageBox("AS = 0 ---> %s", ad.animationAttackState)
--	else tes3.messageBox("AS = %s  ", ad.animationAttackState)
	end
	
end end		--event.register("simulate", L.ARBSIM)


local function MOUSEBUTTONDOWN(e) if not tes3ui.menuMode() then local But = e.button + 1		if But == 1 then
	--tes3.messageBox("AnSpd = %.2f   WSpeed = %.2f", mp.animationController.weaponSpeed, mp.readiedWeapon and mp.readiedWeapon.object.speed or 1)
	if mp.spellReadied and not T.MCT.timeLeft then G.arm1.appCulled = false		G.arm2.appCulled = false		local r, AE, EI, sumcost
		local MCK = 2 + (mp.willpower.current + mp.agility.current)/(P.wil15 and 100 or 200) - mp.encumbrance.normalized*(P.end15 and 0.5 or 1)
		+ (D.AR.cs >= 0 and D.AR.cs or math.min(D.AR.cs + math.max(-mp.encumbrance.currentRaw,0)/2, 0))
		
		local stc = 2 - (mp.willpower.current + mp.endurance.current)/(P.end11 and 100 or 200)
		if cf.mcs then tes3.playSound{sound = "destruction bolt", reference = p, loop = true} end
		if MB[cf.mbsum] == 128 and P.con15 then local hit = tes3.rayTest{position = tes3.getPlayerEyePosition(), direction = tes3.getPlayerEyeVector(), ignore={p}}		r = hit and hit.reference		local m = r and r.mobile
			if m and not m.isDead then for _, aef in pairs(mp:getActiveMagicEffects{}) do EI = aef.effectInstance	if EI.createdData and EI.createdData.object == r then
				AE = aef	sumcost = tes3.getMagicEffect(aef.effectId).baseMagickaCost * MCK/50	break
			end end end
		end
		T.MCT = timer.start{duration = 0.1, iterations = -1, callback = function() if stc > 0 and mp.fatigue.current > 3 then mp.fatigue.current = mp.fatigue.current - stc end
			M.MCB.current = math.min(M.MCB.current + MCK, 100)		if P.enc7 and T.PCT.timeLeft then M.PC.current = math.min(M.PC.current + M.PC.max * MCK/5000, M.PC.max) end
			if AE and EI.state == 5 and mp.magicka.current > sumcost then	--36 для завершённых эффектов
				EI.timeActive = EI.timeActive - MCK*0.4		Mod(sumcost)		tes3.messageBox("%s + %.1f = %d   Cost = %.1f", r.object.name, MCK*0.4, AE.duration - EI.timeActive, sumcost)
			end
		end}	event.register("mouseButtonUp", MCStart)
	elseif mp.weaponDrawn then	local w = mp.readiedWeapon	local wd = w and w.variables	w = w and w.object	local wt = W.wt		--or (w and w.type or -1)
		
	--	if w.id == "glass throwing star" then
	--		if (mp.isMovingLeft or mp.isMovingRight) and not (mp.isMovingForward or mp.isMovingBack) then	ad.animationAttackState = 0		ad.attackDirection = 0		mp:equip{item = "glass dagger"}		return end
	--	elseif w.id == "glass dagger" and not ((mp.isMovingLeft or mp.isMovingRight) and not (mp.isMovingForward or mp.isMovingBack)) then	ad.animationAttackState = 0		mp:equip{item = "glass throwing star"}	return end
		
		if W.DWM then		--tes3.messageBox("Dual as = %s    swing = %.2f", ad.animationAttackState, ad.attackSwing)
			if w then	local WTR = WT[W[W.WR.id] or W.WR.type]		local WTL = WT[W[W.WL.id] or W.WL.type]
				W.DWlim = 1.5 - mp.speed.current*(P.spd13 and 0.006 or 0.003) - mp.agility.current*(P.agi22 and 0.006 or 0.003) - mp:getSkillValue(WTR.s)*(WTR.p8 and 0.004 or 0.002) - mp:getSkillValue(WTL.s)*(WTL.p8 and 0.004 or 0.002)
				if ad.animationAttackState == 0 or (L.AS[ad.animationAttackState] == 1 and ad.attackSwing >= W.DWlim) then L.Swap(w, wd)
				elseif not W.DWsim then event.register("simulate", L.DWSim)		W.DWsim = 1 end
			else L.DWMOD(false) end
		end
		
		if wt < 9 and ad.animationAttackState > 0 and ad.attackSwing >= 2 - mp.speed.current*(P.spd13 and 0.006 or 0.003) - mp.agility.current*(P.agi22 and 0.006 or 0.003) - mp:getSkillValue(WT[wt].s)*(WT[wt].p8 and 0.008 or 0.004) then
			if L.AS[ad.animationAttackState] == 1 then	L.WComb(ad.attackDirection, not w and 0 or w.isOneHanded)
			elseif not W.Wsim then event.register("simulate", L.WSim)	W.Wsim = 1 end
		elseif wt == 9 then
			if not G.artim then G.artim = 0		event.register("simulate", L.ArcSim) end
		end
	end
else
if But == cf.mbshot then
	if G.artim and P.mark9a then	G.arcf = 0		G.arcspd = math.max(mp.animationController.weaponSpeed, 0.4)
	elseif ad.animationAttackState == 2 then	local w = mp.readiedWeapon		w = w and w.object		local wt = w and w.type or -1
		if wt == 11 and P.mark9c and not G.met then	local ws = w.speed	G.metmax = ws > 1.4 and 5 or (ws > 1.1 and 4) or (ws > 0.9 and 3) or 2
			if T.Met.timeLeft then G.metsw = math.max(0.75 - T.Met.timeLeft/4, 0.25)	T.Met:reset() else G.metsw = 0.75		T.Met = timer.start{duration = 2, callback = function() end} end
			event.register("simulate", L.MetSim)		G.met = 1	ad.attackSwing = G.metsw	ad.animationAttackState = 4		mp.animationController.weaponSpeed = 1000000	G.arcspd = mp.animationController.weaponSpeed
		end
	end
end
if But == cf.mbkik then L.KIK() end		--if ad.animationAttackState == 2 then ad.animationAttackState = 4	 mp.animationController.weaponSpeed = 1000000 end
end end end		event.register("mouseButtonDown", MOUSEBUTTONDOWN)


-- animationAttackState всегда 0   Свинг ещё не определен
local function ATTACKSTART(e) local a = e.mobile	local spd = e.attackSpeed		--local ar = e.reference		local dir = e.attackType		local ad = a.actionData		local wd = w and w.variables
local w = a.readiedWeapon	w = w and w.object 		local wt = w and (a == mp and W[w.id] or w.type) or -1	--local fiz = ad.physicalDamage	local wh = wd and wt ~= 11 and 100*wd.condition/w.maxCondition or 100
--if m.actorType == 1 or (m.object.biped or m.object.usesEquipment) then
--local m1 = (mp.isMovingForward or mp.isMovingBack)	local m2 = (mp.isMovingLeft or mp.isMovingRight)		local mov = m1 and (m2 and 3 or 1) or (m2 and 2 or 0)
--e.attackType = m1 and (m2 and 2 or 3) or (m2 and 1 or 2)
e.attackSpeed = spd * (0.9 + (a == mp and
(a.speed.current/(P.spd1 and 1000 or 2000) + a:getSkillValue(WT[wt].s)/(P[WT[wt].p4] and 1000 or 2000) - math.max(D.AR.as + mp.encumbrance.normalized * (P.spd18 and 0.1 or 0.2) - math.max(-mp.encumbrance.currentRaw,0)/2000, 0))
or (a.speed.current/1000 + a:getSkillValue(WT[wt].s)/1000)))
--tes3.messageBox("AtStart! (%s)  dir = %s  spd = %.3f -> %.3f", wt, e.attackType, spd, e.attackSpeed)
end		event.register("attackStart", ATTACKSTART)

local function MOUSEBUTTONUP(e) if not tes3ui.menuMode() and e.button == 0 and ad.animationAttackState == 2 then	local dir = ad.attackDirection	if dir < 4 and not V.dfr then	local pass = MB[cf.mbcharg] == 128
	if cf.autocharg or pass then	local w = mp.readiedWeapon		w = w and w.object		local DMag = math.min(Mag(600), cf.charglim)	if DMag > 0 then
		local vec = tes3.getPlayerEyeVector()	if math.abs(vec.z) < 0.15 then vec.z = 0	vec = vec:normalized() end
		local wr = w and w.reach or G.HandReach.value
		local hit = tes3.rayTest{position = tes3.getPlayerEyePosition(), direction = vec, ignore = {p}}		local ref, hitd
		if hit then ref = N[hit.reference] and hit.reference end
		if ref then hitd = ref.position:distance(pp) - 30 else ref, hitd = L.Sector{d = 9000, lim = 500} end
		hitd = hitd or (hit and hit.distance) or 20000
		if (pass or ref) and hitd > wr*140 then
			local mc = (DMag + (P.acr8 and mp.isJumping and 0 or math.min(DMag,10))) * (P.alt10 and 1 or 1.5)
			local DD = DMag * (Cpow(mp,0,4) + (P.spd8 and 50 or 0))/2		local Dkoef = hitd/DD		if Dkoef < 1 then DD = DD * Dkoef		mc = mc * Dkoef	end
			if T.Dash.timeLeft then mc = mc * (1 + T.Dash.timeLeft/(P.atl8 and 10 or 3)) end	local stam = mc * ((P.end10 and 0.5 or 1) - (P.una10 and D.AR.u*0.02 or 0))
			if mc < mp.magicka.current and stam < mp.fatigue.current then	local vk = math.max(-0.4 - vec.z, 0)/3
				V.d = vec*(DD*30/8 * (1 - vk))	V.dfr = 8	event.register("calcMoveSpeed", L.Dash)		tes3.playSound{sound="Spell Failure Destruction"}
				mp.animationController.weaponSpeed = dir == 3 and 0.4 or (dir == 1 and 0.5) or 0.6			V.daf = w and w.speed or 1		if not mp.isJumping then V.djf = true	mp.isJumping = true end
				G.CombatDistance.value = (DD + 50)/wr		G.CombatAngleXY.value = math.clamp(150/DD, 0.05, 0.5)
				TFR(2, function() G.CombatDistance.value = 128		G.CombatAngleXY.value = 0.5 end)
				Mod(mc)		mp.fatigue.current = mp.fatigue.current - stam
				if cf.m then tes3.messageBox("Charge! Dist = %d  Cost = %.1f  Time = %.1f   SlamK = %d%%", DD, mc, T.Dash.timeLeft or 0, vk*100) end
				V.dd = DD 	if T.Dash.timeLeft then T.Dash:cancel()	end		T.Dash = timer.start{duration = 3, callback = function() end}
				if P.blu12 and hit and hitd > 500 and Dkoef < 1 and w and w.type == 4 and dir == 2 and ad.attackSwing > 0.95 and vec.z < -1 + mp:getSkillValue(20)/(P.acr3 and 150 or 200) and mp.velocity:length() > 0 then
					local dmg = w.chopMax * (1 + mp.strength.current/200) * math.max(mp.readiedWeapon.variables.condition/w.maxCondition, P.arm2 and 0.3 or 0.1) * hitd/3000	local hitp = hit.intersection:copy()	local m
					timer.start{duration = 0.2/w.speed, callback = function() tes3.playSound{sound = table.choice({"endboom1", "endboom2", "endboom3"})}	--"fabBossLeft", "fabBossRight"
						for _, m in pairs(tes3.findActorsInProximity{position = hitp, range = 250}) do if m ~= mp then
							dmg = m:applyDamage{damage = dmg, applyArmor = true, playerAttack = true}		L.CrimeAt(m)
							if cf.m3 then tes3.messageBox("Hammer Slam! Height = %d   %s  Dmg = %.1f  Dist = %d", hitd, m.object.name, dmg, hitp:distance(m.position)) end
						end end
					end}
				end
			end
		end
	end end
	if w and dir == 1 and P.agi15 and not V.daf then G.CombatAngleXY.value = w.isTwoHanded and 1 or 0.8		TFR(2, function() G.CombatAngleXY.value = 0.5 end) end
end end end		event.register("mouseButtonUp", MOUSEBUTTONUP)

--	Велосити заменяет естественную скорость, а импульс складывается с ней		r.sceneNode.velocity - разовое изменение скорости для этого фрейма
--Режимы: 0 = простой на цель, 1 = умный на цель, 2 = самонаведение, 4 = мины, 5 = баллистический, 6 = броски оружия, 10 = стрелы игрока, 11 - стрелы контроль, 7 - магические шары врагов, 8 - спрей
local CPR = {}		local CPRS = {}		local CPS = {0,0,0,0,0,0,0,0,0,0}
local function SimulateCP(e)	G.dt = wc.deltaTime		G.cpfr = G.cpfr + 1		G.pep = tes3.getPlayerEyePosition()		G.pev = tes3.getPlayerEyeVector()
	if MB[cf.mbret] == 128 then G.hit = G.pep + G.pev * 150 else G.hit = tes3.rayTest{position = G.pep, direction = G.pev, ignore = {p}}	if G.hit then G.hit = G.hit.intersection else G.hit = G.pep + G.pev * 4800 end end
	for r, t in pairs(CPR) do if t.tim then	--t.tim = t.tim - G.dt
		if t.tim < t.m.animTime then CPR[r] = nil
		elseif t.mod == 1 then t.m.velocity = (G.hit - r.position):normalized() * (t.m.initialSpeed * 0.75)
		elseif t.mod == 11 then t.m.velocity = G.pev*2000	if G.cpfr == 30 then r.orientation = p.orientation	G.cpfr = 0 end
		elseif t.mod == 0 then t.m.velocity = G.pev * t.m.initialSpeed
		elseif t.mod == 2 then t.m.velocity = (t.tar.position + t.hv - r.position):normalized() * (t.m.initialSpeed/2)
		elseif t.mod == 4 then t.m.position = t.pos		t.m.velocity = t.v*50 end		--tes3vector3.new(50,50,50)
	--	tes3.messageBox("Anim = %.2f  Sw = %.2f  Dam = %.2f  InSpd = %.2f   V = %d", t.m.animTime, t.m.attackSwing, t.m.damage, t.m.initialSpeed, t.m.velocity:length())
	else
		if t.mod == 10 then	t.m.velocity = t.m.velocity + tes3vector3.new(0,0,-2000 * G.dt)	--local ori = r.sceneNode.worldTransform.rotation:toEulerXYZ()			
		elseif t.mod == 7 then if t.liv < t.m.animTime then CPR[r] = nil else t.v = G.pep - r.position	if t.v:length() < G.spdodge then CPR[r] = nil else t.m.velocity = t.v:normalized() * t.m.initialSpeed end end
		elseif t.mod == 5 then t.v = t.ev * (t.m.initialSpeed/2) + tes3vector3.new(0,0,-2000 * t.m.animTime/t.pow)		t.m.velocity = t.con and t.v + G.pev*1000 or t.v
		elseif t.mod == 6 then t.v = t.v + tes3vector3.new(0,0,-G.dt*0.75/t.pow)		t.m.velocity = (t.con and (t.v + G.pev * t.con):normalized() or t.v) * 1000*t.pow		t.r.position = r.position:copy()
		elseif t.mod == 8 then	if t.liv < t.m.animTime then t.m.expire = 1		CPR[r] = nil end end
	--	tes3.messageBox("Anim = %.2f   Sw = %.2f  Dam = %.2f  InSpd = %.2f   V = %d", t.m.animTime, t.m.attackSwing, t.m.damage, t.m.initialSpeed, t.m.velocity:length())
	end end		if table.size(CPR) == 0 then event.unregister("simulate", SimulateCP)	G.cpfr = nil end
end

local function SimulateCPS(e)	G.dt = wc.deltaTime		G.cpg = G.cpg + 4*G.dt
	for r, t in pairs(CPRS) do CPS[t.n] = CPS[t.n] - G.dt
		if CPS[t.n] < 0 then CPS[t.n] = 0	CPRS[r] = nil	else r.position = {pp.x + math.cos(G.cpg + t.n*math.pi/5) * t.rad, pp.y + math.sin(G.cpg + t.n*math.pi/5) * t.rad, pp.z + 100} end
	end		if table.size(CPRS) == 0 then event.unregister("simulate", SimulateCPS)		G.cpscd = nil	G.cpg = 0 end
end

local function MOBILEACTIVATED(e) local m = e.mobile	local r = e.reference		if m then local firm = m.firingMobile	if firm then	local si = m.spellInstance
if firm == mp then	local ss = si and si.source		local n = ss and ss.name	local pass = not ss or (cf.raycon or n ~= "4b_RAY")	local cont = tes3.isAffectedBy{reference = p, effect = 506}
	--tes3.messageBox("Sw = %.2f  Dam = %.2f  InSpd = %.2f   V = %d   mesh = %s", m.attackSwing, m.damage, m.initialSpeed, m.velocity:length(), r.object.mesh)
	if si then local t = MP[si]		local sn = si.serialNumber
		if t then CPR[r] = {}
			timer.delayOneFrame(function() if CPR[r] then r.position = t.pos	if t.exp then m:explode() elseif t.vel then m.velocity = t.vel * m.initialSpeed end		MP[si] = nil end end)
		return end
		local sid = ss.effects[1].id	--tes3.messageBox("Sid = %s    dam = %s", sid, W.metd)
		if sid == 610 then	r.sceneNode.appCulled = true
			if n == "4nm_tet" then W.TETP = r		W.TETsi = si		W.TETmod = 2
			else timer.delayOneFrame(function() r.position = tes3.getPlayerEyePosition() + tes3vector3.new(0,0,20) end)
				CPR[r] = {mod = 6, m = m, v = tes3.getPlayerEyeVector(), r = W.met, pow = W.acs, dmg = W.metd}	W.met.orientation = p.orientation
				V.MET[si] = {r = W.met, dmg = W.metd}
				if cont and mp.magicka.current > 10 then Mod(10 * (P.mys7 and 0.5 or 1))		CPR[r].con = math.max(1 - W.met.object.weight/50, 0.1)
					V.METR[W.met] = {retmc = (5 + W.met.object.weight/2) * (P.mys7 and 0.5 or 1), si = si}
					if not W.metflag then event.register("simulate", L.SimMET)	W.metflag = true end
				end
				if not G.cpfr then event.register("simulate", SimulateCP)	G.cpfr = 0 end	return
			end
		end
		if V.BAL[sn] then CPR[r] = {mod = 5, m = m, ev = tes3.getPlayerEyeVector(), pow = V.BAL[sn]}
			if pass and cont and n ~= "4b_SG" and mp.magicka.current > 10 then Mod(6 * (P.mys7 and 0.5 or 1))		CPR[r].con = true end
			if not G.cpfr then event.register("simulate", SimulateCP)	G.cpfr = 0 end	return
		elseif n == "4b_RAY" and MB[cf.mbray] == 128 == cf.ray then CPR[r] = {mod = 8, m = m, liv = (50 + mp.willpower.current/2 + mp:getSkillValue(11))/(P.alt20 and 600 or 1000)}
			if not G.cpfr then event.register("simulate", SimulateCP)	G.cpfr = 0 end	return
		end
	else r.position = r.position - m.velocity:normalized()*100		CPR[r] = {mod = 10, m = m, liv = 0}		if not G.cpfr then event.register("simulate", SimulateCP)	G.cpfr = 0 end
		if r.object.type == 13 and P.mark9b and (cf.autoarb or MB[cf.mbshot] == 128) and not T.Arb.timeLeft and mp.fatigue.current > 30 then	local ws = m.firingWeapon.speed
			mp.fatigue.current = mp.fatigue.current - math.max(30 - ws*10, 10)
			mp.animationController.weaponSpeed = mp.animationController.weaponSpeed * (2 + mp.agility.current/50)
			T.Arb = timer.start{duration = 3/ws, callback = function() end}
		end
		if BAM[r.object.id] then BAM.am = r.object.id	if tes3.isAffectedBy{reference = p, effect = 601} then mc = BAM.f()	
			BAM.E[1].id = MID[math.random(3)]	BAM.E[1].min = math.random(5) + mp:getSkillValue(10)/20		BAM.E[1].max = BAM.E[1].min*2		BAM.E[1].radius = math.random(5) + L.GetRad(mp)
			if cf.autoammo and mp.magicka.current > mc then	mp.readiedAmmoCount = 2		tes3.addItem{reference = p, item = BAM.am, count = 1, playSound = false}	Mod(mc) end
		end end
	end
	if pass and (cont or (P.mys18 and T.MCT.timeLeft)) and mp.magicka.current > 10 then mc = 4
		local live = (mp.fatigue.normalized*4 + (mp.willpower.current + mp:getSkillValue(14) + mp:getSkillValue(11))/50) * (P.mys80 and 2 or 1)
		if si then
			if DM.cp == 3 then mc = 8		timer.delayOneFrame(function() r.position = L.Hitp(0)	 m:explode() end)
			elseif DM.cp == 2 then	if not G.cpscd then event.register("simulate", SimulateCPS)	G.cpscd = true end	local num = 1	md = CPS[1]		for i, tim in ipairs(CPS) do if tim < md then num = i	md = tim end end 
				CPS[num] = live*1.5		for ref, t in pairs(CPRS) do if t.n == num then CPRS[ref] = nil	break end end		CPRS[r] = {n = num, rad = 200 + ss.effects[1].radius * 6}
				if cf.m then tes3.messageBox("Ball %s  Time = %d  Rad = %d  Balls = %s   Live = %d %d %d %d %d %d %d %d %d %d", num, CPS[num], CPRS[r].rad, table.size(CPRS), CPS[1], CPS[2], CPS[3], CPS[4], CPS[5], CPS[6], CPS[7], CPS[8], CPS[9], CPS[10]) end
			else -- Сперва проверяем мины, затем автонаведение, затем умный режим на цель, затем простой режим
				if DM.cp == 4 then
					if DM.cpm then mc = 10	CPR[r] = {mod = 4, tim = live*1.5, m = m, pos = L.Hitp(100) + tes3vector3.new(0,0,20), v = tes3.getPlayerEyeVector()}
					else mc = 6	CPR[r] = {mod = 4, tim = live*1.5, m = m, pos = tes3.getPlayerEyePosition() + tes3.getPlayerEyeVector()*50, v = tes3.getPlayerEyeVector()} end
				else	if n == "4b_SG" then return end	local tar
					if DM.cp == 1 then local hit = tes3.rayTest{position = tes3.getPlayerEyePosition(), direction = tes3.getPlayerEyeVector(), ignore = {p}}
						tar = hit and hit.reference and hit.reference.mobile and not hit.reference.mobile.isDead and hit.reference
						if not tar then tar = L.Sector{d = 9000, lim = 3000} end
					end
					if tar then mc = 10	CPR[r] = {mod = 2, tim = live, m = m, tar = tar, hv = tes3vector3.new(0,0,tar.mobile.height/2)}
					elseif DM.cpt and n ~= "4b_RAY" then mc = 6	CPR[r] = {mod = 1, tim = live, m = m}
					else CPR[r] = {mod = 0, tim = live, m = m} end
				end		if not G.cpfr then event.register("simulate", SimulateCP)	G.cpfr = 0 end
			end
		else if not G.cpfr then event.register("simulate", SimulateCP)	G.cpfr = 0 end	mc = 6	CPR[r] = {mod = 11, m = m, tim = live} end
		Mod(mc * (P.mys7 and 0.5 or 1))
	end		--if si then SSN[si.serialNumber] = true	tes3.messageBox("Cast! %s", si.serialNumber) end -- устраняем эксплойт с разгоном статов
elseif not si then r.position = r.position - m.velocity:normalized()*100
elseif cf.spellhit and firm.actionData.target == mp then 
	CPR[r] = {mod = 7, m = m, liv = firm.object.level/20}
	if not G.cpfr then event.register("simulate", SimulateCP)	G.cpfr = 0 end
end
	--tes3.messageBox("%s  w = %s  sn = %s  fl = %s  disp = %s  exp = %s  movfl = %s", firm and firm.object.name, m.firingWeapon and m.firingWeapon.id, si and si.serialNumber, m.flags, m.disposition, m.expire, m.movementFlags)
else	if m.actorType and not m.isDead then N[r] = {m = m} end
if r.object.objectType == tes3.objectType.creature and not L.CrBlackList[r.baseObject.id] and not m.isDead and not r.data.spawn then	r.data.spawn = math.random(10)	local d = r.data.spawn	local id = r.baseObject.id
	local conj = L.Summon[id] and L.conjpower or 1		local conj2 = 0		local min, max
	if L.Summon[id] then min = 80	max = 120
		if L.conjagr then m.fight = 100		m:startCombat(mp)	m.actionData.aiBehaviorState = 3
		elseif L.conjp then m.fight = math.max((math.random(50,70) + r.object.level * (P.con5 and 1 or 2) - (conj - 1)*100), 50)
			if (r.object.type == 1 and P.con6b) or (r.object.type == 2 and P.con6a) then conj = conj + mp:getSkillValue(13)/1000 end		if P.con7 then conj2 = 0.1 end
		end
	else min = cf.min	max = cf.max end
	local koef = math.random(min,max)/100		tes3.setStatistic{reference = r, name = "health", value = m.health.base * koef * (conj + conj2)}
	koef = koef/((min+max)/200)		if koef > 1 then koef = 1 + (koef - 1) * 0.75 else koef = 1 + (koef - 1) * 0.5 end		r.scale = r.scale * koef
	tes3.setStatistic{reference = r, name = "magicka", value = m.magicka.base * math.random(min,max)/100 * (conj + conj2)}
	tes3.setStatistic{reference = r, name = "fatigue", value = m.fatigue.base * math.random(min,max)/100 * (conj + conj2)}
	for i, stat in ipairs(L.CStats) do tes3.setStatistic{reference = r, name = stat, value = m[stat].base * math.random(min,max)/100 * conj} end
	m.shield = (L.CAR[id] or m.endurance.current/10 + r.object.level/2) * math.random(min,max)/100 * conj
	m.resistCommonDisease = 200		m.resistBlightDisease = 200
if cf.full then	rf = r		local typ = r.object.type
	if L.CDIS[id] then r.baseObject.spells:add(L.CDIS[id]) end
if typ == 1 then -- Даэдра
	if id == "atronach_flame" or id == "atronach_flame_summon" then m.resistFire = m.resistFire + 200			rems("cruel firebloom", "wizard's fire", "god's fire")
		if d > 7 then adds("cruel firebloom") end	if d > 8 then adds("wizard's fire") end		if d == 10 then adds("god's fire") end
	elseif id == "atronach_frost" or id == "atronach_frost_summon" then m.resistFrost = m.resistFrost + 200		rems("brittlewind", "wizard rend", "god's frost")
		if d > 7 then adds("brittlewind") end	if d > 8 then adds("wizard rend") end	if d == 10 then adds("god's frost") end
	elseif id == "atronach_storm" or id == "atronach_storm_summon" then m.resistShock = m.resistShock + 200		rems("wild shockbloom", "dire shockball", "god's spark")
		if d > 7 then adds("wild shockbloom") end	if d > 8 then adds("dire shockball") end	if d == 10 then adds("god's spark") end
	elseif id == "atronach_flame_lord" then m.resistFire = m.resistFire + 200
	elseif id == "atronach_frost_lord" then m.resistFrost = m.resistFrost + 200
	elseif id == "atronach_storm_lord" then m.resistShock = m.resistShock + 200
	elseif id == "dremora" or id == "dremora_summon" then	rems("summon scamp", "summon clanfear", "fire storm", "firebloom")
		if d > 8 then tes3.addItem{reference = r, item = "4nm_bow_excellent"}	tes3.addItem{reference = r, item = "4nm_arrow_magic+excellent", count = math.random(20,30)}
		elseif d == 8 then tes3.addItem{reference = r, item = "4nm_crossbow_excellent"}	tes3.addItem{reference = r, item = "4nm_bolt_magic+normal", count = math.random(20,30)}
		elseif d > 2 then adds(table.choice{"firebloom", "fire storm"}) end
		if d > 5 then adds(table.choice{"summon scamp", "summon clanfear"}) end
	elseif id == "dremora_lord" then	rems("summon daedroth", "summon dremora", "summon flame atronach", "summon frost atronach", "summon storm atronach")
		if d > 2 then adds(table.choice{"summon daedroth", "summon dremora", "summon daedroth", "summon dremora", "summon flame atronach", "summon frost atronach", "summon storm atronach"}) end		
	elseif id == "dremora_mage" or id == "dremora_mage_s" then rems("summon flame atronach", "summon frost atronach", "summon storm atronach", "4nm_star_atronach1a", "4nm_star_atronach2a", "4nm_star_atronach3a",
		"fireball", "frostball", "shockball", "Fireball_large", "Frostball_large", "shockball_large", "firebloom", "frostbloom", "shockbloom", "flamebolt", "frost bolt", "lightning bolt", "fire storm", "frost storm", "lightning storm")
		adds(table.choice{"fireball", "frostball", "shockball", "4nm_star_atronach1a"}, table.choice{"Fireball_large", "Frostball_large", "shockball_large", "4nm_star_atronach2a"})
		if d > 2 then adds(table.choice{"firebloom", "frostbloom", "shockbloom"})
			if d > 4 then adds(table.choice{"flamebolt", "frost bolt", "lightning bolt", "4nm_star_atronach3a"}, table.choice{"fire storm", "frost storm", "lightning storm"})
				if d > 6 then adds(table.choice{"summon flame atronach", "summon frost atronach", "summon storm atronach"}) end
			end
		end
	elseif id == "scamp" or id == "scamp_summon" then	rems("flame", "fireball", "Fireball_large")
		if d > 5 then adds(table.choice{"flame", "fireball", "Fireball_large"}) end
	elseif id == "daedroth" or id == "daedroth_summon" then	rems("viperbolt", "poisonbloom")
		if d > 6 then adds("viperbolt", "poisonbloom")	elseif d < 3 then adds("viperbolt")	elseif d == 3 or d == 4 then adds("poisonbloom") end
	elseif id == "daedraspider" or id == "daedraspider_s" then	rems("bm_summonbonewolf", "summon daedroth", "summon hunger", "summon clanfear")
		if d > 8 then adds("bm_summonbonewolf")		elseif d < 3 then adds("summon daedroth")	elseif d == 3 or d == 4 then adds("summon hunger")	elseif d == 5 or d == 6 then adds("summon clanfear") end
	elseif id == "winged twilight" or id == "winged twilight_summon" then	rems("frost storm", "lightning storm", "frostbloom", "shockbloom")
		if d == 1 then adds("frost storm") elseif d == 2 then adds("lightning storm") elseif d == 3 then adds("frostbloom") elseif d == 4 then adds("shockbloom") elseif d == 5 then adds("frost storm", "shockbloom")
		elseif d == 6 then adds("lightning storm", "frostbloom") elseif d == 7 then adds("frost storm", "lightning storm", "frostbloom", "shockbloom") end
	elseif id == "xivkyn" or id == "xivkyn_s" then	rems("wizard's fire", "sp_nchurdamzsummon")
		if d > 6 then adds("wizard's fire", "sp_nchurdamzsummon")	elseif d < 3 then adds("wizard's fire")	elseif d == 3 or d == 4 then adds("sp_nchurdamzsummon") end	
	elseif id == "mazken" or id == "mazken_s" then	rems("summon winged twilight", "summon hunger", "summon dremora")
		if d > 8 then tes3.addItem{reference = r, item = "4nm_bow_excellent"}	tes3.addItem{reference = r, item = "4nm_arrow_magic+excellent", count = math.random(20,30)}
		elseif d < 3 then adds("summon winged twilight")	elseif d == 3 or d == 4 then adds("summon hunger")	elseif d == 5 or d == 6 then adds("summon dremora") end
	elseif id == "golden saint" or id == "golden saint_summon" then		rems("summon flame atronach", "summon frost atronach", "summon storm atronach")
		if d > 8 then adds("summon flame atronach")		elseif d < 3 then adds("summon frost atronach")	elseif d == 3 or d == 4 then adds("summon storm atronach") end
	end
elseif typ == 2 then -- Нежить
	if id == "skeleton" or id == "skeleton_summon" then
		if d > 8 then tes3.addItem{reference = r, item = "long bow"}	tes3.addItem{reference = r, item = "iron arrow", count = math.random(20,30)}
		elseif d < 4 then m:equip{item = "iron_shield", addItem = true}
		elseif d == 8 then tes3.addItem{reference = r, item = "wooden crossbow"}	tes3.addItem{reference = r, item = "iron bolt", count = math.random(20,30)} end
	elseif id == "skeleton_mage" or id == "skeleton_mage_s" then
		rems("bone guard", "summon greater bonewalker", "fireball", "frostball", "shockball", "Fireball_large", "Frostball_large", "shockball_large", "firebloom", "frostbloom", "shockbloom")
		adds(table.choice{"fireball", "frostball", "shockball"})
		if d > 2 then adds(table.choice{"Fireball_large", "Frostball_large", "shockball_large"})	
			if d > 3 then adds(table.choice{"bone guard", "summon greater bonewalker"})
				if d > 7 then adds(table.choice{"firebloom", "frostbloom", "shockbloom"})		tes3.addItem{reference = r, item = "4nm_weapon_mage"} end
			end
		end
	elseif id == "bonelord" or id == "bonelord_summon" then	rems("bone guard", "summon least bonewalker")
		if d > 2 then adds(table.choice{"bone guard", "summon least bonewalker"}) end
	elseif id == "skeleton warrior" then
		if d == 1 then tes3.addItem{reference = r, item = "steel crossbow"}	tes3.addItem{reference = r, item = "steel bolt", count = math.random(20,30)} end
	elseif id == "skeleton archer" or id == "skeleton_archer_s" then if d > 8 then tes3.addItem{reference = r, item = "l_n_wpn_missle_thrown", count = math.random(5,20)}
		elseif d < 3 then tes3.addItem{reference = r, item = "4nm_thrown_magic", count = math.random(5,20)} end
	elseif id == "skeleton champion" then rems("frostbloom", "frost storm")
		if d < 3 then adds(table.choice{"frostbloom", "frost storm"}) elseif d == 3 then adds("frostbloom", "frost storm") end
	elseif id == "ash_revenant" then rems("scourge blade", "heartbite", "daedric bite")
		if d > 7 then m:equip{item = "steel_shield", addItem = true}
		elseif d > 4 then adds(table.choice{"scourge blade", "heartbite", "daedric bite"})
		elseif d < 3 then tes3.addItem{reference = r, item = table.choice{"l_n_wpn_missle_bow", "6th longbow"}}	tes3.addItem{reference = r, item = table.choice{"l_m_wpn_missle_arrow", "6th arrow"}, count = math.random(20,30)}
		elseif d == 3 then tes3.addItem{reference = r, item = "l_n_wpn_missle_xbow"}	tes3.addItem{reference = r, item = "4nm_bolt_magic+normal", count = math.random(20,30)} end	
	elseif id == "draugr_priest" then rems("daedric bite", "frost bolt", "wizard rend", "bm_draugr_curse")
		if d > 2 then adds(table.choice{"daedric bite", "frost bolt", "wizard rend"})	if d > 8 then tes3.addItem{reference = r, item = "BM ice wand"}		adds("bm_draugr_curse") end end
	elseif id == "draugr_soldier" then
		if d > 5 then m:equip{item = "iron_shield", addItem = true}
		elseif d < 3 then tes3.addItem{reference = r, item = "nordic_sky bow"}	tes3.addItem{reference = r, item = "nordic_sky arrow", count = math.random(20,30)}
		elseif d == 3 then tes3.addItem{reference = r, item = "steel_sky crossbow"}	tes3.addItem{reference = r, item = "steel_sky bolt", count = math.random(20,30)} end	
	elseif id == "draugr_warrior" then
		if d > 5 then m:equip{item = "iron_shield", addItem = true}
		elseif d < 3 then tes3.addItem{reference = r, item = table.choice{"nordic_sky bow", "BM ice longbow"}}	tes3.addItem{reference = r, item = table.choice{"nordic_sky arrow", "BM ice arrow"}, count = math.random(20,30)}
		elseif d == 3 then tes3.addItem{reference = r, item = "steel_sky crossbow"}	tes3.addItem{reference = r, item = "steel_sky bolt", count = math.random(20,30)} end	
	end
elseif typ == 0 then -- Обычные кричеры	
	if L.CID[id] == "dwem" then m.resistParalysis = m.resistParalysis + 200
		if id == "centurion_weapon" then
			if d > 5 then m:equip{item = "dwemer_shield", addItem = true}
			elseif d < 3 then tes3.addItem{reference = r, item = table.choice{"dwarven arbalest", "dwarven crossbow"}}	tes3.addItem{reference = r, item = "dwarven bolt", count = math.random(20,30)} end
		end
	elseif id == "goblin_grunt" then
		if d > 5 then m:equip{item = "goblin_shield", addItem = true}
		elseif d == 1 then tes3.addItem{reference = r, item = "goblin throwingaxe", count = math.random(5,10)}
		elseif d == 2 then tes3.addItem{reference = r, item = "goblin arrow", count = math.random(20,30)} end
	elseif id == "goblin_shaman" then rems("fireball", "frostball", "shockball", "Fireball_large", "Frostball_large", "shockball_large", "firebloom", "frostbloom", "shockbloom")
		adds(table.choice{"fireball", "frostball", "shockball"})
		if d > 3 then adds(table.choice{"Fireball_large", "Frostball_large", "shockball_large"})		if d > 6 then adds(table.choice{"firebloom", "frostbloom", "shockbloom"}) end end
	elseif id == "BM_riekling_shaman" then rems("fireball", "frostball", "shockball", "Fireball_large", "Frostball_large", "shockball_large", "firebloom", "frostbloom", "shockbloom")
		adds(table.choice{"fireball", "frostball", "shockball"})
		if d > 3 then adds(table.choice{"Fireball_large", "Frostball_large", "shockball_large"})		if d > 6 then adds(table.choice{"firebloom", "frostbloom", "shockbloom"}) end end
	end
elseif typ == 3 then -- Гуманоиды
	if id == "ash_slave" then rems("spark", "flame", "shard", "shockball", "fireball", "frostball")
		if d > 6 then adds(table.choice{"shockball", "fireball", "frostball"})
		elseif d > 2 then adds(table.choice{"spark", "flame", "shard"})
		else m:equip{item = "iron_shield", addItem = true} end
	elseif id == "ash_zombie" then
		if d > 8 then m:equip{item = "iron_shield", addItem = true}
		elseif d < 3 then tes3.addItem{reference = r, item = "l_n_wpn_missle_bow"}	tes3.addItem{reference = r, item = "l_n_wpn_missle_arrow", count = math.random(20,30)}
		elseif d == 3 then tes3.addItem{reference = r, item = "l_n_wpn_missle_xbow"}	tes3.addItem{reference = r, item = "l_n_wpn_missle_bolt", count = math.random(20,30)}
		elseif d == 4 then tes3.addItem{reference = r, item = "6th throwingknife", count = math.random(5,10)} end
	elseif id == "ash_zombie_warrior" then	
		if d > 7 then m:equip{item = "steel_shield", addItem = true}
		elseif d < 3 then tes3.addItem{reference = r, item = table.choice{"l_n_wpn_missle_bow", "6th longbow"}}	tes3.addItem{reference = r, item = table.choice{"l_m_wpn_missle_arrow", "6th arrow"}, count = math.random(20,30)}
		elseif d == 3 then tes3.addItem{reference = r, item = "l_n_wpn_missle_xbow"}	tes3.addItem{reference = r, item = "4nm_bolt_magic+normal", count = math.random(20,30)} end
	elseif id == "ash_ghoul_warrior" then	rems("summon hunger", "summon daedroth", "summon clanfear", "summon greater bonewalker", "summon dremora")
		if d > 5 then adds(table.choice{"summon hunger", "summon daedroth", "summon clanfear", "summon greater bonewalker", "summon dremora"}) end
	elseif id == "ash_ghoul" then rems("summon hunger", "summon daedroth", "summon bonelord", "summon greater bonewalker", "summon least bonewalker")
		if d > 5 then adds(table.choice{"summon hunger", "summon daedroth", "summon bonelord", "summon greater bonewalker", "summon least bonewalker"}) end
	elseif id == "ash_ghoul_high" then rems("summon flame atronach", "summon frost atronach", "summon storm atronach", "summon bonelord", "summon least bonewalker")
		if d > 5 then adds(table.choice{"summon flame atronach", "summon frost atronach", "summon storm atronach", "summon bonelord", "summon least bonewalker"}) end
	--elseif id == "ascended_sleeper" then
	end
end end
if cf.m9 then tes3.messageBox("%s (%s)  HP %d/%d   Mana %d/%d   Stam %d/%d   Str %d/%d   Spd %d/%d   End %d/%d   Agi %d/%d   AR %d   Fig %d",
r.object.name, d, m.health.current, r.baseObject.health, m.magicka.current, r.baseObject.magicka, m.fatigue.current, r.baseObject.fatigue,
m.strength.current, r.baseObject.attributes[1], m.speed.current, r.baseObject.attributes[5], m.endurance.current, r.baseObject.attributes[6], m.agility.current, r.baseObject.attributes[4], m.shield, m.fight) end
end end end end		event.register("mobileActivated", MOBILEACTIVATED)

-- Прожектайл Экспире НЕ триггерится если снаряд убит командой стейт = 6		tes3.messageBox("ex  %s    si = %s", pr, si and si.serialNumber or "nil")	
local function PROJECTILEEXPIRE(e) if e.firingReference == p then local pm = e.mobile	local pr = pm.reference		local si = pm.spellInstance		if si then local eff = si.source.effects
	if W.TETP and W.TETP == pr then W.TETP = nil	W.TETmod = 3 end
	if V.MET[si] then local wr = V.MET[si].r	local drop
		if V.METR[wr] then
			if not V.METR[wr].f then if cf.metret and mp.magicka.current > V.METR[wr].retmc then Mod(V.METR[wr].retmc)	V.METR[wr].f = 1 else V.METR[wr] = nil	drop = true end end
		else drop = true end
		if drop then local hit = tes3.rayTest{position = wr.position - pr.sceneNode.velocity:normalized()*100, direction = V.down}	if hit then wr.position = hit.intersection + tes3vector3.new(0,0,5) end end
	elseif P.des8 and ME[eff[1].id] == 1 then	local rad = 0		local radbon = L.GetRad(mp)
		for i, ef in ipairs(eff) do if ME[ef.id] == 1 and ef.radius > 9 then rad = rad + math.random(ef.min, ef.max) * math.max(ef.radius - 15 + radbon, 0) end end
		if rad > 0 then rad = rad * Cpow(mp,0,2)/100 * (SN[si.serialNumber] or 1)		L.KBlast(pr.position, rad) end
	end
else
	if D.poison then D.poison = D.poison - math.max(100 - mp.agility.current/(P.agi12 and 2 or 4),50)	M.WPB.widget.current = D.poison		if D.poison <= 0 then D.poison = nil	M.WPB.visible = false end end
	if W.f == 2 and pm.firingWeapon == W.ob then MP[tes3.applyMagicSource{reference = p, source = W.ob.enchantment, fromStack = mp.readiedWeapon}] = {pos = pr.position:copy(), exp = true} end
	if D.CW and not D.CWdis and cf.smartcw then	L.CWF(p, 2, 1.5, pr.position:copy()) end
end end end		event.register("projectileExpire", PROJECTILEEXPIRE)


L.AMIC = {
["w\\tx_arrow_iron.tga"] = "iron arrow",
["w\\tx_arrow_bonemold.tga"] = "bonemold arrow",
["w\\tx_arrow_corkbulb.tga"] = "corkbulb arrow",
["w\\tx_arrow_chitin.tga"] = "chitin arrow",
["w\\tx_arrow_silver.tga"] = "silver arrow",
["w\\tx_arrow_glass.tga"] = "glass arrow",
["w\\tx_arrow_ebony.tga"] = "ebony arrow",
["w\\tx_arrow_daedric.tga"] = "daedric arrow",
["w\\tx_bolt_corkbulb.tga"] = "corkbulb bolt",
["w\\tx_bolt_iron.tga"] = "iron bolt",
["w\\tx_bolt_steel.tga"] = "steel bolt",
["w\\tx_bolt_silver.tga"] = "silver bolt",
["w\\tx_bolt_bonemold.tga"] = "bonemold bolt",
["w\\tx_bolt_orcish.tga"] = "orcish bolt",
["w\\tx_arrow_steel.tga"] = "steel arrow",
["w\\huntsman_bolt.dds"] = "BM Huntsmanbolt",
["w\\dwarven_bolt.tga"] = "dwarven bolt",
["w\\obsidian_arrow.dds"] = "6th arrow",
["w\\adamant_arrow.dds"] = "adamantium arrow",
["w\\adamant_bolt.dds"] = "adamantium bolt",
["w\\glass_bolt.dds"] = "glass bolt",
["w\\daedric_bolt.dds"] = "daedric bolt",
["w\\ebony_bolt.dds"] = "ebony bolt",
["w\\ice_arrow.dds"] = "BM ice arrow",
["w\\goblin_arrow.dds"] = "goblin arrow",
["w\\orcish_arrow.dds"] = "orcish arrow",
["w\\huntsman_arrow.dds"] = "BM huntsman arrow",
["w\\imp_arrow.dds"] = "imperial arrow",
["w\\imp_bolt.dds"] = "imperial bolt",
["w\\tr\\dwarven_arrow.dds"] = "dwarven arrow",
["w\\sky\\daedric_arrow.dds"] = "daedric_sky arrow",
["w\\sky\\dwarven_bolt2.dds"] = "dwarven_sky bolt",
["w\\sky\\dwarven_arrow.dds"] = "dwarven_sky arrow",
["w\\sky\\ebony_arrow.dds"] = "ebony_sky arrow",
["w\\sky\\elven_arrow.dds"] = "elven_sky arrow",
["w\\sky\\glass_arrow.dds"] = "glass_sky arrow",
["w\\sky\\iron_arrow.dds"] = "iron_sky arrow",
["w\\sky\\nord_arrow.dds"] = "nordic_sky arrow",
["w\\sky\\orcish_arrow.dds"] = "orcish_sky arrow",
["w\\sky\\steel_bolt.dds"] = "steel_sky bolt",
["w\\sky\\steel_arrow.dds"] = "steel_sky arrow",
["w\\cir\\daedric_arrow.dds"] = "daedric_obl arrow",
["w\\cir\\dwarven_arrow.dds"] = "dwarven_obl arrow",
["w\\cir\\ebony_arrow.dds"] = "ebony_obl arrow",
["w\\cir\\elven_arrow.dds"] = "elven_obl arrow",
["w\\cir\\glass_arrow.dds"] = "glass_obl arrow",
["w\\cir\\iron_arrow.dds"] = "iron_obl arrow",
["w\\cir\\silver_arrow.dds"] = "silver_obl arrow",
["w\\cir\\steel_arrow.dds"] = "steel_obl arrow",
["w\\tx_star_glass.tga"] = "glass throwing star",
["w\\tx_silver_star.tga"] = "silver throwing star",
["w\\tx_star_ebony.tga"] = "ebony throwing star",
["w\\tx_chitin_star.tga"] = "chitin throwing star",
["w\\tx_steel_star.tga"] = "steel throwing star",
["w\\adamant_star.tga"] = "adamantium star",
["w\\bonemold_star.tga"] = "bonemold star",
["w\\daedric_star.dds"] = "daedric star",
["w\\dwarven_star.tga"] = "dwarven star",
["w\\iron_star.tga"] = "iron star",
["w\\tx_w_dwarvenspheredart.dds"] = "centurion_projectile_dart",
["w\\tx_w_dart_steel.tga"] = "steel dart",
["w\\tx_dart_daedric.tga"] = "daedric dart",
["w\\tx_dart_ebony.tga"] = "ebony dart",
["w\\tx_dart_silver.tga"] = "silver dart",
["w\\orcish_dart.dds"] = "orcish dart",
["w\\adamant_dart.tga"] = "adamantium dart",
["w\\glass_dart.dds"] = "glass dart",
["w\\iron_dart.tga"] = "iron dart",
["w\\tx_steel_knife.dds"] = "steel throwing knife",
["w\\tx_knife_glass.tga"] = "glass throwing knife",
["w\\tx_knife_iron.tga"] = "iron throwing knife",
["w\\tx_dagger_dragon.tga"] = "steel throwing knife",
["w\\adamant_throwingknife.tga"] = "adamantium throwingknife",
["w\\chitin_throwingknife.tga"] = "chitin throwingknife",
["w\\daedric_throwingknife.tga"] = "daedric throwingknife",
["w\\ebony_throwingknife.tga"] = "ebony throwingknife",
["w\\silver_throwingknife.tga"] = "silver throwingknife",
["w\\obsidian_throwingknife.tga"] = "6th throwingknife",
["w\\iron_throwingaxe.dds"] = "iron throwingaxe",
["w\\nord_throwingaxe.dds"] = "nordic throwingaxe",
["w\\silver_throwingaxe.dds"] = "silver throwingaxe",
["w\\glass_throwingaxe.dds"] = "glass throwingaxe",
["w\\chitin_throwingaxe.dds"] = "chitin throwingaxe",
["w\\daedric_throwingaxe.dds"] = "daedric throwingaxe",
["w\\goblin_throwingaxe.dds"] = "goblin throwingaxe",
["w\\riekling_javelin.dds"] = "BM riekling javelin"}

local function PROJECTILEHITACTOR(e) if e.target ~= p and e.mobile.reference.object.enchantment and not L.BlackAmmo[e.mobile.reference.object.id] and e.firingReference and not L.Summon[e.firingReference.baseObject.id] then
	if P.luc8 or math.random(100) < 75 then local amob = L.AMIC[e.mobile.reference.object.icon:lower()]
	if amob then tes3.addItem{reference = e.target, item = amob, playSound = false} end end
	--[[
	local hit = tes3.rayTest{position = e.collisionPoint - e.velocity:normalized()*10, direction = e.velocity}		local pos = hit and hit.intersection
	if pos then
		local nod = e.target.sceneNode		nod = nod:getObjectByName("Bip01") or nod
		local trans = e.mobile.reference.sceneNode.worldTransform
		local clone = e.mobile.reference.object.sceneNode:clone()
		local invM = nod.worldTransform.rotation:invert()	local invS = 1 / nod.worldTransform.scale
		clone.rotation = invM * trans.rotation			clone.translation = invM * (pos - nod.worldTransform.translation) * invS * 0.5			clone.scale = invS
		nod:attachChild(clone)	nod:update()	clone:updateProperties()	clone:updateEffects()
	end	--]]
end end		event.register("projectileHitActor", PROJECTILEHITACTOR)

local function onProj(e) local r = e.mobile.reference	local ob = r.object 	if not L.BlackAmmo[ob.id] and e.firingReference and not L.Summon[e.firingReference.baseObject.id] then
local cp = e.collisionPoint		local amob = ob.enchantment and L.AMIC[ob.icon:lower()] or ob		if amob and math.abs(cp.x) < 9000000 then
	local hit = tes3.rayTest{position = cp - e.velocity:normalized()*10, direction = e.velocity}		local pos		--cp + e.velocity * 0.7 * wc.deltaTime
	if hit and hit.intersection:distance(cp) < 150 then pos = hit.intersection else local hitd = tes3.rayTest{position = cp, direction = V.down}	pos = hitd and hitd.intersection end		
	if pos then local ref = tes3.createReference{object = amob, cell = p.cell, orientation = r.sceneNode.worldTransform.rotation:toEulerXYZ(), position = pos}	ref.modified = false	PRR[ref] = true end
	--tes3.createReference{object = "4nm_boundarrow", cell = p.cell, orientation = r.sceneNode.worldTransform.rotation:toEulerXYZ(), position = cp}
end end end		if cf.Proj then event.register("projectileHitObject", onProj)	event.register("projectileHitTerrain", onProj) end


local function MOBILEDEACTIVATED(e) local r = e.reference
	N[r] = nil		AF[r] = nil		FR[r] = nil
--	if AF[r].tremor then AF[r].tremor:cancel()	if r.mobile and r.mobile.paralyze > 0 then r.mobile.paralyze = 0 end end
	if R[r] then R[r] = nil	if cf.m4 then tes3.messageBox("%s deactivated  Enemies = %s", r, table.size(R)) end end
	if A[r] then	if A[r].mettim then A[r].mettim:cancel() end	if A[r].axetim then A[r].axetim:cancel() end	if A[r].longtim then A[r].longtim:cancel() end		A[r] = nil end
end		event.register("mobileDeactivated", MOBILEDEACTIVATED)


local function OBJECTINVALIDATED(e) local ob = e.object
	if CPR[ob] then CPR[ob] = nil elseif CPRS[ob] then CPS[CPRS[ob].n] = 0	CPRS[ob] = nil end
	if ob == W.TETR then if cf.m then tes3.messageBox("Telekinesis: Invalidated") end	W.TETR = nil end
--	if V.METR[ob] then V.METR[ob] = nil		if cf.m then tes3.messageBox("Throw: Invalidated") end end
	if DER[ob] then DER[ob] = nil end
	if PRR[ob] then PRR[ob] = nil end
end		event.register("objectInvalidated", OBJECTINVALIDATED)

-- ЦеллЧЕйнджед НЕ триггерит инвалидейтед обычных референций, но триггерит Прожектайл Экспире.
local function CELLCHANGED(e) AC = {}		for _, cell in pairs(tes3.getActiveCells()) do AC[cell] = true end
	if W.TETmod and e.previousCell and (e.cell.isInterior or e.previousCell.isInterior) then p:activate(W.TETR) end
	if W.metflag and e.previousCell and (e.cell.isInterior or e.previousCell.isInterior) then for r, t in pairs(V.METR) do if t.f then p:activate(r) end end	V.METR = {}	end
end		event.register("cellChanged", CELLCHANGED)

local function mouseWheel(e)
	tes3.messageBox("Scroll = %s", e.delta)
end		--event.register("mouseWheel", mouseWheel)

--local function Fire(n)  tes3.createReference{object = "iron dagger", position = tes3.player.position, cell = tes3.player.cell} if n > 1 then timer.delayOneFrame(function() Fire(n-1) end) end end
local QK = {[cf.q0.keyCode] = "0", [cf.q1.keyCode] = "1", [cf.q2.keyCode] = "2", [cf.q3.keyCode] = "3", [cf.q4.keyCode] = "4", [cf.q5.keyCode] = "5", [cf.q6.keyCode] = "6", [cf.q7.keyCode] = "7", [cf.q8.keyCode] = "8", [cf.q9.keyCode] = "9"}
local function KEYDOWN(e) if not tes3ui.menuMode() then local k = e.keyCode		--tes3.messageBox("key = %s   jump = %s", k, ic.inputMaps[12].code)
if k == cf.magkey.keyCode then local CS = mp.currentSpell		-- Быстрый каст
	if ad.animationAttackState == 1 then
		if L.AG[ad.currentAnimationGroup] then
			if P.agi25 and ad.currentAnimationGroup == 34 then		local stc = 100 * (1 + mp.encumbrance.normalized)
				if mp.fatigue.current > stc then mp.fatigue.current = mp.fatigue.current - stc		ad.animationAttackState = 0		if cf.m then tes3.messageBox("Stand up! Stamcost = %d", stc) end end
			end
		elseif P.agi17 then		local stc = 30 * (1 + mp.encumbrance.normalized)
			if mp.fatigue.current > stc then mp.fatigue.current = mp.fatigue.current - stc		ad.animationAttackState = 0		if cf.m then tes3.messageBox("Break free! Stamcost = %d", stc) end end
		end
	elseif (mp.hasFreeAction and mp.paralyze < 1 or P.agi17) and ad.animationAttackState ~= 10 then
		if M.QB.normalized >= (P.spd11 and 0.5 or 1) and not D.QSP["0"] and QS ~= CS and CS and CS.objectType == tes3.objectType.spell and CS.castType == 0 and (P.int3 or CS.alwaysSucceeds) then QS = CS
			M.Qicon.contentPath = "icons\\" .. QS.effects[1].object.bigIcon
		end
		if QS then	local excost = (QS.alwaysSucceeds and 4 or 2) + (P.agi24 and 0 or 2)	local stc = QS.magickaCost * (P.end8 and 0.5 or 1)
			if M.QB.current >= excost and mp.fatigue.current > stc then		mp.fatigue.current = mp.fatigue.current - stc
				G.LastQS = QS		tes3.cast{reference = p, spell = QS, instant = true, alwaysSucceeds = false}
				M.QB.current = math.max(M.QB.current - excost, 0)
				if not T.QST.timeLeft then T.QST = timer.start{duration = math.max(1 - mp.speed.current/(P.spd9 and 200 or 400), 0.25), iterations = -1, callback = function()
				M.QB.current = M.QB.current + 1		if M.QB.current == 20 then T.QST:cancel() end end} end
			end
		end
	end
	
elseif QK[k] and M.QB.normalized >= (P.spd11 and 0.5 or 1) then local CS = mp.currentSpell		-- Выбор быстрого каста
	if QK[k] ~= "0" then
		if e.isShiftDown and CS and CS.objectType == tes3.objectType.spell and CS.castType == 0 and (CS.alwaysSucceeds or P.int3) then
			D.QSP[QK[k]] = CS.id		tes3.messageBox("%s remembered for %s extra-cast slot", D.QSP[QK[k]], QK[k])
		end
		if D.QSP[QK[k]] then D.QSP["0"] = QK[k]		QS = tes3.getObject(D.QSP[D.QSP["0"]])		M.Qicon.contentPath = "icons\\" .. QS.effects[1].object.bigIcon
			if cf.m10 then tes3.messageBox("%s prepared for extra-cast slot %s  %s", QS.name, D.QSP["0"], QS.alwaysSucceeds and "Is a technique" or "") end
		end
	else
		if e.isShiftDown and CS and CS.objectType == tes3.objectType.spell and CS.castType == 0 then
			if D.FS[CS.id] then D.FS[CS.id] = nil	tes3.messageBox("%s removed from Favorite Spells", CS.name) else D.FS[CS.id] = CS.alwaysSucceeds and 1 or 0		tes3.messageBox("%s added to Favorite Spells", CS.name) end
		elseif e.isAltDown then D.FS = {}	tes3.messageBox("Favorite spell list cleared") else D.QSP["0"] = nil end
	end
elseif k == cf.tpkey.keyCode and (mp.hasFreeAction or P.agi17) then		local dkik = MB[3] == 128	local DMag = math.min(Mag(600), dkik and 1000 or cf.dash)	-- дэши
	if DMag > 0 and MB[cf.mbdod] ~= 128 then	local ang	local DD = DMag * (Cpow(mp,0,4) + (P.spd8 and 50 or 0))/2
		mc = (DMag + (P.acr8 and mp.isJumping and 0 or math.min(DMag,10))) * (P.alt10 and 1 or 1.5)
		if mp.isMovingForward then if mp.isMovingLeft then ang = 315 elseif mp.isMovingRight then ang = 45 end
		elseif mp.isMovingBack then if mp.isMovingLeft then ang = 45 elseif mp.isMovingRight then ang = 315 end
		elseif mp.isMovingLeft then ang = 270 elseif mp.isMovingRight then ang = 90 end
		V.d = tes3.getPlayerEyeVector()		if ang then Matr:toRotationZ(math.rad(ang))	V.d = Matr * V.d end
		if ang == 90 or ang == 270 then V.d.z = 0	V.d = V.d:normalized()	else if mp.isMovingBack then V.d = V.d*-1 end	if math.abs(V.d.z) < 0.15 then V.d.z = 0	V.d = V.d:normalized() end end
		if dkik then local kref		kref, dkik = L.Sector{d = DD, lim = 500, v = V.d} end
		if dkik then dkik = dkik/DD		if dkik < 1 then DD = DD * dkik		mc = mc * dkik end
		else	local dhit = tes3.rayTest{position = tes3.getPlayerEyePosition(), direction = V.d, ignore={p}}		if dhit then dhit = dhit.distance/DD	if dhit < 1 then DD = DD * dhit		mc = mc * dhit end end end
		if T.Dash.timeLeft then mc = mc * (1 + T.Dash.timeLeft/(P.atl8 and 10 or 3)) end	local stam = mc * ((P.end10 and 0.5 or 1) - (P.una10 and D.AR.u*0.02 or 0))
		if not V.dfr and mc < mp.magicka.current and stam < mp.fatigue.current then		local vk = math.max(-0.4 - V.d.z, 0)/3
			V.d = V.d*(DD*30/8 * (1 - vk))		V.dfr = 8	event.register("calcMoveSpeed", L.Dash)		tes3.playSound{sound="Spell Failure Destruction"}
			if not mp.isJumping then V.djf = true	mp.isJumping = true end			if dkik and cf.autokik then V.dkik = true end
			Mod(mc)		mp.fatigue.current = mp.fatigue.current - stam		if cf.m then tes3.messageBox("Dash dist = %d  Cost = %.1f  Time = %.1f  SlamK = %d%%", DD, mc, T.Dash.timeLeft or 0, vk*100) end
			V.dd = DD 	if T.Dash.timeLeft then T.Dash:cancel()	end		T.Dash = timer.start{duration = 3, callback = function() end}
		end
	else	local stam = (P.agi4 and 40 or 50) * (1 + mp.encumbrance.normalized*(P.agi14 and 0.5 or 1) + (D.AR.dc < 0 and D.AR.dc or math.max(D.AR.dc - math.max(-mp.encumbrance.currentRaw,0)/1000,0)))
		if T.Dod.timeLeft then stam = stam * (1 + T.Dod.timeLeft/(P.atl10 and 6 or 3)) end
		if not V.dfr and mp.hasFreeAction and mp.paralyze < 1 and (P.acr13 or not mp.isJumping) and stam < mp.fatigue.current then	local ang
			if mp.isMovingForward then if mp.isMovingLeft then ang = 315 elseif mp.isMovingRight then ang = 45 end
			elseif mp.isMovingBack then if mp.isMovingLeft then ang = 45 elseif mp.isMovingRight then ang = 315 end
			elseif mp.isMovingLeft then ang = 270 elseif mp.isMovingRight then ang = 90 end
			V.d = tes3.getPlayerEyeVector()		if ang then Matr:toRotationZ(math.rad(ang))	V.d = Matr * V.d end
			V.d.z = 0	V.d = V.d:normalized()		V.d = V.d * (P.spd16 and 1000 or 500) * (mp.isMovingBack and -1 or 1)
			V.dfr = 5	event.register("calcMoveSpeed", L.Dash)		mp.fatigue.current = mp.fatigue.current - stam			tes3.playSound{sound = math.random(2) == 1 and "LeftS" or "LeftM"}
			if not mp.isJumping then V.djf = true	mp.isJumping = true end
			if cf.m then tes3.messageBox("Active dodge!  Cost = %d  Time = %.1f", stam, T.Dod.timeLeft or 0) end
			if P.sec6 and (T.Dod.timeLeft or 0) < 2 then tes3.applyMagicSource{reference = p, name = "Dodge", effects = {{id = 510, min = 30, max = 30, duration = 1}}} end
			if T.Dod.timeLeft then T.Dod:cancel() end	T.Dod = timer.start{duration = 3, callback = function() end}
		end
	end
elseif k == cf.kikkey.keyCode then L.KIK()		--tes3.messageBox("Status = %s", table.size(N))
elseif k == cf.telkey.keyCode then -- Телекинез + Метание оружия - возврат
	--tes3.applyMagicSource{reference = p, source = B["Storm_touch"]}
	for r, t in pairs(V.METR) do if not t.f and mp.magicka.current > t.retmc then Mod(t.retmc)		t.f = 1		t.si.state = 6 end end
	if not W.TETmod then	local ref = tes3.getPlayerTarget()	if ref and ref.object.weight then TELnew(ref) end
	elseif W.TETmod == 1 then
		if MB[3] == 128 then p:activate(W.TETR)
		elseif mp.magicka.current > W.TETcost then mc = W.TETcost * (P.mys7 and 0.5 or 1)		Mod(mc)		tes3.playSound{sound = "Weapon Swish"}	--Weapon Swish		Spell Failure Destruction
			tes3.applyMagicSource{reference = p, name = "4nm_tet", effects = {{id = 610, range = 2}}}	if cf.m then tes3.messageBox("Telekinetic throw! Dmg = %.1f  Cost = %.1f (%.1f base)", W.TETdmg, mc, W.TETcost) end
		end
	elseif W.TETmod == 2 then W.TETmod = 3	W.TETsi.state = 6	W.TETsi = nil
	elseif W.TETmod == 3 and P.mys16 and mp.magicka.current > 2*W.TETcost then	mc = W.TETcost * (P.mys7 and 0.5 or 1) * math.min(1 + pp:distance(W.TETR.position)/5000, 2)
		Mod(mc)	W.TETmod = 1	tes3.playSound{sound = "enchant fail"}	if cf.m then tes3.messageBox("Extra teleport!  Manacost = %.1f (%.1f base)", mc, W.TETcost) end
	end
elseif k == cf.cwkey.keyCode then -- Заряженное оружие
	if e.isControlDown then D.CWm = not D.CWm	tes3.messageBox("Charged weapon: %s", D.CWm and "ranged" or "touch")
	elseif e.isShiftDown then D.CWdis = not D.CWdis	tes3.messageBox("Charged weapon: %s", D.CWdis and "disabled" or "enabled")
	elseif e.isAltDown then D.NoEnStrike = not D.NoEnStrike		W.bar.fillColor = D.NoEnStrike and {1,0,0} or {0,1,1}
		tes3.messageBox("Weapon enchant trigger when attacking: %s", D.NoEnStrike and "disabled" or "enabled")
	elseif D.CW and W.TETR and P.mys17 then L.CWF(p, 2, 1, W.TETR.position:copy()) end
elseif k == cf.cpkey.keyCode then -- Контроль снарядов
	if MB[1] == 128 then CPRS = {}	for r, t in pairs(CPR) do if t.tim then 	 if t.mod == 4 then t.m.velocity = t.v * t.m.initialSpeed end		CPR[r] = nil end end -- Роспуск снарядов
	elseif MB[3] == 128 then for r, t in pairs(CPR) do if t.tim and t.mod < 11 then t.m:explode() end end		for r, t in pairs(CPRS) do r.mobile:explode() end
	elseif e.isAltDown then if DM.cpt then DM.cpt = false tes3.messageBox("Simple mode") elseif P.alt8a then DM.cpt = true tes3.messageBox("Smart mode") end
	elseif e.isControlDown then if DM.cpm then DM.cpm = false tes3.messageBox("Mines: simple mode") elseif P.mys8a then DM.cpm = true tes3.messageBox("Mines: teleport mode") end
	elseif ic:isKeyDown(ic.inputMaps[1].code) then if P.mys8a then DM.cp = 3 tes3.messageBox("Teleport projectiles") end
	elseif ic:isKeyDown(ic.inputMaps[2].code) then if P.mys8b then DM.cp = 1 tes3.messageBox("Homing projectiles") end
	elseif ic:isKeyDown(ic.inputMaps[3].code) then if P.alt8b then DM.cp = 2 tes3.messageBox("Spin projectiles") end
	elseif ic:isKeyDown(ic.inputMaps[4].code) then if P.alt8c then DM.cp = 4 tes3.messageBox("Magic mines") end else DM.cp = 0 tes3.messageBox("Target projectiles") end
elseif k == cf.reflkey.keyCode then	-- Отражение	Auras  Prok
	if e.isControlDown then D.Aurdis = not D.Aurdis		tes3.messageBox("Damage aura mode: %s", D.Aurdis and "disabled" or "enabled")
	elseif e.isShiftDown then D.Prokdis = not D.Prokdis		tes3.messageBox("Prok mode: %s", D.Prokdis and "disabled" or "enabled")
	else DM.refl = not DM.refl	tes3.messageBox("Reflect spell mode: %s", DM.refl and "reflect" or "manashield") end
elseif k == cf.totkey.keyCode then -- Тотемы и руны
	if e.isShiftDown then for i, t in pairs(RUN) do L.RunExp(i) end
	elseif e.isControlDown then for i, t in pairs(TOT) do L.TotExp(i) end
	else D.Totdis = not D.Totdis	tes3.messageBox("Totem shooting: %s", D.Totdis and "disabled" or "enabled") end
elseif k == cf.detkey.keyCode then local mag = P.mys12 and 30 or 20  -- Обнаружение
	local node, nod		local dist = {tes3.getEffectMagnitude{reference = p, effect = 64}*mag, tes3.getEffectMagnitude{reference = p, effect = 65}*mag, tes3.getEffectMagnitude{reference = p, effect = 66}*mag}	DEDEL()
	for c, _ in pairs(AC) do for r in c:iterateReferences() do local ot
		if r.object.objectType == tes3.objectType.container and not r.object.organic then ot = "cont" elseif r.object.objectType == tes3.objectType.door then ot = "door" elseif r.mobile and not r.mobile.isDead then
		if r.object.objectType == tes3.objectType.npc or r.object.type == 3 then ot = "npc" elseif r.object.type == 1 then ot = "dae" elseif r.object.type == 2 then ot = "und" elseif r.object.blood == 2 then ot = "robo" else ot = "ani" end
		elseif r.object.enchantment or r.object.isSoulGem then ot = "en" elseif r.object.isKey then ot = "key" end
		if ot and r.sceneNode then node = r.sceneNode:getObjectByName("detect") if node then r.sceneNode:detachChild(node) 	r.sceneNode:update()	r.sceneNode:updateNodeEffects() end
			if pp:distance(r.position) < dist[L.DEO[ot].s] then nod = L.DEO[ot].m:clone()	if r.mobile then nod.translation.z = nod.translation.z + r.mobile.height/2 end
		r.sceneNode:attachChild(nod, true)	r.sceneNode:update()	r.sceneNode:updateNodeEffects()		DER[r] = ot end end
	end end		if table.size(DER) > 0 then tes3.playSound{reference = p, sound = "illusion hit"}	if T.DET.timeLeft then T.DET:reset() else T.DET = timer.start{duration = 10, callback = DEDEL} end end
elseif k == cf.markkey.keyCode then	local mtab = {}		for i = 1, 10 do mtab[i] = i.." - "..(DM["mark"..i] and DM["mark"..i].id or "empty") end -- Пометки
	mtab[11] = "Teleport companions: " .. (D.NoTPComp and "no" or "yes")
	tes3.messageBox{message = "Select a mark for recall", buttons = mtab, callback = function(e) if e.button == 10 then D.NoTPComp = not D.NoTPComp else	local v = "mark"..(e.button+1)		if DM[v] then
		mp.markLocation.cell = tes3.getCell{id = DM[v].id}		mp.markLocation.position = tes3vector3.new(DM[v].x, DM[v].y, DM[v].z)
	end end end}
elseif k == cf.bwkey.keyCode then mc = BAM.f()	-- Призванное оружие
	if e.isControlDown and tes3.isAffectedBy{reference = p, effect = 601} and mp.magicka.current > mc then	if mp.readiedWeapon then BAM.am = BAM[mp.readiedWeapon.object.type] or BAM.met else BAM.am = BAM.met end
		if mwscript.getItemCount{reference = p, item = BAM.am} == 0 then tes3.addItem{reference = p, item = BAM.am, count = 1, playSound = false}	Mod(mc) end mp:equip{item = BAM.am}
	else	local M = {}	M.M = tes3ui.createMenu{id = 402, fixedFrame = true}	M.M.minHeight = 800	M.M.minWidth = 800		local el	M.B = M.M:createBlock{}		M.B.autoHeight = true	M.B.autoWidth = true
		for i = 1, 4 do M[i] = M.B:createBlock{}	M[i].autoHeight = true		M[i].autoWidth = true	M[i].borderAllSides = 5		M[i].flowDirection = "top_to_bottom" end
		for i, l in ipairs(L.BW) do for _, id in ipairs(l) do
			el = M[i]:createLabel{text = id}	el.borderBottom = 2		el:register("mouseClick", function() D.boundw = "4_bound " .. id	M.M:destroy()	tes3ui.leaveMenuMode() end)
		end end		tes3ui.enterMenuMode(402)
	end
elseif k == cf.poisonkey.keyCode then D.poimod = not D.poimod		M.drop.visible = D.poimod		tes3.messageBox("Poison mode %s", M.drop.visible and "enabled" or "disabled")	-- Режим яда
elseif k == cf.dwmkey.keyCode then if e.isAltDown then W.WL = nil W.DL = nil else L.DWMOD(not W.DWM) end	-- Двойное оружие
elseif k == cf.pkey.keyCode and L.READY then	local M = {}	M.M = tes3ui.createMenu{id = 400, fixedFrame = true}	M.M.minHeight = 1100	M.M.minWidth = 1240	-- Перки
	M.S = 0		for i, l in ipairs(L.PR) do for _, t in ipairs(l) do if P[t[1]] then M.S = M.S + t.f end end end	local pat
	M.P = M.M:createVerticalScrollPane{}	M.A = M.P:createBlock{}		M.A.autoHeight = true	M.A.autoWidth = true		M.B = M.M:createBlock{}		M.B.autoHeight = true	M.B.autoWidth = true
	M.F = M.B:createFillBar{current = M.S, max = p.object.level * cf.pmult}	M.F.width = 300		M.F.height = 24		M.F.widget.fillColor = {128,0,255}
	M.close = M.B:createButton{text = tes3.findGMST(tes3.gmst.sClose).value}	M.close:register("mouseClick", function() M.M:destroy()	tes3ui.leaveMenuMode()	L.PerkSpells()	L.HPUpdate() end)
	M.class = M.B:createButton{text = cf.en and "Class select" or "Выбрать класс"}	M.class:register("mouseClick", function() M.M:destroy()	tes3ui.leaveMenuMode()	L.ClassSelect() end)
	M.rescl = M.B:createButton{text = cf.en and "Reset class" or "Сброс класса"}	M.rescl:register("mouseClick", function() M.M:destroy()	tes3ui.leaveMenuMode()	L.ClassReset() end)
	M.resp = M.B:createButton{text = cf.en and "Reset perks" or "Сброс перков"}		M.resp:register("mouseClick", function() M.M:destroy()	tes3ui.leaveMenuMode()	L.PerkReset() end)
	for i = 1, 35 do M[i] = M.A:createBlock{}	M[i].autoHeight = true		M[i].autoWidth = true	M[i].borderAllSides = 1		M[i].flowDirection = "top_to_bottom" end
	for i, l in ipairs(L.PR) do for _, t in ipairs(l) do pat = "icons/p/"..t[1]..".tga"		t.m = M[i]:createImage{path = tes3.getFileExists(pat) and pat or L.PRL[i][2]}
		t.m.borderBottom = 2	if not P[t[1]] then t.m.color = {0.2,0.2,0.2} end
		t.m:register("help", function() local tt = tes3ui.createTooltipMenu():createBlock{}		tt.autoHeight = true	tt.autoWidth = true		tt.maxWidth = 600
		tt:createLabel{text = ("%s   Cost: %s + %s = %s   Required %s: %s  -  %s"):format(t[cf.en and 4 or 3], t.c or 1, t.x, t.f, L.PRL[i][1], t[2], t[cf.en and 6 or 5])} end)
		if M.F.widget.max >= M.S + t.f and not P[t[1]] and mp[L.PRL[i][1]].base >= t[2] then t.m:register("mouseClick", function() if not P[t[1]] and M.F.widget.max >= M.S + t.f then P[t[1]] = true
		M.S = M.S + t.f		M.F.widget.current = M.S	M.F:updateLayout()	tes3.playSound{sound = "skillraise"} end end) end
	end end		tes3ui.enterMenuMode(400)
	if e.isAltDown then	for i, l in ipairs(L.PR) do for _, t in ipairs(l) do P[t[1]] = true end end		for _, num in ipairs(L.SFS) do mwscript.addSpell{reference = p, spell = "4s_"..num} end
	D.resetday = 0		tes3.messageBox("TESTER MOD ACTIVATED!")	tes3.playSound{sound = "Thunder0"} end
end end end		event.register("keyDown", KEYDOWN)


local function CALCFLYSPEED(e) if e.mobile == mp then e.speed = mp.levitate * (20 + mp:getSkillValue(11)/(P.alt15 and 5 or 10)) * (1 + mp.speed.current/400 + mp:getSkillValue(8)/(P.atl7 and 400 or 1000))
elseif not e.mobile.object.flies then e.speed = (2 + e.mobile.levitate) * 40 * (1 + e.mobile.speed.current/200) 		--tes3.messageBox("fly = %s  lev = %.1f  speed = %d", e.reference, e.mobile.levitate, e.speed)
end end		event.register("calcFlySpeed", CALCFLYSPEED)

local function CALCMOVESPEED(e) if e.mobile == mp then e.speed = e.speed
	* math.min(D.AR.ms + math.max(-mp.encumbrance.currentRaw,0)/2000, 1)
	* (P.atl3 and 1 or (1 - mp.encumbrance.normalized/3))
	* (mp.isMovingBack and (P.agi16 and math.min(0.5 + mp.agility.current/400, 0.75) or 0.5) or 1)
	* ((mp.isMovingLeft or mp.isMovingRight) and (mp.isMovingForward or mp.isMovingBack) and 0.8 or 1)
	* (mp.isRunning and (P.atl1 and mp.isMovingForward and not (mp.isMovingLeft or mp.isMovingRight) and 1 or 0.75)
	* (1 - (1 - math.min(mp.fatigue.normalized,1)) * (P.atl2 and 0.25 or 0.5))
	* (ad.animationAttackState == 2 and (P.spd10 and 0.8 or 2/3) or 1) or 1)
	--tes3.messageBox("speed = %d  run = %s / %s", e.speed, mp.isRunning, mp.alwaysRun)
else e.speed = e.speed * (0.5 + math.min(e.mobile.fatigue.normalized,1)/2) end end			if cf.Spd then event.register("calcMoveSpeed", CALCMOVESPEED) end


local function CALCARMORRATING(e) local m = e.mobile	if m then	local a = e.armor
	e.armorRating = a.armorRating * (1 + m:getSkillValue(AT[a.weightClass].s)/((m ~= mp or P[AT[a.weightClass].p]) and 100 or 200)) * (a.weight == 0 and 0.5 + m:getSkillValue(13)/((m ~= mp or P.con9) and 200 or 400) or 1)
e.block = true end end		event.register("calcArmorRating", CALCARMORRATING)


-- Для ближнего боя хит это первое событие. Определяются таргет, направление атаки и свинг, НО физдамаг все еще старый на момент завершения события - он обновится сразу после события и уже учтет силу и прочность оружия
-- Свинг можно менять только для ближнего боя.	ad.physicalDamage бесполезно менять и для ближнего и для дальнего боя. В событии дамага ad.physicalDamage для дальнего боя отображается неверно.
local function CALCHITCHANCE(e) local a = e.attackerMobile	local t = e.targetMobile	local ad = a.actionData
local chance = 100 + a.agility.current - a.blind - (t.chameleon + t.invisibility*300)*((t ~= mp or P.snek7) and 0.5 or 0.25)
if t == mp then		local extra = 0		local sanct = t.sanctuary/5 * (1+(P.una11 and D.AR.u*0.01 or 0))
	L.skarm = math.max((a.object.level * 4 + 20 - p.object.level/2) / (a.object.level + 20) * ad.physicalDamage/50, 0)
	local dodge = (P.lig8 and D.AR.l > 19 and t.isRunning or ((t.isMovingLeft or t.isMovingRight) and not t.isMovingForward)) and
	math.min(math.min(t.fatigue.normalized,1) * (D.AR.dk > 1 and D.AR.dk or math.min(D.AR.dk + math.max(-mp.encumbrance.currentRaw,0)/1000, 1))
	* (t.agility.current*(P.agi20 and 0.3 or 0.2) + (P.luc3 and t.luck.current/10 or 0)) + sanct + (P.acr6 and t.isJumping and t:getSkillValue(20)/5 or 0), 100) or 0
	local DodK = T.Dod.timeLeft and (T.Dod.timeLeft - (P.spd17 and 2.3 or 2.5))/(P.spd17 and 0.7 or 0.5) or 0
	if DodK > 0 then extra = (t.agility.current/(1+t.agility.current/400)/(P.agi2 and 8 or 16) + (P.lig2 and D.AR.l * t:getSkillValue(21)/100 or 0) + (P.agi23 and W.DWM and 10 or 0) + sanct) * (P.spd2 and 2 or 1) * DodK
		mp:exerciseSkill(21, D.AR.l/100)	mp:exerciseSkill(17, D.AR.u/100)
	end
	e.hitChance = chance - dodge - extra		--tes3.messageBox("Hit chance = %d%% (%.1f - %.1f passive - %.1f active (x%.2f))   tim = %s", e.hitChance, chance, dodge, extra, DodK, T.Dod.timeLeft)
	if cf.m3 and dodge + extra > 0 then tes3.messageBox("Hit chance = %d%% (%.1f - %.1f passive - %.1f active (x%.2f))", e.hitChance, chance, dodge, extra, DodK) end
else e.hitChance = chance - t.sanctuary/2 end
if a ~= mp then ad.attackSwing = math.random(50,100)/100 end
--	local pos = tes3.getPlayerEyePosition() + tes3.getPlayerEyeVector()*150		local post = e.target.sceneNode:getObjectByName("Bip01 Head").worldTransform.translation
--	tes3.createReference{object = "4nm_boundstar", position = pos, cell = p.cell}	tes3.createReference{object = "4nm_boundstar", position = post, cell = p.cell, scale = 2}
end		if cf.hit then event.register("calcHitChance", CALCHITCHANCE) end


-- Первое событие для дальнего боя: менять свинг: он уже не изменится при хите, который идет после атаки. Для ближнего боя идет сразу после хита. Дамаг НЕ определен если не было события хита.
-- Можно менять ad.physicalDamage для ближнего боя и это сработает. Но ad.physicalDamage не поменяется для дальнего боя.
local function ATTACK(e) local a = e.mobile	local ar = e.reference	local w = a.readiedWeapon	local ob = w and w.object	local wt = w and (a == mp and W.wt or ob.type) or -1	local ad = a.actionData
if a.fatigue.normalized < 1 then local stret = a ~= mp and 10 or ((P[WT[wt].p3] and a:getSkillValue(WT[wt].s)/20 or 0) + (P.end6 and math.min(a.endurance.current/20, 5) or 0))
if stret > 0 then a.fatigue.current = a.fatigue.current + stret end end

if a == mp and w then	local wd = w.variables
	if ob.weight == 0 then
		if ob.id:sub(1,7) == "4_bound" and not tes3.isAffectedBy{reference = p, effect = 603} then timer.delayOneFrame(function() mp:unequip{item = ob}	timer.delayOneFrame(function()
			for _, st in pairs(inv) do if st.object.objectType == tes3.objectType.weapon and st.object.weight == 0 and st.object.id:sub(1,7) == "4_bound" then tes3.removeItem{reference = p, item = st.object} end end
		end) end) return end
	elseif ob.isMelee and MB[cf.mbmet] == 128 then	local ow = ob.weight	local kw = ow/(1 + ow/20) * (P.str12 and 0.05 or 0.075)
		local sdmg = math.max(math.max(ob.chopMax, ob.thrustMax) * math.max(wd.condition/ob.maxCondition, P.arm2 and 0.3 or 0.1), ob.weight/2) * (P.mark13 and 0.75 or 0.5)
		local Kstr = mp.strength.current/(P.str1 and 1 or 2)		local Kstam = (50 + (P.end1 and 0 or 10) + (P.mark2c and 0 or 20)) * math.max(1-mp.fatigue.normalized,0)
		local Kskill = mp:getSkillValue(23) * ((P.mark1c and 0.2 or 0.1) + (P[WT[wt].h1 and "agi5" or "str2"] and 0.1 or 0.05))		local Kbonus = mp.attackBonus/5		
		local DMag = math.min(tes3.getEffectMagnitude{reference = p, effect = 600}, cf.metlim)		local mc = 0	local Kkin = 0
		if DMag > 0 then mc = DMag * (P.alt17 and 0.5 or 1)		if mp.magicka.current > mc then Kkin = DMag * (Cpow(mp,0,4) + (P.alt16 and 50 or 0))/2000 / (1 + ow/10) 	Mod(mc) end end
		W.acs = math.clamp(ad.attackSwing * (100 + Kstr - Kstam)/100 - kw + Kkin, 0.5, 4)
		W.metd = sdmg * (Kkin + ad.attackSwing * (100 + Kstr - Kstam + Kskill + Kbonus)/100)
		W.met = tes3.dropItem{reference = p, item = ob, itemData = wd}		if W.DWM then L.DWMOD(false) end
		if cf.m then tes3.messageBox("Throw %s!  Acs = %.2f (%.2f w)  Dmg = %.1f (%.1f +%d%% str -%d%% stam +%d%% skill +%d%% atb)  Kin = %.2f (%d cost)", ob.name, W.acs, kw, W.metd, sdmg, Kstr, Kstam, Kskill, Kbonus, Kkin, mc) end
		tes3.applyMagicSource{reference = p, name = "4nm_met", effects = {{id = 610, range = 2}}}	return
	end
	
	if W.f == 1 and ob == W.ob and (wt > 8 or not e.targetMobile) then tes3.applyMagicSource{reference = p, source = ob.enchantment, fromStack = w} end
	if wt == 10 then
		if T.Arb.timeLeft then ad.attackSwing = 0.5		T.Arb:cancel() else ad.attackSwing = 1 end
	--	if MB[3] == 128 then mp.animationController.weaponSpeed = 1000000 end
	--	if mp.readiedAmmo and BAM[mp.readiedAmmo.object.id] then BAM.am = mp.readiedAmmo.object.id	if tes3.isAffectedBy{reference = p, effect = 601} then mc = BAM.f()
	--		BAM.E[1].id = MID[math.random(3)]	BAM.E[1].min = math.random(5) + mp:getSkillValue(10)/20		BAM.E[1].max = BAM.E[1].min*2		BAM.E[1].radius = math.random(5) + L.GetRad(mp)
	--		if cf.autoammo and mp.magicka.current > mc then	mp.readiedAmmoCount = 2		tes3.addItem{reference = p, item = BAM.am, count = 1, playSound = false}	Mod(mc) end
	--	end end
	elseif P.str8 and ob.isTwoHanded and ad.attackDirection == 1 and ad.attackSwing > 0.95 then local dist = 150 * ob.reach
		local dmg = ob.slashMax/2*(1 + mp.strength.current/200) * math.max(wd.condition/ob.maxCondition, P.arm2 and 0.3 or 0.1)
		timer.start{duration = 0.2/ob.speed, callback = function() for _, m in pairs(tes3.findActorsInProximity{reference = p, range = dist}) do if m ~= mp and m ~= e.targetMobile and tes3.getCurrentAIPackageId(m) ~= 3 then
			dmg = m:applyDamage{damage = dmg, applyArmor = true, playerAttack = true}		L.CrimeAt(m)		if cf.m3 then tes3.messageBox("Round attack! %s  Dmg = %.1f", m.reference, dmg) end
		end end end}
	end
elseif a ~= mp and ad.attackDirection == 4 then ad.attackSwing = wt == 10 and 1 or math.random(70,100)/100
	if cf.ammofix and a.readiedAmmoCount == 0 then a.readiedAmmoCount = 1	if cf.m then tes3.messageBox("AMMO FIX!") end end
end

if ar.data.CW then local rt = (a ~= mp and 2) or (not D.CWdis and not (cf.smartcw and wt > 8) and (D.CWm and 2 or (e.targetMobile and e.targetMobile.playerDistance < 192 and 1)))
	if rt == 2 then timer.delayOneFrame(function() L.CWF(ar, 2, 1.5) end) elseif rt == 1 then L.CWF(ar, 1, 1) end
end
--tes3.messageBox("ATA!  ref = %s  wt = %s  dir = %s  swing = %.2f  dmg = %.2f  tar = %s  Ammo = %s %s", ar, wt, ad.attackDirection, ad.attackSwing, ad.physicalDamage, e.targetReference, a.readiedAmmo and a.readiedAmmo.object, a.readiedAmmoCount)
end		event.register("attack", ATTACK)



-- Вызывается после атаки для ближнего боя и после хита для дальнего. Можно менять слот, по которому попадет удар. Далее идёт дамаг. НЕ вызывается если попали по щиту или кричеру.
local function CALCARMORPIECEHIT(e) local s = tes3.getEquippedItem{actor = e.reference, objectType = tes3.objectType.armor, slot = e.slot}
if not s and e.fallback then s = tes3.getEquippedItem{actor = e.reference, objectType = tes3.objectType.armor, slot = e.fallback} end
arm = s and s.object:calculateArmorRating(e.mobile) or 0		arp = s and s.object.weightClass or 3
--e.slot = 0		tes3.messageBox("ARM! ref = %s  slot = %s", e.reference, e.slot)
end		event.register("calcArmorPieceHit", CALCARMORPIECEHIT)


local function DAMAGE(e) if e.source == "attack" then local a = e.attacker	local t = e.mobile	local ar = e.attackerReference	local tr = e.reference	local ad = a.actionData		local rw = a.readiedWeapon	local pr = e.projectile
local StartD = e.damage		local DMG = StartD		local Kperk, Kcond = 0, 0	local WS	local w = pr and pr.firingWeapon or (rw and rw.object)	local wt = w and (not pr and a == mp and W.wt or w.type) or -1	
local sw = ad.attackSwing	 local dir = ad.attackDirection		local agi = a.agility.current		local Tagi = t.agility.current		local bid = ar.baseObject.id		local fat = math.min(t.fatigue.normalized,1)
local BaseHP = t.health.base
if t.actorType == 0 then arm = t.shield		arp = nil	end
if a.actorType == 0 then WS = a.combat.current	if not w then Kperk = a.strength.current/2 + (1 - a.health.normalized) * WS/2 end
else WS = a:getSkillValue(WT[wt].s)		if not w then 
	local gau = (a ~= mp or P.hand7) and tes3.getEquippedItem{actor = ar, objectType = tes3.objectType.armor, slot = dir == 3 and 6 or 7} or nil		gau = gau and gau.object.weight*(0.3 + WS/500) or 0
	StartD = sw * (a.werewolf and 40 or ((a ~= mp or P.hand10) and 10 or 5) + gau) * (1 + a.strength.current/200)
	DMG = StartD * StartD / (StartD + t.armorRating)	e.damage = DMG
end end

local as = (a.isMovingForward and wt < 9 and 1) or (a.isMovingLeft or a.isMovingRight and 2) or (a.isMovingBack and wt < 9 and 3) or 0
local ts = (t.isMovingForward and 1) or (t.isMovingLeft or t.isMovingRight and 2) or (t.isMovingBack and 3) or 0
local hs = 100 + (WS + a.strength.current + agi)/((a ~= mp or P.str1) and 10 or 20) + (as == 1 and (a ~= mp or P.str3) and 20 or 0) + (a == mp and math.min(com, G.maxcomb) * (P.agi9 and 10 or 5) or 0)
+ ((a ~= mp or P.str4 and sw > 0.95) and 20 or 0) + (ts == 1 and (not (t == mp and P.med10 and D.AR.m > 19) and 30 or 0) - (arp == 1 and (t ~= mp or P.med8) and t:getSkillValue(2)/5 or 0) or 0)
- (arp == 2 and (t ~= mp or P.hev8) and t:getSkillValue(3)/5 or 0) - (t == mp and P.hev12 and D.AR.h or 0)
- (t.endurance.current)/((t ~= mp or P.end5) and 5 or 10) - Tagi/((t ~= mp or P.agi26) and 5 or 10) - (ts == 0 and (t ~= mp or P.str5) and t.strength.current/10 or 0)

local Kskill = WS * (((a ~= mp or P[WT[wt].p1]) and 0.2 or 0.1) + ((a ~= mp or P[WT[wt].h1 and "agi5" or "str2"]) and 0.1 or 0.05))
local Kstam = (50 + ((a ~= mp or P.end1) and 0 or 10) + ((a ~= mp or P[WT[wt].p2]) and 0 or 20)) * math.max(1-a.fatigue.normalized,0)
local Kbonus = a.attackBonus/5 + (a == mp and 0 or ar.object.level)
local CritC = Kbonus + agi/((a ~= mp or P.agi1) and 10 or 20) + WS/((a ~= mp or P[WT[wt].p6]) and 10 or 20) + ((a ~= mp or P.luc1) and a.luck.current/20 or 0) + (as == 1 and (a ~= mp or P.spd3) and 10 or 0)
+ (ts == 1 and ((t == mp and P.med10 and D.AR.m > 19 and 0 or 10) + ((t ~= mp or P.agi7) and 0 or 10)) or 0) + (t == mp and arp == 3 and math.max(20 - t:getSkillValue(17)/(P.una13 and 5 or 10), 0) or 0)
+ (a == mp and math.min(com, G.maxcomb) * (P.agi6 and 5 or 3) + (wt == 2 and P.long10 and (T.Dash.timeLeft or 0) > 2 and V.dd/100 or 0) + (wt < 9 and a.isJumping and P.acr4 and a:getSkillValue(20)/10 or 0) - 10 or 10)
- (t.endurance.current + Tagi)/((t ~= mp or P.end3) and 20 or 40) - ((t ~= mp or P.luc2) and t.luck.current/20 or 0) - arm/10 - t.sanctuary/10
+ (1 - fat)*((a ~= mp or P.agi11) and 20 or 10) - (t == mp and ts == 0 and P.hev11 and D.AR.h or 0)
- (arp == 0 and ts ~= 0 and (t ~= mp or P.lig7) and t:getSkillValue(21)/10 or 0) - (arp == 1 and ts == 3 and (t ~= mp or P.med7) and t:getSkillValue(2)/10 or 0) - (arp == 2 and (t ~= mp or P.hev7) and t:getSkillValue(3)/10 or 0)

if w then if a ~= mp or P[WT[wt].p] then
	if wt > 8 then local dist = ar.position:distance(tr.position)
		if wt == 9 then Kperk = dist * WS/20000 -- Луки 5% за каждую 1000 дистанции
		elseif wt == 10 then Kperk = WS * (math.min(arm,100) * 0.005 + ((a ~= mp or P.mark9) and math.max(1000 - dist,0)/5000 or 0))
			if a ~= mp or P.mark9 then hs = hs + WS * math.max(3000 - dist,0)/6000 end
		elseif wt == 11 then if not A[ar] then A[ar] = {met = -1} end
			if (A[ar].met or -1) < ((a ~= mp or P.mark10) and 10 or 5) then A[ar].met = (A[ar].met or -1) + 1 end		Kperk = A[ar].met * WS/20
			if A[ar].mettim then A[ar].mettim:reset() else A[ar].mettim = timer.start{duration = a == mp and 1 + (P.mark8 and WS/200 or 0) or 2 + WS/100, callback = function() A[ar].met = -1	A[ar].mettim = nil end} end
		end
	else
		if wt > 6 then	if not A[ar] then A[ar] = {axe = -1} end
			if (A[ar].axe or -1) < ((a ~= mp or P.axe10) and 10 or 5)  then A[ar].axe = (A[ar].axe or -1) + 1 end		
			if not A[ar].axetim then A[ar].axetim = timer.start{duration = a == mp and 1 + (P.axe11 and WS/200 or 0) or 2 + WS/100, iterations = -1, callback = function()
				A[ar].axe = A[ar].axe - 1		if A[ar].axe < 0 then A[ar].axetim:cancel()	A[ar].axetim = nil end
			end} end
			Kperk = A[ar].axe * WS/20		if a ~= mp or P.axe7 then CritC = CritC + A[ar].axe * WS/50 end
		elseif wt == 6 or wt == -2 then Kperk = (1 - fat) * WS * 0.3
			if dir == 3 and (a ~= mp or P.spear9 and sw > 0.95) then CritC = CritC + 10 end
		elseif wt == 5 or wt == -3 then Kperk = math.min(a.magicka.normalized, 1) * WS * 0.3
		elseif wt > 2 then Kperk = math.min(arm,100) * WS * 0.005		hs = hs + WS/((a ~= mp or P.blu7) and 2 or 4)
		elseif wt > 0 then if not A[ar] then A[ar] = {long = 0} end
			if A[ar].longtim then A[ar].longtim:reset() else A[ar].longtim = timer.start{duration = a == mp and 0.8 + (P.long7 and WS/250 or 0) or 1.5 + WS/200, callback = function() A[ar].long = 0	A[ar].longtim = nil end} end
			if (A[ar].long or 0) < 2 then A[ar].long = (A[ar].long or 0) + 1 else A[ar].long = 0	Kperk = WS/2		if (a ~= mp or P.long12) then hs = hs + WS/2		CritC = CritC + WS/10 end end
		elseif wt == 0 then Kperk = (1 - t.health.normalized) * WS * 0.3	if a ~= mp or P.short11 then CritC = CritC + (1 - fat) * WS/5 end
			if a == mp and P.short10 and sw < 0.3 then mp.animationController.weaponSpeed = 1000000 end		--ad.animationAttackState = 0
		end
	end
end		if wt ~= 11 and (a ~= mp or P.arm2) and rw then Kcond = (1 - math.min(rw.variables.condition/w.maxCondition,1)) * math.min(a:getSkillValue(1),100)/2 end
	if w.weight == 0 then Kbonus = Kbonus + a:getSkillValue(13)*((a ~= mp or P.con8) and 0.5 or 0.2) end
end


if a == mp then
	if P.str11 then Kbonus = Kbonus + math.min(arm,50) * 0.003 end
	if P.str9 and wt < 9 and (T.Dash.timeLeft or 0) > 2 then Kbonus = Kbonus + V.dd/50 end
	if ((P.con12 and t.object.type == 1) or (P.con13 and t.object.type == 2)) then Kbonus = Kbonus + mp:getSkillValue(13)/10 end
	if w then
		if wt < 9 then
			if T.Comb.timeLeft then		local maxcom = (P[WT[wt].pc] and 4 or 3) + math.floor(WS/50) + (P.spd14 and W.DWM and 1 or 0)
				if dir == last then com = math.max(com - 2, 0) elseif dir == pred and com > 2 then com = com - 1 elseif dir ~= pred then com = math.min(com + 1, maxcom) end
				M.CombK.text = ("%s/%s"):format(com, maxcom)		T.Comb:reset()	pred = last		last = dir
			else last = dir		T.Comb = timer.start{duration = (P.spd4 and 2 or 1.5) + (WT[wt].s == 5 and P.long11 and 0.5 or 0), callback = function() com = 0	last = nil	pred = nil	M.CombK.text = "" end} end
		end
		if D.poison then
			if wt < 9 then D.poison = D.poison - math.max(100 - agi/(P.agi12 and 2 or 4),50)	M.WPB.widget.current = D.poison		if D.poison <= 0 then D.poison = nil	M.WPB.visible = false end end
			local chance = 50 + (agi/2 + mp.luck.current/4)*(P.agi13 and 2 or 1) - Tagi/2 - t.luck.current/4 - math.max(t.resistPoison,0)/2 - arm/2
			if chance > math.random(100) then tes3.applyMagicSource{reference = e.reference, source = B.poi}		if cf.m5 then tes3.messageBox("Poisoned! Chance = %d%%  Poison charges = %s", chance, D.poison or 0) end
			elseif cf.m5 then tes3.messageBox("Poison failure! Chance = %d%%  Poison charges = %s", chance, D.poison or 0) end 
		end
		if T.CST.timeLeft then local bls = mp:getSkillValue(0)		Kperk = Kperk + bls*0.3	if P.bloc5 then hs = hs + bls/2		CritC = CritC + bls/10 end		if cf.m3 then tes3.messageBox("Counterstrike!") end end
	end
else
	if t ~= mp and L.Summon[bid] then Kbonus = Kbonus - 30 end
	local MagAt = L.CMAG[bid]		if MagAt and MagAt[2] > math.random(100) then tes3.applyMagicSource{reference = ar, source = B[MagAt[1]]} end
end

local Kcrit = CritC - math.random(100)	if Kcrit < 0 then Kcrit = 0 else Kcrit = Kcrit + 20 + ((a ~= mp or P.agi8) and 10 or 0) + ((a ~= mp or P[WT[wt].p5]) and 20 or 0)
if Kcrit > cf.crit then tes3.playSound{reference = tr, sound = "critical damage"} end end

local Kdef = math.min(((ts == 3 or (t == mp and P.hev10 and ts == 0 and D.AR.h > 19)) and math.min((Tagi + t.endurance.current)/((t ~= mp or P.end2) and 10 or 20)
+ ((t ~= mp or P.bloc2) and t.readiedShield and t:getSkillValue(0)/20 or 0), 30) or 0)
+ (as == 3 and a == mp and math.max(50 - (WS + agi)/(P.agi19 and 10 or 20) - (wt == 6 and P.spear10 and 10 or 0), 0) or 0)
+ (not t.readiedShield and (not t.readiedWeapon and (t.actorType ~= 0 and (t ~= mp or P.hand20) and (t:getSkillValue(26)/10 + Tagi/20) or 0) or
((t ~= mp or P.hand9 and not W.DWM) and WT[t.readiedWeapon.object.type].h1 and (t:getSkillValue(26) + Tagi)/20 or 0)) or 0), 50) + (wt > 8 and arp == 2 and (t ~= mp or P.hev14) and t:getSkillValue(3)/5 or 0)

local stam = (t == mp and (P.end12 and 1 or 2) + ((ts == 3 or (P.hev10 and ts == 0 and D.AR.h > 19)) and (P.med10 and D.AR.m > 19 and 0 or 1) or 0)
- (ts == 0 and P.hev9 and arp == 2 and mp:getSkillValue(3)/100 or 0) - (ts ~= 0 and P.lig3 and arp == 0 and mp:getSkillValue(21)/200 or 0) - (P.med9 and D.AR.m*0.02 or 0) or 0)
+ (wt == 4 and (a ~= mp or P.blu11 and dir == 1 and sw > 0.95) and 1 or 0)

--local dam = ad.physicalDamage * math.max(100 - Kstam + Kskill + Kbonus + Kperk + Kcrit - Kdef + Kcond, 10)/100		DMG = dam * dam / (dam + arm)
DMG = DMG * math.max(100 - Kstam + Kskill + Kbonus + Kperk + Kcrit - Kdef + Kcond, 10)/100
hs = (a == mp and 500*DMG/BaseHP or math.max(5*DMG, 500*DMG/BaseHP)) * (hs + Kcrit/2)/100

if pr and t.readiedShield then
	local bloc = (t:getSkillValue(0) + Tagi/5 + t.luck.current/10) * fat * ((t ~= mp or P.bloc6) and 1.5 or 1) * ((t ~= mp or mp.actionData.animationAttackState == 2) and 1 or 0.3)
	- (WS/2 + agi/5) * (100 - Kstam)/100
	if bloc - math.random(100) > 0 then t.readiedShield.variables.condition = t.readiedShield.variables.condition - DMG
		if t == mp then mp:exerciseSkill(0, 1)	t.fatigue.current = t.fatigue.current - DMG*(P.bloc3 and 1 or 2) end
		DMG = 0	if cf.m3 then tes3.messageBox("Block projectile! Chance = %d%%", bloc) end
	elseif cf.m3 then tes3.messageBox("Fail! Block chance = %d%%", bloc) end
end

local Dred, KSM, smc, trauma = 0, 0, 0, 0
if tr.data.KS then KSM = Mag(508,tr)	if KSM > 0 then		if t.magicka.current > 5 then	KSM = KSM * (1 + (t == mp and P.una7 and D.AR.u * t:getSkillValue(17)/10000 or 0))
	local Dred = math.min(t.magicka.current/4, DMG, KSM)	smc = Dred * (t == mp and (1 + D.AR.l*0.08 + D.AR.m*0.10 + D.AR.h*0.12) * (1 - (arp == 3 and P.una8 and 0.25 or 0) - (P.alt21 and 0.25 or 0)) or 0.5)
	DMG = DMG - Dred		Mod(smc,t)		if arp == 3 then tes3.playSound{reference = tr, sound = "Spell Failure Destruction"} end
end else tr.data.KS = nil end end

if ar.data.LL then local LLM = Mag(509,ar)	if LLM > 0 then		if a.health.normalized < 1 and a.magicka.current > 5 then
	local LLhp = math.min(a.magicka.current/4, LLM/100 * DMG, a.health.base - a.health.current)		mc = LLhp * ((a ~= mp or P.res8) and 0.5 or 1)
	tes3.modStatistic{reference = ar, name = "health", current = LLhp}		Mod(mc,a)		if a.fatigue.normalized < 1 and (a ~= mp or P.res8) then a.fatigue.current = a.fatigue.current + LLhp*2 end
	if cf.m3 then tes3.messageBox("Life leech for %.1f hp (%.1f damage)  %.1f mag  Cost = %.1f", LLhp, DMG, LLM, mc) end
end else ar.data.LL = nil end end

if cf.traum then
	if stam > 0 and t.fatigue.current > 0 then t.fatigue.current = t.fatigue.current - DMG * stam end
	if DMG/BaseHP > ((t ~= mp or P.end4) and 0.1 or 0.05) then
		trauma = math.random(5 + Kcrit/10 + (sw > 0.95 and (a ~= mp or P.str7) and 10 or 0)) + 50*DMG/BaseHP - (t.endurance.current + t.luck.current + t.sanctuary)/((t ~= mp or P.luc4) and 20 or 40)
		if trauma > 0 then tes3.modStatistic{reference = tr, name = L.Traum[math.random(5)], current = - trauma} end
	end
end


local KO = math.min(math.min(100*DMG/BaseHP,40) * (((a ~= mp or P.str4 and sw > 0.95) and 2 or 1.5) + (1 - fat + t.encumbrance.normalized) * ((t ~= mp or P.end22) and 0.5 or 1)
+ ((a ~= mp or P.blu9 and sw > 0.95 and dir == 2) and (wt == 3 or wt == 4) and 0.5 or 0)) - Tagi*((t ~= mp or P.agi26) and 0.5 or 0.25), DMG)

if KO > math.random(100) then G.KOGMST.value = 0 else G.KOGMST.value = 100		hs = hs + math.max(KO,0)
	if hs < math.random(100) and t.actionData.animationAttackState ~= 1 then timer.delayOneFrame(function()
		if t.actionData.animationAttackState == 1 and not L.AG[t.actionData.currentAnimationGroup] then t.actionData.animationAttackState = 0
		else timer.delayOneFrame(function() if t.actionData.animationAttackState == 1 and not L.AG[t.actionData.currentAnimationGroup] then t.actionData.animationAttackState = 0 end end) end
	end) end
end

e.damage = DMG
if cf.m3 then tes3.messageBox([[%.1f = %.1f - %d%% stam + %d%% skill + %d%% ab + %d%% perk + %d%% crit (%d%%) + %d%% cond - %d%% def
AR %d   Hs %d%%  KO %d%%  StamK = %.2f   %.1f Shield (%.1f mag, %.1f mc)   %d traum]],
e.damage, StartD, Kstam, Kskill, Kbonus, Kperk, Kcrit, CritC, Kcond, Kdef, arm, hs, KO, stam, Dred, KSM, smc, trauma) end


if a == mp then L.skw = math.max((tr.object.level * 4 + 20 - p.object.level/2) / (tr.object.level + 20) * DMG/30, 0)
	if P.axe9 and WT[wt].s == 6 and t.health.current - DMG < 0 then A[ar].axe = math.min(A[ar].axe + 5, 10) end
else
	if t == mp then
		if P.sec3 and (mp.health.current - DMG)/BaseHP < 0.2 and not tes3.isAffectedBy{reference = p, object = B.TS} then 
			B.TS.effects[1].id = 510  B.TS.effects[1].min = 20 + mp:getSkillValue(18)/5   B.TS.effects[1].max = B.TS.effects[1].min + 10   B.TS.effects[1].duration = 3
			tes3.applyMagicSource{reference = p, source = B.TS, createCopy = false}
		end
	end
	local Pois = L.CPOI[bid]		if Pois and DMG > 0 and Pois[2] > math.random(100) then tes3.applyMagicSource{reference = tr, source = B[Pois[1]]} end
end
elseif e.source == "shield" then	e.damage = 0	local el = e.activeMagicEffect.effectId		local El = L.ELSH[el]		local ts = tes3.getSimulationTimestamp()
	if El.ts ~= ts then		local ar = e.attackerReference	local tr = e.reference
		if ar.position:distance(tr.position) < ((ar ~= p or P.alt12) and 300 or 200) then
			local mag = math.random(0, Mag(el,ar) * ((ar ~= p or P.alt22) and 1 or 0.8))		local E = B.ElSh.effects[1]		E.id = El.id	E.min = mag		E.max = mag		E.duration = 1
			SNC[(tes3.applyMagicSource{reference = tr, source = B.ElSh}).serialNumber] = e.attacker		--tes3.messageBox("%s   mag = %s   ar = %s", el, mag, ar)
		end
	end		El.ts = ts
elseif e.source == "fall" and e.reference == p and D.KS then local KSM = Mag(508)		mp:exerciseSkill(20, e.damage/20)
	if KSM > 0 and mp.magicka.current > 4 then KSM = KSM * (1 + (P.una7 and D.AR.u * mp:getSkillValue(17)/10000 or 0))
		local Dred = math.min(mp.magicka.current/4, e.damage, KSM)	mc = Dred * (1 + D.AR.l*0.08 + D.AR.m*0.10 + D.AR.h*0.12) * (P.alt21 and 0.5 or 0.75)		e.damage = e.damage - Dred		Mod(mc)
		if cf.m then tes3.messageBox("Shield! %.1f damage  %.1f reduction  %.1f mag  Cost = %.1f", e.damage, Dred, KSM, mc) end
end end end		event.register("damage", DAMAGE)



local function DAMAGEHANDTOHAND(e) local a = e.attacker	local ar = e.attackerReference	local t = e.mobile	local tr = e.reference	local ad = a.actionData		local Mult = 1
local sw = ad.attackSwing	 local dir = ad.attackDirection		local s = a:getSkillValue(26)	local fistd = 0			local agi = a.agility.current		--local Start = ad.physicalDamage / sw * 100/s
local as = (a.isMovingForward and 1) or (a.isMovingLeft or a.isMovingRight and 2) or (a.isMovingBack and 3) or 0
local ts = (t.isMovingForward and 1) or (t.isMovingLeft or t.isMovingRight and 2) or (t.isMovingBack and 3) or 0

local Kskill = s * (((a ~= mp or P.hand1) and 0.2 or 0.1) + ((a ~= mp or P.str2) and 0.1 or 0.05))		local Kbonus = a.attackBonus/5 + (a == mp and 0 or ar.object.level)
local Kstam = (50 + ((a ~= mp or P.end1) and 0 or 10) + ((a ~= mp or P.hand2) and 0 or 20)) * math.max(1-a.fatigue.normalized,0)		local Kstr = a.strength.current/2
local CritC = Kbonus + agi/((a ~= mp or P.agi1) and 10 or 20) + s/((a ~= mp or P.hand6) and 10 or 20) + ((a ~= mp or P.luc1) and a.luck.current/20 or 0) + (as == 1 and (a ~= mp or P.spd3) and 10 or 0)
+ (ts == 1 and ((t == mp and P.med10 and D.AR.m > 19 and 0 or 10) + ((t ~= mp or P.agi7) and 0 or 10)) or 0)
+ (a == mp and math.min(com, G.maxcomb) * (P.agi6 and 5 or 3) + (a.isJumping and P.acr4 and a:getSkillValue(20)/10 or 0) - 10 or 10)
- (t.endurance.current + t.agility.current)/((t ~= mp or P.end3) and 20 or 40) - ((t ~= mp or P.luc2) and t.luck.current/20 or 0) - t.armorRating/10 - t.sanctuary/10
+ math.max(1-t.fatigue.normalized,0)*((a ~= mp or P.agi11) and 20 or 10) - (t == mp and ts == 0 and P.hev11 and D.AR.h or 0)
local Kcrit = CritC - math.random(100)	if Kcrit < 0 then Kcrit = 0 else Kcrit = Kcrit + 20 + ((a ~= mp or P.agi8) and 10 or 0) + ((a ~= mp or P.hand5) and 20 or 0) end
local Kdef = math.min(((ts == 3 or (t == mp and P.hev10 and ts == 0 and D.AR.h > 19)) and math.min((t.agility.current + t.endurance.current)/((t ~= mp or P.end2) and 10 or 20)
+ ((t ~= mp or P.bloc2) and t.readiedShield and t:getSkillValue(0)/20 or 0), 30) or 0)
+ (not t.readiedShield and (not t.readiedWeapon and (t.actorType ~= 0 and (t ~= mp or P.hand20) and (t:getSkillValue(26)/10 + t.agility.current/20) or 0) or
((t ~= mp or P.hand9 and not W.DWM) and WT[t.readiedWeapon.object.type].h1 and (t:getSkillValue(26) + t.agility.current)/20 or 0)) or 0), 50)


if a == mp then
	if (not R[tr] or not R[tr].cm) and math.abs(t:getViewToActor(mp)) > 150 then Mult = 2 + (P.snek3 and mp.isSneaking and 1 or 0) + (P.hand18 and 1 or 0) end
	if P.str9 and (T.Dash.timeLeft or 0) > 2 then Kbonus = Kbonus + V.dd/50 end
	if ((P.con12 and t.object.type == 1) or (P.con13 and t.object.type == 2)) then Kbonus = Kbonus + mp:getSkillValue(13)/10 end
	if T.Comb.timeLeft then		local maxcom = (P[WT[-1].pc] and 4 or 3) + math.floor(s/50)
		if dir == last then com = math.max(com - 2, 0) elseif dir == pred and com > 2 then com = com - 1 elseif dir ~= pred then com = math.min(com + 1, maxcom) end
		M.CombK.text = ("%s/%s"):format(com, maxcom)		T.Comb:reset()	pred = last		last = dir
	else	last = dir	T.Comb = timer.start{duration = P.spd4 and 2 or 1.5, callback = function() com = 0	last = nil	pred = nil	M.CombK.text = "" end} end
elseif t == mp then Mult = P.end12 and 1 or 1.5 end

local Koef = math.max(100 + Kstr + Kskill + Kbonus + Kcrit - Kstam - Kdef, 10)
e.fatigueDamage = sw * Koef/100 * ((a ~= mp or P.hand17) and 20 or 15) * Mult

if a ~= mp or P.hand19 then
	local gau = (a ~= mp or P.hand7) and tes3.getEquippedItem{actor = ar, objectType = tes3.objectType.armor, slot = dir == 3 and 6 or 7} or nil		gau = gau and gau.object.weight*(0.3 + s/500) or 0
	fistd = sw * (s/50 + gau) * Koef/100
end


local hs = (100 + Kcrit/2 + (s + a.strength.current + agi)/((a ~= mp or P.str1) and 10 or 20) + (as == 1 and (a ~= mp or P.str3) and 20 or 0) + (a == mp and math.min(com, G.maxcomb) * (P.agi9 and 10 or 5) or 0)
+ (ts == 1 and (not (t == mp and P.med10 and D.AR.m > 19) and 30 or 0) or 0) - (t == mp and P.hev12 and D.AR.h or 0)
- (t.endurance.current + t.agility.current)/((t ~= mp or P.end5) and 5 or 10) - (ts == 0 and (t ~= mp or P.str5) and t.strength.current/10 or 0)) * e.fatigueDamage*5/t.health.base

if hs < math.random(100) and t.actionData.animationAttackState ~= 1 then timer.delayOneFrame(function()
	if t.actionData.animationAttackState == 1 and not L.AG[t.actionData.currentAnimationGroup] then t.actionData.animationAttackState = 0
	else timer.delayOneFrame(function() if t.actionData.animationAttackState == 1 and not L.AG[t.actionData.currentAnimationGroup] then t.actionData.animationAttackState = 0 end end) end
end) end


if cf.m3 then tes3.messageBox("%d Fist (%d sw)  %d%% (+ %d%% str + %d%% skill + %d%% ab + %d%% crit (%d%%) - %d%% stam - %d%% def)  HS = %d%%   Dmg = %d  x%.1f Mult",
e.fatigueDamage, sw*100, Koef, Kstr, Kskill, Kbonus, Kcrit, CritC, Kstam, Kdef, hs, fistd, Mult) end


if tr.data.KS then local KSM = Mag(508,tr)	if KSM > 0 then		if t.magicka.current > 5 then	KSM = KSM * (1 + (t == mp and P.una7 and D.AR.u * t:getSkillValue(17)/10000 or 0))
	local Dred = math.min(t.magicka.current/4, fistd, KSM)		local cmult = t == mp and (1 + D.AR.l*0.08 + D.AR.m*0.10 + D.AR.h*0.12) * (P.alt21 and 0.5 or 0.75) or 0.5		mc = 0
	if fistd > 0 then mc = Dred * cmult		fistd = fistd - Dred end
	local Stred = math.min(t.magicka.current - mc, e.fatigueDamage, KSM)		if Stred > 0 then mc = mc + Stred/5 * cmult		e.fatigueDamage = e.fatigueDamage - Stred end		Mod(mc,t)
	if cf.m3 then tes3.messageBox("Shield! %d stam damage  (-%d   -%.1f dmg) %.1f mag  Cost = %.1f", e.fatigueDamage, Stred, Dred, KSM, mc) end
end else tr.data.KS = nil end end

if fistd > 0 then t:applyDamage{damage = fistd, applyArmor = true, playerAttack = a == mp} end

if a == mp then		L.skw = math.max((tr.object.level * 4 + 20 - p.object.level/2) / (tr.object.level + 20) * e.fatigueDamage/50, 0)
	--if P.hand4 and sw < s/200 then ad.animationAttackState = 0 end
end
end		event.register("damageHandToHand", DAMAGEHANDTOHAND)


local function BLOCK(e)	local SH = mp.readiedShield		local cost = SH.object.weight * (1 - mp:getSkillValue(0)/(P.bloc3 and 125 or 200))		if cost > 0 then mp.fatigue.current = mp.fatigue.current - cost end
	if T.Shield.timeLeft then T.Shield:reset() else T.Shield = timer.start{duration = 10, callback = function() M.SHbar.visible = false end} end
	M.SHbar.widget.max = SH.object.maxCondition		M.SHbar.widget.current = SH.variables.condition		M.SHbar.visible = true
	if T.CST.timeLeft then T.CST:reset() elseif P.bloc4 then T.CST = timer.start{duration = 0.4 + (P.bloc8 and (mp.agility.current + mp:getSkillValue(0))/1000 or 0), callback = function() end} end
end		event.register("exerciseSkill", BLOCK, {filter = 0})



-- бехевиор: -1 = стоит столбом и ничего не делает хотя и в бою. 5 = убегает и не видит игрока, 6 = убегает; 3 = атака; 2 - идл (но бывает и при атаке); 0 = хеллоу; 8 = бродит
local function COMBATSTARTED(e) local m = e.actor	local ref = m.reference	 	if e.target == mp and not R[ref] and m.combatSession then	local ob = m.object
R[ref] = {m = m, a = m.actionData, ob = ob, c = 0, at = (m.actorType == 1 or ob.biped) and 1 or (not ob.usesEquipment and 3), lim = math.max((P.per7 and 70 or 100) + ob.level*(ill19 and 5 or 10), 100),
rc = L.MAC[(m.actorType == 1 and m:getSkillValue(10) > 40) and 0 or ob.baseObject.id]}
timer.delayOneFrame(function() if R[ref] then R[ref].cm = true end end)
if cf.m4 then tes3.messageBox("%s joined the battle! Enemies = %s", ob.name, table.size(R)) end
if not T.CT.timeLeft then	T.CT = timer.start{duration = 1, iterations = -1, callback = function() local s, w, beh, HD, status	--local tik5 = math.floor(T.CT.timing)%5 == 0
	if P.int4 then local ht = ad.hitTarget	if ht and not ht.isDead then M.Sbar.visible = true	M.Sbar.widget.normalized = ht.fatigue.normalized else M.Sbar.visible = false end end
	for r, t in pairs(R) do s = t.m.combatSession	beh = t.a.aiBehaviorState	w = t.m.readiedWeapon	HD = nil
		if s and s.selectedAction == 7 or (beh == 6 or beh == 5) then			--(not s or s.selectedAction == 0)
			if t.m.health.normalized > 0.1 and t.m.flee < t.lim then	HD = math.abs(pp.z - r.position.z) > 128 * (w and w.object.reach or 0.7)
				if HD then
					if t.at == 1 then	if not t.rc then t.c = t.c + 1 end
						if not w or w.object.type < 9 then
							if t.c > cf.AIsec then
								status = "STONE!"	if not t.ob.inventory:contains(L.stone) then tes3.addItem{reference = r, item = L.stone, count = math.random(2,3)} end
								mwscript.equip{reference = r, item = L.stone}	 r:updateEquipment()
							else status = "NO STONE" end
						else status = "RANGE!" end
						if s then s.selectedAction = 2 end
						t.a.aiBehaviorState = 3
					else status = "NO RUN MONSTR"	if s then s.selectedAction = 5 end
						t.a.aiBehaviorState = 3 end
				else status = "NO RUN!"		if s then s.selectedAction = t.at or 1 end		
					t.a.aiBehaviorState = 3
				end
				if t.rc and t.m.isPlayerDetected and tes3.testLineOfSight{reference1 = r, reference2 = p} then tes3.applyMagicSource{reference = r, source = B[table.choice(t.rc)]} end
			else status = "FLEE!" end
		elseif not t.m.inCombat then
			if t.m.fight > 30 then	HD = math.abs(pp.z - r.position.z) > 128 * (w and w.object.reach or 0.7)
				if HD then
					if t.at == 1 then
						if not w or w.object.type < 9 then status = "EXTRA-STONE!"
							if not t.ob.inventory:contains(L.stone) then tes3.addItem{reference = r, item = L.stone, count = math.random(1,2)} end
							mwscript.equip{reference = r, item = L.stone} r:updateEquipment()
						else status = "EXTRA-RANGE!" end
						t.m:startCombat(mp)		t.a.aiBehaviorState = 3
					else status = "NO COMBAT MONSTR!" end
				else status = "EXTRA NO LEAVE!"		t.m:startCombat(mp)		t.a.aiBehaviorState = 3 end
			else status = "CALM! - LEAVE COMBAT"	R[r] = nil end
		elseif beh == -1 then	status = "EXTRA COMBAT!"	t.m:startCombat(mp)		t.a.aiBehaviorState = 3
		else status = ""	if not w or w.object.type < 9 then t.c = t.c > cf.AIsec and cf.AIsec or 0 end end
		if cf.m4 then tes3.messageBox("%s (%d)  %s  %d fl (%d) / %d fg   HD = %s  Beh = %s/%s  SA = %s   Pdet %s", status, t.c, t.ob.name, t.m.flee, t.lim, t.m.fight, HD, beh,
		t.a.aiBehaviorState, s and s.selectedAction, t.a.target == mp and t.m.isPlayerDetected) end
	end
	if table.size(R) == 0 then T.CT:cancel()
	M.Sbar.visible = false	if cf.m4 then tes3.messageBox("The battle is over!") end end
	--if rrr then rrr:disable()	rrr.modified = false end	rrr = tes3.createReference{object = "4nm_light", scale = 3, position = e.actor.actionData.walkDestination, cell = p.cell}
end} end
end end		event.register("combatStarted", COMBATSTARTED)

--[[	local function determineAction(e)	local s = e.session		local m = s.mobile		if R[m.reference] then
tes3.messageBox("DE  %s  SA = %s  Prior = %s", m.reference, s.selectedAction, s.selectionPriority)
end end		--event.register("determineAction", determineAction)
--]]
-- не решил = 0, Атака (1 мили, 2 рейндж, 3 кричер без оружия или рукопашка), AlchemyOrSummon = 6, бегство = 7, Спелл (касание 4, цель 5, на себя 8), UseEnchantedItem = 10		s:changeEquipment()
local function onDeterminedAction(e) local s = e.session	local m = s.mobile 	local t = R[m.reference]	if t then
--tes3.messageBox("DED  %s  SA = %s  Beh = %s  fl = %d  fg = %d  Prior = %s  W = %d %s  S = %d %s  %s", m.object.name, s.selectedAction,  m.actionData.aiBehaviorState, m.flee, m.fight, s.selectionPriority,
--m.readiedWeapon and m.readiedWeapon.object.type or -1, s.selectedWeapon and s.selectedWeapon.object.name, m.readiedShield and 1 or 0, s.selectedShield and "+S" or "", s.selectedSpell and s.selectedSpell.name)
if s.selectedAction == 7 then
	if m.health.normalized > 0.1 and m.flee < t.lim then s.selectedAction = t.at or 1		t.a.aiBehaviorState = 3
		if cf.m4 then tes3.messageBox("UPD NO FLEE!  %s", t.ob.name) end
	end
end end	end		event.register("determinedAction", onDeterminedAction)

local function combatStop(e) local m = e.actor	local r = m.reference	if R[r] then local t = R[r]		local status	--событие не триггерится от контроля и успокоения
if m.fight > 30 then
	if t.at == 1 then
		if math.abs(pp.z - r.position.z) > 128 * (t.m.readiedWeapon and t.m.readiedWeapon.object.reach or 0.7) then		
			if not m.readiedWeapon or m.readiedWeapon.object.type < 9 then
				if not t.ob.inventory:contains(L.stone) then tes3.addItem{reference = r, item = L.stone, count = math.random(1,2)} end
				mwscript.equip{reference = r, item = L.stone} r:updateEquipment()
				status = "NO LEAVE + STONE"
			else status = "NO LEAVE + RANGE" end
			t.a.aiBehaviorState = 3
			if cf.m4 then tes3.messageBox("%s  %s  fg = %s   Beh = %s  SA = %s  Tar = %s", status, r, m.fight, t.a.aiBehaviorState, m.combatSession and m.combatSession.selectedAction, t.a.target and t.a.target.object.name) end
			return false
		else status = "LEAVE NPC" end
		if cf.m4 then tes3.messageBox("%s  %s  fg = %s   Beh = %s  SA = %s  Tar = %s", status, r, m.fight, t.a.aiBehaviorState, m.combatSession and m.combatSession.selectedAction, t.a.target and t.a.target.object.name) end
	else	status = "LEAVE MONSTR"
		if cf.m4 then tes3.messageBox("%s  %s  fg = %s   Beh = %s  SA = %s  Tar = %s", status, r, m.fight, t.a.aiBehaviorState, m.combatSession and m.combatSession.selectedAction, t.a.target and t.a.target.object.name) end
	end
else status = "CALM"
	if cf.m4 then tes3.messageBox("%s  %s  fg = %s   Beh = %s  SA = %s  Tar = %s", status, r, m.fight, t.a.aiBehaviorState, m.combatSession and m.combatSession.selectedAction, t.a.target and t.a.target.object.name) end
	R[r] = nil
end
end end		event.register("combatStop", combatStop)

--[[ local function onCombatStopped(e) local m = e.actor		if R[m.reference] then	-- Триггерится при кальме, но не при контроле
	if cf.m4 then tes3.messageBox("%s leave combat  fg = %s   Beh = %s  SA = %s  Enemies = %s", m.object.name, m.fight, m.actionData.aiBehaviorState, m.combatSession and m.combatSession.selectedAction, table.size(R)) end
end end		--event.register("combatStopped", onCombatStopped)
--]]

local function DETECTSNEAK(e) if e.target == mp then	local m = e.detector	local r = m.reference
--[[	local VMult = Viev < 90 and tes3.findGMST("fSneakViewMult").value or tes3.findGMST("fSneakNoViewMult").value
	local DMult = tes3.findGMST("fSneakDistanceBase").value + r.position:distance(pp) * tes3.findGMST("fSneakDistanceMultiplier").value
	local PKoef = (mp.isSneaking and mp.sneak.current * tes3.findGMST("fSneakSkillMult").value + mp.agility.current/5 + mp.luck.current/10 + mp:getBootsWeight() * tes3.findGMST("fSneakBootMult").value or 0)
	* mp:getFatigueTerm() * DMult + mp.chameleon + (mp.invisibility > 0 and 100 or 0)
	local DKoef = (m.sneak.current + m.agility.current/5 + m.luck.current/10 - m.blind) * VMult * m:getFatigueTerm()
	local chance = PKoef - DKoef		local detected = math.random(100) >= chance		e.isDetected = detected		--m.isPlayerDetected = detected		m.isPlayerHidden = not detected
--]]
local com = R[r] and R[r].cm	local snek = mp.isSneaking or (P.snek12 and mp.movementFlags == 0)
local KP = com and 0 or ((mp:getSkillValue(19) + mp.agility.current/2)*(P.snek1 and 1 or 0.5) + (P.luc10 and mp.luck.current/4 or 0) + (P.sec5 and mp:getSkillValue(18)/4 or 0)) * (snek and 0.5 or (P.snek10 and 0.2 or 0)) * math.min(mp.fatigue.normalized,1)
local KD = com and 0 or (m:getSkillValue(18) + m.agility.current/4 + m.luck.current/4)
local Koef = com and 1 or math.max((100 + KD - KP)/100, 0.5)
local DistKF = math.max(1.5 - r.position:distance(pp)/(P.snek5 and 2000 or 3000), 0.5)
local VPow = com and 200 or math.max(200 - math.abs(m:getViewToActor(mp)) * (P.snek6 and 1.2 or 1), 0)
local Vis = math.max(VPow * Koef * DistKF - (mp.invisibility > 0 and (P.snek11 and 200 or 150) - m:getSkillValue(14)/2 or 0) - mp.chameleon - m.blind, 0)
local Aud = math.max((5 + mp.encumbrance.current/5 + mp:getBootsWeight()) * ((snek and 0 or 2) + (P.snek4 and 1 or 2)) * Koef * DistKF - (P.ill21 and mp.chameleon/2 or 0) - m.sound, 0)
local chance = Vis + Aud		local detected = chance > math.random(100)		e.isDetected = detected		m.isPlayerDetected = detected		m.isPlayerHidden = not detected
if cf.m11 then tes3.messageBox("Det %s %d%%  Vis = %d%% (%d)  Aud = %d%%  DistKF = %.2f  Koef = %.2f (%d - %d)  %s", detected, chance, Vis, VPow, Aud, DistKF, Koef, KD, KP, r) end
end	end		if cf.stels then event.register("detectSneak", DETECTSNEAK) end

local function ACTIVATE(e) if e.activator == p then
if e.target.object.objectType == tes3.objectType.npc and e.target.mobile.fatigue.current < 0 then		--ref.object:hasItemEquipped(item[, itemData])
	if cf.maniac and mp.agility.current*(P.agi18 and 1 or 0.5) > 50 + 50*e.target.mobile.health.normalized + e.target.mobile.fatigue.current then
		for _, s in pairs(e.target.object.equipment) do e.target.mobile:unequip{item = s.object} end	if cf.m then tes3.messageBox("Playful hands!") end
	else if e.target.mobile.readiedWeapon then e.target.mobile:unequip{item = e.target.mobile.readiedWeapon.object} end		if e.target.mobile.readiedAmmo then e.target.mobile:unequip{item = e.target.mobile.readiedAmmo.object} end end
elseif e.target.object.objectType == tes3.objectType.apparatus and ic:isKeyDown(cf.ekey.keyCode) then	local app = {}
	for r in p.cell:iterateReferences(tes3.objectType.apparatus) do
		if (not app[r.object.type] or app[r.object.type].quality < r.object.quality) and tes3.hasOwnershipAccess{target = r} and pp:distance(r.position) < 800 then app[r.object.type] = r.object end
	end
	for i, ob in pairs(app) do tes3.addItem{reference = p, item = ob, playSound = false} end
	timer.delayOneFrame(function() local appar = app[0] or app[1] or app[2] or app[3]	if appar then
		mp:equip{item = appar}	timer.delayOneFrame(function() for i, ob in pairs(app) do tes3.removeItem{reference = p, item = ob, playSound = false} end end)
	end end)
	return false
end		-- if e.activator == p and wc.inputController:isKeyDown(cf.telkey.keyCode) and e.target ~= W.TETR then TELnew(e.target)	return false end
end end		event.register("activate", ACTIVATE)

L.Improve = function(e) if e.item then	local cost = (e.item.value * (P.arm11 and 2 or 3))^0.5
	if G.ImpC - cost >= math.random(100) then	e.itemData.condition = e.item.maxCondition * (1 + G.ImpKF)
		tes3.messageBox("You successfully improved %s  Chance = %.2f (%.2f - %.2f cost)", e.item.name, (G.ImpC - cost), G.ImpC, cost)		tes3.playSound{sound = "repair"}
	else	e.itemData.condition = e.item.maxCondition * math.min((0.5 + mp.armorer.base/(P.arm8 and 250 or 500)), 0.9)
		tes3.messageBox("You failed to improve %s  Chance = %.2f (%.2f - %.2f cost)", e.item.name, (G.ImpC - cost), G.ImpC, cost)			tes3.playSound{sound = "repair fail"}
	end
end end
L.ImpFilt = function(e) if ((e.item.objectType == tes3.objectType.weapon and e.item.type ~= 11 and P.arm4) or (e.item.objectType == tes3.objectType.armor and P.arm5)) and (not e.item.enchantment or P.arm10) and
e.item.weight ~= 0 and G.ImpC - (e.item.value * (P.arm11 and 2 or 3))^0.5 >= cf.impmin then
	if not e.itemData then tes3.addItemData{to = p, item = e.item} end	if e.itemData then return e.itemData.condition >= e.item.maxCondition end
else return false end end

local function EQUIP(e) if e.reference == p and e.item.weight > 0 then local o = e.item
if (o.objectType == tes3.objectType.alchemy or o.objectType == tes3.objectType.ingredient) then
	if o.objectType == tes3.objectType.alchemy and M.drop.visible then local Btab = L.BotMod[o.mesh:lower()]	if Btab then	local ispoison = true
		if cf.smartpoi then ispoison = nil		for i, ef in ipairs(o.effects) do if ef.object and ef.object.isHarmful then ispoison = true break end end end
		if ispoison then
			if ic:isKeyDown(cf.ekey.keyCode) then -- кидание бутылок
				if not G.pbotswap then G.pbotswap = true	local bot = L.pbottle
					if mp.readiedWeapon and mp.readiedWeapon.object == bot then mp:unequip{item = bot} end
					timer.delayOneFrame(function() G.pbotswap = nil
						local numdel = tes3.getItemCount{reference = p, item = bot}		if numdel > 0 then
							tes3.removeItem{reference = p, item = bot, count = numdel}		tes3.addItem{reference = p, item = D.poisonbid, count = numdel}		D.poisonbid = nil
							if cf.m5 then tes3.messageBox("%d %s", numdel, cf.en and "bottles unequipped" or "старых бутылок снято") end
						end
						local num = tes3.getItemCount{reference = p, item = o}	if num > 0 then		local enc = tes3.getObject("4nm_e_poisonbottle")	local E = enc.effects	local pow = P.alc7 and 3 or 4
							for i, ef in ipairs(o.effects) do E[i].id = ef.id		E[i].radius = 5		E[i].min = L.nomag[ef.id] and ef.min or ef.min/pow		E[i].max = L.nomag[ef.id] and ef.max or ef.max/pow
							E[i].duration = L.nomag[ef.id] and ef.duration/pow or ef.duration	E[i].rangeType = 1		E[i].attribute = ef.attribute		E[i].skill = ef.skill end
							bot.mesh = Btab[1]	bot.icon = Btab[2]	bot.weight = o.weight	D.poisonbid = o.id		enc.modified = true		bot.modified = true		
							tes3.removeItem{reference = p, item = o, count = num}		tes3.addItem{reference = p, item = bot, count = num}		mp:equip{item = bot}
							if cf.m5 then tes3.messageBox("%d %s", num, cf.en and "bootles are ready!" or "бутылок готово к броску!") end
						end
					end)
					return false
				else tes3.messageBox("Not so fast!") return false end
			else -- отравление оружия
				timer.delayOneFrame(function() if tes3.getItemCount{reference = p, item = o} > 0 then	local pow = P.alc5 and 5 or 6
					for i, ef in ipairs(o.effects) do
						B.poi.effects[i].id = ef.id	B.poi.effects[i].min = L.nomag[ef.id] and ef.min or ef.min/pow		B.poi.effects[i].max = L.nomag[ef.id] and ef.max or ef.max/pow
						B.poi.effects[i].duration = L.nomag[ef.id] and ef.duration/pow or ef.duration		B.poi.effects[i].attribute = ef.attribute		B.poi.effects[i].skill = ef.skill
					end
					D.poison = 100 + (mp.alchemy.current + mp.agility.current) * (P.alc6 and 1 or 0.5)		M.WPB.widget.current = D.poison		M.WPB.visible = true
					tes3.removeItem{reference = p, item = o}
					if cf.m5 then tes3.messageBox("%s %d", cf.en and "Poison is ready! Charges =" or "Яд готов! объем =", D.poison) end
				end end)
				return false
			end
		end
	end end

	if D.potmcd then
		if cf.m5 then if cf.en then tes3.messageBox("Not so fast! I need at least %d seconds to swallow what is already in my mouth!", D.potmcd)
		else tes3.messageBox("Не так быстро! Мне надо еще хотя бы %d секунды чтобы проглотить то что уже у меня во рту!", D.potmcd) end end		return false
	elseif D.potcd and D.potcd > G.potlim then
		if cf.m5 then if cf.en then tes3.messageBox("Belly already bursting! I can't take o anymore... I have to wait at least %d seconds before I can swallow something else", D.potcd - G.potlim)
		else tes3.messageBox("Пузо уже по швам трещит! Больше не могу... Надо подождать хотя бы %d секунд прежде, чем я смогу заглотить что-то еще", D.potcd - G.potlim) end end	return false
	end
	D.potmcd = math.max((P.spd5 and 8 or 10) - mp.speed.current/20, 2)		D.potcd = (D.potcd or 0) + math.max(40 - (P.alc9 and mp.alchemy.current/10 or 0), 30)
	if not T.POT.timeLeft then T.POT = timer.start{duration = 1, iterations = -1, callback = function() D.potcd = D.potcd - 1	if D.potmcd then D.potmcd = D.potmcd - 1	if D.potmcd <= 0 then D.potmcd = nil end end
		if D.potmcd and D.potmcd > D.potcd - G.potlim then M.PCD.max = 5	M.PCD.current = D.potmcd else M.PCD.max = 30	M.PCD.current = D.potcd - G.potlim	if M.PCD.current <= 0 then M.PIC.visible = false end end
		if D.potcd <= 0 then D.potcd = nil	T.POT:cancel() end
	end} end
	M.PCD.max = 5	M.PCD.current = 5	M.PIC.visible = true	if cf.m5 then tes3.messageBox("%s %d / %d", cf.en and "Om-nom-nom! Belly filled at" or "Ням-ням! Пузо заполнилось на", D.potcd, G.potlim) end
elseif o.objectType == tes3.objectType.repairItem and not mp.inCombat then		local anvil		local Anvil = {furn_anvil00 = true, furn_t_fireplace_01 = true, furn_de_forge_01 = true, furn_de_bellows_01 = true, Furn_S_forge = true}
	if P.arm7 then for r in p.cell:iterateReferences(tes3.objectType.static) do if Anvil[r.object.id] and pp:distance(r.position) < 800 then anvil = true	break end end end
	G.ImpKF = math.min(mp:getSkillValue(1)/2000 * o.quality, 0.1) * (P.arm9 and 1 or 0.5) * (anvil and 1.5 or 1)
	G.ImpC = math.min((mp:getSkillValue(1) + mp.luck.current/5 + mp.agility.current/5) * o.quality/2, 150) + (anvil and math.min(mp:getSkillValue(1)/2, 50) or 0) + (P.luc9 and 20 or 0)
	tes3.findGMST("fRepairAmountMult").value = 1 + (anvil and 1 or 0) + (P.arm1 and 1 or 0)
	if P.arm4 or P.arm5 then if ic:isKeyDown(cf.ekey.keyCode) then tes3ui.showInventorySelectMenu{title = "Improve weapons and armor", noResultsText = "No items that you can improve", filter = L.ImpFilt, callback = L.Improve} return false
	else timer.start{duration = 0.1, callback = function() tes3ui.showInventorySelectMenu{title = "Improve weapons and armor", noResultsText = "No items that you can improve", filter = L.ImpFilt, callback = L.Improve} end} end end
elseif e.item.objectType == tes3.objectType.weapon and ic:isKeyDown(cf.gripkey.keyCode) and not W.AltWCD then
	if L.AltW[o.type] then	local New	local ida = e.itemData	local wg = o.weight
		if o.id:sub(1,2) == "4_" and tes3.getObject(o.id:sub(3)) then New = tes3.getObject(o.id:sub(3)) else	local K = o.isOneHanded and 1.25 or 0.8
			New = tes3.createObject{objectType = tes3.objectType.weapon, id = "4_" .. o.id, type = L.AltW[o.type]}
			New.name = o.name	New.mesh = o.mesh	New.icon = o.icon	New.enchantment = o.enchantment		New.weight = wg		New.value = o.value		New.maxCondition = o.maxCondition
			New.flags = o.flags		New.ignoresNormalWeaponResistance = o.ignoresNormalWeaponResistance		New.isSilver = o.isSilver		New.reach = o.reach		New.enchantCapacity = o.enchantCapacity
			New.speed = math.round((o.isOneHanded and math.clamp(wg > 10 and 2.5 - wg*3/(wg+20) or 2.5 - wg/10, 0.3, 2) or math.max(wg > 15 and 2 - wg*3/(wg+30) or 2.5 - wg/10, 0.3))*20)/20
			New.chopMin = o.chopMin*K	New.chopMax = o.chopMax*K	New.slashMin = o.slashMin*K		New.slashMax = o.slashMax*K		New.thrustMin = o.thrustMin*K		New.thrustMax = o.thrustMax*K
		end
		tes3.addItem{reference = tes3.player, item = New}		--itemData = ida
		if ida then local DAT = tes3.addItemData{to = p, item = New}	DAT.condition = ida.condition		if ida.charge then DAT.charge = ida.charge end end
		W.AltWCD = true		mp:equip{item = New}		timer.delayOneFrame(function() tes3.removeItem{reference = p, item = o, playSound = false}	W.AltWCD = nil end, timer.real)			return false
	end
end
end end		event.register("equip", EQUIP)


-- Во время события equipped mp.readiedWeapon == нил! Надо ждать фрейм
local function EQUIPPED(e) if e.reference == p then	local o = e.item
if o.objectType == tes3.objectType.weapon then local od = e.itemData	timer.delayOneFrame(function() L.GetWstat() end, timer.real)
	if WT[o.type].dw then		if not ((o == W.WL and od == W.DL) or (o == W.WR and od == W.DR)) then	L.DWMOD(false)		L.DWNEW(o, od, ic:isKeyDown(cf.ekey.keyCode)) end
	else L.DWMOD(false)
		if o.type == 9 and (mp.readiedAmmo and mp.readiedAmmo.object.type or 0) ~= 12 then
			for _, s in pairs(inv) do if s.object.type == 12 then mwscript.equip{reference = p, item = s.object} if cf.m8 then tes3.messageBox("arrows equipped") end break end end
		elseif o.type == 10 and (mp.readiedAmmo and mp.readiedAmmo.object.type or 0) ~= 13 then
			for _, s in pairs(inv) do if s.object.type == 13 then mwscript.equip{reference = p, item = s.object} if cf.m8 then tes3.messageBox("bolts equipped") end break end end
		end
	end
	if cf.autoshield and not W.DWM and WT[o.type].h1 and not mp.readiedShield then
		for _, s in pairs(inv) do if s.object.objectType == tes3.objectType.armor and s.object.slot == 8 then mwscript.equip{reference = p, item = s.object} break end end
	end
elseif o.objectType == tes3.objectType.armor then L.GetArmT()		if o.slot == 8 then L.DWMOD(false) end
elseif L.DWOBT[o.objectType] then L.DWMOD(false) end
end end		event.register("equipped", EQUIPPED)



local function UNEQUIPPED(e) if e.reference == p then local it = e.item
if it.objectType == tes3.objectType.weapon then		if D.lw then local w = tes3.getObject(D.lw.id)	w.reach = D.lw.r	D.lw = nil end		L.GetWstat()
	if it == W.ob then W.ob = nil		W.f = nil	W.BAR.visible = false end
	if it == L.pbottle and not G.pbotswap then timer.delayOneFrame(function() local num = mwscript.getItemCount{reference = p, item = it} if num > 0 then
		tes3.removeItem{reference = p, item = it, count = num}		tes3.addItem{reference = p, item = D.poisonbid, count = num}	D.poisonbid = nil
		if cf.m5 then tes3.messageBox("%d bottles unequipped", num) end
	end end) end
else	if it.objectType == tes3.objectType.armor then L.GetArmT() end		if it.enchantment and it.enchantment.castType == 3 then ConstEnLim() end
end end end		event.register("unequipped", UNEQUIPPED)


local function WEAPONREADIED(e) if e.reference == p then	G.HandReach.value = (P.hand11 or e.weaponStack) and 0.7 or 0.5	
	if mp.readiedShield then G.BlockMult.value = P.bloc1 and 2 or 0.5
		if P.bloc9 then G.BlockMax.value = 100			G.BlockLeft.value = -1		G.BlockRight.value = 0.5 end
	else G.BlockMax.value = 90	G.BlockMult.value = 2	G.BlockLeft.value = -0.666	G.BlockRight.value = 0.333 end
	if W.DWM then if e.weaponStack then L.Cul(true) else L.DWMOD(false) end end
end end		event.register("weaponReadied", WEAPONREADIED)

local function WEAPONUNREADIED(e) if e.reference == p then	if W.DWM then L.Cul(false) end
	G.HandReach.value = 0.7		G.BlockMax.value = 90		G.BlockMult.value = 2		G.BlockLeft.value = -0.666		G.BlockRight.value = 0.333
end end		event.register("weaponUnreadied", WEAPONUNREADIED)


local function ITEMDROPPED(e) local r = e.reference
	if BAM[r.object.id] then r:delete()		if cf.m then tes3.messageBox("Ammo unbound") end
	elseif r.object == L.pbottle then local num = r.stackSize	tes3.addItem{reference = p, item = D.poisonbid, count = num}
		r:delete()	if cf.m5 then tes3.messageBox("%d %s", num, cf.en and "old bottles unequipped" or "старых бутылок снято") end
	elseif ic:isKeyDown(cf.telkey.keyCode) then TELnew(r) end	-- ic:isKeyDown(cf.telkey.keyCode)
end		event.register("itemDropped", ITEMDROPPED)

local function FILTERINVENTORY(e) if L.BlackItem[e.item.id] and M.Stat and M.Stat.visible == false then e.filter = false end end		event.register("filterInventory", FILTERINVENTORY, {priority = -1000})
--local function filterContentsMenu(e) e.filter = true end		event.register("filterContentsMenu", filterContentsMenu, {priority = -1000})


local function SPELLCREATED(e) local s = e.spell	local del, rt
for i, ef in ipairs(s.effects) do if ef.id ~= -1 and ef.rangeType ~= 1 then if rt then if ef.rangeType ~= rt then del = true	break end else rt = ef.rangeType end end end
if del then	timer.delayOneFrame(function() mwscript.removeSpell{reference = p, spell = s}	timer.delayOneFrame(function() tes3.deleteObject(s) 	tes3.messageBox("Anti-exploit! Spell deleted!") end) end) end
end		if cf.aspell then event.register("spellCreated", SPELLCREATED, {filter = "service"}) end

local function MENUSETVALUES(e) local MSVD = e.element:findChild(-789) if MSVD then		local MSVI = e.element:findChild(-32588)		e.element:findChild(-783):registerBefore("mouseClick", function()
	local min = (L.MEDUR[MSVI.contentPath:sub(9,-5):lower()] or 0) * (P.int10 and 1 or 2)
	if MSVD.widget.current < min then tes3.messageBox("Minimum duration = %s", min) return false end
end) end end		if cf.durlim then event.register("uiActivated", MENUSETVALUES, {filter = "MenuSetValues"}) end

local function ENEVENT(e) if e.property == tes3.uiProperty.mouseClick then	--tes3.messageBox("Эвент id = %s   top = %s", e.block.id, tes3ui.getMenuOnTop().id)
	if e.block.id == -267 or e.block.id == -268 then	if tes3ui.getMenuOnTop().id ~= -264 then event.unregister("uiEvent", ENEVENT) end
	else	local MENCH = tes3ui.findMenu(-264)
		if MENCH then tes3.findGMST("fEnchantmentConstantDurationMult").value = math.max((P.enc13 and 40000 or 50000)/math.max(MENCH:findChild(-296).text,200),100) end
	end
end end

local function MENUENCHANTMENT(e) event.register("uiEvent", ENEVENT)	if cf.spmak then
e.element.minWidth = 1200	e.element.minHeight = 800		local vol = 15	local EL = e.element:findChild(-1155)	local lin = math.ceil(#EL.children/vol)
local M0 = e.element:findChild(-1260)		M0.width = 32*(vol+1)
EL.minWidth = 32*(vol+1)	EL.maxWidth = EL.minWidth	EL.minHeight = 32*(lin+1)	EL.maxHeight = EL.minHeight		EL.autoHeight = true	EL.autoWidth = true
for i, s in ipairs(EL.children) do s.minHeight = 32		s.minWidth = 32		s.autoHeight = true		s.autoWidth = true	s.text = nil
s:createImage{path = "icons\\" .. s:getPropertyObject("MenuEnchantment_Effect").bigIcon}	s.absolutePosAlignX = 1/vol * ((i%vol > 0 and i%vol or vol)-1)		s.absolutePosAlignY = 1/lin * (math.ceil(i/vol)-1) end
end end		event.register("uiActivated", MENUENCHANTMENT, {filter = "MenuEnchantment"})

local function MENUSPELLMAKING(e)	e.element.minWidth = 1200	e.element.minHeight = 800		local vol = 15	local EL = e.element:findChild(-1155)	local lin = math.ceil(#EL.children/vol)
local M0 = e.element:findChild(-827).parent		M0.width = 32*(vol+1)
EL.minWidth = 32*(vol+1)	EL.maxWidth = EL.minWidth	EL.minHeight = 32*(lin+1)	EL.maxHeight = EL.minHeight		EL.autoHeight = true	EL.autoWidth = true
for i, s in ipairs(EL.children) do s.minHeight = 32		s.minWidth = 32		s.autoHeight = true		s.autoWidth = true	s.text = nil
s:createImage{path = "icons\\" .. s:getPropertyObject("MenuSpellmaking_Effect").bigIcon}	s.absolutePosAlignX = 1/vol * ((i%vol > 0 and i%vol or vol)-1)		s.absolutePosAlignY = 1/lin * (math.ceil(i/vol)-1) end
end		if cf.spmak then event.register("uiActivated", MENUSPELLMAKING, {filter = "MenuSpellmaking"}) end

L.ALF={[1]={75,76,77,74,79,80,81,82,117,72,73,69,70,90,91,92,93,97,99,94}, [2]={10,8,4,5,6,1,2,0,41,43,39,57,67,68,59,64,65,66}, [3]={27,23,24,25,22,18,19,20,17,35,28,29,30,31,7,45,47}, [4]={}}	L.ALFEF = {[17]=0, [22]=0, [74]=0, [79]=0, [85]=0}
L.ALE = {[75]={5,20}, [76]={5,30}, [77]={10,60}, [74]={5,10}, [79]={20,60}, [83]={20,60}, [80]={20,60}, [81]={100,60}, [82]={100,120}, [84]={10,60}, [117]={30,60}, [42]={30,60}, [72]={1,1}, [73]={1,1}, [69]={1,1}, [70]={1,1},
[90]={30,60}, [91]={30,60}, [92]={30,60}, [93]={30,60}, [97]={30,60}, [98]={30,60}, [99]={30,60}, [94]={50,120}, [95]={50,120}, [96]={30,60},
[10]={10,30}, [8]={100,120}, [3]={30,60}, [4]={10,30}, [5]={10,30}, [6]={10,30}, [1]={30,60}, [2]={1,30}, [0]={1,60}, [9]={20,30}, [11]={20,60},
[41]={30,120}, [43]={30,120}, [39]={1,30}, [40]={30,60}, [57]={100,1}, [67]={10,60}, [68]={10,60}, [59]={30,60}, [64]={200,120}, [65]={200,120}, [66]={200,120},
[27]={5,20}, [23]={5,20}, [14]={5,20}, [15]={5,20}, [16]={5,20}, [24]={10,30}, [25]={10,30}, [22]={3,15}, [18]={50,60}, [19]={100,60}, [20]={100,60}, [17]={30,60}, [21]={30,60},
[28]={30,60}, [29]={30,60}, [30]={30,60}, [31]={30,60}, [34]={30,60}, [35]={30,60}, [36]={30,60}, [32]={50,120}, [33]={50,120}, [7]={100,60}, [45]={1,5}, [46]={1,10}, [47]={50,60}, [48]={50,60}}

local function MENUALCHEMY(e)	M.Alc = e.element
	local RFI = e.element:findChild(-1111):findChild(-32588):createImage{path = "icons\\potions_blocked.tga"}
	RFI:register("help", function() local tt = tes3ui.createTooltipMenu():createBlock{}	tt.autoHeight = true	tt.autoWidth = true		tt:createLabel{text = "Reset alchemy filter"} end)
	RFI:register("mouseClick", function() M.Alf = nil	M.AlfAt = nil	tes3.messageBox("Alchemy filter reset") end)
	M.AlcCH = e.element:createLabel{text = ("Chance %s%%"):format(cf.alc and "?" or math.floor(mp.alchemy.current + mp.intelligence.current/10 + mp.luck.current/10))}
	M.AlcCH.absolutePosAlignY = -0.1	M.AlcCH.positionY = -247 		e.element:updateLayout()
	if cf.alc and not P.alc21 then M.Alc:findChild(-25):registerBefore("mouseClick", function() tes3.messageBox("%s", cf.en and "You are not yet skilled enough to brew 4-ingredient potions" or
	"Вы еще недостаточно искусны чтобы варить зелья из 4 ингредиентов")		return false end) end
end		event.register("uiActivated", MENUALCHEMY, {filter = "MenuAlchemy"})

local function POTIONBREWSKILLCHECK(e)	local Al, Int, Luc, Agi, Mort, Cal, Ret, Alem = mp.alchemy.base, mp.intelligence.base, mp.luck.base, mp.agility.base, math.min(e.mortar.quality,2),
	e.calcinator, e.retort, e.alembic			Cal, Ret, Alem = (Cal and math.min(Cal.quality or 0,2) or 0), (Ret and math.min(Ret.quality or 0,2) or 0), (Alem and math.min(Alem.quality or 0,2) or 0)
	local pow0 = Al/2 + Int/10 + Mort*20 + (P.luc12 and Luc/10 or 0)		local pow = math.min(pow0,100)
	local Chance = Al*(P.alc13 and 1 or 0.5) + Mort*20 + Int/5 + Agi/5 + Luc*(P.luc12 and 0.3 or 0.1) + math.max(pow0-100,0) - (Ret + Cal + Alem) * (P.alc17 and 10 or 20)
	local Mag = (P.alc3 and 60 or 40) + Ret * (P.alc14 and 10 or 5) + Cal * (P.alc16 and 10 or 5)
	local Dur = (P.alc4 and 60 or 40) + Alem * (P.alc15 and 10 or 5) + Cal * (P.alc16 and 10 or 5)
	if math.random(100) <= Chance then e.potionStrength = pow	e.success = true
	elseif P.alc18 and Chance > 20 then pow = pow * math.random(1,Chance)/100	e.potionStrength = pow		e.success = true	else e.potionStrength = -1	e.success = false end
	G.PotM = Mag * pow/10000	G.PotD = Dur * pow/10000
	M.AlcCH.text = ("Chance %d%%  Power %d%%/%d%%/%d%%"):format(Chance, pow, Mag, Dur)		M.Alc:updateLayout()
end		if cf.alc then event.register("potionBrewSkillCheck", POTIONBREWSKILLCHECK) end

local function POTIONBREWED(e)	local ob = e.object		local Alem = e.alembic		Alem = Alem and math.min(Alem.quality or 0,2)*(P.alc19 and 1 or 0.5) or 0
--local q = L.BotIc[ob.icon]	if q then ob.mesh = ("m\\misc_potion_%s_01.nif"):format(q) end	--ob.icon = ("potions\\%s_%s.dds"):format(q, ob.effects[1].id)

local cost = 0	for _, i in ipairs(e.ingredients) do if i then cost = cost + i.value end end	mp:exerciseSkill(16, cost/50)
if cf.alc then	local E = {}	local norm = not M.drop.visible		local gold = 40
	for i, ef in ipairs(ob.effects) do E[i] = ef	if ef.id ~= -1 then local AE = L.ALE[ef.id]		local harm = norm == ef.object.isHarmful		gold = gold + (harm and -20 or 20)
	if AE then E[i].min = math.max(G.PotM * AE[1]/(harm and (1 + Alem*2) or 1), 1)		E[i].max = E[i].min		E[i].duration = math.max(G.PotD * AE[2]/(harm and (1 + Alem) or 1), 1) end end end
	tes3.removeItem{reference = p, item = ob, playSound = false}
	tes3.addItem{reference = p, item = tes3alchemy.create({name = ob.name, mesh = ob.mesh, icon = ob.icon, weight = P.alc20 and 0.3 or 0.5, value = G.PotM * G.PotD * math.max(gold,10) * (P.alc8 and 1 or 0.5), effects = E}), playSound = false}
end			--	tes3.messageBox("id = %s  name = %s   cost = %d", ob.id, ob.name, cost)
end		event.register("potionBrewed", POTIONBREWED)

local function FilterEnchant(e) if M.EncFilt then local o = e.item	 if o.objectType == tes3.objectType.weapon and not o.enchant and o.id:sub(1,2) == "4_" and tes3.getObject(o.id:sub(3)) then e.filter = false end end end
local function FilterAlc(e) if M.Alf and e.item.objectType == tes3.objectType.ingredient then local filt = false	for i, ef in ipairs(e.item.effects) do if ef == M.Alf then
	if L.ALFEF[ef] and M.AlfAt then if e.item.effectAttributeIds[i] == M.AlfAt then filt = true	break end else filt = true	break end
end end		e.filter = filt end end

local function MENUINVENTORYSELECT(e) e.element.height = 1000	e.element.width = 800	local Name = e.element:findChild(-344).text
if Name == tes3.findGMST("sIngredients").value then		if not M.AlcFilt then event.register("filterInventorySelect", FilterAlc)	M.AlcFilt = true end		local EL = {{},{},{},{}}
	for l, tab in ipairs(L.ALF) do if (M.drop.visible and l > 2) or (not M.drop.visible and l ~=3) then	EL[l].b = e.element:createThinBorder{}	EL[l].b.autoHeight = true	EL[l].b.autoWidth = true	for i, ef in ipairs(tab) do
		EL[l][i] = EL[l].b:createImage{path = "icons/s/b_" .. tes3.getMagicEffect(ef).icon:sub(3)}		EL[l][i]:register("mouseClick", function() M.Alf = ef	tes3ui.updateInventorySelectTiles() end)
		EL[l][i]:register("help", function() local tt = tes3ui.createTooltipMenu():createBlock{}	tt.autoHeight = true	tt.autoWidth = true		tt:createLabel{text = tes3.getMagicEffect(ef).name} end)
	end end end
	for i = 0, 7 do EL[4][i] = EL[4].b:createImage{path = L.ATRIC[i]}		EL[4][i]:register("mouseClick", function() M.AlfAt = i	tes3ui.updateInventorySelectTiles() end)
	EL[4][i]:register("help", function() local tt = tes3ui.createTooltipMenu():createBlock{}	tt.autoHeight = true	tt.autoWidth = true		tt:createLabel{text = L.ATR[i]} end) end
	EL[4][8] = EL[4].b:createImage{path = "icons/k/magic_alchemy.dds"}		EL[4][8]:register("mouseClick", function() M.AlfAt = nil	tes3ui.updateInventorySelectTiles() end)
	EL[4][8]:register("help", function() local tt = tes3ui.createTooltipMenu():createBlock{}	tt.autoHeight = true	tt.autoWidth = true		tt:createLabel{text = "All Attributes"} end)
	EL[4][9] = EL[4].b:createImage{path = "icons/potions_blocked.tga"}		EL[4][9]:register("mouseClick", function() M.Alf = nil	M.AlfAt = nil	tes3ui.updateInventorySelectTiles() end)
	EL[4][9]:register("help", function() local tt = tes3ui.createTooltipMenu():createBlock{}	tt.autoHeight = true	tt.autoWidth = true		tt:createLabel{text = "Reset alchemy filter"} end)
--[[
e.element.width = 1200	local vol = 20	local num = #e.element:findChild(-1155).children	local stolb, lin	--tes3.messageBox("children = %s", num)
for i, s in ipairs(e.element:findChild(-1155).children) do	s.height = 40		s.width = 300	s.autoHeight = true		s.autoWidth = true
	lin = i%vol		if lin == 0 then lin = vol end		stolb = (i - lin)/vol
	s.absolutePosAlignX = stolb * 0.36		s.absolutePosAlignY = (lin - 1) * 0.05
	--s.positionX = stolb * 300		s.positionY = (lin - 1) * -42
	tes3.messageBox("width = %s", s.width)
end
--]]
else	if Name == tes3.findGMST("sEnchantItems").value and not M.EncFilt then	event.register("filterInventorySelect", FilterEnchant)	M.EncFilt = true end
end end		event.register("uiActivated", MENUINVENTORYSELECT, {filter = "MenuInventorySelect"})

local function ITEMTILEUPDATED(e)	local ob = e.item
	if ob.objectType == tes3.objectType.alchemy then	local eob = ob.effects[1].object	if eob then
		local Eic = e.element:createImage{path = ("icons\\%s"):format(eob.icon)}		--("icons\\s\\b_%s.tga"):format(icon)	Eic.width = 16		Eic.height = 16		Eic.scaleMode = true
		Eic.absolutePosAlignX = 1.0		Eic.absolutePosAlignY = 0.2		Eic.consumeMouseEvents = false
	end
end end		if cf.lab then event.register("itemTileUpdated", ITEMTILEUPDATED) end

local function MENUEXIT(e)
	if M.EncFilt then M.EncFilt = nil 	event.unregister("filterInventorySelect", FilterEnchant) end
	if M.AlcFilt then M.AlcFilt = nil	event.unregister("filterInventorySelect", FilterAlc) end
end			event.register("menuExit", MENUEXIT)

local function MENUQUICK(e)	local Q = {}	Q.bl = e.element:createThinBorder{}		Q.bl.autoHeight = true	Q.bl.autoWidth = true
for i = 1, 10 do	local s = D.QSP[tostring(i)] and tes3.getObject(D.QSP[tostring(i)])		Q[i] = Q.bl:createImage{path = s and "icons\\" .. s.effects[1].object.bigIcon or "icons/k/magicka.dds"}
	if s then if M.QB.normalized == 1 then
		Q[i]:register("mouseClick", function() D.QSP["0"] = tostring(i)		QS = tes3.getObject(D.QSP[D.QSP["0"]])		M.Qicon.contentPath = "icons\\" .. QS.effects[1].object.bigIcon
			tes3.messageBox("%s prepared for extra-cast  Slot %s  %s", QS.name, D.QSP["0"], QS.alwaysSucceeds and "Is a technique" or "")
		end) end
	elseif i == 10 then Q[i]:register("mouseClick", function() D.QSP["0"] = nil		tes3.messageBox("Universal extra-cast slot") end) end
	Q[i]:register("help", function() local tt = tes3ui.createTooltipMenu():createBlock{}	tt.autoHeight = true	tt.autoWidth = true
	tt:createLabel{text = s and ("Extra-cast slot %s  -  %s    Cost = %s    %s"):format(i, s.name, s.magickaCost, s.alwaysSucceeds and "Is a technique" or "") or ("Extra-cast slot %s  -  %s"):format(i, i == 10 and "Universal" or "Empty")} end)
end	e.element:updateLayout() end		event.register("uiActivated", MENUQUICK, {filter = "MenuQuick"})

local function UISPELLTOOLTIP(e) local tt = e.tooltip:findChild(tes3ui.registerID("helptext"))	tt.text = ("%s (%d)"):format(tt.text, e.spell.magickaCost) end		event.register("uiSpellTooltip", UISPELLTOOLTIP)


--local function ENCHANTEDITEMCREATED(e)	tes3.messageBox("[enchantedItemCreated] Item: %s; Base: %s; Soul: %s (%s); Enchanter: %s", e.object, e.baseObject, e.soulGem, e.soul, e.enchanterReference)
--end		event.register("enchantedItemCreated", ENCHANTEDITEMCREATED)


local function BARTEROFFER(e)	local m = e.mobile	local k = 0		local C		--#e.selling	#e.buying	tile.item, tile.count
if e.value > 0 then k = e.offer/e.value - 1 else k = e.value/e.offer - 1 end
if k > 0 then	local k0 = 0.1 + (((e.value > 0 and P.merc12) or (e.value < 0 and P.merc11)) and 0.1 or 0) + (P.luc5 and math.min(mp.luck.current,100)/2000 or 0)
	if k <= k0 then C = math.min(m.object.disposition or 50, 100) - 100*k/k0 + mp.mercantile.current/2 - m:getSkillValue(24)*2 + (P.merc4 and 10 or 0) + mp.speechcraft.current/(P.spec10 and 5 or 10) else C = 0 end
	if cf.m6 then tes3.messageBox("Chance = %d  Koef = %.1f%%  Max = %.1f%%  Gold = %d (%d - %d) Merc = %d  Disp = %d", C, k*100, k0*100, e.offer - e.value, e.offer, e.value, m:getSkillValue(24), m.object.disposition or 50) end
	e.success = math.random(100) < C		if e.success then mp:exerciseSkill(24, math.abs(e.value)/1000 + (e.offer - e.value)/50) end
end
end

local function BarterK(m) local rang = m.object.faction and m.object.faction.playerRank + 1 or 0		return rang,
(mp.mercantile.current + mp.speechcraft.current/(P.spec3 and 5 or 10) + mp.personality.current/(P.per3 and 5 or 10) + (P.luc5 and mp.luck.current/10 or 0) + rang*(P.spec5 and 10 or 5) + (P.per8 and p.object.factionIndex/2 or 0))/200,
(m:getSkillValue(24) + m:getSkillValue(25)/5 + m.personality.current/5 + m.luck.current/10 + 150 - math.min(m.object.disposition or 50, 100))/200
end
local function CALCBARTERPRICE(e)	local rang, k1, k2 = BarterK(e.mobile)		--if e.item.id == "Gold_001" then e.price = e.count
	local k0 = 1 + (e.buying and (P.merc10 and 0.5 or 0.7) or (P.merc2 and 0.8 or 1))		local koef = math.max(k0 - k1 + k2, 1.25)
	if e.buying then e.price = e.basePrice * koef else e.price = e.basePrice / koef end
	if cf.m6 then tes3.messageBox("Disp = %s  Price = %d (base = %d)  Rang = %s  koef = %.2f (%.2f - %.2f + %.2f)", e.mobile.object.disposition, e.price, e.basePrice, rang, koef, k0, k1, k2) end
end
local function CALCPRICE(e)	local rang, k1, k2 = BarterK(e.mobile)		local koef = math.max(1 - k1 + k2, 0.5)		e.price = e.basePrice * koef
	if cf.m6 then tes3.messageBox("Price = %d (base = %d)  Rang = %s  koef = %.2f (1 - %.2f + %.2f)", e.price, e.basePrice, rang, koef, k1, k2) end
end
if cf.barter then event.register("calcBarterPrice", CALCBARTERPRICE)		event.register("barterOffer", BARTEROFFER)	
event.register("calcTrainingPrice", CALCPRICE)	event.register("calcSpellPrice", CALCPRICE)	event.register("calcTravelPrice", CALCPRICE) event.register("calcRepairPrice", CALCPRICE) end


local BART = {IT = {bartersAlchemy = true, bartersApparatus = true, bartersArmor = true, bartersBooks = true, bartersClothing = true, bartersEnchantedItems = true, bartersIngredients = true,
bartersLights = true, bartersLockpicks = true, bartersMiscItems = true, bartersProbes = true, bartersRepairTools = true, bartersWeapons = true}}
local function MENUBARTER(e)	BART.gold = nil		local m = tes3ui.getServiceActor()		local ai = m.object.aiConfig		if mp.fatigue.normalized > 1 then mp.fatigue.current = mp.fatigue.base end
	if P.merc9 then for it, _ in pairs(BART.IT) do if not ai[it] then ai[it] = true end end end
	--timer.delayOneFrame(function() m.health.current = 0		TFR(2, function() tes3.runLegacyScript{command = "resurrect", reference = m.reference} end) end, timer.real)
end		event.register("uiActivated", MENUBARTER, {filter = "MenuBarter"})

local function MENUPERSUASION(e)	local m = tes3ui.getServiceActor()	local bob = m.object.baseObject
if bob.barterGold > 0 then
	if BART.torgid and BART.torgid ~= m then BART.gold = nil end		BART.torgid = m
	if BART.gold then BART.dif = mwscript.getItemCount{reference = m.reference, item = "Gold_001"} - BART.gold else BART.dif = 0 end
	BART.gold = mwscript.getItemCount{reference = m.reference, item = "Gold_001"}
	if BART.dif == 1000 and P.merc3 then	local DI = m.reference.data		local M		if mp.mercantile.base >= 100 then M = 20 elseif mp.mercantile.base >= 75 then M = 10 else M = 5 end
		if not DI.invest then DI.invest = {g = bob.barterGold, i = 0} end	DI = DI.invest
		if DI.i < M then DI.i = DI.i + 1		bob.barterGold = DI.g * (1 + DI.i * 0.05)		bob.modified = true		mp:exerciseSkill(24, 10) end
		tes3.messageBox("Invested in %s   Gold = %s / %s  Investments: %s / %s", bob.id, m.barterGold, bob.barterGold, DI.i, M)
	end
end
if mp.intelligence.current + mp.speechcraft.current + (P.spec1 and 100 or 0) > 150 then
	local fPersMod, fLuckMod, fRepMod, fFatigueBase, fFatigueMult, fLevelMod = tes3.findGMST(1150).value, tes3.findGMST(1151).value, tes3.findGMST(1152).value, tes3.findGMST(1006).value, tes3.findGMST(1007).value, tes3.findGMST(1153).value
	local pLucPers = mp.personality.current/fPersMod + mp.luck.current/fLuckMod		local d = 1 - math.abs(math.min(m.object.disposition,100) - 50)/50
	local npcRepLucPers = m.personality.current/fPersMod + m.luck.current/fLuckMod + m.object.factionIndex * fRepMod
	local pFat = fFatigueBase - fFatigueMult * (1 - mp.fatigue.normalized)			local npcFat = fFatigueBase - fFatigueMult * (1 - m.fatigue.normalized)
	local RAT = 50 + (p.object.factionIndex * fRepMod + pLucPers + mp.speechcraft.current) * pFat - (npcRepLucPers + m.speechcraft.current) * npcFat
	local T = {}	T[1] = d * RAT		T[3] = T[1]		T[2] = d * (RAT + p.object.level * fLevelMod - m.object.level * fLevelMod * npcFat)
	local brib = d * (((pLucPers + mp.mercantile.current) * pFat) - ((npcRepLucPers + m.mercantile.current) * npcFat) + 50)
	T[4], T[5], T[6] = brib + tes3.findGMST(1154).value, brib + tes3.findGMST(1155).value, brib + tes3.findGMST(1156).value			for i=1,6 do T[i] = math.max(tes3.findGMST(1159).value, T[i]) end
	for i, b in ipairs(e.element:findChild(-633).children) do if i < 7 then local t = b.children[1]		t.text = ("%s:  %d%%"):format(t.text, T[i]) end end		e.element:updateLayout()
end
end		event.register("uiActivated", MENUPERSUASION, {filter = "MenuPersuasion"})

local function MENUDIALOG(e)	local r	= tes3ui.getServiceActor().reference	local id = r.baseObject.id
	if L.SSEL[id] then for i, sp in ipairs(L.SSEL[id]) do mwscript.addSpell{reference = r, spell = sp} end		--tes3.messageBox("%s get new spells", id)
		if id == "marayn dren" then for _, num in ipairs(L.SFS) do mwscript.addSpell{reference = r, spell = "4s_"..num} end end
	end
end		--event.register("uiActivated", MENUDIALOG, {filter = "MenuDialog"})

local function LOCKPICK(e) L.sksec = e.lockData.level/100 end		event.register("lockPick", LOCKPICK)
local function TRAPDISARM(e) if e.lockData and e.lockData.trap then L.sksec = e.lockData.trap.magickaCost * 5 / (e.lockData.trap.magickaCost + 80) end end		event.register("trapDisarm", TRAPDISARM)

local function EXERCISESKILL(e) local sk = e.skill
	if sk == 8 then	e.progress = e.progress * (1 + mp.encumbrance.normalized * 2) -- Атлетика
	elseif L.SK[sk] then
		if sk == 5 then if W.wt == -2 then e.progress = 0	mp:exerciseSkill(7, 1)	return end end
		e.progress = e.progress * L[L.SK[sk]]		if cf.m7 then tes3.messageBox("%s exp: %.2f", tes3.skillName[sk], e.progress)
	end
	elseif sk == 9 then	if e.progress < 3 then e.progress = e.progress * L.sken end		if cf.m7 then tes3.messageBox("Enchant exp: %.3f", e.progress) end	
	elseif sk == 16 or sk == 1 then	if D.expcraft == nil then D.expcraft = 0 end -- Алхимия и кузнец
		L.skcraft = D.expcraft < 400 and (1 - D.expcraft/(D.expcraft + 100)) or 0		e.progress = e.progress * L.skcraft
		if D.expcraft < 400 then D.expcraft = D.expcraft + 1 end
		if cf.m7 then tes3.messageBox("%s exp: %.2f (%d%%)  Fatigue: %d", tes3.skillName[sk], e.progress, L.skcraft*100, D.expcraft) end
	elseif sk == 24 or sk == 25 then	if D.expsocial == nil then D.expsocial = 0 end -- Красноречие и торговля
		L.sksoc = D.expsocial < 400 and (1 - D.expsocial/(D.expsocial + 100)) or 0		e.progress = e.progress * L.sksoc
		if D.expsocial < 400 then D.expsocial = D.expsocial + 1 end
		if cf.m7 then tes3.messageBox("%s exp: %.2f (%d%%)  Fatigue: %d", tes3.skillName[sk], e.progress, L.sksoc*100, D.expsocial) end
	end
	if not L.MENSK[sk] then
		if D.expcraft then D.expcraft = D.expcraft - e.progress		if D.expcraft < 0 then D.expcraft = nil end end
		if D.expsocial then D.expsocial = D.expsocial - e.progress 	if D.expsocial < 0 then D.expsocial = nil end end
		if cf.m7 and (D.expsocial or D.expcraft) then tes3.messageBox("Fatigue: Craft = %d  Social = %d", (D.expcraft or 0), (D.expsocial or 0)) end
	end
end		if cf.trmod then event.register("exerciseSkill", EXERCISESKILL, {priority = -10}) end

local function SKILLRAISED(e)
if cf.levmod then	local aup, aup2, lup = 3, 1, 0.25		local sk = e.skill
	for _, s in pairs(p.object.class.majorSkills) do if s == sk then aup = 4	aup2 = 2	lup = 1 end end		for _, s in pairs(p.object.class.minorSkills) do if s == sk then aup = 3.5	aup2 = 1.5	lup = 1 end end
	local atr, atr2 = tes3.getSkill(sk).attribute, L.SA2[sk]	local Aname, Aname2 = L.ATR[atr], L.ATR[atr2]	D.L[Aname] = D.L[Aname] + aup	D.L[Aname2] = D.L[Aname2] + aup2	D.L.levelup = D.L.levelup + lup
	if D.L[Aname] >= 10 then D.L[Aname] = D.L[Aname] - 10		if mp[Aname].base < 100 then tes3.modStatistic{reference = p, attribute = atr, value = 1}	tes3.messageBox("!!! %s +1 !!!", Aname) end end
	if D.L[Aname2] >= 10 then D.L[Aname2] = D.L[Aname2] - 10	if mp[Aname2].base < 100 then tes3.modStatistic{reference = p, attribute = atr2, value = 1}	tes3.messageBox("!!! %s +1 !!!", Aname2) end end
	if D.L.levelup >= 10 then	D.L.levelup = D.L.levelup - 10		if p.object.level < 100 then
		tes3.messageBox("!!! LEVEL UP !!!")		tes3.streamMusic{path="Special/MW_Triumph.mp3"}		mwscript.setLevel{reference = p, level = p.object.level + 1}
		if mp.luck.base < 100 then tes3.modStatistic{reference = p, attribute = 7, value = 1} elseif mp.personality.base < 100 then tes3.modStatistic{reference = p, attribute = 6, value = 1} end
		local menu = tes3ui.findMenu(tes3ui.registerID("MenuStat"))		menu:findChild(tes3ui.registerID("MenuStat_level")).text = p.object.level	menu:updateLayout()
		if p.object.level * G.leskoef > D.L.les and G.stop.value == 1 then G.stop.value = 0 end
	end end
	mp.levelUpProgress = math.min(D.L.levelup, 8)	if cf.m7 then tes3.messageBox("Attr: %s + %s = %s,  %s + %s = %s   Lvl + %s = %s", Aname, aup, D.L[Aname], Aname2, aup2, D.L[Aname2], lup, D.L.levelup) end
end
if cf.skillp and e.source == "training" then -- progress, book, training
	D.L.les = D.L.les + 1		if p.object.level * G.leskoef <= D.L.les then	G.stop.value = 1 end
	tes3.messageBox("Trained already %s times. %s left. %s", D.L.les, p.object.level * G.leskoef - D.L.les, G.stop.value == 0 and "" or "It's time to put the acquired knowledge into practice")
end
end		event.register("skillRaised", SKILLRAISED)


L.UpdateSpellM = function()	local ob, ic, mc	local ls = cf.lin	local F = {}	local S = {}
local MM = tes3ui.findMenu(-434)	local PL = MM:findChild(-441)	PL.borderBottom = 5		PL.flowDirection = "left_to_right"		local SL = MM:findChild(-444)
local MC = MM:findChild(-1155).children		MC[1].visible = false	MC[3].visible = false	MC[4].visible = false	MC[6].visible = false	MC[7].visible = false
MM:findChild(-442).visible = false		MM:findChild(-445).visible = false		MM:findChild(-446).visible = false		MM:findChild(-436).flowDirection = "left_to_right"
for i, s in ipairs(PL.children) do s:createImage{path = "icons\\" .. s:getPropertyObject("MagicMenu_Spell").effects[1].object.bigIcon}	s.minHeight = 32	s.minWidth = 32		s.text = nil end
for i, s in ipairs(SL.children) do s.minHeight = 32		s.minWidth = 32		s.text = nil	ob = s:getPropertyObject("MagicMenu_Spell")		ic = s:createImage{path = "icons\\" .. ob.effects[1].object.bigIcon}
if cf.UIcol ~= 0 then mc = ic:createLabel{text = ("%s"):format(ob.magickaCost)}	mc.color = L.UItcolor[cf.UIcol]		mc.font = 1 end		table.insert(D.FS[ob.id] and F or S, s) end
if SL.children[1] then SL.children[1]:register("destroy", function(e) timer.delayOneFrame(L.UpdateSpellM, timer.real) end) end
local Flin = math.ceil(#F/ls)	local Slin = math.ceil(#S/ls)	local ML = Flin + Slin
MC[5].maxHeight = 32*ML	+ 5		SL.minWidth = 32*(ls+1)		SL.maxWidth = SL.minWidth	SL.minHeight = 32*(ML+1)	SL.maxHeight = SL.minHeight
for i, s in ipairs(F) do s.absolutePosAlignX = 1/ls * ((i%ls > 0 and i%ls or ls)-1)		s.absolutePosAlignY = 1/ML * (math.ceil(i/ls)-1) end
for i, s in ipairs(S) do s.absolutePosAlignX = 1/ls * ((i%ls > 0 and i%ls or ls)-1)		s.absolutePosAlignY = 1/ML * (math.ceil(i/ls)-1+Flin) end
end

L.UpdateEnM = function() local MM = tes3ui.findMenu(-434)		local MC = MM:findChild(-1155).children		local ob, ic, icm, mc		local ls = cf.lin
local IL = MM:findChild(-447)	local ILin = math.max(math.ceil(#IL.children/ls), 1)		MC[8].maxHeight = 32*ILin + 5
IL.minWidth = 32*(ls+1)		IL.maxWidth = IL.minWidth	IL.minHeight = 32*(ILin+1)	IL.maxHeight = IL.minHeight
for i, s in ipairs(IL.children) do s.minHeight = 32		s.minWidth = 32		s.text = nil	ob = s:getPropertyObject("MagicMenu_object")		ic = s:createImage{path = ("icons\\%s"):format(ob.icon)}
if ob.objectType ~= tes3.objectType.book then icm = ic:createImage{path = ("icons\\%s"):format(ob.enchantment.effects[1].object.icon)}		icm.absolutePosAlignX = 1	icm.absolutePosAlignY = 1
if cf.UIcol ~= 0 then mc = ic:createLabel{text = ("%s"):format(ob.enchantment.chargeCost)}	mc.color = L.UItcolor[cf.UIcol]		mc.font = 1 end end
s.absolutePosAlignX = 1/ls * ((i%ls > 0 and i%ls or ls)-1)		s.absolutePosAlignY = 1/ILin * (math.ceil(i/ls)-1) end
if IL.children[1] then IL.children[1]:register("destroy", function(e) M.EnDF = false	if tes3ui.menuMode() then timer.delayOneFrame(L.UpdateEnM, timer.real) end end)	M.EnDF = true end
end


local function MENUENTER(e) if M.INV and M.INV.visible then	L.GetArStat() end
	if cf.UIen and not M.EnDF then local MagM = tes3ui.findMenu(-434)		if MagM and MagM.visible and MagM:findChild(-447).children[1] then L.UpdateEnM() end end
end		event.register("menuEnter", MENUENTER)

local function SAVE(e)
	if W.DWM then D.DW = {IDR = W.WR.id, IDL = W.WL.id, CondR = W.DR.condition, CondL = W.DL.condition} end
end		event.register("save", SAVE)

local function LOAD(e) 
if T.AoE.timeLeft then for i, t in pairs(AOE) do t.r:delete() end	AOE = {} end
if T.Run.timeLeft then for i, t in pairs(RUN) do t.r:delete() end RUN = {} end
if T.Tot.timeLeft then for i, t in pairs(TOT) do t.r:delete() end TOT = {} end
if table.size(LI.R) ~= 0 then	for ref, _ in pairs(LI.R) do ref:delete() end  LI.R = {} end
if V.bcd then event.unregister("calcMoveSpeed", L.BLAST)	V.bcd = nil		KSR = {} end
if T.LI.timeLeft then event.unregister("simulate", LI.SIM)	LI.r = nil end
if T.TS.timeLeft then event.unregister("simulate", SIMTS)	TSK = 1 end
if T.Frost.timeLeft then event.unregister("calcMoveSpeed", CMSFrost) end
if T.DET.timeLeft then DEDEL() end
if p and D.lw then local w = tes3.getObject(D.lw.id)	w.reach = D.lw.r end 
end		event.register("load", LOAD)


local function LOADED(e) p = tes3.player	mp = tes3.mobilePlayer	ad = mp.actionData		pp = p.position		D = tes3.player.data	inv = p.object.inventory	p1 = tes3.player1stPerson.sceneNode		p3 = p.sceneNode
if not D.Mmod then D.Mmod = {} end	DM = D.Mmod		if not D.perks then D.perks = {} end	P = D.perks		if not D.FS then D.FS = {} end
if not D.AR or not D.AR.mc then D.AR = {l=0,m=0,h=0,u=0,as=0,ms=1,dk=1,dc=0,cs=0,cc=0,mc=0} end
if not D.L then D.L = {strength = 0, endurance = 0, intelligence = 0, willpower = 0, speed = 0, agility = 0, personality = 0, levelup = 0, les = 0} end		if not D.PCL then D.PCL = 0 end
AF = setmetatable({}, MT)	SNC = {}	W = {}	FR = {}		V.BAL = {}	V.MET = {}	V.METR = {}		R = {}	A = {}	com = 0		L.ClearEn()		L.SetGlobal()

G.ck = ic.inputMaps[tes3.keybind.readyMagic + 1].code		--G.ts = tes3.findGlobal("TimeScale").value
G.LastMana = nil
if tes3.isAffectedBy{reference = p, effect = 501} then AF[p].T501 = timer.start{duration = 1, iterations = -1, callback = L.RechargeTik}	G.REI = {} end

W.l1 = p1:getObjectByName("Bip01 L Hand")		W.l3 = p3:getObjectByName("Bip01 L Hand")		W.r1 = p1:getObjectByName("Bip01 R Hand")		W.r3 = p3:getObjectByName("Bip01 R Hand")
W.w1 = p1:getObjectByName("Weapon Bone")		W.w3 = p3:getObjectByName("Weapon Bone")		event.unregister("playItemSound", L.DWESound, {priority = 10000})		L.MagefAdd()

local w = mp.readiedWeapon	local wd = w and w.variables	w = w and w.object
if w then	if D.DW then
	if w.id == D.DW.IDR and wd.condition == D.DW.CondR then L.DWNEW(w, wd, false)		local ob = tes3.getObject(D.DW.IDL)
		for i, ida in pairs(inv:findItemStack(ob).variables) do if ida.condition == D.DW.CondL and ida ~= W.DR then L.DWNEW(ob, ida, true)	break end end
	elseif w.id == D.DW.IDL and wd.condition == D.DW.CondL then L.DWNEW(w, wd, true)	local ob = tes3.getObject(D.DW.IDR)
		for i, ida in pairs(inv:findItemStack(ob).variables) do if ida.condition == D.DW.CondR and ida ~= W.DL then L.DWNEW(ob, ida, false)	break end end
	end
	D.DW = nil
elseif WT[w.type].dw then L.DWNEW(w, wd, false) end end


for ref, _ in pairs(PRR) do ref:delete() end		PRR = {}
if D.ligspawn then	local spawn = 0	for _, cell in pairs(tes3.getActiveCells()) do for r in cell:iterateReferences() do if r.baseObject.id == "4nm_light" then spawn = spawn + 1	r:delete() end end end
if spawn > 0 then tes3.messageBox("%s lights extra deleted", spawn) end		D.ligspawn = nil	LI.r = nil end

B.poi = tes3.getObject("4b_poison") or tes3alchemy.create{id = "4b_poison", name = "4b_poison", weight = 0.1, icon = "s\\b_tx_s_sun_dmg.dds"}	--B.poi.sourceless = true
if D.AUR then T.AUR = timer.start{duration = P.alt11 and math.max(3 - mp:getSkillValue(11)/200, 2.5) or 3, iterations = -1, callback = L.AuraTik} end
if D.Prok then T.Prok = timer.start{duration = P.alt11 and math.max(3 - mp:getSkillValue(11)/100, 2) or 3, iterations = -1, callback = L.ProkTik} end


local MU = tes3ui.findMenu(-526)	M.MU = MU		M.Mana = MU:findChild(-865).widget			M.Stat = tes3ui.findMenu(-855)		M.EHB = MU:findChild(-573)		M.INV = tes3ui.findMenu(-314)
local QBL = MU:findChild(-539).parent:createBlock{}		QBL.autoHeight = true	QBL.autoWidth = true	QBL.borderAllSides = 2		QBL.flowDirection = "top_to_bottom"
local QIC = QBL:createThinBorder{}	QIC.height = 36		QIC.width = 36		M.Qicon = QIC:createImage{path = "icons/k/magicka.dds"}		M.Qicon.borderAllSides = 2
M.Qicon:register("help", function() if QS then local tt = tes3ui.createTooltipMenu():createBlock{}	tt.autoHeight = true	tt.autoWidth = true		tt:createLabel{text = ("%s (%s)"):format(QS.name, QS.magickaCost)} end end)
M.Qbar = QBL:createFillBar{current = 20, max = 20}	M.Qbar.width = 36		M.Qbar.height = 7		M.QB = M.Qbar.widget	M.QB.showText = false		M.QB.fillColor = {0,1,0}
M.PIC = MU:findChild(-539).parent:createBlock{}		M.PIC.visible = false	M.PIC.autoHeight = true		M.PIC.autoWidth = true	M.PIC.borderAllSides = 2	M.PIC.flowDirection = "top_to_bottom"
local PICb = M.PIC:createThinBorder{}	PICb.height = 36	PICb.width = 36		local Picon = PICb:createImage{path = "icons/potions_blocked.tga"}	Picon.borderAllSides = 2
local potbar = M.PIC:createFillBar{current = 30, max = 30}	potbar.width = 36		potbar.height = 7		M.PCD = potbar.widget	M.PCD.showText = false		M.PCD.fillColor = {0,1,1}
if D.potcd then M.PIC.visible = true	T.POT = timer.start{duration = 1, iterations = -1, callback = function() D.potcd = D.potcd - 1	if D.potmcd then D.potmcd = D.potmcd - 1	if D.potmcd <= 0 then D.potmcd = nil end end
	if D.potmcd and D.potmcd > D.potcd - G.potlim then M.PCD.max = 5	M.PCD.current = D.potmcd else M.PCD.max = 30	M.PCD.current = D.potcd - G.potlim	if M.PCD.current <= 0 then M.PIC.visible = false end end
	if D.potcd <= 0 then D.potcd = nil	T.POT:cancel() end
end} end
M.drop = MU:findChild(-539).parent:createImage{path = "icons/poisondrop.tga"}	M.drop.visible = not not D.poimod

M.EHB.parent.flowDirection = "top_to_bottom"
M.AR = M.INV and M.INV:findChild(-322) or M.EHB.parent:createBlock{}	M.AR.minWidth = 150		M.AR.width = 150		M.AR:register("help", L.TTAR)
M.MI = (M.INV and M.INV:findChild(-320) or M.AR):createBlock{}	M.MI.autoHeight = true	M.MI.autoWidth = true	M.MI.flowDirection = "top_to_bottom"
M.SL2 = M.MI:createBlock{}	M.SL2.autoHeight = true	M.SL2.autoWidth = true		M.SL3 = M.MI:createBlock{}	M.SL3.autoHeight = true	M.SL3.autoWidth = true		M.SL4 = M.MI:createBlock{}	M.SL4.autoHeight = true	M.SL4.autoWidth = true
M.SI11 = M.AR:createImage{path = "icons/s/repairArmor.tga"}		M.SI11.borderRight = 28		M.ST11 = M.AR:createLabel{}		M.ST11.borderRight = 5
M.SI12 = M.AR:createImage{path = "icons/s/dash.tga"}	M.ST12 = M.AR:createLabel{}
M.SI21 = M.SL2:createImage{path = "icons/s/chargeFire.tga"}			M.ST21 = M.SL2:createLabel{}	M.ST21.borderRight = 5
M.SI21:register("help", function() local tt = tes3ui.createTooltipMenu():createBlock{}	tt.autoHeight = true	tt.autoWidth = true		tt:createLabel{text = cf.en and "Physical Damage Modifier" or "Модификатор физического урона"} end)
M.SI22 = M.SL2:createImage{path = "icons/s/repairWeapon.tga"}		M.ST22 = M.SL2:createLabel{}
M.SI22:register("help", function() local tt = tes3ui.createTooltipMenu():createBlock{}	tt.autoHeight = true	tt.autoWidth = true		tt:createLabel{text = cf.en and "Attack Speed / Maximum combo" or "Cкорость атаки / Максимум комбо"} end)
M.SI31 = M.SL3:createImage{path = "icons/s/recharge.tga"}			M.ST31 = M.SL3:createLabel{}	M.ST31.borderRight = 5
M.SI31:register("help", function() local tt = tes3ui.createTooltipMenu():createBlock{}	tt.autoHeight = true	tt.autoWidth = true		tt:createLabel{text = cf.en and "Magic power modifier" or "Модификатор мощности магии"} end)
M.SI32 = M.SL3:createImage{path = "icons/s/empowerShock.tga"}	M.ST32 = M.SL3:createLabel{}	M.ST32.borderRight = 5
M.SI32:register("help", function() local tt = tes3ui.createTooltipMenu():createBlock{}	tt.autoHeight = true	tt.autoWidth = true		tt:createLabel{text = cf.en and "Mana cost modifier" or "Модификатор стоимости заклинаний"} end)
M.SI33 = M.SL3:createImage{path = "icons/s/projectileControl.tga"}		M.ST33 = M.SL3:createLabel{}
M.SI33:register("help", function() local tt = tes3ui.createTooltipMenu():createBlock{}	tt.autoHeight = true	tt.autoWidth = true		tt:createLabel{text = cf.en and "Cast chance modifier" or "Модификатор шанса каста"} end)
M.SI41 = M.SL4:createImage{path = "icons/s/tx_s_sanctuary.dds"}		M.ST41 = M.SL4:createLabel{}	M.ST41.borderRight = 5
M.SI41:register("help", function() local tt = tes3ui.createTooltipMenu():createBlock{}	tt.autoHeight = true	tt.autoWidth = true
tt:createLabel{text = cf.en and "Passive dodge / Dodge maneuver / Stamina cost for dodge maneuver" or "Пассивное уклонение / Маневр уклонения / Расход стамины на маневр уклонения"} end)
M.SI42 = M.SL4:createImage{path = "icons/s/tx_s_feather.dds"}		M.ST42 = M.SL4:createLabel{}
M.SI42:register("help", function() local tt = tes3ui.createTooltipMenu():createBlock{}	tt.autoHeight = true	tt.autoWidth = true		tt:createLabel{text = cf.en and "Stamina cost for attacks / jumping / running" or "Расход стамины на атаки / прыжки / бег"} end)

M.ENLB = M.MI:createFillBar{current = D.ENconst or 0, max = 4000 + mp.enchant.base*20 + (P.enc16 and 2000 or 0)}
M.ENLB.width = 150	M.ENLB.height = 12	M.ENL = M.ENLB.widget	M.ENL.showText = false	M.ENL.fillColor = {0,1,1}
M.ENLB:register("help", function() local tt = tes3ui.createTooltipMenu():createBlock{}	tt.autoHeight = true	tt.autoWidth = true
tt:createLabel{text = ("%s: %d / %d"):format(cf.en and "Constant enchant limit" or "Лимит постоянных зачарований", M.ENL.current, M.ENL.max)} end)

M.Sbar = M.EHB.parent:createFillBar{current = 100, max = 100}		M.Sbar.visible = false	M.Sbar.widget.showText = false	M.Sbar.width = 65		M.Sbar.height = 7		M.Sbar.widget.fillColor = {0,1,0}
M.Bar4 = M.EHB.parent:createFillBar{current = 0, max = L.GetPCmax()}	M.PC = M.Bar4.widget	M.PC.showText = false	M.Bar4.width = 65	M.Bar4.height = 12	M.PC.fillColor = {1,0,1}
M.Bar4:register("help", function() local tt = tes3ui.createTooltipMenu():createBlock{}	tt.autoHeight = true	tt.autoWidth = true
tt:createLabel{text = ("%s: %d / %d"):format(cf.en and "Potential charge" or "Потенциальный заряд", M.PC.current, M.PC.max)} end)

T.PCT = timer.start{duration = 1, iterations = -1, callback = function() M.PC.current = M.PC.current + M.PC.max * (0.005 + (P.enc18 and math.min(tes3.getEffectMagnitude{reference = p, effect = 76},20)*0.0005 or 0))
if M.PC.normalized > 1 then M.PC.current = M.PC.max		T.PCT:cancel()	D.PCcur = nil	M.Bar4.visible = false else D.PCcur = M.PC.current end end}
M.PC.current = D.PCcur or M.PC.max		if not D.PCcur then T.PCT:cancel()	M.Bar4.visible = false end


if not D.QSP then D.QSP = {} end
QS = D.QSP["0"] and tes3.getObject(D.QSP[D.QSP["0"]]) or (mp.currentSpell and mp.currentSpell.objectType == tes3.objectType.spell and mp.currentSpell.castType == 0 and (P.int3 or mp.currentSpell.alwaysSucceeds) and mp.currentSpell)
if QS then M.Qicon.contentPath = "icons\\" .. QS.effects[1].object.bigIcon end

W.BAR = MU:findChild(-547):createFillBar{current = 10, max = 10}	W.BAR.width = 36	W.BAR.height = 7	W.BAR.visible = false
W.bar = W.BAR.widget	W.bar.showText = false		W.bar.fillColor = D.NoEnStrike and {1,0,0} or {0,1,1}
W.tim = timer.start{duration = 1, iterations = -1, callback = function() if W.ob then W.bar.current = W.v.charge end end}
L.GetWstat()
M.WPB = MU:findChild(-547):createFillBar{current = D.poison or 0, max = 300}	M.WPB.width = 36	M.WPB.height = 7	M.WPB.widget.showText = false	M.WPB.widget.fillColor = {0,1,0}	M.WPB.visible = not not D.poison
M.MCbar = MU:findChild(-548):createFillBar{current = 0, max = 100}	M.MCbar.width = 36	M.MCbar.height = 7	M.MCB = M.MCbar.widget	M.MCB.showText = false	M.MCB.fillColor = {0,1,1}

M.CombK = MU:findChild(-543):createLabel{text = ""}		M.CombK.color = {0.7,0.3,0}		M.CombK.absolutePosAlignX = 1	M.CombK.absolutePosAlignY = 0		--M.CombK.visible = false

MU:findChild(-866).parent.flowDirection = "top_to_bottom"
M.SHbar = MU:findChild(-866).parent:createFillBar{current = 100, max = 100}	M.SHbar.visible = false		M.SHbar.widget.showText = false	M.SHbar.width = 65	M.SHbar.height = 7	M.SHbar.widget.fillColor = {0,1,1}


local o = tes3.getObject("4s_603")
if not o or o.magickaCost ~= 30 then	local s		for _, t in ipairs(L.NEWSP) do s = tes3.getObject("4s_"..t[1]) or tes3spell.create("4s_"..t[1])	--s.sourceless = true
	s.name = t[9]		s.magickaCost = t[8] or 0	s = s.effects[1]	s.rangeType = t[2]	s.id = t[3]		s.min = t[4]	s.max = t[5]	s.radius = t[6]		s.duration = t[7]
end		tes3.messageBox("New effects and spells updated")	end

o = tes3.getObject("4as_atr8")
if not o or o.name ~= (cf.en and "Elemental ray" or "Стихийный луч") or o.magickaCost ~= 50 then	local s		tes3.messageBox("Perk abilities updated")
	for id, t in pairs(L.PA) do s = tes3.getObject("4p_"..id) or tes3spell.create("4p_"..id)	s.name = cf.en and t[5] or t[4] or "4p_"..id	s.castType = 1	s = s.effects[1]	s.id = t[1]		s.min = t[2]	s.max = t.m or t[2] end
	for id, t in pairs(L.NSU) do s = tes3.getObject(id) or tes3spell.create(id)		s.name = cf.en and t.en or t.ru		s.magickaCost = t.c		if t.f then s.alwaysSucceeds = true end		s = s.effects
	for i, ef in ipairs(t) do s[i].rangeType = t.rt	or 0	s[i].id	= ef[1]		s[i].min = ef[2] or t.m		s[i].max = ef[3] or t.ma	s[i].radius = ef.r or t.r or 0		s[i].duration = ef.d or t.d		s[i].attribute = ef.a or -1 end end
end

if not tes3.getObject("marayn dren").spells:contains("fireball") then tes3.messageBox("Spellsellers get new spells")
	for id, list in pairs(L.SSEL) do o = tes3.getObject(id)		if o.id == "marayn dren" then for _, num in ipairs(L.SFS) do o.spells:add("4s_"..num) end end
		for i, sp in ipairs(list) do o.spells:add(sp) end
	end
end

if not e.newGame then L.READY = true	local PS = {}	local PA = {}	PS.sp = p.object.class.specialization	local id	local b = L.BS[mp.birthsign.id]
	for _, s in pairs(p.object.class.majorSkills) do PS[s] = 1 end		for _, s in pairs(p.object.class.minorSkills) do PS[s] = 2 end		for _, at in pairs(p.object.class.attributes) do PA[at] = true end
	for i, l in ipairs(L.PR) do for _, t in ipairs(l) do	id = L.PRL[i][3]
		if i < 9 then t.x = PA[id] and 0 or 1 else t.x = (PS[id] or 3) + (L.SS[id] == PS.sp and 0 or 1) - (PA[L.SA[id]] and 1 or 0) - (PA[L.SA2[id]] and 1 or 0) end		t.f = math.max(t.x + (t.c or 1),0)
	end end
	if not D.chimstar and b and p.object.level >= 20 then if b ~= "shadow" then mwscript.removeSpell{reference = p, spell = "4nm_star_"..b.."1"}	mwscript.addSpell{reference = p, spell = "4nm_star_"..b.."2"} end
		if tes3.getObject("4nm_star_"..b.."2a") then mwscript.addSpell{reference = p, spell = "4nm_star_"..b.."2a"} end
		if b == "atronach" then mwscript.addSpell{reference = p, spell = "4as_atr4"}	mwscript.addSpell{reference = p, spell = "4as_atr5"}	mwscript.addSpell{reference = p, spell = "4as_atr6"}	mwscript.addSpell{reference = p, spell = "4as_atr9"} end
		tes3.messageBox(cf.en and "You have awakened the power of your Birth Sign" or "Вы пробудили силу своего Знака")	D.chimstar = 1
	elseif D.chimstar == 1 and b and p.object.level >= 50 then if b ~= "shadow" then mwscript.removeSpell{reference = p, spell = "4nm_star_"..b.."2"}	mwscript.addSpell{reference = p, spell = "4nm_star_"..b.."3"} end
		if tes3.getObject("4nm_star_"..b.."3a") then mwscript.addSpell{reference = p, spell = "4nm_star_"..b.."3a"} end
		if b == "atronach" then mwscript.addSpell{reference = p, spell = "4as_atr7"}	mwscript.addSpell{reference = p, spell = "4as_atr8"} end
		tes3.messageBox(cf.en and "You have ascended to level of the gods and unleashed the true potential of your Birth Sign" or "Вы вознеслись до уровня богов и раскрыли истинный потенциал своего Знака")	D.chimstar = 2
	end
	if cf.UIsp then L.UpdateSpellM() end
	if cf.UIen then local MM = tes3ui.findMenu(-434)	MM:findChild(-448).visible = false		MM:findChild(-449).visible = false		M.EnDF = false end
else L.READY = nil end
end		event.register("loaded", LOADED)

local function initialized(e)	wc = tes3.worldController	ic = wc.inputController		MB = ic.mouseState.buttons		local o, E
--ГМСТ едины для игровой сессии и обновляются из плагинов при старте игры. Если поменять ГМСТ через луа, то они сохранятся для всех последующих сейвов в этой сессии но сбросятся на дефолтные при следующем запуске игры
G.KOGMST = tes3.findGMST("iKnockDownOddsBase")			G.KOGMST.value = 0				G.HandReach = tes3.findGMST("fHandToHandReach")
G.BlockMax = tes3.findGMST("iBlockMaxChance")			G.BlockMax.value = 90			G.BlockMult = tes3.findGMST("fSwingBlockMult")			G.BlockMult.value = 0	
G.BlockLeft = tes3.findGMST("fCombatBlockLeftAngle")	G.BlockLeft.value = -0.666		G.BlockRight = tes3.findGMST("fCombatBlockRightAngle")	G.BlockRight.value = 0.333
G.CombatDistance = tes3.findGMST("fCombatDistance")		G.CombatAngleXY = tes3.findGMST("fCombatAngleXY")	G.CombatAngleXY.value = 0.5			--tes3.findGMST("fCombatAngleZ").value = 0.6
G.CriticalMult = tes3.findGMST("fCombatCriticalStrikeMult")

tes3.findGMST("fEffectCostMult").value = 1				tes3.findGMST("fNPCbaseMagickaMult").value = 3			tes3.findGMST("iAutoSpellTimesCanCast").value = 5
tes3.findGMST("fTargetSpellMaxSpeed").value = 2000		tes3.findGMST("fMagicCreatureCastDelay").value = 0		tes3.findGMST("fEnchantmentMult").value = 0.1
tes3.findGMST("fFatigueSpellBase").value = 0.5			tes3.findGMST("fFatigueSpellMult").value = 0.5			tes3.findGMST("fElementalShieldMult").value = 1
tes3.findGMST("fEncumberedMoveEffect").value = 0.5		tes3.findGMST("fBaseRunMultiplier").value = 3			tes3.findGMST("fSwimRunBase").value = 0.3
tes3.findGMST("fJumpAcrobaticsBase").value = 278		tes3.findGMST("fFallDistanceMult").value = 0.1
tes3.findGMST("fFatigueReturnBase").value = 0			tes3.findGMST("fFatigueReturnMult").value = 0.2		tes3.findGMST("fFatigueBase").value = 1.5				tes3.findGMST("fFatigueMult").value = 0.5
tes3.findGMST("fFatigueAttackBase").value = 10			tes3.findGMST("fFatigueAttackMult").value = 10		tes3.findGMST("fWeaponFatigueMult").value = 1
tes3.findGMST("fFatigueBlockBase").value = 5			tes3.findGMST("fFatigueBlockMult").value = 10		tes3.findGMST("fWeaponFatigueBlockMult").value = 2
tes3.findGMST("fFatigueRunBase").value = 10				tes3.findGMST("fFatigueRunMult").value = 30			tes3.findGMST("fFatigueSwimWalkBase").value = 10		tes3.findGMST("fFatigueSwimWalkMult").value = 30
tes3.findGMST("fFatigueSwimRunBase").value = 20			tes3.findGMST("fFatigueSwimRunMult").value = 30		tes3.findGMST("fFatigueSneakBase").value = 0			tes3.findGMST("fFatigueSneakMult").value = 10
tes3.findGMST("fMinHandToHandMult").value = 0			tes3.findGMST("fMaxHandToHandMult").value = 0.2		tes3.findGMST("fHandtoHandHealthPer").value = 0.25
tes3.findGMST("fKnockDownMult").value = 0				tes3.findGMST("iKnockDownOddsMult").value = 0		tes3.findGMST("fCombatKODamageMult").value = 1.5		
tes3.findGMST("fDamageStrengthBase").value = 1			tes3.findGMST("fDamageStrengthMult").value = 0.05	tes3.findGMST("fCombatArmorMinMult").value = 0.01
tes3.findGMST("fProjectileMinSpeed").value = 1000		tes3.findGMST("fProjectileMaxSpeed").value = 5000	tes3.findGMST("fThrownWeaponMinSpeed").value = 1000			tes3.findGMST("fThrownWeaponMaxSpeed").value = 3000
tes3.findGMST("fCombatDelayCreature").value = -0.4		tes3.findGMST("fCombatDelayNPC").value = -0.4		
tes3.findGMST("fAIFleeHealthMult").value = 88.888		tes3.findGMST("fFleeDistance").value = 5000			tes3.findGMST("fAIRangeMeleeWeaponMult").value = 70			tes3.findGMST("fSuffocationDamage").value = 10
tes3.findGMST("fAIFleeFleeMult").value = 0	--0.3	 float rating = (1.0f - healthPercentage) * fAIFleeHealthMult + flee * fAIFleeFleeMult;
tes3.findGMST("fSleepRestMod").value = 0.5				tes3.findGMST("fDispDiseaseMod").value = -30		tes3.findGMST("fBargainOfferMulti").value = -20				tes3.findGMST("fSpecialSkillBonus").value = 0.8
tes3.findGMST("fRestMagicMult").value = 0.5				tes3.findGMST("iMonthsToRespawn").value = 7	
tes3.findGMST("sArmor").value = " "		tes3.findGMST("sMagicPCResisted").value = ""		tes3.findGMST("sMagicTargetResisted").value = ""	tes3.findGMST("sMagicInsufficientCharge").value = ""
if cf.alc then tes3.findGMST("fPotionT1MagMult").value = 2		tes3.findGMST("fPotionT1DurMult").value = 0.5 end

--for _, v in ipairs(L.SREG) do o = tes3spell.create("4s_"..v, "4s_"..v) 	o.magickaCost = 0	o.sourceless = true		S[v] = o end
for _, n in ipairs(L.BREG) do o = tes3alchemy.create{id = "4b_"..n, name = "4b_"..n, icon = "s\\b_tx_s_sun_dmg.dds"} 	o.sourceless = true 	B[n] = o end
for _, t in ipairs(L.BU) do o = tes3alchemy.create{id = "4b_"..t.n, name = "4b_"..t.n, icon = "s\\b_tx_s_sun_dmg.dds"}	o.sourceless = true		o.weight = t.w or 0		B[t.n] = o		E = o.effects
for i, ef in ipairs(t) do E[i].rangeType = ef[1]	E[i].id = ef[2]		E[i].min = ef[3]	E[i].max = ef[4]	E[i].radius = ef[5]		E[i].duration = ef[6] end end

BAM.E = tes3.getObject("4nm_e_boundammo").effects		LI.l = tes3.getObject("4nm_light")		L.stone = tes3.getObject("4nm_stone")		L.magef = tes3.loadMesh("e\\magef.nif")
L.pbottle = tes3.getObject("4nm_poisonbottle")
L.DEO = {["door"] = {m = tes3.loadMesh("e\\detect_door.nif"), s = 3}, ["cont"] = {m = tes3.loadMesh("e\\detect_cont.nif"), s = 3}, ["npc"] = {m = tes3.loadMesh("e\\detect_npc.nif"), s = 1},
["ani"] = {m = tes3.loadMesh("e\\detect_animal.nif"), s = 1}, ["dae"] = {m = tes3.loadMesh("e\\detect_daedra.nif"), s = 1}, ["und"] = {m = tes3.loadMesh("e\\detect_undead.nif"), s = 1},
["robo"] = {m = tes3.loadMesh("e\\detect_robo.nif"), s = 1}, ["key"] = {m = tes3.loadMesh("e\\detect_key.nif"), s = 2}, ["en"] = {m = tes3.loadMesh("e\\detect_ench.nif"), s = 2}}

local S = {[0] = {l = {0.5,0,1}, p = "vfx_alt_glow.tga", sc = "alteration cast", sb = "alteration bolt", sh = "alteration hit", sa = "alteration area", vc = "VFX_AlterationCast", vb = "VFX_AlterationBolt", vh = "VFX_AlterationHit", va = "VFX_AlterationArea"},
[1] = {l = {1,1,0}, p = "vfx_conj_flare02.tga", sc = "conjuration cast", sb = "conjuration bolt", sh = "conjuration hit", sa = "conjuration area", vc = "VFX_ConjureCast", vb = "VFX_ConjureBolt", vh = "VFX_DefaultHit", va = "VFX_ConjureArea"},
[2] = {l = {1,0,0}, p = "vfx_alpha_bolt01.tga", sc = "destruction cast", sb = "destruction bolt", sh = "destruction hit", sa = "destruction area", vc = "VFX_DestructCast", vb = "VFX_DestructBolt", vh = "VFX_DestructHit", va = "VFX_DestructArea"},
[3] = {l = {0,1,0.5}, p = "vfx_greenglow.tga", sc = "illusion cast", sb = "illusion bolt", sh = "illusion hit", sa = "illusion area", vc = "VFX_IllusionCast", vb = "VFX_IllusionBolt", vh = "VFX_IllusionHit", va = "VFX_IllusionArea"},
[4] = {l = {1,0.5,1}, p = "vfx_myst_flare01.tga", sc = "mysticism cast", sb = "mysticism bolt", sh = "mysticism hit", sa = "mysticism area", vc = "VFX_MysticismCast", vb = "VFX_MysticismBolt", vh = "VFX_MysticismHit", va = "VFX_MysticismArea"},
[5] = {l = {0,0.5,1}, p = "vfx_bluecloud.tga", sc = "restoration cast", sb = "restoration bolt", sh = "restoration hit", sa = "restoration area", vc = "VFX_RestorationCast", vb = "VFX_RestoreBolt", vh = "VFX_RestorationHit", va = "VFX_RestorationArea"},
[6] = {l = {1,0.5,0}, p = "e\\vfx_##lensw.dds", sc = "destruction cast", sb = "destruction bolt", sh = "destruction hit", sa = "destruction area", vc = "VFX_FireCast", vb = "VFX_FireBolt", vh = "VFX_FireHit", va = "VFX_FireArea"},
[7] = {l = {0,1,1}, p = "e\\vfx_frsstr.dds", sc = "frost_cast", sb = "frost_bolt", sh = "frost_hit", sa = "frost area", vc = "VFX_FrostCast", vb = "VFX_FrostBolt", vh = "VFX_FrostHit", va = "VFX_FrostArea"},
[8] = {l = {1,0,1}, p = "e\\vfx_shock1.dds", sc = "shock cast", sb = "shock bolt", sh = "shock hit", sa = "shock area", vc = "VFX_LightningCast", vb = "VFX_ShockBolt", vh = "VFX_LightningHit", va = "VFX_LightningArea"},
[9] = {l = {0.5,1,0}, p = "vfx_poison.tga", sc = "destruction cast", sb = "destruction bolt", sh = "destruction hit", sa = "destruction area", vc = "VFX_PoisonCast", vb = "VFX_PoisonBolt", vh = "VFX_PoisonHit", va = "VFX_PoisonArea"},
[10] = {l = {1,0,0.5}, p = "e\\vfx_spark_red.dds", sc = "destruction cast", sb = "destruction bolt", sh = "destruction hit", sa = "destruction area", vc = "VFX_DestructCast", vb = "VFX_DestructBolt", vh = "VFX_DestructHit", va = "VFX_DestructArea"}}
local MEN = {{600, "dash", "Dash", 1, s=0, "Gives the ability to quickly move in the selected direction, as well as make kinetic kicks", c1=0, c2=0},
{601, "boundAmmo", "Bound ammo", 1, s=1, "Bounds arrows, bolts or throwing stars from Oblivion", c1=0, c2=0, nom=1},
{602, "kineticStrike", "Kinetic strike", 2, s=0, "A burst of power knocks back enemies and deals damage", c0=0, c1=0, nod=1, h=1, snd=2, col = KSCollision},
{603, "boundWeapon", "Bound weapon", 5, s=1, "Bounds any weapon from Oblivion", c1=0, c2=0, nom=1, tik = function(e) e:triggerBoundWeapon(D and D.boundw or "4_bound longsword") end},
{610, "bolt", "Dummy bolt", 0.01, s=2, ss=6, "Dummy bolt", c0=0, c1=0, h=1, nod=1, nom=1, unr=1, ale=0, als=0, vfb = "VFX_DefaultBolt", sb = "Sound Test", tik = L.METW},
{500, "teleport", "Teleport", 10, s=4, "Teleports caster to the point, indicated by him", c0=0, c1=0, nod=1, nom=1, sp=2, col = TeleportCollision},
{501, "recharge", "Recharge", 10, s=4, "Restores charges of equipped magic items", ale=0},
{502, "repairWeapon", "Repair weapon", 5, s=0, "Repairing equipped weapon"},
{503, "repairArmor", "Repair armor", 3, s=0, "Repairing equipped armor"},
{504, "lightTarget", "Magic light", 0.1, s=0, "Creates a light, following a caster or attached to hit point", snd=3, vfx=3, col = LightCollision},
{505, "teleportToTown", "Teleport to town", 1000, s=4, "Teleports the caster to the town", c1=0, c2=0, nod=1, nom=1, ale=0, tik = L.TownTP},
{506, "projectileControl", "Projectile control", 1, s=0, "Allows to control projectile flight", c1=0, c2=0, nom=1},
{507, "reflectSpell", "Reflect Spell", 1, s=4, "Reflects enemy spells"},
{508, "kineticShield", "Kinetic shield", 1, s=0, "Absorbs physical damage, spending mana", vfh="VFX_ShieldHit", vfc="VFX_ShieldCast"},
{509, "lifeLeech", "Life leech", 0.5, s=4, "Heals for a portion of your physical damage"},
{510, "timeShift", "Time shift", 1, s=3, "Slows perception of time"},
{511, "chargeFire", "Charge fire", 0.5, s=4, ss=6, "Adds fire damage to attacks", snd=4}, {512, "chargeFrost", "Charge frost", 0.5, s=4, ss=7, "Adds frost damage to attacks", snd=4},
{513, "chargeShock", "Charge shock", 0.5, s=4, ss=8, "Adds shock damage to attacks", snd=4}, {514, "chargePoison", "Charge poison", 0.5, s=4, ss=9, "Adds poison damage to attacks", snd=4},
{515, "chargeVitality", "Charge vitality", 0.5, s=4, ss=10, "Adds vitality damage to attacks", snd=4},
{516, "auraFire", "Aura fire", 0.5, s=2, ss=6, "Deals fire damage to all enemies around you", con=1, c1=0, c2=0, vfh="VFX_FireShield"}, {517, "auraFrost", "Aura frost", 0.5, s=2, ss=7, "Deals frost damage to all enemies around you", con=1, c1=0, c2=0, vfh="VFX_FrostShield"},
{518, "auraShock", "Aura shock", 0.5, s=2, ss=8, "Deals shock damage to all enemies around you", con=1, c1=0, c2=0, vfh="VFX_LightningShield"}, {519, "auraPoison", "Aura poison", 0.5, s=2, ss=9, "Deals poison damage to all enemies around you", con=1, c1=0, c2=0},
{520, "auraVitality", "Aura vitality", 0.5, s=2, ss=10, "Deals vitality damage to all enemies around you", con=1, c1=0, c2=0, vfh="VFX_DestructHit"},
{521, "aoeFire", "AoE fire", 3, s=2, ss=6, "Deals fire damage to an area", c0=0, c1=0, h=1, col = AOEcol}, {522, "aoeFrost", "AoE frost", 3, s=2, ss=7, "Deals frost damage to an area", c0=0, c1=0, h=1, col = AOEcol},
{523, "aoeShock", "AoE shock", 4, s=2, ss=8, "Deals shock damage to an area", c0=0, c1=0, h=1, col = AOEcol}, {524, "aoePoison", "AoE poison", 5, s=2, ss=9, "Deals poison damage to an area", c0=0, c1=0, h=1, col = AOEcol},
{525, "aoeVitality", "AoE vitality", 4, s=2, ss=10, "Deals vitality damage to an area", c0=0, c1=0, h=1, col = AOEcol},
{526, "runeFire", "Rune fire", 3, s=2, ss=6, "Creates fire rune, exploding when touched by enemy", c0=0, c1=0, h=1, col = RUNcol}, {527, "runeFrost", "Rune frost", 3, s=2, ss=7, "Creates frost rune, exploding when touched by enemy", c0=0, c1=0, h=1, col = RUNcol},
{528, "runeShock", "Rune shock", 4, s=2, ss=8, "Creates shock rune, exploding when touched by enemy", c0=0, c1=0, h=1, col = RUNcol}, {529, "runePoison", "Rune poison", 5, s=2, ss=9, "Creates poison rune, exploding when touched by enemy", c0=0, c1=0, h=1, col = RUNcol},
{530, "runeVitality", "Rune vitality", 4, s=2, ss=10, "Creates chaos rune, exploding when touched by enemy", c0=0, c1=0, h=1, col = RUNcol},
{531, "prokFire", "Prok fire", 0.5, s=4, ss=6, "Launch fire ball at regular intervals", c1=0, c2=0, snd=4}, {532, "prokFrost", "Prok frost", 0.5, s=4, ss=7, "Launch frost ball at regular intervals", c1=0, c2=0, snd=4},
{533, "prokShock", "Prok shock", 0.5, s=4, ss=8, "Launch shock ball at regular intervals", c1=0, c2=0, snd=4}, {534, "prokPoison", "Prok poison", 0.5, s=4, ss=9, "Launch poison ball at regular intervals", c1=0, c2=0, snd=4},
{535, "prokVitality", "Prok vitality", 0.5, s=4, ss=10, "Launch chaos ball at regular intervals", c1=0, c2=0, snd=4},
{536, "shotgunFire", "Spread fire", 15, s=2, ss=6, "Shoots a group of fire balls", c0=0, c2=0}, {537, "shotgunFrost", "Spread frost", 15, s=2, ss=7, "Shoots a group of frost balls", c0=0, c2=0},
{538, "shotgunShock", "Spread shock", 20, s=2, ss=8, "Shoots a group of shock balls", c0=0, c2=0}, {539, "shotgunPoison", "Spread poison", 25, s=2, ss=9, "Shoots a group of poison balls", c0=0, c2=0},
{540, "shotgunVitality", "Spread vitality", 20, s=2, ss=10, "Shoots a group of chaos balls", c0=0, c2=0},
{541, "dischargeFire", "Discharge fire", 3, s=2, ss=6, "Explosion of fire strikes everyone around", c0=0, c2=0}, {542, "dischargeFrost", "Discharge frost", 3, s=2, ss=7, "Explosion of frost strikes everyone around", c0=0, c2=0},
{543, "dischargeShock", "Discharge shock", 4, s=2, ss=8, "Explosion of lightning strikes everyone around", c0=0, c2=0}, {544, "dischargePoison", "Discharge poison", 5, s=2, ss=9, "Explosion of poison strikes everyone around", c0=0, c2=0},
{545, "dischargeVitality", "Discharge vitality", 4, s=2, ss=10, "Explosion of chaos strikes everyone around", c0=0, c2=0},
{546, "rayFire", "Ray fire", 30, s=2, ss=6, "Fires a ray of fire", c0=0, c2=0}, {547, "rayFrost", "Ray frost", 30, s=2, ss=7, "Fires a ray of frost", c0=0, c2=0},
{548, "rayShock", "Ray shock", 40, s=2, ss=8, "Fires a ray of lightning", c0=0, c2=0}, {549, "rayPoison", "Ray poison", 50, s=2, ss=9, "Fires a ray of poison", c0=0, c2=0},
{550, "rayVitality", "Ray vitality", 40, s=2, ss=10, "Fires a ray of chaos magic", c0=0, c2=0},
{551, "totemFire", "Totem fire", 0.5, s=4, ss=6, "Creates a totem that shoots fire at your enemies", c0=0, c1=0, h=1, col = TOTcol}, {552, "totemFrost", "Totem frost", 0.5, s=4, ss=7, "Creates a totem that shoots frost at your enemies", c0=0, c1=0, h=1, col = TOTcol},
{553, "totemShock", "Totem shock", 0.5, s=4, ss=8, "Creates a totem that shoots lightning at your enemies", c0=0, c1=0, h=1, col = TOTcol}, {554, "totemPoison", "Totem poison", 0.5, s=4, ss=9, "Creates a totem that shoots poison at your enemies", c0=0, c1=0, h=1, col = TOTcol},
{555, "totemVitality", "Totem vitality", 0.5, s=4, ss=10, "Creates a totem that shoots magic at your enemies", c0=0, c1=0, h=1, col = TOTcol},
{556, "empowerFire", "Empower fire", 1, s=4, ss=6, "Empower your fire spells", snd=4}, {557, "empowerFrost", "Empower frost", 1, s=4, ss=7, "Empower your frost spells", snd=4},
{558, "empowerShock", "Empower shock", 1, s=4, ss=8, "Empower your shock spells", snd=4}, {559, "empowerPoison", "Empower poison", 1, s=4, ss=9, "Empower your poison spells", snd=4},
{560, "empowerVitality", "Empower vitality", 1, s=4, ss=10, "Empower your vitality damage spells", snd=4},
{561, "reflectFire", "Reflect fire", 1, s=4, ss=6, "Converts enemy spells energy into fire and reflects it", snd=4}, {562, "reflectFrost", "Reflect frost", 1, s=4, ss=7, "Converts enemy spells energy into frost and reflects it", snd=4},
{563, "reflectShock", "Reflect shock", 1, s=4, ss=8, "Converts enemy spells energy into lightning and reflects it", snd=4}, {564, "reflectPoison", "Reflect poison", 1, s=4, ss=9, "Converts enemy spells energy into poison and reflects it", snd=4},
{565, "reflectVitality", "Reflect vitality", 1, s=4, ss=10, "Converts enemy spells energy into magic and reflects it", snd=4}}
for _,e in ipairs(MEN) do tes3.claimSpellEffectId(e[2], e[1])	tes3.addMagicEffect{id = e[1], name = e[3], baseCost = e[4], school = e.s, description = e[5] or e[3],
allowEnchanting = not e.ale, allowSpellmaking = not e.als, canCastSelf = not e.c0, canCastTarget = not e.c1, canCastTouch = not e.c2, isHarmful = not not e.h, hasNoDuration = not not e.nod, hasNoMagnitude = not not e.nom,
nonRecastable = not not e.nor, hasContinuousVFX = not not e.con, appliesOnce = not e.apo, unreflectable = not not e.unr, casterLinked = false, illegalDaedra = false, targetsAttributes = false, targetsSkills = false, usesNegativeLighting = false,
castSound = S[e.snd or e.ss or e.s].sc, boltSound = e.sb or S[e.snd or e.ss or e.s].sb, hitSound = S[e.snd or e.ss or e.s].sh, areaSound = S[e.snd or e.ss or e.s].sa,
castVFX = e.vfc or S[e.vfx or e.ss or e.s].vc, boltVFX = e.vfb or S[e.vfx or e.ss or e.s].vb, hitVFX = e.vfh or S[e.vfx or e.ss or e.s].vh, areaVFX = e.vfa or S[e.vfx or e.ss or e.s].va,
particleTexture = e.p or S[e.ss or e.s].p, icon = "s\\"..e[2]..".tga", speed = e.sp or 1, size = 1, sizeCap = 50, lighting = S[e.ss or e.s].l, onCollision = e.col or nil, onTick = e.tik or nil} end

local OBJ = {["potion_skooma_01"] = {[4]=510},	["4nm_star_shadow3a"] = {[7]=600},	["4nm_class_06"] = {[5]=501},	["4nm_class_07"] = {[8]=600},	["4nm_class_08"] = {[6]=600},	["4nm_class_12"] = {[8]=501},
["4nm_class_14"] = {[6]=501},	["4nm_class_15"] = {[3]=501,[7]=600},	["4nm_class_16"] = {[7]=600},		["4nm_class_17"] = {[7]=501,[8]=600},	["4nm_class_18"] = {[6]=600},	["4nm_class_19"] = {[7]=600},
["4nm_class_22"] = {[4]=600},	["4nm_class_23"] = {[3]=501,[5]=600},	["4nm_class_24"] = {[1]=600},		["thunder fist"] = {[2]=512, [3]=513},		["wizard's brand"] = {[2]=511, [3]=513},
["4a_con1"] = {[1]=601,[7]=603},	["4a_enc"] = {[1]=501},		["4a_alt1"] = {[3]=600},		["4a_mys3"] = {[2]=507},	["4a_sec"] = {[1]=510},		["4a_arm"] = {[1]=502,[2]=503},
["ward of endus"] = {[3]=556,[4]=557,[5]=558},	["ward of odros"] = {[5]=511,[6]=561},		["ward of vemyn"] = {[3]=509},		["ward of tureynul"] = {[6]=507,[7]=508},	["ward of uthol"] = {[1]=501},
["drakespride_en_uniq"] = {[2]=501,[5]=507},	["necromancers_amulet_en"] = {[5]=501},
["levitate_peakstar_en"] = {[2]=600}, 			["Wind Whisper"] = {[3]=600}, 			["Caius' Subtlety"] = {[2]=600}, 		["bm_amulspd"] = {[5]=600}, 				["wraithguard_en"] = {[1]=507,[2]=508},
["warlock's sphere"] = {[4]=507,[5]=509}, 		["watchful spirit"] = {[3]=508}, 		["hircine's blessing"] = {[2]=507},			["theranafeather_en_uniq"] = {[2]=508}, 	["Marara's Boon"] = {[3]=507},
["hort_ledd_shield"] = {[2]=507,[3]=508}, 		["will_en"] = {[2]=507},				["armor of god_en"] = {[1]=507,[2]=508}, 	["Spell Breaker"] = {[2]=507},				["dragon aura"] = {[2]=556},
["stroris"] = {[2]=512,[3]=557,[4]=562},		["bitter mercy"] = {[2]=513,[3]=558,[4]=563},
["ward of araynys"] = {[1]=556,[2]=557,[3]=558,[4]=511,[5]=512,[6]=513,[7]=506},		["ward of gilvoth"] = {[4]=561,[5]=562,[6]=563,[7]=506},	["ward of dagoth"] = {[6]=600,[7]=510,[8]=506},
["tenpaceboots_en"] = {[5]=600}, 				["we_stormforge_en"] = {[2]=513}, 		["mazedband"] = {[1]=500},
} -- [""] = {[]=}, [""] = {[]=}, [""] = {[]=}, [""] = {[]=}, [""] = {[]=}, [""] = {[]=}, [""] = {[]=}, [""] = {[]=},
for id, t in pairs(OBJ) do E = tes3.getObject(id).effects	for i, eid in pairs(t) do E[i].id = eid end end

if cf.scroll then for b in tes3.iterateObjects(tes3.objectType.book) do if b.type == 1 and b.enchantment then b.icon = ("scrolls\\tx_scroll_%s.dds"):format(b.enchantment.effects[1].id) end end end
mwse.memory.writeFunctionCall{address = 0x4D0CD5, length = 0x10, signature = {returns = "int"}, call = function() if P then return tes3.player.object.level > 99 and 100 or math.max(tes3.player.object.level * (P.luc11 and 1 or 0.3), 5) end end}
mwse.memory.writeBytes{address = 0x5C3B6C, bytes={0x90, 0x90, 0x90, 0x90, 0xD9, 0x44, 0x24, 0x10}} -- фикс стоимости зачарований
end		event.register("initialized", initialized)

local function registerModConfig()		local template = mwse.mcm.createTemplate("4NM")	template:saveOnClose("4NM", cf)		template:register()		local var = mwse.mcm.createTableVariable
local p1, p0, p2, p3 = template:createPage(cf.en and "Interface" or "Интерфейс"), template:createPage(cf.en and "Modules" or "Модули"), template:createPage(cf.en and "Buttons" or "Кнопки"), template:createPage(cf.en and "Mechanics" or "Удобства")
p0:createSlider{label = cf.en and "Difficulty level: 1 - Hard, 2 - Medium, 3 - Easy. The difficulty only affects the number of perkpoints per level" or
"Уровень сложности: 1 - Тяжело, 2 - Средне, 3 - Легко. Сложность влияет только на количество перкпоинтов за уровень", min = 1, max = 3, step = 1, jump = 1, variable = var{id = "pmult", table = cf}}
p0:createYesNoButton{label = cf.en and "Enable improved creature abilities" or "Улучшенные способности существ", variable = var{id = "full", table = cf}}
p0:createSlider{label = cf.en and "The minimum percentage of creature power. Default: 80" or "Минимальный процент силы существ. По умолчанию 80", min = 50, max = 200, step = 1, jump = 5, variable = var{id = "min", table = cf}}
p0:createSlider{label = cf.en and "The maximum percentage of creature power. Default: 120" or "Максимальный процент силы существ. По умолчанию 120", min = 50, max = 200, step = 1, jump = 5, variable = var{id = "max", table = cf}}
p0:createYesNoButton{label = cf.en and "Enable advanced leveling system" or "Продвинутая система левелинга", variable = var{id = "levmod", table = cf}}
p0:createYesNoButton{label = cf.en and "Enable advanced training system" or "Продвинутая система набора опыта", variable = var{id = "trmod", table = cf}, restartRequired = true}
p0:createYesNoButton{label = cf.en and "Enable skill points system" or "Включить систему скиллпоинтов для обучения у тренеров", variable = var{id = "skillp", table = cf}}
p0:createYesNoButton{label = cf.en and "Enable realistic run speed" or "Реалистичная скорость бега", variable = var{id = "Spd", table = cf}, restartRequired = true}
p0:createYesNoButton{label = cf.en and "Enable realistic hit chance" or "Реалистичный шанс на попадание", variable = var{id = "hit", table = cf}, restartRequired = true}
p0:createYesNoButton{label = cf.en and "Enable realistic injury and fatigue in combat" or "Реалистичная травматичность и утомляемость в бою", variable = var{id = "traum", table = cf}}
p0:createYesNoButton{label = cf.en and "Enable advanced alchemy" or "Продвинутая алхимия", variable = var{id = "alc", table = cf}, restartRequired = true}
p0:createYesNoButton{label = cf.en and "Enable advanced economics" or "Продвинутая экономика", variable = var{id = "barter", table = cf}, restartRequired = true}
p0:createYesNoButton{label = cf.en and "Enable advanced stealth" or "Продвинутый стелс", variable = var{id = "stels", table = cf}, restartRequired = true}
p0:createYesNoButton{label = cf.en and "Enable constant enchantments limit" or "Ограничение объема постоянных зачарований", variable = var{id = "enchlim", table = cf}}
p0:createYesNoButton{label = cf.en and "Enable minimum duration for homemade spells" or "Ограничение длительности самодельных спеллов", variable = var{id = "durlim", table = cf}, restartRequired = true}
p0:createYesNoButton{label = cf.en and "Enable improved targeting magic for enemies" or "Улучшенное наведение магии для врагов", variable = var{id = "spellhit", table = cf}}
p0:createYesNoButton{label = cf.en and "Arrows get stuck on hit" or "Стрелы будут застревать при попадании", variable = var{id = "Proj", table = cf}, restartRequired = true}
p0:createYesNoButton{label = cf.en and "Bug-fix of idle shooting - enable only if shooters are bugged" or "Баг-фикс стрельбы вхолостую - включать только если забагуются стрелки", variable = var{id = "ammofix", table = cf}}
p0:createYesNoButton{label = cf.en and "Anti-exploit for homemade spells" or "Анти-эксплойт с самодельными спеллами", variable = var{id = "aspell", table = cf}, restartRequired = true}
p0:createSlider{label = cf.en and "How many seconds does it take for enemies to switch to throwing stones" or "Сколько секунд надо затупившим врагам на то чтобы начать кидать камни в героя",
min = 0, max = 10, step = 1, jump = 1, variable = var{id = "AIsec", table = cf}}

p1:createYesNoButton{label = "English language", variable = var{id = "en", table = cf}, restartRequired = true}
p1:createYesNoButton{label = cf.en and "Show new mechanics messages" or "Показывать сообщения о новых механиках", variable = var{id = "m", table = cf}}
p1:createYesNoButton{label = cf.en and "Show magic power messages" or "Показывать сообщения о силе магии", variable = var{id = "m1", table = cf}}
p1:createYesNoButton{label = cf.en and "Show magic cast messages" or "Показывать сообщения о касте магии", variable = var{id = "m10", table = cf}}
p1:createYesNoButton{label = cf.en and "Show magic affect messages" or "Показывать сообщения о вторичных магических эффектах", variable = var{id = "m2", table = cf}}
p1:createYesNoButton{label = cf.en and "Show combat messages" or "Показывать боевые сообщения", variable = var{id = "m3", table = cf}}
p1:createYesNoButton{label = cf.en and "Show AI messages" or "Показывать сообщения для модуля ИИ", variable = var{id = "m4", table = cf}}
p1:createYesNoButton{label = cf.en and "Show item messages" or "Показывать сообщений о предметах", variable = var{id = "m8", table = cf}}
p1:createYesNoButton{label = cf.en and "Show alchemy messages" or "Показывать алхимические сообщения", variable = var{id = "m5", table = cf}}
p1:createYesNoButton{label = cf.en and "Show economic messages" or "Показывать экономические сообщения", variable = var{id = "m6", table = cf}}
p1:createYesNoButton{label = cf.en and "Show training messages" or "Показывать сообщения об опыте", variable = var{id = "m7", table = cf}}
p1:createYesNoButton{label = cf.en and "Show randomizer messages" or "Показывать сообщения рандомизатора", variable = var{id = "m9", table = cf}}
p1:createYesNoButton{label = cf.en and "Show stealth messages" or "Показывать сообщения о скрытности", variable = var{id = "m11", table = cf}}
p1:createSlider{label = cf.en and "Set number of icons in 1 line in Improved magic menu" or "Сколько иконок будет в одной строке Улучшенного меню магии", min = 5, max = 50, step = 1, jump = 5, variable = var{id = "lin", table = cf}}
p1:createSlider{label = cf.en and "Font color in Improved magic menu (0 = no text)" or "Цвет шрифта в улучшенном меню магии (0 = без текста)", min = 0, max = 8, step = 1, jump = 1, variable = var{id = "UIcol", table = cf}}
p1:createYesNoButton{label = cf.en and "Improved spell menu (requires save load)" or "Улучшенное меню заклинаний", variable = var{id = "UIsp", table = cf}}
p1:createYesNoButton{label = cf.en and "Improved enchanted items menu (requires save load)" or "Улучшенное меню зачарованных предметов", variable = var{id = "UIen", table = cf}}
p1:createYesNoButton{label = cf.en and "Improved spell creation menu" or "Улучшеное меню создания заклинаний", variable = var{id = "spmak", table = cf}}
p1:createYesNoButton{label = cf.en and "Replace potion icons with better ones" or "Заменить иконки зелий на информативные", variable = var{id = "lab", table = cf}, restartRequired = true}
p1:createYesNoButton{label = cf.en and "Replace scroll icons with beautiful ones" or "Заменить иконки свитков на красивые", variable = var{id = "scroll", table = cf}, restartRequired = true}

p2:createCategory(cf.en and "Mouse buttons: 1 - left, 2 - right, 3 - middle, 4-7 - side" or "Кнопки мыши: 1 - левая, 2 - правая, 3 - средняя, 4-7 - боковые")
p2:createKeyBinder{variable = var{id = "pkey", table = cf}, label = cf.en and "Perks Menu" or "Вызвать меню перков"}
p2:createKeyBinder{variable = var{id = "tpkey", table = cf}, label = cf.en and "Dash / active dodge key" or "Кнопка для дэшей и активных уклонений"}
p2:createSlider{label = cf.en and "Mouse button for active dodge (hold while using dash to use active dodge instead of dash)" or 
"Кнопка мыши для активного уклонения (зажмите при использовании дэша, чтобы применить активное уклонение вместо дэша)", min = 2, max = 7, step = 1, jump = 1, variable = var{id = "mbdod", table = cf}}
p2:createKeyBinder{variable = var{id = "kikkey", table = cf}, label = cf.en and "Kicking and climbing key. It is recommended to assign the same button as for the jump" or
"Кнопка для удара ногой и карабканья. Рекомендуется назначить ту же кнопку что и для прыжка"}
p2:createSlider{label = cf.en and "Mouse button for kicking and climbing" or "Кнопка мыши для удара ногой и карабканья", min = 2, max = 7, step = 1, jump = 1, variable = var{id = "mbkik", table = cf}}
p2:createKeyBinder{variable = var{id = "magkey", table = cf}, label = cf.en and "Key for Extra cast. Press slot key with SHIFT to assign the current spell to this Extra cast slot" or
"Кнопка Экстра-каста. Нажмите одну из кнопок выбора слота экстра-каста вместе с SHIFT чтобы назначить текущий спелл для этого слота"}
p2:createKeyBinder{variable = var{id = "ekey", table = cf}, label = cf.en and
[[Hold this key when: Equipping weapon - to remember it for left hand; Equipping poison - to use it for throwing; Activating the apparatus - to display the alchemy menu without adding it to your inventory;
Equipping repair kit - repair menu will not appear, but there will only be an upgrade menu]] or
[[Удерживайте эту кнопку: При экипировке оружия - чтобы запомнить его для левой руки; При экипировке яда - чтобы кидать бутылки; При активации аппарата - чтобы алхимическое меню появилось без взятия этого апаарата;
При экипировке ремнабора - и тогда меню ремонта не появится, а появится сразу меню апгрейда]]}
p2:createKeyBinder{variable = var{id = "dwmkey", table = cf}, label = cf.en and "Switch to dual-weapon mode. Press this button while holding ALT to forget the left weapon" or
"Переключение режима двух оружий. Нажмите эту кнопку, удерживая ALT, чтобы забыть оружие для левой руки"}
p2:createKeyBinder{variable = var{id = "gripkey", table = cf}, label = cf.en and "Press this key when equip weapon to change it grip" or "Нажмите эту кнопку при экипировке оружия чтобы сменить его хват"}
p2:createSlider{label = cf.en and "Mouse button for charge attack (hold while attack)" or "Кнопка мыши для чардж-атаки (зажмите при атаке)", min = 2, max = 7, step = 1, jump = 1, variable = var{id = "mbcharg", table = cf}}
p2:createSlider{label = cf.en and "Mouse button for throwing weapons (hold while attacking)" or "Кнопка мыши для кидания оружия (зажмите при атаке)", min = 2, max = 7, step = 1, jump = 1, variable = var{id = "mbmet", table = cf}}
p2:createSlider{label = cf.en and "Mouse button for alternative shots (press while holding LMB for bows and throwing weapons; hold and press LMB for crossbows)" or
"Кнопка мыши для альтернативных выстрелов (нажмите при зажатой ЛКМ для луков и метательного оружия; удерживайте и нажимайте ЛКМ для арбалетов)", min = 2, max = 7, step = 1, jump = 1, variable = var{id = "mbshot", table = cf}}
p2:createSlider{label = cf.en and "Mouse button to hold breath when archery (select 1 for automatic hold)" or
"Кнопка мыши для задержки дыхания при стрельбе из лука (выберите 1 для автоматической задержки)", min = 1, max = 7, step = 1, jump = 1, variable = var{id = "mbarc", table = cf}}
p2:createSlider{label = cf.en and "Mouse button for weighting magic projectiles (hold while casting)" or "Кнопка мыши для утяжеления магических снарядов (зажмите при касте)",
min = 1, max = 7, step = 1, jump = 1, variable = var{id = "mbhev", table = cf}}
p2:createSlider{label = cf.en and "Mouse button for alternate ray mode (hold while casting)" or "Кнопка мыши для альтернативного режима луча (зажмите при касте)", min = 1, max = 7, step = 1, jump = 1, variable = var{id = "mbray", table = cf}}
p2:createSlider{label = cf.en and "Mouse button to extend the life of summoned creatures (hold while charging magic and looking at the creature)" or
"Кнопка мыши для продления жизни призванных существ (удерживайте, заряжая магию и смотря на существо)", min = 1, max = 7, step = 1, jump = 1, variable = var{id = "mbsum", table = cf}}
p2:createSlider{label = cf.en and "Mouse button to return controlled projectiles" or "Кнопка мыши для возврата контролируемых снарядов", min = 1, max = 7, step = 1, jump = 1, variable = var{id = "mbret", table = cf}}
p2:createKeyBinder{variable = var{id = "cpkey", table = cf}, label = cf.en and "Projectile control mode key. Press with: Move buttons = switch modes; ALT = turn Smart mode; CTRL = turn Mine mode; LMB = release projectiles" or
"Кнопка для контроля снарядов. Нажмите ее вместе с: кнопками движения = переключить режимы; ALT = переключить умный режим; CTRL = переключить режим мин; ЛКМ = отпустить снаряды"}
p2:createKeyBinder{variable = var{id = "telkey", table = cf}, label = cf.en and "Telekinetic Throw key. Press again to return thrown weapon. Hold while activating or dropping weapons." or
"Кнопка для телекинетического броска. Нажмите повторно чтобы вернуть брошенное оружие. Удерживайте ее во время активации или выбрасывания предмета."}
p2:createKeyBinder{variable = var{id = "cwkey", table = cf}, label = cf.en and "Charge weapon key. Press with SHIFT to turn mode. Press with CTRL to switch ranged/touch mode. Press with ALT to disable enchantments on strike" or
"Конпка для эффекта заряженного оружия. Нажмите ее вместе с SHIFT для переключения режима. Нажмите вместе с CTRL для пререключения дальности. Нажмите вместе с ALT для запрета применять зачарования при ударе"}
p2:createKeyBinder{variable = var{id = "reflkey", table = cf}, label = cf.en and "Turn reflect/manashield mode for new reflect spells. Press with: CTRL - switch auras mode; SHIFT - switch procs mode" or
"Кнопка для переключения режима отражения и манащита для эффектов нового отражения. Нажмите ее вместе с: CTRL - переключить режим аур; SHIFT - переключить режим проков"}
p2:createKeyBinder{variable = var{id = "totkey", table = cf}, label = cf.en and "Press to switch totem mode. Press with SHIFT to explode all runes. Press with CTRL to explode all totems." or
"Нажмите для переключения режима тотемов. Нажмите вместе с SHIFT чтобы взорвать все руны. Нажмите вместе с CTRL чтобы взорвать все тотемы."}
p2:createKeyBinder{variable = var{id = "detkey", table = cf}, label = cf.en and "Use magic vision for detection" or "Кнопка для применения магического зрения для магии обнаружения"}
p2:createKeyBinder{variable = var{id = "markkey", table = cf}, label = cf.en and "Key for select mark for recall" or "Кнопка для выбора текущей Пометки для магии Возврата"}
p2:createKeyBinder{variable = var{id = "bwkey", table = cf}, label = cf.en and "Choosing a bound weapon. Press with CTRL for replenishment of bound ammo" or
"Выбор призванного оружия. Нажмите вместе с CTRL для пополнения призванных снарядов"}
p2:createKeyBinder{label = cf.en and "Assign a button to toggle poison mode. If poison mode enabled, you will create poisons instead of potions, and also apply them to your weapons instead of drinking" or
"Кнопка для режима яда. Когда режим яда включен, вы варите яды вместо зелий а также отравляете свое оружие ядом вместо выпивания", variable = var{id = "poisonkey", table = cf}}
p2:createKeyBinder{variable = var{id = "q0", table = cf}, label = cf.en and [[Universal Extra cast slot. If selected, the current spell will always be prepared for a Extra cast.
Press this button with SHIFT to add/remove current spell to Favorite Spells list. Press this button with ALT to clear this list.
Spells from Favorite list are placed at the top of the Improved Magic Menu. Changes to the list take effect after loading the save.]] or
[[Кнопка выбора универсального слота для экстра-каста. Если универсальный слот выбран, то для экстра-каста всегда будет использован только ваш текущий спелл.
Нажмите эту кнопку вместе с SHIFT чтобы добавить/удалить текущий спелл в список Избранных Спеллов. Нажмите эту кнопку вместе с ALT чтобы очистить этот список.
Спеллы из Избранного списка помещаются наверх в Улучшенном меню магии. Изменения списка вступают в силу после загрузки сейва.]]}
p2:createKeyBinder{variable = var{id = "q1", table = cf}, label = cf.en and "Extra cast slot #1" or "Слот экстра-каста #1"}
p2:createKeyBinder{variable = var{id = "q2", table = cf}, label = cf.en and "Extra cast slot #2" or "Слот экстра-каста #2"}
p2:createKeyBinder{variable = var{id = "q3", table = cf}, label = cf.en and "Extra cast slot #3" or "Слот экстра-каста #3"}
p2:createKeyBinder{variable = var{id = "q4", table = cf}, label = cf.en and "Extra cast slot #4" or "Слот экстра-каста #4"}
p2:createKeyBinder{variable = var{id = "q5", table = cf}, label = cf.en and "Extra cast slot #5" or "Слот экстра-каста #5"}
p2:createKeyBinder{variable = var{id = "q6", table = cf}, label = cf.en and "Extra cast slot #6" or "Слот экстра-каста #6"}
p2:createKeyBinder{variable = var{id = "q7", table = cf}, label = cf.en and "Extra cast slot #7" or "Слот экстра-каста #7"}
p2:createKeyBinder{variable = var{id = "q8", table = cf}, label = cf.en and "Extra cast slot #8" or "Слот экстра-каста #8"}
p2:createKeyBinder{variable = var{id = "q9", table = cf}, label = cf.en and "Extra cast slot #9" or "Слот экстра-каста #9"}

p3:createSlider{label = cf.en and "Magnitude limiter for your dashes. Use a dash with middle mouse button pressed to remove this limitation" or
"Ограничитель магнитуды для ваших дэшей. Используйте дэш с зажатой средней кнопкой мыши чтобы снять это ограничение", min = 0, max = 100, step = 1, jump = 5, variable = var{id = "dash", table = cf}}
p3:createSlider{label = cf.en and "Magnitude limiter for your charge attacks" or "Ограничитель магнитуды для ваших чардж-атак", min = 0, max = 100, step = 1, jump = 5, variable = var{id = "charglim", table = cf}}
p3:createSlider{label = cf.en and "Magnitude limiter for your kinetic kicks" or "Ограничитель магнитуды для ваших кинетических пинков", min = 0, max = 100, step = 1, jump = 5, variable = var{id = "moment", table = cf}}
p3:createSlider{label = cf.en and "Magnitude limiter for your kinetic throws" or "Ограничитель магнитуды для ваших кинетических бросков", min = 0, max = 100, step = 1, jump = 5, variable = var{id = "metlim", table = cf}}
p3:createYesNoButton{label = cf.en and "Automatically kick after dash (if dash is done with middle mouse button pressed)" or "Автоматически делать пинок после дэша (если дэш сделан с зажатой средней кнопкой мыши)", variable = var{id = "autokik", table = cf}}
p3:createYesNoButton{label = cf.en and "Automatically charge attack if you are looking at an enemy" or "Автоматически делать чардж-атаку если вы смотрите на врага", variable = var{id = "autocharg", table = cf}}
p3:createSlider{label = cf.en and "Percentage limiter for your manashield" or "Ограничитель процента эффективности для вашего манащита", min = 0, max = 100, step = 1, jump = 5, variable = var{id = "mshmax", table = cf}}
p3:createSlider{label = cf.en and "Percentage limiter for your reflects" or "Ограничитель процента эффективности для ваших отражений", min = 0, max = 100, step = 1, jump = 5, variable = var{id = "rfmax", table = cf}}
p3:createYesNoButton{label = cf.en and "Charged weapon: smart mode for range weapons" or "Эффект заряженного оружия: включить умный режим для дальнобойного оружия", variable = var{id = "smartcw", table = cf}}
p3:createYesNoButton{label = cf.en and "Agressive mode for your auras, totems and homing projectiles" or "Агрессивный режим для ваших аур, тотемов и самонаведения", variable = var{id = "agr", table = cf}}
p3:createYesNoButton{label = cf.en and "Allow projectile control for magic rays" or "Разрешить контроль снарядов для магических лучей", variable = var{id = "raycon", table = cf}}
p3:createYesNoButton{label = cf.en and "Default ray mode (if not then spray)" or "Режим луча по умолчанию (если нет то будет спрей)", variable = var{id = "ray", table = cf}}
p3:createYesNoButton{label = cf.en and "Automatic replenishment of bound ammo" or "Автоматически пополнять призванные снаряды", variable = var{id = "autoammo", table = cf}}
p3:createYesNoButton{label = cf.en and "Allow telekinetic return of thrown weapons" or "Разрешить телекинетический возврат кинутого оружия", variable = var{id = "metret", table = cf}}
p3:createYesNoButton{label = cf.en and "Always shoot a crossbow in alternate mode" or "Всегда стрелять из арбалета в альтернативном режиме", variable = var{id = "autoarb", table = cf}}
p3:createSlider{label = cf.en and "Set color saturation of magic lights (0 = maximum colorfulness, 255 = full white)" or
"Насыщенность цвета для магических фонарей (0 = максимум цвета, 255 = чисто белый свет)", min = 0, max = 255, step = 1, jump = 5, variable = var{id = "col", table = cf}}
p3:createYesNoButton{label = cf.en and "Play sound of magic concentration (hold Left Mouse Button for concentrate power)" or
"Звук магической концентрации (удерживайте левую кнопку мыши чтобы сконцентрировать магию и зарядить спелл)", variable = var{id = "mcs", table = cf}}
p3:createSlider{label = cf.en and "Minimum crit power to play crit strike sound" or "Минимальная мощь крита для проигрывания звука крита", min = 0, max = 100, step = 1, jump = 5, variable = var{id = "crit", table = cf}}
p3:createYesNoButton{label = cf.en and "Maniac mode! You will try to undress knocked out enemies" or "Режим маньяка! Вы будете пытаться раздеть нокаутированных врагов", variable = var{id = "maniac", table = cf}}
p3:createYesNoButton{label = cf.en and "Automatic shield equipment" or "Автоматическая экипировка щитов", variable = var{id = "autoshield", table = cf}}
p3:createYesNoButton{label = cf.en and "Smart potion/poison discrimination mode. If the potion contains at least 1 negative effect, then this is poison" or
"Умный режим различения зелий и ядов. Работает со включенным режимом яда. Если зелье содержит хотябы 1 негативный эффект, то это яд, иначе зелье и вы его выпьете", variable = var{id = "smartpoi", table = cf}}
p3:createSlider{label = cf.en and "Minimum chance of success for upgrade offer" or "Минимальный шанс апгрейда для появления вещи в списке", min = 0, max = 100, step = 1, jump = 5, variable = var{id = "impmin", table = cf}}
end		event.register("modConfigReady", registerModConfig)