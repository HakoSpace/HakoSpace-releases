# HakoSpace B2.6.49

Release date: 2026-09-30 (UTC)

## Features

- AI assistant: OpenRouter is now available as a fourth provider, next to Anthropic, OpenAI and Google Gemini. In the server settings, under AI → Overview, choose OpenRouter as the provider and save an "OpenRouter API Key". OpenRouter model IDs look like `vendor/model`; the default is `z-ai/glm-5.3-flash`. Only models that support tool calling can let the assistant act for you, so pick one of those: the Test button reports a model that OpenRouter lists as not supporting tool calling. (#152)

  - Two settings appear only when OpenRouter is selected. "Reasoning effort (OpenRouter)" sets how much a reasoning model may think per reply: Model default (nothing is sent and the model decides), Low, Medium or High. It defaults to Low, because thinking counts toward the max token budget and the 120-second reply timeout. "Deny data collection (OpenRouter)", off by default, routes requests only to providers that do not retain prompts or train on them; some models may become unavailable with it on.
  - Models marked `:free` on OpenRouter have per-minute and per-day request limits, so they are a poor fit for a bot that many people use.

- AI assistant: the Model setting is now a list of the models the selected provider offers, loaded with the API key saved for that provider. OpenRouter's list does not need a key. (#153)

  - The first option, "Provider default (…)", leaves the setting empty, and the server uses that provider's default model. When a list has more than 30 models, a "Filter models…" box appears above it. OpenRouter's list is grouped by vendor and only includes models that support tool calling. OpenAI's list is picked by model name and may miss a model, and neither the OpenAI nor the Google Gemini list guarantees tool-calling support, so the Test button remains the final check.
  - "Enter manually" switches to typing a model ID, and "Choose from list" switches back. A saved model that is not in the list is kept and shown as "Current setting: … (not in list)", for example after you switch provider.
  - Until the provider's API key is saved, the setting stays a text box with "Save this provider's API key to choose from its model list." If the list can't be loaded, the reason is shown and you can enter the model manually. The server refreshes each provider's list every 10 minutes.

## Bug Fixes

- AI assistant: leaving the Model setting empty now uses the selected provider's default model, the same one the Test button checks. It used to fall back to a Claude model whichever provider was selected. (#152)
- AI assistant: after you switch to a provider whose API key has not been saved yet, the assistant now stops, and starts again by itself once the key is saved. It used to keep running on the previous provider's connection with the new settings. (#152)
- AI assistant replies now say what went wrong in more cases: when the account's credits are used up, when OpenRouter's moderation blocks a message, and when no OpenRouter provider matches the server's routing settings. With OpenAI and OpenRouter, a reply that runs out of time now shows "AI service is temporarily unavailable" instead of a raw error, and a reasoning model that spends the whole reply budget thinking now produces an error message instead of no reply at all. (#152)
- Game HUD: opening the panel with its shortcut right after the HUD starts no longer flashes a Windows title bar and window frame.
- Game HUD: on screens larger than 1080p, and on setups whose monitors use different scaling, the HUD now has the right size the first time it appears. It used to keep the wrong size until the panel had been opened once.

## Notes

- The AI assistant changes are part of the server, so they take effect once the server is updated. The desktop app has no changes of its own in this release; only the game HUD program it bundles is new.
- The game HUD program bundled with the Windows desktop app was rebuilt for this release. Its fixes come from its own repository, so they have no pull-request number here. The native capture engine is the same build as in B2.6.48.
- The Privacy Policy and the EULA are unchanged in this release (still effective 2026-09-26 and 2026-07-08), so no new acceptance is required.
- No Docker image is published for this pre-release. Servers running the Docker image stay on their current version.
