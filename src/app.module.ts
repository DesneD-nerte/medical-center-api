import { Module } from "@nestjs/common";
import { AppController } from "./app.controller";
import { AppService } from "./app.service";
import { AuthModule } from "./auth/auth.module";
import { PrismaModule } from "./prisma/prisma.module";
import { PrismaService } from "./prisma/prisma.service";
import { ScheduleModule } from "./schedule/schedule.module";
import { ScheduleModule as NestScheduleModule } from "@nestjs/schedule";
import { TasksModule } from "./tasks/tasks.module";
import { MailerModule } from "@nestjs-modules/mailer";
import { HandlebarsAdapter } from "@nestjs-modules/mailer/dist/adapters/handlebars.adapter";
import { EmailModule } from "./notifications/email/email.module";

@Module({
  imports: [
    AuthModule,
    ScheduleModule,
    PrismaModule,
    NestScheduleModule.forRoot(),
    TasksModule,
    EmailModule,
    MailerModule.forRoot({
      //It is not a real password, it is specific app password
      transport: "smtps://ershov.sasha2013@gmail.com:ehkqqnhebbgjeukz@smtp.gmail.com",
      defaults: {
        from: '"nest-modules" <modules@nestjs.com>',
      },
      template: {
        dir: __dirname + "/mails",
        adapter: new HandlebarsAdapter(),
        options: {
          strict: true,
        },
      },
    }),
  ],
  controllers: [AppController],
  providers: [AppService, PrismaService],
})
export class AppModule {}
