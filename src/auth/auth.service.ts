import { Inject, Injectable } from "@nestjs/common";
import { Patient } from "@prisma/client";
import { PrismaService } from "../prisma/prisma.service";
import { RegisterPatientDto } from "./dto/register-patient-dto";

@Injectable()
export class AuthService {
  constructor(private prisma: PrismaService) {}

  async register(registerPatientDto: RegisterPatientDto) {
    const { email } = registerPatientDto;
    const registeredPatient = await this.prisma.patient.findUnique({ where: { email } });

    if (registeredPatient) {
      return registeredPatient;
    }

    const newPatient = await this.prisma.patient.create({ data: { ...registerPatientDto } });

    return newPatient;
  }
}
