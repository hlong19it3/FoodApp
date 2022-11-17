function isEmpty(object) {
  return Object.keys(object).length === 0;
}

function isNotEmpty(object) {
  return Object.keys(object).length > 0;
}

module.exports = { isEmpty, isNotEmpty };
