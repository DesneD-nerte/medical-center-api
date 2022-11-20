import { Module } from "@nestjs/common";
import { EmailRepository } from "./email.repository";
import { EmailService } from "./email.service";

@Module({
  imports: [],
  controllers: [],
  providers: [EmailService, EmailRepository],
  exports: [EmailService],
})
export class EmailModule {}
