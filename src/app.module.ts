import { Module } from "@nestjs/common";
import { AppController } from "./app.controller";
import { AppService } from "./app.service";
import { AuthModule } from "./auth/auth.module";
import { PrismaModule } from "./prisma/prisma.module";
import { PrismaService } from "./prisma/prisma.service";
import { ScheduleModule } from "./schedule/schedule.module";
import { ScheduleModule as NestScheduleModule } from "@nestjs/schedule";
import { TasksModule } from "./tasks/task.module";

@Module({
  imports: [AuthModule, ScheduleModule, PrismaModule, NestScheduleModule.forRoot(), TasksModule],
  controllers: [AppController],
  providers: [AppService, PrismaService],
})
export class AppModule {}
