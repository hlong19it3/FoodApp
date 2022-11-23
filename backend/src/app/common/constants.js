const role = {
	ADMIN: 0,
	USER: 1,
	RESTAURANT_OWNER: 2,
	SHIPPER: 3,
}

const statusCode = {
	OK: 200,
	NON_AUTH: 201,
	BAD_REQUEST: 400,
	UN_AUTHORIZED: 401,
	NOT_FOUND: 404,
	FORBIDDEN: 403,
	LOCKED: 423,
	FAILED_DEPENDENCY: 424,
	SERVER_ERROR: 500,
}

module.exports = { role, statusCode }
