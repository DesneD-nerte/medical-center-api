import { Module } from "@nestjs/common";
import { AuthController } from "./auth.controller";
import { AuthRepository } from "./auth.repository";
import { AuthService } from "./auth.service";

@Module({
  imports: [],
  controllers: [AuthController],
  providers: [AuthService, AuthRepository],
})
export class AuthModule {}
