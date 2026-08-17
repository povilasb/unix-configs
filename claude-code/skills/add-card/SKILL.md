---
name: add-card
description: Add a flashcard to the local flashcard app running at http://127.0.0.1:7001.
---

Add a flashcard by POSTing to the local flashcard app API using the Bash tool:

```
curl -s -o /dev/null -w "%{http_code}" -X POST http://127.0.0.1:7001/api/cards \
  -H "Content-Type: application/json" \
  -d '<json>'
```

JSON body schema:
```json
{
  "question": "string (required)",
  "answer": "string (required)",
  "examples": "string or null",
  "source": "string or null",
  "tags": ["array", "of", "strings"],
  "answer_img_fname": null,
  "question_img_fname": null
}
```

Use $ARGUMENTS as the starting point to infer question, answer, tags, etc. Only ask the user for clarification if question or answer cannot be determined from context.

Default to a single tag that best categorises the card. Only use multiple tags if the user explicitly provides them.

A 201 response means success — confirm the card was added. Any other status is an error — show it and ask if the user wants to retry.
