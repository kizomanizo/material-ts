-- CreateTable
CREATE TABLE `person` (
    `uuid` VARCHAR(191) NOT NULL,
    `firstName` VARCHAR(50) NOT NULL,
    `middleName` VARCHAR(50) NULL,
    `lastName` VARCHAR(50) NOT NULL,
    `address` VARCHAR(191) NULL,
    `mobilePhone` VARCHAR(191) NULL,
    `birthDate` DATETIME(3) NULL,
    `isActive` BOOLEAN NOT NULL DEFAULT true,
    `createdAt` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `updatedAt` DATETIME(3) NULL,

    UNIQUE INDEX `person_uuid_key`(`uuid`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `user_role` (
    `uuid` VARCHAR(191) NOT NULL,
    `name` VARCHAR(30) NOT NULL,
    `access` VARCHAR(191) NOT NULL,
    `isActive` BOOLEAN NOT NULL DEFAULT true,
    `createdAt` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `updatedAt` DATETIME(3) NULL,

    UNIQUE INDEX `user_role_uuid_key`(`uuid`),
    UNIQUE INDEX `user_role_name_key`(`name`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `client` (
    `uuid` VARCHAR(191) NOT NULL,
    `lastPurchase` DATETIME(3) NULL,
    `clientRating` INTEGER NOT NULL,
    `isActive` BOOLEAN NOT NULL DEFAULT true,
    `createdAt` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `updatedAt` DATETIME(3) NULL,
    `personId` VARCHAR(191) NULL,

    UNIQUE INDEX `client_uuid_key`(`uuid`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `user` (
    `uuid` VARCHAR(191) NOT NULL,
    `email` VARCHAR(50) NOT NULL,
    `passwordHash` VARCHAR(191) NOT NULL,
    `joinDate` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `lastLogin` DATETIME(3) NULL,
    `isActive` BOOLEAN NOT NULL DEFAULT true,
    `createdAt` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `updatedAt` DATETIME(3) NULL,
    `personId` VARCHAR(191) NULL,
    `roleId` VARCHAR(191) NULL,

    UNIQUE INDEX `user_uuid_key`(`uuid`),
    UNIQUE INDEX `user_email_key`(`email`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `item_category` (
    `uuid` VARCHAR(191) NOT NULL,
    `name` VARCHAR(30) NOT NULL,
    `access` VARCHAR(191) NOT NULL,
    `isActive` BOOLEAN NOT NULL DEFAULT true,
    `createdAt` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `updatedAt` DATETIME(3) NULL,
    `userId` VARCHAR(191) NULL,

    UNIQUE INDEX `item_category_uuid_key`(`uuid`),
    UNIQUE INDEX `item_category_name_key`(`name`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `item_supplier` (
    `uuid` VARCHAR(191) NOT NULL,
    `name` VARCHAR(30) NOT NULL,
    `address` VARCHAR(191) NULL,
    `mobilePhone` VARCHAR(20) NOT NULL,
    `email` VARCHAR(30) NOT NULL,
    `reorderLevel` INTEGER NOT NULL,
    `maximumLevel` INTEGER NOT NULL,
    `batchNumber` VARCHAR(191) NULL,
    `isActive` BOOLEAN NOT NULL DEFAULT true,
    `createdAt` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `updatedAt` DATETIME(3) NULL,

    UNIQUE INDEX `item_supplier_uuid_key`(`uuid`),
    UNIQUE INDEX `item_supplier_name_key`(`name`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `item_store` (
    `uuid` VARCHAR(191) NOT NULL,
    `name` VARCHAR(30) NOT NULL,
    `isActive` BOOLEAN NOT NULL DEFAULT true,
    `createdAt` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `updatedAt` DATETIME(3) NULL,

    UNIQUE INDEX `item_store_uuid_key`(`uuid`),
    UNIQUE INDEX `item_store_name_key`(`name`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `item` (
    `uuid` VARCHAR(191) NOT NULL,
    `name` VARCHAR(30) NOT NULL,
    `buyingPrice` INTEGER NOT NULL,
    `sellingPrice` INTEGER NOT NULL,
    `unit` VARCHAR(191) NOT NULL,
    `reorderLevel` INTEGER NOT NULL,
    `maximumLevel` INTEGER NOT NULL,
    `batchNumber` VARCHAR(191) NULL,
    `isActive` BOOLEAN NOT NULL DEFAULT true,
    `createdAt` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `updatedAt` DATETIME(3) NULL,
    `userId` VARCHAR(191) NULL,
    `categoryId` VARCHAR(191) NULL,
    `supplierId` VARCHAR(191) NULL,
    `storeId` VARCHAR(191) NULL,

    UNIQUE INDEX `item_uuid_key`(`uuid`),
    UNIQUE INDEX `item_name_key`(`name`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `insurance` (
    `uuid` VARCHAR(191) NOT NULL,
    `name` VARCHAR(30) NOT NULL,
    `description` VARCHAR(191) NOT NULL,
    `isActive` BOOLEAN NOT NULL DEFAULT true,
    `createdAt` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `updatedAt` DATETIME(3) NULL,
    `useruuid` VARCHAR(191) NULL,

    UNIQUE INDEX `insurance_uuid_key`(`uuid`),
    UNIQUE INDEX `insurance_name_key`(`name`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `order` (
    `uuid` VARCHAR(191) NOT NULL,
    `orderDate` DATETIME(3) NOT NULL,
    `isInsured` BOOLEAN NOT NULL,
    `insuranceNumber` VARCHAR(191) NOT NULL,
    `isActive` BOOLEAN NOT NULL DEFAULT true,
    `createdAt` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `updatedAt` DATETIME(3) NULL,
    `clientId` VARCHAR(191) NULL,

    UNIQUE INDEX `order_uuid_key`(`uuid`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `order_discount` (
    `uuid` VARCHAR(191) NOT NULL,
    `name` VARCHAR(30) NOT NULL,
    `discountRate` INTEGER NOT NULL,
    `startDate` DATETIME(3) NOT NULL,
    `endDate` DATETIME(3) NOT NULL,
    `isActive` BOOLEAN NOT NULL DEFAULT true,
    `createdAt` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `updatedAt` DATETIME(3) NULL,

    UNIQUE INDEX `order_discount_uuid_key`(`uuid`),
    UNIQUE INDEX `order_discount_name_key`(`name`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `order_item` (
    `uuid` VARCHAR(191) NOT NULL,
    `pauuid` INTEGER NOT NULL,
    `quantity` INTEGER NOT NULL,
    `isActive` BOOLEAN NOT NULL DEFAULT true,
    `createdAt` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `updatedAt` DATETIME(3) NULL,
    `itemId` VARCHAR(191) NULL,
    `discountId` VARCHAR(191) NULL,

    UNIQUE INDEX `order_item_uuid_key`(`uuid`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `item_inventory` (
    `uuid` VARCHAR(191) NOT NULL,
    `quantity` INTEGER NOT NULL,
    `isActive` BOOLEAN NOT NULL DEFAULT true,
    `createdAt` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `updatedAt` DATETIME(3) NULL,
    `itemId` VARCHAR(191) NULL,

    UNIQUE INDEX `item_inventory_uuid_key`(`uuid`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `item_stock` (
    `uuid` VARCHAR(191) NOT NULL,
    `stockDate` DATETIME(3) NULL DEFAULT CURRENT_TIMESTAMP(3),
    `quantity` INTEGER NOT NULL,
    `isActive` BOOLEAN NOT NULL DEFAULT true,
    `createdAt` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `updatedAt` DATETIME(3) NULL,
    `itemId` VARCHAR(191) NULL,

    UNIQUE INDEX `item_stock_uuid_key`(`uuid`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- AddForeignKey
ALTER TABLE `client` ADD CONSTRAINT `client_personId_fkey` FOREIGN KEY (`personId`) REFERENCES `person`(`uuid`) ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `user` ADD CONSTRAINT `user_personId_fkey` FOREIGN KEY (`personId`) REFERENCES `person`(`uuid`) ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `user` ADD CONSTRAINT `user_roleId_fkey` FOREIGN KEY (`roleId`) REFERENCES `user_role`(`uuid`) ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `item_category` ADD CONSTRAINT `item_category_userId_fkey` FOREIGN KEY (`userId`) REFERENCES `user`(`uuid`) ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `item` ADD CONSTRAINT `item_userId_fkey` FOREIGN KEY (`userId`) REFERENCES `user`(`uuid`) ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `item` ADD CONSTRAINT `item_categoryId_fkey` FOREIGN KEY (`categoryId`) REFERENCES `item_category`(`uuid`) ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `item` ADD CONSTRAINT `item_supplierId_fkey` FOREIGN KEY (`supplierId`) REFERENCES `item_supplier`(`uuid`) ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `item` ADD CONSTRAINT `item_storeId_fkey` FOREIGN KEY (`storeId`) REFERENCES `item_store`(`uuid`) ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `order` ADD CONSTRAINT `order_clientId_fkey` FOREIGN KEY (`clientId`) REFERENCES `client`(`uuid`) ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `order_item` ADD CONSTRAINT `order_item_itemId_fkey` FOREIGN KEY (`itemId`) REFERENCES `item`(`uuid`) ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `order_item` ADD CONSTRAINT `order_item_discountId_fkey` FOREIGN KEY (`discountId`) REFERENCES `order_discount`(`uuid`) ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `item_inventory` ADD CONSTRAINT `item_inventory_itemId_fkey` FOREIGN KEY (`itemId`) REFERENCES `item`(`uuid`) ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `item_stock` ADD CONSTRAINT `item_stock_itemId_fkey` FOREIGN KEY (`itemId`) REFERENCES `item`(`uuid`) ON DELETE SET NULL ON UPDATE CASCADE;
