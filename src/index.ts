import * as dotenv from "dotenv";
dotenv.config();
const Express = require("express");
const app = Express();
const port = process.env.PORT || 3001;
import cors from "cors";
import ErrorHandler from "./helpers/errors/errorHelper";
import { Request, Response, NextFunction } from "express";
import { Router } from "./routes/userRoutes";
import { ApiError } from "./helpers/errors/apiError";

// App Configuration Entries
app.disable("x-powered-by");
app.use(cors({ exposedHeaders: ["x-auth-token"] }));
app.use(Express.urlencoded({ extended: false }));
app.use("/api/v1/users", Router);

// Start the server
app.listen(port, () => {
  console.log("INFO: App started and listening on port " + port);
});

// Catch-all route handler for unknown routes
app.use((req: Request, res: Response, next: NextFunction) => {
  const error = new ApiError(404, "Not Found");
  next(error);
});

// Error handling middleware
app.use((err: any, req: Request, res: Response, next: NextFunction) => {
  ErrorHandler.handleError(err, req, res, next);
});

module.exports = app;
