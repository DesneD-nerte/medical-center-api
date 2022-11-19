import { Type } from "class-transformer";
import { IsString } from "class-validator";

export class RegisterPatientDto {
  @Type(() => String)
  @IsString()
  phone: string;

  @Type(() => String)
  @IsString()
  name: string;

  @Type(() => String)
  @IsString()
  email: string;

  @Type(() => String)
  @IsString()
  gender: string;
}
