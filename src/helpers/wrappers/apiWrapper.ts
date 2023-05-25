import { Request, Response, NextFunction } from "express";
import { ApiError } from "../errors/apiError";
import { logInfo } from "../errors/eventLogger";

export function apiWrapper(
  req: Request,
  res: Response,
  next: NextFunction,
  message: Object,
  log: String
) {
  try {
    logInfo.info(`${new Date()}- INFO' : ${log}`);
    res.status(200).json({
      success: true,
      status: res.statusCode,
      request: req.path,
      message: message,
    });
  } catch (error) {
    next(new ApiError(500, "Internal Server Error"));
  }
}
