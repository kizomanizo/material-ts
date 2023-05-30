// Imports
import { Request, Response, NextFunction } from "express";
import { apiWrapper } from "../helpers/wrappers/apiWrapper";
import * as Service from "../services/roleService";
import { ApiError } from "../helpers/errors/apiError";

// Methods
export async function getAll(req: Request, res: Response, next: NextFunction) {
  try {
    const roles = await Service.getRoles(req, res, next);
    return apiWrapper(res, true, 200, req.path, roles, "Roles retrieved by: ");
  } catch (error) {
    next(error);
  }
}

export async function getOne(req: Request, res: Response, next: NextFunction) {
  try {
    const role = await Service.getRole(req, res, next);
    return apiWrapper(res, true, 200, req.path, role, "Role retrieved by: ");
  } catch (error) {
    next(error);
  }
}

export async function addOne(req: Request, res: Response, next: NextFunction) {
  const role = await Service.addRole(req, res, next);
  try {
    return apiWrapper(res, true, 201, req.path, role, "Role added by: ");
  } catch (error) {
    next(error);
  }
}

export async function updateOne(
  req: Request,
  res: Response,
  next: NextFunction
) {
  try {
    const role = await Service.updateRole(req, res, next);
    return apiWrapper(res, true, 202, req.path, role, "Role updated by: ");
  } catch (error) {
    next(error);
  }
}
