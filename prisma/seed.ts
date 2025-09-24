import  { words } from "./data/words";
import { present } from "./data/present";
import { PrismaClient } from "@prisma/client";

const prisma = new PrismaClient();

async function main() {
    const w = await prisma.word.createMany({
        data: words,
        skipDuplicates: true,
    });
    
    console.log(w)
}

main().catch((e) => {
    console.error(e);
    process.exit(1);
}).finally( async () => {
    await prisma.$disconnect();
});