import { MailerService } from "@nestjs-modules/mailer";
import { Injectable } from "@nestjs/common";
import { EmailRepository } from "./email.repository";
import { NotificationDto } from "../dto/notification-dto";
import { NotificationService } from "../notification.interface";

@Injectable()
export class EmailService implements NotificationService {
  private previousHoursPatientsEmails: NotificationDto[] = [];
  private previousTomorrowPatientsEmails: NotificationDto[] = [];

  constructor(
    private emailRepository: EmailRepository,
    private readonly mailerService: MailerService,
  ) {}

  async send() {
    const filteredHoursPatientsEmails = await this.getFilteredHoursEmails();
    const filteredTomorrowPatientsEmails = await this.getFilteredTomorrowEmails();

    this.handleSend(filteredHoursPatientsEmails, "hours");
    this.handleSend(filteredTomorrowPatientsEmails, "tomorrow");

    this.previousHoursPatientsEmails.push(...filteredHoursPatientsEmails);
    this.previousTomorrowPatientsEmails.push(...filteredTomorrowPatientsEmails);
  }

  handleSend(arrayNotificationRecords: NotificationDto[], options: "tomorrow" | "hours") {
    arrayNotificationRecords.forEach(async (notificationRecord) => {
      await this.mailerService.sendMail({
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

  async getFilteredHoursEmails() {
    const currentHoursPatientsEmails = await this.emailRepository.findHoursRecords();

    const filteredHoursPatientsEmails = currentHoursPatientsEmails.filter((oneNotificationDto) => {
      return !this.previousHoursPatientsEmails.some(
        (previousNotificationDto) => previousNotificationDto.email == oneNotificationDto.email,
      );
    });
    return filteredHoursPatientsEmails;
  }

  async getFilteredTomorrowEmails() {
    const currentTomorrowPatientsEmails = await this.emailRepository.findTomorrowRecords();

    const filteredTomorrowPatientsEmails = currentTomorrowPatientsEmails.filter(
      (oneNotificationDto) => {
        return !this.previousTomorrowPatientsEmails.some(
          (previousNotificationDto) => previousNotificationDto.email == oneNotificationDto.email,
        );
      },
    );

    return filteredTomorrowPatientsEmails;
  }
}
