import { Injectable } from "@nestjs/common";
import { Cron, CronExpression } from "@nestjs/schedule";
import { EmailService } from "src/notifications/email/email.service";

@Injectable()
export class TasksService {
  constructor(private emailService: EmailService) {}

  @Cron(CronExpression.EVERY_10_SECONDS)
  async handleCron() {
    await this.emailService.send();
    // this.telegramService.send();
    // this.phoneService.send();
  }
}
