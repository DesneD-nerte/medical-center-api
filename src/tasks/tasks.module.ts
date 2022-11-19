import { Module } from "@nestjs/common";
import { TasksController } from "./tasks.controller";
import { TasksRepository } from "./tasks.repository";
import { TasksService } from "./tasks.service";

@Module({
  imports: [],
  controllers: [TasksController],
  providers: [TasksService, TasksRepository],
})
export class TasksModule {}
