import { Injectable } from "@nestjs/common";
import { AuthRepository } from "./auth.repository";
import { RegisterPatientDto } from "./dto/register-patient-dto";

@Injectable()
export class AuthService {
  constructor(private authRepository: AuthRepository) {}

  async register(registerPatientDto: RegisterPatientDto) {
    const { email } = registerPatientDto;
    const registeredPatient = await this.authRepository.findOne(email);

    if (registeredPatient) {
      return registeredPatient;
    }

    const newPatient = await this.authRepository.registerOne(registerPatientDto);

    return newPatient;
  }
}
