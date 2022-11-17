const express = require("express");
const router = express.Router();

const { checkToken } = require("../../auth/token_validation");
const addressController = require("../../app/controllers/api/AddressController");
const { isRestaurantOwner } = require("../../app/middleware/role");

router.post("/create", checkToken, addressController.create);
router.put("/update", checkToken, addressController.update);
router.get("/select-by-id/:id", checkToken, addressController.selectById);
router.get(
  "/select-by-user-id/:id",
  checkToken,
  addressController.selectUserId
);
router.get("/delete", checkToken, addressController.deleteAddress);
router.get("/search", checkToken, addressController.search);

module.exports = router;
