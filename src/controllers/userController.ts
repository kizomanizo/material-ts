// Imports
import { Request, Response, NextFunction } from "express";
import { apiWrapper } from "../helpers/wrappers/apiWrapper";
import { getUsers } from "../services/userService";

// Methods
export async function getAll(req: Request, res: Response, next: NextFunction) {
  return apiWrapper(res, true, 200, req.path, getUsers, "Users retrieved by ");
}
