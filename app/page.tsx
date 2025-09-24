"use server";

import { SignInForm } from "../components/ui/auth/SignInForm";
import { auth } from "../auth";

export default async function Home() {
  const session = await auth();
  console.log(session);

  if(session?.user) {
    return (
      <div>
        <p>Hi {session.user.name}</p>
      </div>
    );
  }
  return (
    <div>
      <p>You are not signed in</p>
      <SignInForm />
    </div>
  );
}
