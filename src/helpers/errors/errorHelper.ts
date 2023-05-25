import { Request, Response, NextFunction } from "express";
import { logInfo, logError } from "./eventLogger";

export default class ErrorHandler {
  static handleError(
    err: any,
    req: Request,
    res: Response,
    next: NextFunction
  ) {
    let statusCode = err.statusCode || 500;
    let message = err.message || "Internal Server Error";

    // Log the error stack trace
    logError.error(err.stack || err.message);

    // Send the error response as JSON
    res.status(statusCode).json({
      success: false,
      status: statusCode,
      request: req.path,
      message: message,
    });
  }
}
