import Express from "express";
const userRouter = Express.Router();
import * as Controller from "../controllers/userController";

userRouter.route("/").get(Controller.getAll);

export default userRouter;
