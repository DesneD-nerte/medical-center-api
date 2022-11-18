import { Body, Controller, Get, Post } from "@nestjs/common";
import { AuthService } from "./auth.service";
import { RegisterPatientDto } from "./dto/register-patient-dto";

@Controller("auth")
export class AuthController {
  constructor(private readonly authService: AuthService) {}

  @Post("/register")
  async register(@Body() registerPatientDto: RegisterPatientDto) {
    return await this.authService.register(registerPatientDto);
  }
}
