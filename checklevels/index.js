fs = require('fs');
_ = require('underscore');

process.argv.slice(2).forEach(function (fileName) {
    fs.readFile(fileName, 'utf8', function(err, data) {
        if (err) {
            return console.log(err);
        }
        var inventory = JSON.parse(data);
        var playerStats = _.find(inventory, function(inventoryElement) {
            return inventoryElement.inventory_item_data && inventoryElement.inventory_item_data.player_stats;
        });
        console.log(fileName + " level " + playerStats.inventory_item_data.player_stats.level);
    });
});
