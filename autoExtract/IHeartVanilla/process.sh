#!/bin/bash

extract() {
    rm -rf $2
    num=$(find ../downloads -iname "$1" -type f -printf '.' | wc -c)
    echo "$1 -- match = $num"
    find ../downloads -iname "$1" -exec 7z x {} -o$2 > /dev/null \;
}

dataToCfg() {
    curPath=$(pwd -W)

    if [ -d "$1" ]   # For file "if [ -f /home/rama/file ]"
    then
        echo "$1 -- present"
    else
        echo "$1 -- error, not present"
    fi

    echo "data=\"$curPath/$1\"" >> openmw.data.cfg
}

pluginToCfg() {
    echo "content=$1" >> openmw.content.cfg
}

settingToCfg() {
    echo "$1 = $2" >> setting.extra.cfg
}

total=0
countMods() {
    ((total++))
    echo "Mod num: $total"
}

# Clear files
rm openmw.data.cfg openmw.content.cfg setting.extra.cfg

# Original game
echo "data=\"D:/games/openmw/morrowind/Data Files\"" >> openmw.data.cfg
pluginToCfg "Morrowind.esm"
pluginToCfg "Tribunal.esm"
pluginToCfg "Bloodmoon.esm"

# https://www.nexusmods.com/morrowind/mods/45096
countMods
extract "Patch for Purists*" "PatchforPurists"
dataToCfg "PatchforPurists"
pluginToCfg "Patch for Purists.esm"
pluginToCfg "Patch for Purists - Book Typos.ESP"
pluginToCfg "Patch for Purists - Semi-Purist Fixes.ESP"

# https://www.nexusmods.com/morrowind/mods/43931
countMods
extract "UMOPP*" "UnofficialMorrowindOfficialPluginsPatched"
extract "Merged and Compatibility Versions*" "Temp"
dataToCfg "UnofficialMorrowindOfficialPluginsPatched"
cp "Temp/UMOPP Merged/Unofficial Morrowind Official Plugins Patched.ESP" "UnofficialMorrowindOfficialPluginsPatched"
pluginToCfg "Unofficial Morrowind Official Plugins Patched.ESP"

# https://www.nexusmods.com/morrowind/mods/47588
countMods
extract "Expansion Delay*" "ExpansionDelay"
dataToCfg "ExpansionDelay"
pluginToCfg "Expansion Delay.ESP"

# https://www.nexusmods.com/morrowind/mods/45384
countMods
extract "Morrowind Optimization Patch*" "MorrowindOptimizationPatch"
dataToCfg "MorrowindOptimizationPatch/00 Core"
dataToCfg "MorrowindOptimizationPatch/01 Fixed Vanilla Textures"
pluginToCfg "Lake Fjalding Anti-Suck.ESP"

# https://www.nexusmods.com/morrowind/mods/45886
countMods
extract "Glow in the Dahrk*" "GlowintheDahrk"
dataToCfg "GlowintheDahrk/00 Core"
dataToCfg "GlowintheDahrk/01 Hi Res Window Texture Replacer"
dataToCfg "GlowintheDahrk/02 Interior Sunrays"
dataToCfg "GlowintheDahrk/03 Nord Glass Windows"
dataToCfg "GlowintheDahrk/03 Nord Glass Windows Interior Sunrays"
dataToCfg "GlowintheDahrk/04 Telvanni Dormers on Vvardenfell"
dataToCfg "GlowintheDahrk/05 Raven Rock Glass Windows"
dataToCfg "GlowintheDahrk/05 Raven Rock Glass Windows Interior Sunrays"
dataToCfg "GlowintheDahrk/06 Tamriel Rebuilt Patch"
dataToCfg "GlowintheDahrk/06 Tamriel Rebuilt Patch Interior Sunrays"
pluginToCfg "GITD_Telvanni_Dormers.ESP"
pluginToCfg "GITD_Telvanni_Dormers_Exterior.ESP"
pluginToCfg "GITD_Telvanni_Dormers_Interiors.ESP"
pluginToCfg "GITD_WL_RR_Interiors.esp"

# https://www.nexusmods.com/morrowind/mods/46599
countMods
extract "Graphic Herbalism MWSE - OpenMW*" "GraphicHerbalismMWSEandOpenMWEdition"
extract "GH Patches and Replacers*" "GraphicHerbalismMWSEandOpenMWEdition/patches"
dataToCfg "GraphicHerbalismMWSEandOpenMWEdition/00 Core + Vanilla Meshes"
dataToCfg "GraphicHerbalismMWSEandOpenMWEdition/01 Optional - Smoothed Meshes"
dataToCfg "GraphicHerbalismMWSEandOpenMWEdition/patches/00 Correct UV Ore + README"
dataToCfg "GraphicHerbalismMWSEandOpenMWEdition/patches/01 Pherim's Replacers"
dataToCfg "GraphicHerbalismMWSEandOpenMWEdition/patches/03 Pherim Pulsing Kwama"
dataToCfg "GraphicHerbalismMWSEandOpenMWEdition/patches/06 Less Epic Plants"
dataToCfg "GraphicHerbalismMWSEandOpenMWEdition/patches/15 Apel's Azura's Coast"
pluginToCfg "correctUV Ore Replacer_respawning.esp"

# https://www.nexusmods.com/morrowind/mods/45399
countMods
extract "Project Atlas*" "ProjectAtlas"
dataToCfg "ProjectAtlas/00 Core"
dataToCfg "ProjectAtlas/10 Glow in the Dahrk Patch"
dataToCfg "ProjectAtlas/20 BC Mushrooms - Smoothed"
dataToCfg "ProjectAtlas/30 Redware - Smoothed"
dataToCfg "ProjectAtlas/40 Urns - Smoothed"
dataToCfg "ProjectAtlas/50 Wood Poles - Hi-Res Texture"

# Another https://www.nexusmods.com/morrowind/mods/46599
countMods
dataToCfg "GraphicHerbalismMWSEandOpenMWEdition/patches/12 Atlas - Smoothed BC Mushrooms"

# https://www.nexusmods.com/morrowind/mods/47469
countMods
extract "Intelligent Textures*" "IntelligentTextures"
dataToCfg "IntelligentTextures/00 Core"
dataToCfg "IntelligentTextures/01 Atlas Textures"

# https://www.nexusmods.com/morrowind/mods/47617
countMods
extract "kart_facelift_default*" "Facelift/Default"
extract "kart_fut_TR_PT*" "Facelift/TR_PT"
extract "kart_facelift_update*" "Facelift/Update"
dataToCfg "Facelift/Default"
dataToCfg "Facelift/TR_PT"
dataToCfg "Facelift/Update"

# https://www.nexusmods.com/morrowind/mods/46232
countMods
extract "OpenMW Containers Animated*" "OpenMWContainersAnimated"
dataToCfg "OpenMWContainersAnimated/Containers Animated"
dataToCfg "OpenMWContainersAnimated/Optional/kollops"
pluginToCfg "Containers Animated.esp"

# https://www.nexusmods.com/morrowind/mods/46069
countMods
extract "WeaponSheathing*" "WeaponSheathing"
dataToCfg "WeaponSheathing"
echo "[Game]" >> setting.extra.cfg
settingToCfg "shield sheathing" "true"
settingToCfg "weapon sheathing" "true"
settingToCfg "use additional anim sources" "true"

# Another https://www.nexusmods.com/morrowind/mods/45384
countMods
dataToCfg "MorrowindOptimizationPatch/04 Weapon Sheathing Patch"

# https://www.nexusmods.com/morrowind/mods/45967
countMods
extract "Auto Ammo Equip for OpenMW*" "AutoAmmoEquipforOpenMW"
mv "AutoAmmoEquipforOpenMW/Auto Ammò Equip for OpenMW.omwaddon" "AutoAmmoEquipforOpenMW/Auto Ammo Equip for OpenMW.omwaddon"
dataToCfg "AutoAmmoEquipforOpenMW"
pluginToCfg "Auto Ammo Equip for OpenMW.omwaddon"

# https://www.nexusmods.com/morrowind/mods/46332
# Somehow 7z doesn't work for this rar
countMods
extract "TimeScale Change OpenMW*" "TimeScaleChangeOpenMW"
rm -rf TimeScaleChangeOpenMW
mkdir TimeScaleChangeOpenMW
cd TimeScaleChangeOpenMW
find ../../downloads -iname "TimeScale Change OpenMW*" -exec unrar x {} > /dev/null \;
cd ..
dataToCfg "TimeScaleChangeOpenMW"
pluginToCfg "TimescaleChange.omwaddon"

# https://www.nexusmods.com/morrowind/mods/46854
countMods
extract "Fonts*" "TrueTypeFonts"
extract "HD texture buttons (English)*" "HDTextureButtons"
cp -r "TrueTypeFonts/Fonts" "/d/dlshc/Documents/My Games/OpenMW"
dataToCfg "HDTextureButtons/HiResUI"

# https://github.com/jmelesky/omwllf/blob/master/README.md
countMods
rm -r omwllf
mkdir omwllf
cp ../downloads/omwllf.py omwllf
