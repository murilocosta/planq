import { Group, Header, useMantineColorScheme } from "@mantine/core";
import AppLogo from "./AppLogo";
import AppNavigation from "./AppNavigation";

export default function AppHeader() {
  const colorScheme = useMantineColorScheme();

  return (
    <Header p={'md'} height={60}>
      <Group sx={{ height: '100%' }} px={20} position="apart">
        <AppLogo />
      </Group>
    </Header>
  );
}