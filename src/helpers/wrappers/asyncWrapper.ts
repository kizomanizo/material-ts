import { Request, Response, NextFunction } from "express";
import { ApiError } from "../errors/apiError";

export function tryCatcher(
  callback: (req: Request, res: Response, next: NextFunction) => Promise<any>
) {
  return (req: Request, res: Response, next: NextFunction) => {
    callback(req, res, next).catch((error: any) => {
      next(new ApiError(500, JSON.stringify(error)));
    });
  };
}