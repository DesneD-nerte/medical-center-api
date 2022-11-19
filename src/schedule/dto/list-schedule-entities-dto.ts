import { Transform, Type } from "class-transformer";
import { IsBoolean, IsDate, IsNumber } from "class-validator";

export class ListScheduleEntitiesDto {
  @Type(() => Date)
  @IsDate()
  date: Date;

  @Type(() => Date)
  @IsDate()
  timeFrom: Date;

  @Type(() => Date)
  @IsDate()
  timeTo: Date;

  @Transform(({ value }) => value === "1" || value === "true")
  @IsBoolean()
  isFree: boolean;

  @Type(() => Number)
  @IsNumber()
  doctorId: number;

  @Type(() => Number)
  @IsNumber()
  patientId: number;
}
