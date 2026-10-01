# HakoSpace B2.6.50

Release date: 2026-10-01 (UTC)

## Features

- AI assistant: a new Usage Log shows who used the assistant, when, with which provider and model, how many tokens it took, and whether it answered. It is in the server settings under AI → Usage Log, which replaces the MCP Logs tab and needs the same Manage AI permission. (#156)

  - Choose a time range (Today, 7, 30 or 90 days, All, or a custom range) and filter by member, provider and model. Days follow UTC, the same day boundary as the daily token limit.
  - Cards show the number of uses, tokens in and out, members, and failed or blocked uses. A "Cost (OpenRouter)" card appears when OpenRouter was used. Only OpenRouter reports what each call cost, so for other providers only tokens are shown.
  - A chart shows usage per day, coloured by model, as uses or as tokens. Ranges longer than 62 days are shown per week, and ranges longer than a year per month. Next to it are the top members and the models used.
  - "Each use" lists every use and can be filtered by status: Answered, Failed, Blocked or In progress. Open a use to see its model calls and tool calls in order; tool calls are shown with their arguments and results. What members send to the AI is not recorded.
  - "Export CSV" exports up to 10,000 uses, and the page tells you when the export was cut short.
  - Each-use records are kept for 30, 90 (the default), 180 or 365 days and then deleted automatically. The totals, chart and rankings keep counting them.
  - The log starts recording once the server is updated. Tool calls recorded before that are listed in a collapsed section at the bottom, and are deleted with the same retention period.

## Bug Fixes

- AI assistant: the daily token limit is now checked before each call to the provider. It used to be checked only after a call, so once the limit was reached every new message still cost a call whose reply was then thrown away. The call that crosses the limit has already been paid for, so a normal reply from it is still sent; if it asks to run a tool, the assistant stops before running it. The limit now also counts the tokens of failed calls that the provider still charges for, and Gemini's reasoning tokens. (#156, #159)
- AI assistant: the Google Gemini API key is now sent in a request header instead of the web address, so it can no longer appear in error messages. If your server has used Gemini, we recommend replacing its API key. When a request fails without an explanation from the provider, members now get "The AI request failed. Please try again later. If it keeps failing, contact the server admin." instead of the raw error. (#157)
- AI assistant: when the provider's moderation blocks a member's message or the assistant's reply, the member now gets "The AI provider's moderation blocked this message. Try rephrasing it." or "The AI provider's moderation blocked the reply. Try rephrasing your message.", as a reply to the blocked message. The blocked message and the warning are left out of what the assistant reads next time, so a rephrased message is not blocked again because of the earlier one. Before, a blocked reply usually produced no answer at all, and a message blocked by Gemini got a generic error. This covers Gemini, OpenAI, OpenRouter (including Anthropic models used through it) and Anthropic. (#158, #159, #160)
- AI assistant: Gemini and Anthropic requests that run out of time now show "AI service is temporarily unavailable", as OpenAI and OpenRouter already did. A Gemini reply that stops before producing any content, for example because it ran out of tokens, now produces an error message instead of no answer. (#158, #159)
- AI assistant: the member's latest message is now sent to the provider once. It used to appear twice in every request. (#159)
- AI assistant: the assistant now answers only messages that were actually saved. A message that failed to send, for example because an attachment was rejected, no longer gets an answer; a message that reaches the server twice is answered only once; and a message deleted before the assistant gets to it is not answered and does not count as a use. (#160)
- AI assistant: once a tool has run successfully, a reply such as "I've created the channel" is no longer mistaken for a claim the assistant made up, so it is no longer pushed into doing the same thing a second time. (#160)
- Direct messages: the newest message no longer sits against the text box or partly under it. There is now space below the last message, and the "is typing" line no longer cuts it off. (#154)
- Channels and direct messages: when you are at the bottom of the conversation, the newest message now stays fully visible when the area around the text box grows, for example when you start a reply, attach a file, or type several lines. (#155)

## Notes

- Everything in this release is part of the server and the web client it provides, so it takes effect once the server is updated. The desktop app has no changes of its own; the game HUD program and the native capture engine it bundles are the same builds as in B2.6.49.
- The Privacy Policy and the EULA are unchanged in this release (still effective 2026-09-26 and 2026-07-08), so no new acceptance is required.
- No Docker image is published for this pre-release. Servers running the Docker image stay on their current version.
