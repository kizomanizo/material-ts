import { Request, NextFunction, Response } from "express";
import { logInfo, logError } from "./eventLogger";

export class ApiError extends Error {
  statusCode: number;
  constructor(statusCode: number, message: any) {
    super();
    this.statusCode = statusCode;
    this.message = message;
    Error.captureStackTrace(this, this.constructor);
  }
}

export async function errorLogger(err: ApiError) {
  logError.error(err.stack || err.message);
}

export async function clientErrors(
  err: any,
  req: Request,
  res: Response,
  next: NextFunction
) {
  await errorLogger(err);
  if (req.xhr) {
    res.status(err.statusCode || 500).json({
      success: false,
      status: "Error" + " " + err.statusCode,
      request: req.method + ": " + req.path,
      message: err.message,
      stack: err.stack,
    });
  } else {
    next(err);
  }
}

export async function allErrors(
  err: any,
  req: Request,
  res: Response,
  next: NextFunction
) {
  res.status(err.statusCode).json({
    success: false,
    status: "Error" + " " + err.statusCode,
    request: req.method + ": " + req.path,
    message: err.message,
    // stack: err.stack,
  });
  next(err);
}

export async function notErrors(
  err: any,
  req: Request,
  res: Response,
  next: NextFunction
) {
  res.status(404).json({
    success: false,
    status: 404,
    request: req.method + ": " + req.path,
    message: "Route requested is not available",
  });
  next(err);
}
