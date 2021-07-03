ArrayUtils <- {
    function printArray(array) {
        return array.reduce(function(previousValue, currentValue) {
            return (previousValue.tostring() + ", " + currentValue.tostring());
        })
    }
}