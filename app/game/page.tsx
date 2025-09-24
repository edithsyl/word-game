import {
  Box,
  Button,
  Checkbox,
  Heading,
  Progress,
  VStack,
} from "@chakra-ui/react";
import Image from "next/image";
import { UserRow } from "../../components/ui/user/UserRow";

export default async function Page() {
  return (
    <Box textAlign="center" fontSize="xl" pt="30vh">
      <VStack gap="8">
        <UserRow    
            id="1" 
            image="https://share.google/images/oeKdW2JoVeGgXfi7g" 
            name="Dan Abramov" 
        />
        <Image
          alt="chakra logo"
          src="/static/logo.svg"
          width="80"
          height="80"
        />
        <Heading size="6xl" letterSpacing="tight">
          Set Title
        </Heading>

        <Progress.Root width="300px" value={65} striped>
          <Progress.Track>
            <Progress.Range />
          </Progress.Track>
        </Progress.Root>

        <Checkbox.Root defaultChecked gap={"4"}>
          <Checkbox.HiddenInput />
          <Checkbox.Control>
            <Checkbox.Indicator />
          </Checkbox.Control>
          <Checkbox.Label>Present</Checkbox.Label>
          <Checkbox.Control>
            <Checkbox.Indicator />
          </Checkbox.Control>
          <Checkbox.Label>Preterite</Checkbox.Label>
          <Checkbox.Control>
            <Checkbox.Indicator />
          </Checkbox.Control>
          <Checkbox.Label>Imperfect</Checkbox.Label>
        </Checkbox.Root>

        <Button size={"lg"} width={"300px"}>
          Let's go!
        </Button>
      </VStack>
    </Box>
  );
}
