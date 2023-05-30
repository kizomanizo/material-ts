// Imports
import { ApiError } from "../helpers/errors/apiError";
import { tryCatcher } from "../helpers/wrappers/asyncWrapper";
import prisma from "../helpers/wrappers/prismaWrapper";
import { NextFunction } from "express";

// Methods
export async function getUsers(next: NextFunction) {
  try {
    const users = await prisma.user.findMany({
      include: {
        Role: true,
        Person: true,
      },
    });
    return users;
  } catch (error) {
    next(new ApiError(500, "Internal Server Error"));
  }
}
