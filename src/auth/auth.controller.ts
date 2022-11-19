import { Body, Controller, Get, Post, UsePipes, ValidationPipe } from "@nestjs/common";
import { AuthService } from "./auth.service";
import { RegisterPatientDto } from "./dto/register-patient-dto";

@Controller("auth")
@UsePipes(new ValidationPipe({ whitelist: true, transform: true }))
export class AuthController {
  constructor(private readonly authService: AuthService) {}

  @Post("/register")
  async register(@Body() registerPatientDto: RegisterPatientDto) {
    return await this.authService.register(registerPatientDto);
  }
}
