PlayerList <- {
    players = [],

    constructor() {
        for (local i = 0; i < getMaxSlots(); ++i) {
            players.append(Player())
        }
    }

    function get(pid) {
        return players[pid]
    }

    function isConnected(username) {
        for (local i = 0; i < getMaxSlots(); ++i) {
            if (players[i].username == username) {
                return true
            }
        }
        return false
    }
}
PlayerList.constructor()
