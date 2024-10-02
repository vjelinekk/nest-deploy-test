import { Controller, Get, Post } from '@nestjs/common'
import { AppService } from './app.service'

@Controller('/api')
export class AppController {
    constructor(private readonly appService: AppService) {}

    @Get('/hello')
    getHello(): string {
        return this.appService.getHello()
    }

    @Get('/goodbye')
    getGoodbye(): string {
        return this.appService.getGoodbye()
    }
}
