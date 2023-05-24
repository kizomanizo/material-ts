import { logInfo } from "./errorLogger";
import { Request, Response, NextFunction } from "express";
import { ApiError } from "./apiError";

export default class ErrorHandler {
  static handle = () => {
    return async (
      err: ApiError,
      req: Request,
      res: Response,
      next: NextFunction
    ) => {
      const statusCode = err.statusCode || 500;
      res.status(statusCode).send({
        success: false,
        // message: err.message,
        // stack: err.stack,
      });
    };
  };

  static errorLogger(err: any) {
    logInfo.info("An error has occured");
  }
}
