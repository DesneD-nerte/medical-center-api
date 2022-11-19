import { Injectable } from "@nestjs/common";
import { PrismaService } from "../prisma/prisma.service";
import { CreateRecordScheduleDto } from "./dto/create-record-schedule-dto";
import { ListScheduleEntitiesDto } from "./dto/list-schedule-entities-dto";
import { UpdateRecordScheduleDto } from "./dto/update-record-schedule-dto";

@Injectable()
export class ScheduleRepository {
  constructor(private prisma: PrismaService) {}

  async findOne(id: number) {
    return await this.prisma.schedule.findUnique({ where: { id } });
  }

  async findMany(listScheduleEntitiesDto: ListScheduleEntitiesDto) {
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

  async createOne(createRecordScheduleDto: CreateRecordScheduleDto) {
    const { scheduleId, patientId, type } = createRecordScheduleDto;

    const newRecord = await this.prisma.schedule.update({
      where: { id: scheduleId },
      data: { is_free: false, type, patient_id: patientId },
    });

    return newRecord;
  }

  async updateOne(updateRecordScheduleDto: UpdateRecordScheduleDto) {
    const { oldScheduleId, newScheduleId, patientId, type } = updateRecordScheduleDto;

    await this.prisma.schedule.update({
      where: { id: oldScheduleId },
      data: { is_free: true, type: null, patient_id: null },
    });

    const updatedRecord = await this.prisma.schedule.update({
      where: { id: newScheduleId },
      data: { is_free: false, type, patient_id: patientId },
    });

    return updatedRecord;
  }
}
