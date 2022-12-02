import Image from "next/image";

export default function AppLogo() {
  return (
    <Image src='/logo.svg' alt='Planq' width={50} height={50} />
  );
}
