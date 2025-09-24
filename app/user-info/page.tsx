import { auth } from "../../auth";
import { Avatar, VStack, Heading, } from "@chakra-ui/react";

export default async function UserInfo() {
    const session = await auth();
    return (
        <div>
            <VStack gap="6">
                <Heading size="6xl" letterSpacing="tight">
                    {session?.user?.name}
                </Heading>
                <p>EMAIL: {session?.user?.email}</p>
            </VStack>

        </div>
    );
}