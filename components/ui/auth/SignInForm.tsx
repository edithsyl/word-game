import { Button, Box, VStack } from "@chakra-ui/react";
import { login } from "../../../lib/actions/auth";

export const SignInForm = () => {
  return (
      <Box textAlign="center" fontSize="xl" pt="30vh">
        <VStack gap={8}>
          <Button onClick={login}>Sign in with Github</Button>
        </VStack>
      </Box>
  );
}
