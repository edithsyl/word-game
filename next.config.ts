import type { NextConfig } from "next";

const nextConfig: NextConfig = {
  /* config options here */
  experimental: {
    optimizePackageImports: ["@chakra-ui/react"],
  },
  images: {
    domains: ["share.google.com", "avatars.githubsercontent.com"],
  },
};

export default nextConfig;
