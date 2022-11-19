import { Body, Controller, Get, Post, Put, Query, UsePipes, ValidationPipe } from "@nestjs/common";
import { CreateRecordScheduleDto } from "./dto/create-record-schedule-dto";
import { ListScheduleEntitiesDto } from "./dto/list-schedule-entities-dto";
import { UpdateRecordScheduleDto } from "./dto/update-record-schedule-dto";
import { ScheduleService } from "./schedule.service";

@Controller("schedule")
export class ScheduleController {
  constructor(private readonly scheduleService: ScheduleService) {}

  @Get()
  async getRecords(@Query() query: ListScheduleEntitiesDto) {
    console.log(query);
    return await this.scheduleService.getRecords(query);
  }

  @Post()
  async createRecord(@Body() createRecordScheduleDto: CreateRecordScheduleDto) {
    console.log(createRecordScheduleDto);
    // try {
    return await this.scheduleService.createRecord(createRecordScheduleDto);
    // } catch(err) {
    // 	throw new HttpException({

    // 	})
    // }
  }

  @Put()
  async updateRecord(@Body() updateRecordScheduleDto: UpdateRecordScheduleDto) {
    return await this.scheduleService.updateRecord(updateRecordScheduleDto);
  }
}
