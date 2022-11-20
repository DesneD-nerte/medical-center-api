import { BadRequestException, HttpException, HttpStatus, Injectable } from "@nestjs/common";
import { CreateRecordScheduleDto } from "./dto/create-record-schedule-dto";
import { ListScheduleEntitiesDto } from "./dto/list-schedule-entities-dto";
import { UpdateRecordScheduleDto } from "./dto/update-record-schedule-dto";
import { ScheduleRepository } from "./schedule.repository";

@Injectable()
export class ScheduleService {
  constructor(private scheduleRepository: ScheduleRepository) {}

  async getRecords(listScheduleEntitiesDto: ListScheduleEntitiesDto) {
    return await this.scheduleRepository.findMany(listScheduleEntitiesDto);
  }

  async createRecord(createRecordScheduleDto: CreateRecordScheduleDto) {
    const { scheduleId } = createRecordScheduleDto;
    const scheduleRecord = await this.scheduleRepository.findOne(scheduleId);

    if (!scheduleRecord.is_free) {
      throw new HttpException({ message: "Запись уже занята." }, HttpStatus.BAD_REQUEST);
    }

    return await this.scheduleRepository.createOne(createRecordScheduleDto);
  }

  async updateRecord(updateRecordScheduleDto: UpdateRecordScheduleDto) {
    const { oldScheduleId, newScheduleId } = updateRecordScheduleDto;

    const checkOldRecord = await this.scheduleRepository.findOne(oldScheduleId);
    const checkNewRecord = await this.scheduleRepository.findOne(newScheduleId);
    if (!checkOldRecord || !checkNewRecord) {
      throw new HttpException(
        { message: "Cann't find necessary records." },
        HttpStatus.BAD_REQUEST,
      );
    }

    return await this.scheduleRepository.updateOne(updateRecordScheduleDto);
  }
}
