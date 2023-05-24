import * as dotenv from "dotenv";
dotenv.config();
const Express = require("express");
const app = Express();
const port = process.env.PORT || 3001;
import cors from "cors";
import { NotFoundError } from "./helpers/errors/notFoundError";
import ErrorHandler from "./helpers/errors/errorHandler"
import { Request, Response, NextFunction } from "express";
import { Router } from "./routes/userRoutes";

// App Configuration Entries
app.disable("x-powered-by");
app.use(cors({ exposedHeaders: ["x-auth-token"] }));
app.use(Express.urlencoded({ extended: false }));
app.use(ErrorHandler.handle());
app.use("/api/v1/users", Router);


// Start the server
app.listen(port, () => {
  console.log("INFO: App started and listening on port " + port);
});

// Handle errors
app.use((req: Request, res: Response, next: NextFunction) =>
  next(new NotFoundError(req.path))
);

module.exports = app;
