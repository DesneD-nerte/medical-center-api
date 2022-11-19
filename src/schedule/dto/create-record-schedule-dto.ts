import { Type } from "class-transformer";
import { IsNumber } from "class-validator";

export class CreateRecordScheduleDto {
  @Type(() => Number)
  @IsNumber()
  patientId: number;

  @Type(() => Number)
  @IsNumber()
  scheduleId: number;

  @Type(() => Number)
  @IsNumber()
  type: number;
}
