# Cloudmoji

```
🌐DemoStack
    🪪demo-stack-name

🙈🪣DemoBucket
🙈    🪪demo-bucket-name

🗄️DemoTable
    🪪demo-table-name
    🔑messageId string
    ❗message string
    ❓sender string
    📅date string

🎄DemoAPI
    🍭GET /
        ☕ return { version: "1.0" }
    🍭GET /messages
        ⬇️🗄️DemoTable
    🍭POST /messages
        ↩️🗄️DemoTable
    🍭GET /messages/{messageId}
        ⬅️🗄️DemoTable
    🍭PUT /messages/{messageId}
        ➡️🗄️DemoTable
    🍭DELETE /messages/{messageId}
        ❌🗄️DemoTable

```
