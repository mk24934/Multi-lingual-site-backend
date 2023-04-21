import { Controller, Get, Body, Post } from '@nestjs/common';
import { AppService } from './app.service';

@Controller()
export class AppController {
  constructor(private readonly appService: AppService) {}

  @Get()
  getHello(): string {
    return this.appService.getHello();
  }

  @Post('/day')
  async getGreeting(@Body() body: { day: string }): Promise<string> {
    console.log("body is: ", body)
    const day = body.day;
    return `Today is ${day}!`;
  }

  @Get('/hi')
  getHi(): string{
    return "Hi!";
  }
}
