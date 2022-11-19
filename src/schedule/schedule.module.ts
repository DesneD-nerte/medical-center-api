import { Module } from "@nestjs/common";
import { ScheduleController } from "./schedule.controller";
import { ScheduleRepository } from "./schedule.repository";
import { ScheduleService } from "./schedule.service";

@Module({
  imports: [],
  controllers: [ScheduleController],
  providers: [ScheduleService, ScheduleRepository],
})
export class ScheduleModule {}
