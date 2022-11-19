import { Type } from "class-transformer";
import { IsNumber } from "class-validator";

export class UpdateRecordScheduleDto {
  @Type(() => Number)
  @IsNumber()
  patientId: number;

  @Type(() => Number)
  @IsNumber()
  oldScheduleId: number;

  @Type(() => Number)
  @IsNumber()
  newScheduleId: number;

  @Type(() => Number)
  @IsNumber()
  type: number;
}
