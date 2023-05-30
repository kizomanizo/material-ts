import Express from "express";
const roleRouter = Express.Router();
import * as Controller from "../controllers/roleController";

roleRouter.route("/").get(Controller.getAll);
roleRouter.route("/:uuid").get(Controller.getOne);
roleRouter.route("/").post(Controller.addOne);
roleRouter.route("/:uuid").patch(Controller.updateOne);

export default roleRouter;
