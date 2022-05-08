import sys
from string import Template

payload = """["{\\"msg\\":\\"method\\",\\"method\\":\\"getChallenges\\",\\"params\\":[\\"$language\\",{\\"$$gte\\":0,\\"$$lt\\":6},[\\"algebra\\",\\"algorithms\\",\\"arrays\\",\\"bit_operations\\",\\"bugs\\",\\"closures\\",\\"conditions\\",\\"control_flow\\",\\"cryptography\\",\\"data_structures\\",\\"dates\\",\\"formatting\\",\\"functional_programming\\",\\"games\\",\\"geometry\\",\\"higher_order_functions\\",\\"interview\\",\\"language_fundamentals\\",\\"logic\\",\\"loops\\",\\"math\\",\\"numbers\\",\\"objects\\",\\"physics\\",\\"recursion\\",\\"regex\\",\\"scope\\",\\"sorting\\",\\"strings\\",\\"validation\\"],$amount,[]],\\"id\\":\\"$request_id\\"}"]
"""

payload_template = Template(payload)

amount = int(sys.argv[1]) if len(sys.argv) >= 1 else 10
request_id = int(sys.argv[2]) if len(sys.argv) >= 2 else 3
payload_amount = int(sys.argv[3]) if len(sys.argv) >= 3 else 4
language = sys.argv[4] if len(sys.argv) >= 4 else "javascript"

print("Using initial challenges amount:", amount)
print("Using initial request_id:", request_id)
print("Generating this amount of payloads:", payload_amount)
print("Generating for language:", language)

file = open("edabit_ws_payload.txt", "w")

for i in range(payload_amount + 1):
    amount += 10
    request_id += 1
    new_line = payload_template.substitute(language=language, amount=amount, request_id=request_id)
    file.write(new_line)

file.close()
