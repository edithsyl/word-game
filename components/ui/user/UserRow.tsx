"use client";
import { JSX, useEffect } from "react";
import { Box, Text, Avatar, HStack, VStack, Link } from "@chakra-ui/react";
import { logout } from "../../../lib/actions/auth";
// import { useWebsocketEvent } from "../../lib/hooks/useWebsocketEvent";
// import * as Constants from "../../../lib/constants";

interface UserRowProps {
  id: string;
  image?: string;
  name: string; // Function prop
}

const colorPalette = ["red", "blue", "green", "yellow", "purple", "orange"];


const pickPalette = (name: string) => {
  const index = name.charCodeAt(0) % colorPalette.length;
  return colorPalette[index];
};

export function UserRow ({ 
    id, image, name 
}: UserRowProps): JSX.Element | null {
  // const { data: session, status } = useSession();
  // const loading = status === 'loading';

  // if (loading || !session) {
  //   return null;
  // }

  return (
    <Box>
      <HStack gap="3">
        <Avatar.Root colorPalette={pickPalette(name)} size="lg">
          <Avatar.Fallback name={name} />
          <Avatar.Image src={image} />
        </Avatar.Root>
        <VStack>
            <Text ml={2}>{name}</Text>
            <Link fontSize="xs" onClick={() => logout()}>
            Sign out
            </Link>
        </VStack>
      </HStack>
    </Box>
  );
};
