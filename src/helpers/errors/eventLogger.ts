import winston from "winston";

export const logInfo = winston.createLogger({
  level: "info",
  format: winston.format.combine(
    winston.format.timestamp(),
    winston.format.json()
  ),
  transports: [
    new winston.transports.File({ filename: "./logs/info.log" }),
    new winston.transports.Console({ level: "error" }),
  ],
});

export const logError = winston.createLogger({
  level: "error",
  format: winston.format.combine(
    winston.format.timestamp(),
    winston.format.json()
  ),
  transports: [
    new winston.transports.File({ filename: "./logs/error.log", level: "warn" }),
    new winston.transports.Console({ level: "warn" }),
  ],
});
