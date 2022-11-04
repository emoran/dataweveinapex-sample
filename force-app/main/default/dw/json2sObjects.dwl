%dw 2.0
input incomingJson application/json
output application/json

---
incomingJson map {
    Company: $.title.rendered,
    FirstName: $.author
}