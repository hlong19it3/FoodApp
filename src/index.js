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

var dir = "./src/public/img/foods";

if (!fs.existsSync(dir)) {
  fs.mkdirSync(dir, { recursive: true });
}

//routes
const route = require("./routes/route");
route(app);

// console.log(md5("12345"));

app.get("/test-railway", (req, res) => {
  return res.json({ msg: "Ok" });
});
// run
app.listen(port, () => {
  console.log(`Example app listening on port http://localhost:${port}`);
});
