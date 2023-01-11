const isAdmin = (req, res, next) => {
	const role = req.user.role
	if (role == 0) {
		next()
		return
	}
	return res.status(403).json({ message: 'This action required Admin role' })
}

const isUser = (req, res, next) => {
	const role = req.user.role
	if (role == 1) {
		next()
		return
	}
	return res.status(403).json({ message: 'This action required User role' })
}

const isRestaurantOwner = (req, res, next) => {
	const role = req.user.role
	if (role == 2) {
		next()
		return
	}
	return res.status(403).json({ message: 'This action required Restaurant Owner role' })
}

const isShipper = (req, res, next) => {
	const role = req.user.role
	if (role == 3) {
		next()
		return
	}
	return res.status(403).json({ message: 'This action required Shipper role' })
}
module.exports = { isAdmin, isUser, isRestaurantOwner, isShipper }
