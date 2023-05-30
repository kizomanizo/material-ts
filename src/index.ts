import * as dotenv from "dotenv";
dotenv.config();
const Express = require("express");
const app = Express();
const port = process.env.PORT || 3001;
import cors from "cors";
import { Request, Response, NextFunction } from "express";
import * as ErrorHandlers from "./helpers/errors/apiError";
import bodyParser from "body-parser";
import userRouter from "./routes/userRoutes";
import roleRouter from "./routes/roleRoutes";

// App Configuration Entries
app.disable("x-powered-by");
app.use(cors({ exposedHeaders: ["x-auth-token"] }));
app.use(Express.urlencoded({ extended: true }));
app.use(bodyParser.json());
app.use("/api/v1/users", userRouter);
app.use("/api/v1/roles", roleRouter);

// Start the server
app.listen(port, () => {
  console.log("INFO: App started and listening on port " + port);
});

// Error handling middleware
app.use((error: any, req: Request, res: Response, next: NextFunction) => {
  ErrorHandlers.clientErrors(error, req, res, next);
  next(error);
});

app.use((error: any, req: Request, res: Response, next: NextFunction) => {
  ErrorHandlers.allErrors(error, req, res, next);
  next(error);
});

app.use((req: Request, res: Response, next: NextFunction) => {
  res.status(404).json({
    success: false,
    status: 404,
    request: req.path,
    message: "Route requested is not available",
  });
});
module.exports = app;
