import * as dotenv from "dotenv";
dotenv.config();
const Express = require("express");
const app = Express();
// import cors from "cors";
// import { NotFoundError } from "./helpers/errors/notFoundError";
import { Request, Response, NextFunction } from "express";
const port = process.env.PORT || 3001;
import { userRoutes } from "./routes/userRoutes";

// App Configuration Entries
app.disable("x-powered-by");
// app.use(cors({ exposedHeaders: ["x-auth-token"] }));
app.use(Express.json);
app.use(Express.urlencoded({ extended: false }));
app.use("api/v1/users", userRoutes);
// app.use((req: Request, res: Response, next: NextFunction) =>
//   next(new NotFoundError(req.path))
// );

// const server = createServer(app);

// Start the server
app.listen(port, () => {
  console.log("INFO: App started and listening on port " + port);
});

process.on("uncaughtException", (err: Error) => {
  console.log(err.name, err.message);
  console.log("UNCAUGHT EXCEPTION! 💥 Shutting down...");

  process.exit(1);
});

process.on("unhandledRejection", (reason: Error, promise: Promise<any>) => {
  console.log(reason.name, reason.message);
  console.log("UNHANDLED REJECTION! 💥 Shutting down...");
  process.exit(1);
  throw reason;
});

module.exports = app;
