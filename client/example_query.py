from requests import put, get, delete

resp = get("http://localhost:5000/entries").json()
print(f'### get all elements:\n {resp}')

resp = put('http://localhost:5000/entries/entry4', data={'user': 'user4'}).json()
print(f'### add:\n {resp}')

resp = delete('http://localhost:5000/entries/entry4')
print(f'### delete element:\n {resp}')

resp = get("http://localhost:5000/entries").json()
print(f'get all elements:\n {resp}')
