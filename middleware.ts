import { NextResponse, NextRequest } from "next/server"
import { auth } from "./auth";


const protectedRoutes=["/user-info"];

export default async function middleware(request: NextRequest) {
    const session = await auth();
    const {pathname} = request.nextUrl;
    const isProtected = protectedRoutes.some((route) => pathname.startsWith(route));

    if (isProtected && !session) {
        console.log("Redirecting to login...");
        return NextResponse.redirect(new URL('/login', request.url));
    }
    
    return NextResponse.next();
}