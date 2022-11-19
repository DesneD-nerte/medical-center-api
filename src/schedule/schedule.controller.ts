import { Body, Controller, Get, Post, Put, Query, UsePipes, ValidationPipe } from "@nestjs/common";
import { CreateRecordScheduleDto } from "./dto/create-record-schedule-dto";
import { ListScheduleEntitiesDto } from "./dto/list-schedule-entities-dto";
import { UpdateRecordScheduleDto } from "./dto/update-record-schedule-dto";
import { ScheduleService } from "./schedule.service";

@Controller("schedule")
export class ScheduleController {
  constructor(private readonly scheduleService: ScheduleService) {}

  @Get()
  @UsePipes(new ValidationPipe({ whitelist: true, transform: true, skipMissingProperties: true }))
  async getRecords(@Query() query: ListScheduleEntitiesDto) {
    return await this.scheduleService.getRecords(query);
  }

  @Post()
  @UsePipes(new ValidationPipe({ whitelist: true, transform: true }))
  async createRecord(@Body() createRecordScheduleDto: CreateRecordScheduleDto) {
    return await this.scheduleService.createRecord(createRecordScheduleDto);
  }

  @Put()
  @UsePipes(new ValidationPipe({ whitelist: true, transform: true }))
  async updateRecord(@Body() updateRecordScheduleDto: UpdateRecordScheduleDto) {
    return await this.scheduleService.updateRecord(updateRecordScheduleDto);
  }
}
