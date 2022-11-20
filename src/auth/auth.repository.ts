import { Injectable } from "@nestjs/common";
import { PrismaService } from "../prisma/prisma.service";
import { RegisterPatientDto } from "./dto/register-patient-dto";

@Injectable()
export class AuthRepository {
  constructor(private prisma: PrismaService) {}

  async findOne(email: string) {
    return await this.prisma.patients.findUnique({ where: { email: email } });
  }

  async registerOne(registerPatientDto: RegisterPatientDto) {
    const newPatient = await this.prisma.patients.create({ data: { ...registerPatientDto } });

    return newPatient;
  }
}
