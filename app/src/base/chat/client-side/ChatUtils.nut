local DISTANCE_DIVISOR = 300;

function chatDistanceColorDivisor(distance) {
    local power = (distance / DISTANCE_DIVISOR).tointeger()
    local result = pow(0.85, power)
    return result
}
