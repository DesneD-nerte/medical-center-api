import { Injectable } from "@nestjs/common";
import { Patient } from "@prisma/client";
import { PrismaService } from "../prisma/prisma.service";
import { CreateRecordScheduleDto } from "./dto/create-record-schedule-dto";
import { ListScheduleEntitiesDto } from "./dto/list-schedule-entities-dto";
import { UpdateRecordScheduleDto } from "./dto/update-record-schedule-dto";

@Injectable()
export class ScheduleService {
  constructor(private prisma: PrismaService) {}

  async getRecords(listScheduleEntitiesDto: ListScheduleEntitiesDto) {
    const { date, timeFrom, timeTo, isFree, doctorId, patientId } = listScheduleEntitiesDto;

    const filteredRecords = await this.prisma.schedule.findMany({
      where: {
        AND: [
          { date },
          { time_from: timeFrom },
          { time_to: timeTo },
          { is_free: isFree },
          { doctor_id: doctorId },
          { patient_id: patientId },
        ],
      },
    });

    return filteredRecords;
  }

  async createRecord(createRecordScheduleDto: CreateRecordScheduleDto) {
    const { scheduleId, patientId, type } = createRecordScheduleDto;
    const scheduleRecord = await this.prisma.schedule.findUnique({ where: { id: scheduleId } });

    if (!scheduleRecord.is_free) {
      throw new Error("Запись уже занята.");
    }

    const newRecord = await this.prisma.schedule.update({
      where: { id: scheduleId },
      data: { is_free: false, type, patient_id: patientId },
    });

    return newRecord;
  }

  async updateRecord(updateRecordScheduleDto: UpdateRecordScheduleDto) {
    const { oldScheduleId, newScheduleId, patientId, type } = updateRecordScheduleDto;

    await this.prisma.schedule.update({
      where: { id: oldScheduleId },
      data: { is_free: true, type: null, patient_id: null },
    });

    const newRecord = await this.prisma.schedule.update({
      where: { id: newScheduleId },
      data: { is_free: false, type, patient_id: patientId },
    });

    return newRecord;
  }
}
