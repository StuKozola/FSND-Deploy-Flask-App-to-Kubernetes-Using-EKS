# auth endpoint
export TOKEN=`curl -d '{"email":"stuart.kozola@gmail.com","password":"uniquepa$$w0rd"}' -H "Content-Type: application/json" -X POST localhost:8080/auth  | jq -r '.token'`
echo $TOKEN

# contents endpoint
curl --request GET 'http://127.0.0.1:8080/contents' -H "Authorization: Bearer ${TOKEN}" | jq .
