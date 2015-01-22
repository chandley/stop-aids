var mongoose = require('mongoose');
var Schema = mongoose.Schema;

var questionSchema = new Schema({
	boby: String,
});


module.exports = mongoose.model('Question', questionSchema);

