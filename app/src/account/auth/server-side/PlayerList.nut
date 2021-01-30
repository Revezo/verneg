PlayerList <- {
    players = [],

    constructor() {
        players = array(getMaxSlots())
    }

    function get(pid) {
        return players[pid]
    }

    function insert(player) {
        players.insert(player.serverId, player)
    }

    function remove(pid) {
        players.remove(pid)
    }

    function isDuplicate(pid, username) {
        for (local targetId = 0; targetId < getMaxSlots(); ++targetId) {
            if (namesMath(targetId, pid, username)) {
                if (!(targetId == pid)) {
                    return true
                }
            }
        }
        return false
    }

    // private
    function namesMath(targetId, pid, username) {
        players[targetId] != null && players[targetId].username == username && targetId != pid
    }
}
PlayerList.constructor()
