import Express from "express";
import { Request, Response } from "express";
export const Router = Express.Router();

  Router.get("/", (_req: Request, res: Response) => {
    res.status(200).json({
      success: true,
      request: "Root Users",
      message: "",
    });
  });
