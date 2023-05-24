const dotenv = require("dotenv");
dotenv.config();
const Express = require("express");
const app = Express();
import { Request, Response } from "express";
const port = process.env.PORT;
import { userRoutes } from "./routes/userRoutes";

// App Configuration Entries
app.disable("x-powered-by");
// app.use(cors({ exposedHeaders: ["x-auth-token"] }));
app.use(Express.urlencoded({ extended: false }));
app.use("api/v1/users", userRoutes);

app.get("/", (req: Request, res: Response) => {
  res.send("Express + TypeScript Server");
});

app.listen(port, () => {
  console.log("App is running on port " + port);
});
