class Item {
    instance = null
    amount = null
    placeId = null
    
    constructor(instance, amount, placeId) {
        this.instance = instance
        this.amount = amount
        this.placeId = placeId
    }

    function tostring() {
        return "Item[instance=" + instance + ", amount=" + amount + ",placeId=" + placeId.tostring() + "]"
    }
}