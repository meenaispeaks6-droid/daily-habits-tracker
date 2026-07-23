## Current state

- The Google OAuth navigation bug described in the previous plan is already fixed in `src/routes/login.tsx`: when `result.redirected` is false and there is no error, the code calls `navigate({ to: "/app" })`.
- The login page previously used hardcoded hex colors (`#FDAA3E`, `#1a1a1a`, `bg-white`) which bypassed the theme system and would break if the project switches to dark mode or changes its palette.

## Latest change

**File: `src/styles.css`** — Added semantic `brand` color tokens:

- `--color-brand` / `--color-brand-foreground` registered in `@theme inline`
- Light and dark mode values set in `:root` and `.dark`

**File: `src/routes/login.tsx`** — Replaced hardcoded colors with theme tokens:

- Page background: `bg-white` → `bg-background`
- Card background: `bg-white` → `bg-card`
- CTA button: `bg-[#FDAA3E] text-[#1a1a1a] hover:bg-[#fdb95e] shadow-[#FDAA3E]/20` → `bg-brand text-brand-foreground hover:bg-brand/90 shadow-brand/20`

## Suggested next steps

1. Apply the same `brand` token to other hardcoded orange instances (hero CTAs in `src/routes/index.tsx`, `ProgressRing.tsx`, `HabitCard.tsx` checkmarks) so the entire app is themeable.
2. Configure Google social auth in Lovable Cloud if you want the "Continue with Google" button to work for real users.
3. Publish the app to make it live and test the OAuth flow end-to-end.
