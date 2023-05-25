// Imports
import { Request, Response, NextFunction } from "express";
import { apiWrapper } from "../helpers/wrappers/apiWrapper";

// Constants
const users = [
  {
    id: 1,
    name: "Msela Wakwanza",
    Age: 32,
  },
  {
    id: 2,
    name: "Jamaa Wapili",
    Age: 19,
  },
];

// Methods
export async function getAll(req: Request, res: Response, next: NextFunction) {
  return apiWrapper(req, res, next, users, "All users retrieved by ");
}
