import { Injectable, Logger } from "@nestjs/common";
import { Cron, CronExpression } from "@nestjs/schedule";
import { MailerService } from "@nestjs-modules/mailer";
import { TasksRepository } from "./tasks.repository";
import { NotificationDto } from "./dto/notification-dto";

@Injectable()
export class TasksService {
  private readonly logger = new Logger(TasksService.name);

  constructor(
    private readonly mailerService: MailerService,
    private tasksRepository: TasksRepository,
  ) {}

  async sendEmail(arrayNotificationRecords: NotificationDto[], options: "tomorrow" | "hours") {
    arrayNotificationRecords.forEach((notificationRecord) => {
      this.mailerService.sendMail({
        to: notificationRecord.email,
        from: "noreply@nestjs.com",
        subject: "Уведомление записи на прием",
        template: options == "hours" ? "record-notification-2hour" : "record-notification-tomorrow",
        context: {
          data: {
            currentDate: new Date().toLocaleDateString("ru-RU"),
            name: notificationRecord.name,
            spec: notificationRecord.spec,
            time:
              notificationRecord.time_from.getHours() + notificationRecord.time_from.getMinutes(),
          },
        },
      });
    });
  }

  @Cron(CronExpression.EVERY_10_MINUTES)
  async handleCron() {
    const hoursPatientsEmails = await this.tasksRepository.findHoursRecords();
    const tomorrowPatientsEmails = await this.tasksRepository.findTomorrowRecords();

    this.sendEmail(hoursPatientsEmails, "hours");
    this.sendEmail(tomorrowPatientsEmails, "tomorrow");
  }
}
