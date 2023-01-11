const path = require("path");
const express = require("express");
const app = express();
const handlebar = require("express-handlebars");
const md5 = require("md5");
const port = 3000;
var fs = require("fs");

const swaggerUI = require("swagger-ui-express");
const swaggerJsDoc = require("swagger-jsdoc");

const options = {
  definition: {
    openapi: "3.0.0",
    info: {
      title: "Ninja FOOD API",
      version: "1.0.0",
      description: "A simple Express Food API",
    },
  },
  apis: ["./Routes/*.js"],
};

const specs = swaggerJsDoc(options);
app.use("/api-docs", swaggerUI.serve, swaggerUI.setup(specs));

app.use(
  express.urlencoded({
    extended: true,
  })
);
app.use(express.json());

// static files
app.use(express.static(path.join(__dirname, "public")));

// views engine
app.engine(
  ".hbs",
  handlebar.engine({
    extname: ".hbs",
  })
);
app.set("view engine", ".hbs");
app.set("views", path.join(__dirname, "./views"));

var dirFood = "./src/public/img/foods";
const dirCategory = "./src/public/img/categogy";

if (!fs.existsSync(dirFood)) {
  fs.mkdirSync(dirFood, { recursive: true });
}

if (!fs.existsSync(dirCategory)) {
  fs.mkdirSync(dirCategory, { recursive: true });
}

//routes
const route = require("./routes/route");
const { User } = require("./app/database/models");
route(app);

// console.log(md5("12345"));
app.get("/test-user", async (req, res) => {
  rs = User.findAll({});
  return res.json(rs);
});

// run
app.listen(port, () => {
  console.log(`Example app listening on port http://localhost:${port}`);
});
