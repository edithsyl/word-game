import { Button, Dialog, Portal } from "@chakra-ui/react";
import React from "react";

interface AlertDialogProps {
  buttonText?: string;
  body: string;
  title?: string;
  cancelText: string;
  deleteText: string;
  customButton?: any;
  onClick: Function; // Function prop
}

export const AlertDialog: React.FC<AlertDialogProps> = ({
  buttonText = null,
  body,
  title = null,
  cancelText,
  deleteText,
  customButton,
  onClick,
}) => {
  const handleClick = () => {
    onClick();
  };
  return (
    <Dialog.Root role="alertdialog">
      <Dialog.Trigger asChild>
        {customButton || <Button>{buttonText}</Button>}
      </Dialog.Trigger>
      <Portal>
        <Dialog.Backdrop />
        <Dialog.Positioner>
          <Dialog.Content>
            <Dialog.Header>
              {title && <Dialog.Title>{title}</Dialog.Title>}
            </Dialog.Header>
            <Dialog.Body>
              <p>{body}</p>
            </Dialog.Body>
            <Dialog.Footer>
              <Dialog.ActionTrigger asChild>
                <Button variant="outline">{cancelText}</Button>
              </Dialog.ActionTrigger>
              <Button colorPalette="red" onClick={handleClick}>
                {deleteText}
              </Button>
            </Dialog.Footer>
          </Dialog.Content>
        </Dialog.Positioner>
      </Portal>
    </Dialog.Root>
  );
};
