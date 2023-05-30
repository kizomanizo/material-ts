import { Response } from "express";
import { logInfo } from "../errors/eventLogger";

export function apiWrapper(
  res: Response,
  success: boolean,
  status: number,
  request: string,
  message: any,
  log: string
) {
  logInfo.info(`${new Date()}- INFO' : ${log}`);
  res.status(res.statusCode).json({ success, status, request, message });
}
