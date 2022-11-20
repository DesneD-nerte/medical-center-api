import { Module } from "@nestjs/common";
import { EmailModule } from "../notifications/email/email.module";
import { TasksService } from "./tasks.service";

@Module({
  imports: [EmailModule],
  controllers: [],
  providers: [TasksService],
})
export class TasksModule {}
