-- Instance Followup Data
-- Maps dungeon IDs to their boss encounters in order
-- Structure: [dungeonId][encounterEntry] = "Boss Name"
local addonName, addon = ...

addon.INSTANCE_FOLLOWUP_DATA = {
    -- ========================================
    -- VANILLA DUNGEONS
    -- ========================================
    
    -- Wailing Caverns (Dungeon ID: 1)
    [1] = {
        [585] = "Lady Anacondra",
        [586] = "Lord Cobrahn",
        [587] = "Kresh",
        [588] = "Lord Pythas",
        [589] = "Skum",
        [590] = "Lord Serpentis",
        [591] = "Verdan el Eterno",
        [592] = "Mutanus el Devorador"
    },
    
    -- Scholomance (Dungeon ID: 2)
    [2] = {
        [451] = "Kirtonos el Heraldo",
        [452] = "Jandice Barov",
        [453] = "Traquesangre",
        [454] = "Marduk Pozonegro",
        [455] = "Vectus",
        [456] = "Ras Murmuhelado",
        [457] = "Instructora Malicia",
        [458] = "Doctor Theolen Krastinov",
        [459] = "Cuidador del saber Polkelt",
        [460] = "El Raveniano",
        [461] = "Lord Alexei Barov",
        [462] = "Lady Illucia Barov",
        [463] = "Maestro Oscuro Gandling"
    },
    
    -- Ragefire Chasm (Dungeon ID: 4)
    [4] = {
        [430] = "Oggleflint",
        [431] = "Taragaman el Hambriento"
    },
    
    -- The Deadmines (Dungeon ID: 6)
    [6] = {
        [161] = "Rhahk'zor",
        [162] = "Sneed",
        [163] = "Gilnid",
        [164] = "Don Mamporro",
        [165] = "Cocinero",
        [166] = "Capitán Verdete",
        [167] = "Edwin VanCleef"
    },
    
    -- Shadowfang Keep (Dungeon ID: 8)
    [8] = {
        [464] = "Rethilgore",
        [465] = "Garrajadestripador el Carnicero",
        [466] = "Barón Filargenta",
        [467] = "Comandante Vallefont",
        [468] = "Odo el Vigía Ciego",
        [469] = "Fenrus el Devorador",
        [470] = "Maestro de lobos Nandos",
        [471] = "Archimago Arugal"
    },
    
    -- Blackfathom Deeps (Dungeon ID: 10)
    [10] = {
        [219] = "Ghamoo-ra",
        [220] = "Lady Sarevess",
        [221] = "Gelihast",
        [222] = "Lorgus Jett",
        [224] = "Viejo Serra'kis",
        [225] = "Señor Crepuscular Kelris",
        [226] = "Aku'mai"
    },
    
    -- The Stockade (Dungeon ID: 12)
    [12] = {
        [536] = "Targorr el Aterrador",
        [537] = "Kam Furiaprofunda",
        [538] = "Hamhock",
        [539] = "Bazil Thredd"
    },
    
    -- Gnomeregan (Dungeon ID: 14)
    [14] = {
        [378] = "Precipitado viscoso",
        [379] = "Grubbis",
        [380] = "Electrocutor 6000",
        [381] = "Aporreador de masas 9-60",
        [382] = "Mekigeniero Termochufe"
    },
    
    -- Razorfen Kraul (Dungeon ID: 16)
    [16] = {
        [438] = "Roogug",
        [439] = "Aggem Malaspina",
        [440] = "Portavoz de la muerte Jargba",
        [441] = "Señor supremo Colmipuerc",
        [443] = "Charlga Filonavaja"
    },
    
    -- Scarlet Monastery (Dungeon ID: 18, 163, 164, 165)
    [18] = {
        [444] = "Interrogador Vishas",
        [445] = "Mago de sangre Thalnos"
    },
    [163] = {
        [448] = "Herodes"
    },
    [164] = {
        [449] = "Alto inquisidor Fairbanks",
        [450] = "Alta inquisidora Melenablanca"
    },
    [165] = {
        [446] = "Maestro de canes Loksey",
        [447] = "Arcanista Doan"
    },
    
    -- Razorfen Downs (Dungeon ID: 20)
    [20] = {
        [432] = "Jergosh el Convocador",
        [433] = "Bazzalan",
        [434] = "Tuten'kash",
        [435] = "Mordresh Ojo de Fuego",
        [436] = "Tragón",
        [437] = "Amnennar el Gélido"
    },
    
    -- Uldaman (Dungeon ID: 22)
    [22] = {
        [547] = "Revelosh",
        [548] = "Los enanos perdidos",
        [549] = "Ironaya",
        [551] = "Vigía de piedra ancestral",
        [552] = "Galgann Martillo de Fuego",
        [553] = "Grimlok",
        [554] = "Archaedas"
    },
    
    -- Zul'Farrak (Dungeon ID: 24)
    [24] = {
        [593] = "Hidromántica Velratha",
        [594] = "Ghaz'rilla",
        [595] = "Antu'sul",
        [596] = "Theka el Mártir",
        [597] = "Médico brujo Zum'rah",
        [598] = "Nekrum Comevísceras",
        [599] = "Sacerdote de las sombras Sezz'ziz",
        [600] = "Jefe Ukorz Arenacabellera"
    },
    
    -- Maraudon (Dungeon ID: 26, 272, 273)
    [26] = {
        [422] = "Noxxion",
        [423] = "Latigador cortante"
    },
    [272] = {
        [424] = "Lord Lenguavil"
    },
    [273] = {
        [425] = "Celebras el Maldito",
        [426] = "Derrumbador",
        [427] = "Manitas Gizlock",
        [428] = "Dienteroto",
        [429] = "Princesa Theradras"
    },
    
    -- The Temple of Atal'Hakkar (Dungeon ID: 28)
    [28] = {
        [485] = "Atal'alarion",
        [486] = "Guadañasueños",
        [487] = "Tejedor",
        [488] = "Jammal'an el Profeta",
        [490] = "Morphaz",
        [491] = "Hazzas",
        [492] = "Avatar de Hakkar",
        [493] = "Sombra de Eranikus"
    },
    
    -- Blackrock Depths (Dungeon ID: 30, 276)
    [30] = {
        [227] = "Alta interrogadora Gerstahn"
    },
    [276] = {
        [228] = "Lord Roccor",
        [229] = "Maestro de canes Grebmar",
        [230] = "Círculo de la Ley",
        [231] = "Piromántico Semillalor",
        [232] = "Lord Incendius",
        [233] = "Guardián Stilgiss",
        [234] = "Fineous Forjoscuro",
        [235] = "Bael'Gar",
        [236] = "General Forjainquina",
        [237] = "Señor gólem Argelmach",
        [238] = "Hurley Negraliento",
        [239] = "Falange",
        [240] = "Ribbly Llavedoble",
        [241] = "Plugger Aropistón",
        [242] = "Embajador Latifuego",
        [243] = "Los Siete",
        [244] = "Magmus",
        [245] = "Emperador Dagran Thaurissan"
    },
    
    -- Lower Blackrock Spire (Dungeon ID: 32)
    [32] = {
        [267] = "Alto señor Omokk",
        [268] = "Cazadora de las sombras Vosh'gajin",
        [269] = "Maestro de guerra Voone",
        [270] = "Madre Telabrasa",
        [271] = "Urok Aullapocalipsis",
        [272] = "Intendente Zigris",
        [273] = "Gizrul el Esclavista",
        [274] = "Halycon",
        [275] = "Señor supremo Vermithalak"
    },
    
    -- Dire Maul (Dungeon ID: 34, 36, 38)
    [34] = {
        [343] = "Zevrim Pezuñahendida",
        [344] = "Hidromancia",
        [345] = "Lethtendris",
        [346] = "Alzzin el Formaferal"
    },
    [36] = {
        [347] = "Illyanna Roblecuervo",
        [348] = "Magister Kalendris",
        [349] = "Immol'thar",
        [350] = "Tendris Alabeo",
        [361] = "Príncipe Tortheldrin"
    },
    [38] = {
        [362] = "Guardia Mol'dar",
        [363] = "Pisotón Kreeg",
        [364] = "Guardia Fengus",
        [365] = "Guardia Slip'kik",
        [366] = "Capitán Kromcrush",
        [367] = "Cho'Rush el Observador",
        [368] = "Rey Gordok"
    },
    
    -- Stratholme (Dungeon ID: 40, 274)
    [40] = {
        [472] = "El Implacable",
        [473] = "Cantofuego Forresten",
        [474] = "Timmy el Cruel",
        [475] = "Maestro cañonero Willey",
        [476] = "Malor el Celoso",
        [477] = "Archivista Galford",
        [478] = "Balnazzar"
    },
    [274] = {
        [479] = "Baronesa Anastari",
        [480] = "Nerub'enkan",
        [481] = "Maleki el Pálido",
        [482] = "Magistrado Barthilas",
        [483] = "Ramstein el Empachador",
        [484] = "Barón Osahendido"
    },
    
    -- Upper Blackrock Spire (Dungeon ID: 44)
    [44] = {
        [276] = "Piroguardia Vigía de las Ascuas",
        [277] = "Solakar Corona de Fuego",
        [278] = "Jefe de Guerra Rend Puño Negro",
        [279] = "La Bestia",
        [280] = "General Drakkisath"
    },
    
    -- ========================================
    -- VANILLA RAIDS
    -- ========================================
    
    -- Zul'Gurub (Raid ID: 42)
    [42] = {
        [784] = "Sumo sacerdote Venoxis",
        [785] = "Suma sacerdotisa Jeklik",
        [786] = "Suma sacerdotisa Mar'li",
        [787] = "Señor sangriento Mandokir",
        [788] = "Borde de la Locura",
        [789] = "Sumo sacerdote Thekal",
        [790] = "Gahz'ranka",
        [791] = "Suma sacerdotisa Arlokk",
        [792] = "Jin'do el Aojador",
        [793] = "Hakkar"
    },
    
    -- Onyxia's Lair (Raid ID: 46, 257)
    [46] = {
        [707] = "Onyxia"
    },
    [257] = {
        [708] = "Onyxia"
    },
    
    -- Molten Core (Raid ID: 48)
    [48] = {
        [663] = "Lucifron",
        [664] = "Magmadar",
        [665] = "Gehennas",
        [666] = "Garr",
        [667] = "Shazzrah",
        [668] = "Barón Geddon",
        [669] = "Presagista Sulfuron",
        [670] = "Golemagg el Incinerador",
        [671] = "Mayordomo Executus",
        [672] = "Ragnaros"
    },
    
    -- Blackwing Lair (Raid ID: 50)
    [50] = {
        [610] = "Sangrevaja el Indomable",
        [611] = "Vaelastrasz el Corrupto",
        [612] = "Señor de linaje Capazote",
        [613] = "Faucefogo",
        [614] = "Ebonroc",
        [615] = "Flamagor",
        [616] = "Chromaggus",
        [617] = "Nefarian"
    },
    
    -- Ruins of Ahn'Qiraj (Raid ID: 160)
    [160] = {
        [718] = "Kurinnaxx",
        [719] = "General Rajaxx",
        [720] = "Moam",
        [721] = "Buru el Manducador",
        [722] = "Ayamiss el Cazador",
        [723] = "Osirio el Sinmarcas"
    },
    
    -- Temple of Ahn'Qiraj (Raid ID: 161)
    [161] = {
        [709] = "El profeta Skeram",
        [710] = "Realeza silítida",
        [711] = "Guardia de batalla Sartura",
        [712] = "Fankriss el Implacable",
        [713] = "Viscidus",
        [714] = "Princesa Huhuran",
        [715] = "Emperadores Gemelos",
        [716] = "Ouro",
        [717] = "C'thun"
    },
    
    -- Naxxramas (Raid ID: 159, 227)
    [159] = {
        [673] = "Anub'Rekhan",
        [677] = "Gran viuda Faerlina",
        [679] = "Maexxna",
        [681] = "Noth el Pesteador",
        [683] = "Heigan el Impuro",
        [685] = "Loatheb",
        [687] = "Instructor Razuvious",
        [690] = "Gothik el Cosechador",
        [692] = "Los Cuatro Jinetes",
        [694] = "Remendejo",
        [696] = "Grobbulus",
        [698] = "Gluth",
        [700] = "Thaddius",
        [702] = "Sapphiron",
        [704] = "Kel'Thuzad"
    },
    [227] = {
        [706] = "Kel'Thuzad"
    },
    
    -- ========================================
    -- THE BURNING CRUSADE DUNGEONS
    -- ========================================
    
    -- Hellfire Ramparts (Dungeon ID: 136, 188)
    [136] = {
        [392] = "Guardián vigía Gargolmar",
        [394] = "Omor el Sinmarcas",
        [396] = "Vazruden el Heraldo"
    },
    [188] = {
        [397] = "Vazruden el Heraldo"
    },
    
    -- The Blood Furnace (Dungeon ID: 137, 187)
    [137] = {
        [401] = "El Hacedor",
        [403] = "Broggok",
        [405] = "Keli'dan el Rompedor"
    },
    [187] = {
        [406] = "Keli'dan el Rompedor"
    },
    
    -- The Shattered Halls (Dungeon ID: 138, 189)
    [138] = {
        [407] = "Gran brujo Malbisojo",
        [409] = "Guardia de sangre Porung",
        [410] = "Belisario O'mrogg",
        [412] = "Jefe de Guerra Kargath Garrafilada"
    },
    [189] = {
        [413] = "Jefe de Guerra Kargath Garrafilada"
    },
    
    -- The Slave Pens (Dungeon ID: 140, 184)
    [140] = {
        [301] = "Mennu el Traidor",
        [302] = "Rokmar el Crujidor",
        [303] = "Quagmirran"
    },
    [184] = {
        [304] = "Mennu el Traidor",
        [305] = "Rokmar el Crujidor",
        [306] = "Quagmirran"
    },
    
    -- The Underbog (Dungeon ID: 146, 186)
    [146] = {
        [320] = "Hambrefronda",
        [322] = "Ghaz'an",
        [329] = "Señor del Pantano Musel'ek",
        [331] = "La Acechadora Negra"
    },
    [186] = {
        [332] = "La Acechadora Negra"
    },
    
    -- The Steamvault (Dungeon ID: 147, 185)
    [147] = {
        [314] = "Hidromántica Thespia",
        [316] = "Mekigeniero Vaporino",
        [318] = "Señor de la guerra Kalithresh"
    },
    [185] = {
        [319] = "Señor de la guerra Kalithresh"
    },
    
    -- Mana-Tombs (Dungeon ID: 148, 179)
    [148] = {
        [203] = "Pandemonius",
        [204] = "Tavarok",
        [205] = "Príncipe-Nexo Shaffar"
    },
    [179] = {
        [248] = "Pandemonius",
        [249] = "Tavarok",
        [250] = "Yor",
        [251] = "Príncipe-Nexo Shaffar"
    },
    
    -- Auchenai Crypts (Dungeon ID: 149, 178)
    [149] = {
        [201] = "Shirrak el Vigía de los Muertos",
        [202] = "Exarca Maladaar"
    },
    [178] = {
        [246] = "Shirrak el Vigía de los Muertos",
        [247] = "Exarca Maladaar"
    },
    
    -- Sethekk Halls (Dungeon ID: 150, 180)
    [150] = {
        [206] = "Tejeoscuro Syth",
        [207] = "Rey Garra Ikiss"
    },
    [180] = {
        [252] = "Tejeoscuro Syth",
        [253] = "Anzu",
        [254] = "Rey Garra Ikiss"
    },
    
    -- Shadow Labyrinth (Dungeon ID: 151, 181)
    [151] = {
        [208] = "Embajador Fauceinfernal",
        [209] = "Corazón Negro el Incitador",
        [210] = "Gran maestro Vorpil",
        [211] = "Murmullo"
    },
    [181] = {
        [255] = "Embajador Fauceinfernal",
        [256] = "Corazón Negro el Incitador",
        [257] = "Gran maestro Vorpil",
        [258] = "Murmullo"
    },
    
    -- Old Hillsbrad Foothills (Dungeon ID: 170, 171, 183)
    [170] = {
        [281] = "Cazador de Épocas"
    },
    [171] = {
        [283] = "Capitán Skarloc",
        [285] = "Teniente Drake",
        [287] = "Señor del tiempo Deja",
        [289] = "Temporus",
        [291] = "Aeonus"
    },
    [183] = {
        [282] = "Cazador de Épocas"
    },
    
    -- The Black Morass (Dungeon ID: 182)
    [182] = {
        [292] = "Aeonus"
    },
    
    -- The Mechanar (Dungeon ID: 172, 192)
    [172] = {
        [513] = "Señor mecánico Capacitus",
        [515] = "Abisalista Sepethrea",
        [517] = "Pathaleon el Calculador"
    },
    [192] = {
        [518] = "Pathaleon el Calculador"
    },
    
    -- The Botanica (Dungeon ID: 173, 191)
    [173] = {
        [502] = "Comandante Sarannis",
        [505] = "Gran botánico Freywinn",
        [507] = "Espinagrín el Tierno",
        [509] = "Laj",
        [511] = "Astilla de distorsión"
    },
    [191] = {
        [512] = "Astilla de distorsión"
    },
    
    -- The Arcatraz (Dungeon ID: 174, 190)
    [174] = {
        [494] = "Zereketh el Desatado",
        [496] = "Dalliah la Oradora del Sino",
        [498] = "Vidente de la Ira Soccothrates",
        [500] = "Presagista Cielorris"
    },
    [190] = {
        [501] = "Presagista Cielorris"
    },
    
    -- Magisters' Terrace (Dungeon ID: 198, 201)
    [198] = {
        [414] = "Selin Corazón de Fuego",
        [416] = "Vexallus",
        [418] = "Sacerdotisa Delrissa",
        [420] = "Kael'thas Caminante del Sol"
    },
    [201] = {
        [421] = "Kael'thas Caminante del Sol"
    },
    
    -- ========================================
    -- THE BURNING CRUSADE RAIDS
    -- ========================================
    
    -- Karazhan (Raid ID: 175)
    [175] = {
        [652] = "Attumen el Montero",
        [653] = "Moroes",
        [654] = "Doncella de Virtud",
        [655] = "Evento de la Ópera",
        [656] = "El Curator",
        [657] = "Terestian Pezuña Enferma",
        [658] = "Sombra de Aran",
        [659] = "Rencor Abisal",
        [660] = "Evento del Ajedrez",
        [661] = "Príncipe Malchezaar"
    },
    
    -- Karazhan - Nightbane (Raid ID: 48) - Note: shares with MC
    -- [662] = "Nightbane" - handled separately
    
    -- Magtheridon's Lair (Raid ID: 176)
    [176] = {
        [651] = "Magtheridon"
    },
    
    -- Gruul's Lair (Raid ID: 177)
    [177] = {
        [649] = "Su Majestad Maulgar",
        [650] = "Gruul el Asesino de Dragones"
    },
    
    -- Serpentshrine Cavern (Raid ID: 194)
    [194] = {
        [623] = "Hydross el Inestable",
        [624] = "El Protector del Fondo",
        [625] = "Leotheras el Ciego",
        [626] = "Señor de las profundidades Karathress",
        [627] = "Morogrim Levantamareas",
        [628] = "Lady Vashj"
    },
    
    -- Tempest Keep (The Eye) (Raid ID: 193)
    [193] = {
        [730] = "Al'ar",
        [731] = "Atracador del Vacío",
        [732] = "Gran astrónoma Solarian",
        [733] = "Kael'thas Caminante del Sol"
    },
    
    -- Battle for Mount Hyjal (Raid ID: 195)
    [195] = {
        [618] = "Ira Fríoinvierno",
        [619] = "Anetheron",
        [620] = "Kaz'rogal",
        [621] = "Azgalor",
        [622] = "Archimonde"
    },
    
    -- Black Temple (Raid ID: 196)
    [196] = {
        [601] = "Gran señor de la guerra Naj'entus",
        [602] = "Supremus",
        [603] = "Sombra de Akama",
        [604] = "Teron Sanguino",
        [605] = "Gurtogg Sangre Hirviente",
        [606] = "Relicario de Almas",
        [607] = "Madre Shahraz",
        [608] = "El Consejo Illidari",
        [609] = "Illidan Tempestira"
    },
    
    -- Zul'Aman (Raid ID: 197)
    [197] = {
        [772] = "Archavon el Vigía de Piedra",
        [774] = "Emalon el Vigía de la Tormenta",
        [776] = "Koralon el Vigía de las Llamas",
        [778] = "Akil'zon",
        [779] = "Nalorakk",
        [780] = "Jan'alai",
        [781] = "Halazzi",
        [782] = "Señor del maleficio Malacrass",
        [783] = "Zul'jin"
    },
    
    -- Sunwell Plateau (Raid ID: 199)
    [199] = {
        [724] = "Kalecgos",
        [725] = "Brutallus",
        [726] = "Bruma vil",
        [727] = "Gemelas Eredar",
        [728] = "M'uru",
        [729] = "Kil'jaeden"
    },
    
    -- ========================================
    -- WRATH OF THE LICH KING DUNGEONS
    -- ========================================
    
    -- Utgarde Keep (Dungeon ID: 202, 242)
    [202] = {
        [571] = "Príncipe Keleseth",
        [573] = "Skarvold y Dalronn",
        [575] = "Ingvar el Desvalijador"
    },
    [242] = {
        [576] = "Ingvar el Desvalijador"
    },
    
    -- Utgarde Pinnacle (Dungeon ID: 203, 205)
    [203] = {
        [577] = "Svala Tumbapena",
        [579] = "Gortok Pezuña Pálida",
        [581] = "Skadi el Despiadado",
        [583] = "Rey Ymiron"
    },
    [205] = {
        [584] = "Rey Ymiron"
    },
    
    -- Azjol-Nerub (Dungeon ID: 204, 241)
    [204] = {
        [216] = "Krik'thir el Guardapuertas",
        [217] = "Hadronox",
        [218] = "Anub'arak"
    },
    [241] = {
        [264] = "Krik'thir el Guardapuertas",
        [265] = "Hadronox",
        [266] = "Anub'arak"
    },
    
    -- The Oculus (Dungeon ID: 206, 211)
    [206] = {
        [528] = "Drakos el Interrogador",
        [530] = "Varos Zancanubes",
        [532] = "Señor de la magia Urom",
        [534] = "Guardián Ley Eregos"
    },
    [211] = {
        [535] = "Guardián Ley Eregos"
    },
    
    -- Halls of Lightning (Dungeon ID: 207, 212)
    [207] = {
        [555] = "General Bjarngrim",
        [557] = "Volkhan",
        [559] = "Ionar",
        [561] = "Loken"
    },
    [212] = {
        [562] = "Loken"
    },
    
    -- Halls of Stone (Dungeon ID: 208, 213)
    [208] = {
        [563] = "Krystallus",
        [565] = "Doncella de Pena",
        [567] = "Tribunal de las Eras",
        [569] = "Sjonnir el Afilador"
    },
    [213] = {
        [570] = "Sjonnir el Afilador"
    },
    
    -- The Culling of Stratholme (Dungeon ID: 209, 210)
    [209] = {
        [293] = "Gancho",
        [294] = "Salramm el Modelador de carne",
        [295] = "Señor de la época Chrono",
        [296] = "Mal'ganis"
    },
    [210] = {
        [297] = "Gancho",
        [298] = "Salramm el Modelador de carne",
        [299] = "Señor de la época Chrono",
        [300] = "Mal'ganis"
    },
    
    -- Drak'Tharon Keep (Dungeon ID: 214, 215)
    [214] = {
        [369] = "Destripatrols",
        [371] = "Novos el Invocador",
        [373] = "Rey Dred",
        [375] = "El profeta Tharon'ja"
    },
    [215] = {
        [376] = "El profeta Tharon'ja"
    },
    
    -- Gundrak (Dungeon ID: 216, 217)
    [216] = {
        [383] = "Slad'ran",
        [385] = "Coloso Drakkari",
        [387] = "Moorabi",
        [389] = "Eck el Feroz",
        [390] = "Gal'darah"
    },
    [217] = {
        [391] = "Gal'darah"
    },
    
    -- Ahn'kahet: The Old Kingdom (Dungeon ID: 218, 219)
    [218] = {
        [212] = "Ancestro Nadox",
        [213] = "Príncipe Taldaram",
        [214] = "Jedoga Buscasombras",
        [215] = "Heraldo Volazj"
    },
    [219] = {
        [259] = "Ancestro Nadox",
        [260] = "Príncipe Taldaram",
        [261] = "Jedoga Buscasombras",
        [262] = "Amanitar",
        [263] = "Heraldo Volazj"
    },
    
    -- The Violet Hold (Dungeon ID: 220, 221)
    [220] = {
        [540] = "Dextren Ward",
        [541] = "Primer prisionero",
        [543] = "Segundo prisionero",
        [545] = "Cyanigosa"
    },
    [221] = {
        [546] = "Cyanigosa"
    },
    
    -- The Nexus (Dungeon ID: 225, 226)
    [225] = {
        [519] = "Comandante congelado",
        [520] = "Gran maga Telestra",
        [522] = "Anómalo",
        [524] = "Ormorok el Cortador de árboles",
        [526] = "Keristrasza"
    },
    [226] = {
        [527] = "Keristrasza"
    },
    
    -- Trial of the Champion (Dungeon ID: 245, 249)
    [245] = {
        [334] = "Grandes campeones",
        [338] = "Campeón Argenta",
        [340] = "El Caballero Negro"
    },
    [249] = {
        [341] = "El Caballero Negro"
    },
    
    -- The Forge of Souls (Dungeon ID: 251, 252)
    [251] = {
        [829] = "Bronjahm",
        [831] = "Devorador de Almas"
    },
    [252] = {
        [832] = "Devorador de Almas"
    },
    
    -- Pit of Saron (Dungeon ID: 253, 254)
    [253] = {
        [833] = "Maestro de forja Gargelado",
        [835] = "Krick",
        [837] = "Señor supremo Tyrannus"
    },
    [254] = {
        [838] = "Señor supremo Tyrannus"
    },
    
    -- Halls of Reflection (Dungeon ID: 255, 256)
    [255] = {
        [839] = "Marwyn",
        [841] = "Falric",
        [843] = "Huida de Arthas"
    },
    [256] = {
        [844] = "Huida de Arthas"
    },
    
    -- ========================================
    -- WRATH OF THE LICH KING RAIDS
    -- ========================================
    
    -- The Eye of Eternity (Raid ID: 223, 237)
    [223] = {
        [734] = "Malygos"
    },
    [237] = {
        [735] = "Malygos"
    },
    
    -- The Obsidian Sanctum (Raid ID: 224, 238)
    [224] = {
        [736] = "Tenebron",
        [738] = "Shadron",
        [740] = "Vesperon",
        [742] = "Sartharion"
    },
    [238] = {
        [743] = "Sartharion"
    },
    
    -- Vault of Archavon (Raid ID: 239, 240)
    [239] = {
        [883] = "Agathelos el Enfurecido",
        [885] = "Toravon el Vigía de Hielo"
    },
    [240] = {
        [886] = "Toravon el Vigía de Hielo"
    },
    
    -- Ulduar (Raid ID: 243, 244)
    [243] = {
        [744] = "Leviatán de llamas",
        [745] = "Ignis el Maestro de la Caldera",
        [746] = "Tajoescama",
        [747] = "Desarmador XA-002",
        [748] = "La Asamblea de Hierro",
        [749] = "Kologarn",
        [750] = "Auriaya",
        [751] = "Hodir",
        [752] = "Thorim",
        [753] = "Freya",
        [754] = "Mimiron",
        [755] = "General Vezax",
        [756] = "Yogg-Saron",
        [757] = "Algalon el Observador"
    },
    [244] = {
        [758] = "Leviatán de llamas",
        [759] = "Ignis el Maestro de la Caldera",
        [760] = "Tajoescama",
        [761] = "Desarmador XA-002",
        [762] = "La Asamblea de Hierro",
        [763] = "Kologarn",
        [764] = "Auriaya",
        [765] = "Hodir",
        [766] = "Thorim",
        [767] = "Freya",
        [768] = "Mimiron",
        [769] = "General Vezax",
        [770] = "Yogg-Saron",
        [771] = "Algalon el Observador"
    },
    
    -- Trial of the Crusader (Raid ID: 246, 247, 248, 250)
    [246] = {
        [629] = "Bestias de Rasganorte",
        [633] = "Lord Jaraxxus",
        [637] = "Campeones de Facción",
        [641] = "Gemelas Val'kyr",
        [645] = "Anub'arak"
    },
    [247] = {
        [647] = "Anub'arak"
    },
    [248] = {
        [646] = "Anub'arak"
    },
    [250] = {
        [648] = "Anub'arak"
    },
    
    -- Icecrown Citadel (Raid ID: 279, 280)
    [279] = {
        [845] = "Lord Tuétano",
        [846] = "Lady Susurramuerte",
        [847] = "Batalla de naves de guerra de Corona de Hielo",
        [848] = "Libramorte Colmillosauro",
        [849] = "Panzachancro",
        [850] = "Carapútrea",
        [851] = "Profesor Putricidio",
        [852] = "Concilio de Sangre",
        [853] = "Reina de Sangre Lana'thel",
        [854] = "Valithria Caminasueños",
        [855] = "Sindragosa",
        [856] = "El Rey Exánime"
    },
    [280] = {
        [857] = "Lord Tuétano",
        [858] = "Lady Susurramuerte",
        [859] = "Batalla de naves de guerra de Corona de Hielo",
        [860] = "Libramorte Colmillosauro",
        [861] = "Panzachancro",
        [862] = "Carapútrea",
        [863] = "Profesor Putricidio",
        [864] = "Concilio de Sangre",
        [865] = "Reina de Sangre Lana'thel",
        [866] = "Valithria Caminasueños",
        [867] = "Sindragosa",
        [868] = "El Rey Exánime"
    },
    
    -- The Ruby Sanctum (Raid ID: 293, 294)
    [293] = {
        [887] = "Halion"
    },
    [294] = {
        [888] = "Halion"
    }
};