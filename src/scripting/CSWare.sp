#pragma semicolon 1

#include <morecolors>

#pragma newdecls required

#include <sourcemod>
#include <sdktools>
#include <cstrike>

#include "methodmaps/Player.inc"

public Plugin myinfo =
{
    name = "CSWare",
    author = "peppizza",
    description = "A plugin to add a warioware minigame in cs:go",
    version = "0.1",
    url = "https://github.com/peppizza/CSWare/"
};

public void OnPluginStart()
{
    HookEvent("bomb_planted", Event_BombPlanted);
}

public Action CS_OnBuyCommand(int client, const char[] weapon)
{
    if (strcmp("tec9", weapon) == 0)
    {
        return Plugin_Changed;
    }
    return Plugin_Continue;
}

public void Event_BombPlanted(Event event, const char[] name, bool dontBroadcast)
{
    char clientname[MAX_NAME_LENGTH];
    int client = event.GetInt("userid");
    int site = event.GetInt("site");
    client = GetClientOfUserId(client);
    GetClientName(client, clientname, sizeof(clientname));

    PrintToChatAll("%s has planted the bomb at site index: %i", clientname, site);
}
