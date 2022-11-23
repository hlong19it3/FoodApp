function isEmpty(object) {
	return Object.keys(object).length === 0
}

function isNotEmpty(object) {
	if (object) {
		return Object.keys(object).length > 0
	}
	return false
}

module.exports = { isEmpty, isNotEmpty }
