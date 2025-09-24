-- CreateEnum
CREATE TYPE "public"."Role" AS ENUM ('USER', 'ADMIN');

-- CreateEnum
CREATE TYPE "public"."PartOfSpeech" AS ENUM ('NOUN', 'VERB', 'ADJECTIVE');

-- CreateEnum
CREATE TYPE "public"."VisibilityLevel" AS ENUM ('PUBLIC', 'PRIVATE');

-- CreateEnum
CREATE TYPE "public"."Quality" AS ENUM ('EASY', 'GOOD', 'CORRECT_HESITATE', 'INCORRECT_RECALL', 'INCORRECT', 'BLACKOUT');

-- CreateTable
CREATE TABLE "public"."User" (
    "id" TEXT NOT NULL,
    "name" TEXT,
    "role" "public"."Role" NOT NULL DEFAULT 'USER',
    "email" TEXT,
    "emailVerified" TIMESTAMP(3),
    "image" TEXT,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "User_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "public"."Account" (
    "id" SERIAL NOT NULL,
    "userId" TEXT NOT NULL,
    "type" TEXT NOT NULL,
    "provider" TEXT NOT NULL DEFAULT 'github',
    "providerAccountId" TEXT NOT NULL,
    "refresh_token" TEXT,
    "refresh_token_expires_in" INTEGER,
    "access_token" TEXT,
    "expires_at" INTEGER,
    "token_type" TEXT,
    "scope" TEXT,
    "id_token" TEXT,
    "session_state" TEXT,
    "oauth_token_secret" TEXT,
    "oauth_token" TEXT,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "Account_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "public"."Session" (
    "id" SERIAL NOT NULL,
    "userId" TEXT NOT NULL,
    "expires" TIMESTAMP(3) NOT NULL,
    "sessionToken" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "Session_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "public"."VerificationToken" (
    "identifier" TEXT NOT NULL,
    "token" TEXT NOT NULL,
    "expires" TIMESTAMP(3) NOT NULL
);

-- CreateTable
CREATE TABLE "public"."Word" (
    "id" SERIAL NOT NULL,
    "partOfSpeech" "public"."PartOfSpeech" NOT NULL,
    "infinitive" TEXT NOT NULL,
    "url" TEXT NOT NULL,

    CONSTRAINT "Word_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "public"."PresentConjugation" (
    "id" SERIAL NOT NULL,
    "word_id" INTEGER NOT NULL,
    "yo" TEXT NOT NULL,
    "tu" TEXT NOT NULL,
    "elEllaUsted" TEXT NOT NULL,
    "nosotros" TEXT NOT NULL,
    "vosotros" TEXT NOT NULL,
    "ellosEllasUstedes" TEXT NOT NULL,

    CONSTRAINT "PresentConjugation_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "public"."PreteriteConjugation" (
    "id" SERIAL NOT NULL,
    "wordId" INTEGER NOT NULL,
    "yo" TEXT NOT NULL,
    "tu" TEXT NOT NULL,
    "elEllaUsted" TEXT NOT NULL,
    "nosotros" TEXT NOT NULL,
    "vosotros" TEXT NOT NULL,
    "ellosEllasUstedes" TEXT NOT NULL,

    CONSTRAINT "PreteriteConjugation_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "public"."ImperfectConjugation" (
    "id" SERIAL NOT NULL,
    "wordId" INTEGER NOT NULL,
    "yo" TEXT NOT NULL,
    "tu" TEXT NOT NULL,
    "elEllaUsted" TEXT NOT NULL,
    "nosotros" TEXT NOT NULL,
    "vosotros" TEXT NOT NULL,
    "ellosEllasUstedes" TEXT NOT NULL,

    CONSTRAINT "ImperfectConjugation_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "public"."ParticipleConjudation" (
    "id" SERIAL NOT NULL,
    "word_id" INTEGER NOT NULL,
    "present" TEXT NOT NULL,
    "past" TEXT NOT NULL,

    CONSTRAINT "ParticipleConjudation_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "public"."Set" (
    "id" SERIAL NOT NULL,
    "title" TEXT NOT NULL,
    "authorId" TEXT NOT NULL,
    "visibility" "public"."VisibilityLevel" NOT NULL,

    CONSTRAINT "Set_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "public"."LearnerSet" (
    "learnerId" TEXT NOT NULL,
    "setId" INTEGER NOT NULL,

    CONSTRAINT "LearnerSet_pkey" PRIMARY KEY ("learnerId","setId")
);

-- CreateTable
CREATE TABLE "public"."WordSet" (
    "id" SERIAL NOT NULL,
    "setId" INTEGER NOT NULL,
    "wordId" INTEGER NOT NULL,
    "assignedAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "WordSet_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "public"."UserWordProgress" (
    "id" SERIAL NOT NULL,
    "userId" TEXT NOT NULL,
    "wordId" INTEGER NOT NULL,
    "quality" "public"."Quality" NOT NULL,
    "repetition" INTEGER NOT NULL DEFAULT 0,
    "easeFactor" DOUBLE PRECISION NOT NULL DEFAULT 2.5,
    "previousInterval" INTEGER NOT NULL DEFAULT 0,
    "lastReviewed" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "UserWordProgress_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "User_email_key" ON "public"."User"("email");

-- CreateIndex
CREATE INDEX "userId" ON "public"."Account"("userId");

-- CreateIndex
CREATE UNIQUE INDEX "Account_provider_providerAccountId_key" ON "public"."Account"("provider", "providerAccountId");

-- CreateIndex
CREATE UNIQUE INDEX "Session_sessionToken_key" ON "public"."Session"("sessionToken");

-- CreateIndex
CREATE UNIQUE INDEX "VerificationToken_token_key" ON "public"."VerificationToken"("token");

-- CreateIndex
CREATE UNIQUE INDEX "VerificationToken_identifier_token_key" ON "public"."VerificationToken"("identifier", "token");

-- CreateIndex
CREATE UNIQUE INDEX "PresentConjugation_word_id_key" ON "public"."PresentConjugation"("word_id");

-- CreateIndex
CREATE UNIQUE INDEX "PreteriteConjugation_wordId_key" ON "public"."PreteriteConjugation"("wordId");

-- CreateIndex
CREATE UNIQUE INDEX "ImperfectConjugation_wordId_key" ON "public"."ImperfectConjugation"("wordId");

-- CreateIndex
CREATE UNIQUE INDEX "ParticipleConjudation_word_id_key" ON "public"."ParticipleConjudation"("word_id");

-- CreateIndex
CREATE UNIQUE INDEX "WordSet_setId_wordId_key" ON "public"."WordSet"("setId", "wordId");

-- CreateIndex
CREATE UNIQUE INDEX "UserWordProgress_userId_key" ON "public"."UserWordProgress"("userId");

-- CreateIndex
CREATE UNIQUE INDEX "UserWordProgress_userId_wordId_key" ON "public"."UserWordProgress"("userId", "wordId");

-- AddForeignKey
ALTER TABLE "public"."Account" ADD CONSTRAINT "Account_userId_fkey" FOREIGN KEY ("userId") REFERENCES "public"."User"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "public"."Session" ADD CONSTRAINT "Session_userId_fkey" FOREIGN KEY ("userId") REFERENCES "public"."User"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "public"."PresentConjugation" ADD CONSTRAINT "PresentConjugation_word_id_fkey" FOREIGN KEY ("word_id") REFERENCES "public"."Word"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "public"."PreteriteConjugation" ADD CONSTRAINT "PreteriteConjugation_wordId_fkey" FOREIGN KEY ("wordId") REFERENCES "public"."Word"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "public"."ImperfectConjugation" ADD CONSTRAINT "ImperfectConjugation_wordId_fkey" FOREIGN KEY ("wordId") REFERENCES "public"."Word"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "public"."ParticipleConjudation" ADD CONSTRAINT "ParticipleConjudation_word_id_fkey" FOREIGN KEY ("word_id") REFERENCES "public"."Word"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "public"."Set" ADD CONSTRAINT "Set_authorId_fkey" FOREIGN KEY ("authorId") REFERENCES "public"."User"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "public"."LearnerSet" ADD CONSTRAINT "LearnerSet_learnerId_fkey" FOREIGN KEY ("learnerId") REFERENCES "public"."User"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "public"."LearnerSet" ADD CONSTRAINT "LearnerSet_setId_fkey" FOREIGN KEY ("setId") REFERENCES "public"."Set"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "public"."WordSet" ADD CONSTRAINT "WordSet_setId_fkey" FOREIGN KEY ("setId") REFERENCES "public"."Set"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "public"."WordSet" ADD CONSTRAINT "WordSet_wordId_fkey" FOREIGN KEY ("wordId") REFERENCES "public"."Word"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "public"."UserWordProgress" ADD CONSTRAINT "UserWordProgress_userId_fkey" FOREIGN KEY ("userId") REFERENCES "public"."User"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "public"."UserWordProgress" ADD CONSTRAINT "UserWordProgress_wordId_fkey" FOREIGN KEY ("wordId") REFERENCES "public"."Word"("id") ON DELETE CASCADE ON UPDATE CASCADE;
