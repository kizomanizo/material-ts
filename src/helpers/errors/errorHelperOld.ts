import { Request, Response, NextFunction } from "express";
import { logInfo } from "./logger";

export default class ErrorHandler extends Error {
  statusCode: number;
  constructor(statusCode: number, message: string) {
    super();
    this.statusCode = statusCode;
    this.message = message;
  }

  static handleError(
    err: ErrorHandler,
    req: Request,
    res: Response,
    next: NextFunction
  ) {
    res.status(err.statusCode || 500).json({
      success: false,
      type: "Error" + " " + err.statusCode,
      title: "Error thrown!",
      message: err.message,
      // stack: err.stack,
    });
  }

  static errorLogger(err: any) {
    logInfo.info(`${new Date()}- Error ( ${err.statusCode}): ${err.message}`);
  }
}
