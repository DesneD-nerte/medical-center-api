import { Injectable } from "@nestjs/common";
import { PrismaService } from "../prisma/prisma.service";
import { RegisterPatientDto } from "./dto/register-patient-dto";

@Injectable()
export class AuthRepository {
  constructor(private prisma: PrismaService) {}

  async findOne(email: string) {
    return await this.prisma.patient.findUnique({ where: { email } });
  }

  async registerOne(registerPatientDto: RegisterPatientDto) {
    const newPatient = await this.prisma.patient.create({ data: { ...registerPatientDto } });

    return newPatient;
  }
}
