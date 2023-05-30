// Imports
import prisma from "../helpers/wrappers/prismaWrapper";
import { Response, Request, NextFunction } from "express";
import crypto from "crypto";
import { ApiError } from "../helpers/errors/apiError";

// Get all roles from the DB.
export async function getRoles(
  req: Request,
  res: Response,
  next: NextFunction
) {
  try {
    const roles = await prisma.role.findMany();
    return roles;
  } catch (error) {
    next(error);
  }
}

// Get a single role based on sent-in UUID
export async function getRole(req: Request, res: Response, next: NextFunction) {
  try {
    const role = await prisma.role.findUnique({
      where: { uuid: req.params.uuid || req.body.uuid },
    });
    return role;
  } catch (error) {
    next(error);
  }
}

// Add a role into the DB
export async function addRole(req: Request, res: Response, next: NextFunction) {
  try {
    const checkRole = await prisma.role.findUnique({
      where: { name: req.body.name },
    });

    if (!checkRole) {
      const newRole = await prisma.role.create({
        data: {
          uuid: crypto.randomUUID(),
          name: req.body.name,
          access: req.body.access,
          createdBy: req.body.createdBy,
        },
      });
      return newRole;
    } else {
      throw new ApiError(400, 'Duplicate role exists!');
    }
  } catch (error) {
    next(error);
  }
}

export async function updateRole(
  req: Request,
  res: Response,
  next: NextFunction
) {
  try {
    const oldRole = await prisma.role.findUnique({
      where: { uuid: req.params.uuid },
    });
    const updatedRole =  await prisma.role.update({
      where: { uuid: req.params.uuid },
      data: {
        name: req.body.name || oldRole?.name,
        access: req.body.access || oldRole?.access,
        isActive: req.body.isActive || false,
        updatedAt: new Date(),
      },
    });
    return updatedRole;
  } catch (error) {
    next(error);
  }
}
