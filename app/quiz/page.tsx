"use client";

import {
  Box,
  Button,
  CloseButton,
  HStack,
  Heading,
  Progress,
  VStack,
  Input,
} from "@chakra-ui/react";
import { useState, useCallback } from "react";
import { AlertDialog } from "../../components/ui/AlertDialog";
import { useRouter } from "next/navigation";    

export default function Page() {

  const router = useRouter()
  const [isEnabled, setIsEnabled] = useState(true);

  const onReturn = useCallback(() => {
    console.log("HI");
    setIsEnabled(true);
  }, []);

  const returnToGame = () => {
      console.log("Return Game...");
      router.push("/game");
  }


  const navigateToDictionary = () => {
      console.log("Go to Spanishdict...");
      router.push(`https://www.spanishdict.com/translate/${"abrir"}`);
  }


  return (
    <>
      <Box textAlign="center" pt="10vh">
        <VStack gap="40">
          <HStack>
            <AlertDialog 
                title="Are you sure?"
                body={"Leaving will reset your progress."} 
                cancelText={"Cancel"} 
                deleteText={"Leave"} 
                customButton={<CloseButton />}
                buttonText="Leave"
                onClick={returnToGame}
            />
            <Progress.Root width="350px" value={65} striped>
              <Progress.Track>
                <Progress.Range />
              </Progress.Track>
            </Progress.Root>
          </HStack>

          <VStack gap="6">
            <Heading size="6xl" letterSpacing="tight">
              abrir
            </Heading>
            <Input
              placeholder="el/ ella/ usted"
              variant="outline"
              size={"lg"}
              width={"100%"}
              minHeight={"60px"}
              fontSize={"2xl"}
            />

            <HStack>
              <Button size={"lg"} onClick={navigateToDictionary} >Go to Dictionary</Button>
              <Button size={"lg"} variant="outline">
                😛 I don't know
              </Button>
            </HStack>
          </VStack>
        </VStack>
      </Box>
    </>
  );
}
