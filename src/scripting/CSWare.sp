#pragma semicolon 1

#include <morecolors>

#pragma newdecls required

#include <sourcemod>
#include <sdktools>
#include <cstrike>
#include <sdkhooks>

#include "methodmaps/Player.inc"

public Plugin myinfo =
{
    name = "CSWare",
    author = "peppizza",
    description = "A plugin to add a warioware minigame in cs:go",
    version = "0.1",
    url = "https://github.com/peppizza/CSWare/"
};

public Action CS_OnBuyCommand(int client, const char[] weapon)
{
    if (strcmp("tec9", weapon) == 0)
    {
        return Plugin_Handled;
    }
    return Plugin_Continue;
}

public void OnEntityCreated(int entity, const char[] classname)
{
    if (StrEqual(classname, "planted_c4"))
        SDKHook(entity, SDKHook_Spawn, OnC4Spawn);
}

public Action OnC4Spawn(int c4)
{
    ConVar cvRestartGame = FindConVar("mp_restartgame");
    cvRestartGame.IntValue = 1;
    delete cvRestartGame;
    return Plugin_Handled;
}