/**
 * Created by Vladimir on 7/31/2016.
 */
function getRandomPosition(leftUpPosition, rightDownPosition) {
    mapWidth = Math.abs(leftUpPosition.lat - rightDownPosition.lat);
    mapHeight = Math.abs(leftUpPosition.long - rightDownPosition.long);
    long = Math.min(leftUpPosition.long, rightDownPosition.long) + (mapHeight / 100) * getRandom(10, 90);
    lat = Math.min(leftUpPosition.lat, rightDownPosition.lat) + (mapWidth / 100) * getRandom(10, 90);
    return {long: long, lat: lat};
}

/**
 * Get a random floating point number between `min` and `max`.
 *
 * @param {number} min - min number
 * @param {number} max - max number
 * @return {float} a random floating point number
 */
function getRandom(min, max) {
    return Math.random() * (max - min) + min;
}

exports.getRandomPosition = getRandomPosition;