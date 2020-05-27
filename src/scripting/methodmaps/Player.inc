methodmap Player __nullable__
{
    public Player(int client)
    {
        return view_as<Player>(client);
    }

    property int client
    {
        public get()
        {
            return view_as<int>(this);
        }
    }

    property int team
    {
        public get()
        {
            return GetClientTeam(this.client);
        }
        public set(int team)
        {
            CS_SwitchTeam(this.client, team);
        }
    }

    public void GiveWeapon(const char[] weapon)
    {
        GivePlayerItem(this.client, weapon);
    }

    public void KillPlayer()
    {
        ForcePlayerSuicide(this.client);
    }

    public void RespawnPlayer()
    {
        CS_RespawnPlayer(this.client);
    }
}