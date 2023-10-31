import { Href } from "expo-router";

import { Icons } from "@/components/icons";

export type SupportedLanguageCode = "en" | "mm" | "jp" | "th";

export type Languages = {
  [key in SupportedLanguageCode]: { name: string; flag: string };
};

export type Translations = {
  [key in SupportedLanguageCode]: string;
};

export type CommonTranslations = {
  [key: string]: Translations;
};

export type IconName = keyof typeof Icons;

export type NavItem = {
  icon: keyof typeof Icons;
  label: string;
  href: Href;
};

export type AppConfig = {
  name: string;
  title: string;
  description: string | undefined;
  author: string;
  keywords: string[];
};

export type Colors = {
  background: string;
  foreground: string;
  primary: string;
  primaryForeground: string;
  secondary: string;
  secondaryForeground: string;
  muted: string;
  mutedForeground: string;
  accent: string;
  accentForeground: string;
  destructive: string;
  destructiveForeground: string;
  sucess: string;
  sucessForeground: string;
  border: string;
};

export type ThemeColors = {
  light: Colors;
  dark: Colors;
};
