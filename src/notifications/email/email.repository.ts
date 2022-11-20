import { Injectable } from "@nestjs/common";
import { PrismaService } from "src/prisma/prisma.service";
import { NotificationDto } from "../dto/notification-dto";

@Injectable()
export class EmailRepository {
  constructor(private prisma: PrismaService) {}

  async findTomorrowRecords(): Promise<NotificationDto[]> {
    return await this.prisma
      .$queryRaw`SELECT time_from, patients.email, doctors.name, doctors.spec FROM schedule 
    INNER JOIN patients ON patient_id = patients.id
    INNER JOIN doctors ON doctor_id = doctors.id
    WHERE is_free = 0
        AND
        TIMESTAMPDIFF(HOUR, CURRENT_TIMESTAMP(), time_from) < 24
        AND
        TIMESTAMPDIFF(HOUR,  CURRENT_TIMESTAMP(), time_from) > 2`;
  }

  async findHoursRecords(): Promise<NotificationDto[]> {
    return await this.prisma
      .$queryRaw`SELECT time_from, patients.email, doctors.name, doctors.spec FROM schedule
    INNER JOIN patients ON patient_id = patients.id
    INNER JOIN doctors ON doctor_id = doctors.id  
    WHERE is_free = 0
        AND
        CURDATE() = date 
        AND
        TIMESTAMPDIFF(HOUR,  CURRENT_TIMESTAMP(), time_from) < 2
        AND
        TIMESTAMPDIFF(HOUR,  CURRENT_TIMESTAMP(), time_from) > 0`;
  }
}
