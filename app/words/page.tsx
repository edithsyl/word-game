import prisma from "../../db";

// use `prisma` in your application to read and write data in your DB

export default async function WordsPage() {
    const words = await prisma.word.findMany({include: {present: true}});

    return (
        <div>
            <h1>Words</h1>
            {words.map((word) => (
                <p key={word.id}>{word.infinitive} {word?.present?.yo}</p>
            ))}
        </div>
    );
}