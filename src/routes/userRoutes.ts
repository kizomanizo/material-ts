import Express from "express";
import { Request, Response } from "express";
export const Router = Express.Router();

  Router.get("/", (req: Request, res: Response) => {
    res.status(200).json({
      success: true,
      status: 200,
      request: req.path,
      message: "",
    });
  });
