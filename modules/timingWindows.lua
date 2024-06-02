local timings = {
    Osu = {
        O0 = {
            max = 16,
            per = 64,
            goo = 97,
            okk = 127,
            bad = 151,
            mis = 188
        },
        O1 = {
            max = 16,
            per = 61,
            goo = 94,
            okk = 124,
            bad = 148,
            mis = 185
        },
        O2 = {
            max = 16,
            per = 58,
            goo = 91,
            okk = 121,
            bad = 145,
            mis = 182
        },
        O3 = {
            max = 16,
            per = 55,
            goo = 88,
            okk = 118,
            bad = 142,
            mis = 179
        },
        O4 = {
            max = 16,
            per = 52,
            goo = 85,
            okk = 115,
            bad = 139,
            mis = 176
        },
        O5 = {
            max = 16,
            per = 49,
            goo = 82,
            okk = 112,
            bad = 136,
            mis = 173
        },
        O6 = {
            max = 16,
            per = 46,
            goo = 79,
            okk = 109,
            bad = 133,
            mis = 170
        },
        O7 = {
            max = 16,
            per = 43,
            goo = 76,
            okk = 106,
            bad = 130,
            mis = 167
        },
        O8 = {
            max = 16,
            per = 40,
            goo = 73,
            okk = 103,
            bad = 127,
            mis = 164
        },
        O9 = {
            max = 16,
            per = 37,
            goo = 70,
            okk = 100,
            bad = 124,
            mis = 161
        },
        O10 = {
            max = 16,
            per = 34,
            goo = 67,
            okk = 97,
            bad = 121,
            mis = 158
        },
    },

    Quaver = {
        Q4 = {
            max = 18,
            per = 43,
            goo = 76,
            okk = 106,
            bad = 127,
            mis = 164
        },
        Q5 = {
            max = 16,
            per = 39,
            goo = 69,
            okk = 96,
            bad = 127,
            mis = 164
        },
        Q6 = {
            max = 14,
            per = 35,
            goo = 62,
            okk = 87,
            bad = 127,
            mis = 164
        },
        Q7 = {
            max = 13,
            per = 32,
            goo = 57,
            okk = 79,
            bad = 127,
            mis = 164
        },
        Q8 = {
            max = 8,
            per = 20,
            goo = 35,
            okk = 49,
            bad = 127,
            mis = 164
        },
    },

    Stepmania = {
        J4 = {
            max = 23,
            per = 45,
            goo = 90,
            okk = 135,
            bad = 180,
        },
        J5 = {
            max = 19,
            per = 38,
            goo = 76,
            okk = 113,
            bad = 180,
        },
        J6 = {
            max = 15,
            per = 30,
            goo = 59,
            okk = 89,
            bad = 180,
        },
        J7 = {
            max = 11,
            per = 23,
            goo = 45,
            okk = 68,
            bad = 180,
        },
        J8 = {
            max = 7,
            per = 15,
            goo = 30,
            okk = 45,
            bad = 180,
        },
        J9 = {
            max = 5,
            per = 9,
            goo = 18,
            okk = 27,
            bad = 180,
        },
    },

    LunaticRave2
}

local function getGameTiming(typ)
    if typ == "Osu" then return "O" end
    if typ == "Quaver" then return "Q" end
    if typ == "Stepmania" then return "J" end
    if typ == "LunaticRave2" then return "L" end
end

local function getTiming(typ, let, lev, jud, neg)
    return ((timings[typ[let..lev[jud]]] / 100) * (neg and -1 or 1))
end

local mainConfig = {
    getGameTiming = getGameTiming,
    getTiming = getTiming,
}
return mainConfig