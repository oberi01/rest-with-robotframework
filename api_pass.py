from flask import Flask
from flask_restful import reqparse, abort, Api, Resource

app = Flask(__name__)
api = Api(app)

ENTRIES = {
    'entry1': {'user': 'bob', 'description': 'login to my account at google.com', 'password': 'secret'},
    'entry2': {'user': 'eve', 'description': 'ssh to host server.local', 'password': 'geheim'},
    'entry3': {'user': 'alice', 'description': 'URL: https://mysite.local', 'password': 'top secret'},
}


def abort_if_entry_doesnt_exist(entry_id):
    if entry_id not in ENTRIES:
        abort(404, message="entry {} doesn't exist".format(entry_id))


parser = reqparse.RequestParser()
parser.add_argument('user')


# shows a single entry item and lets you delete it
class Entry(Resource):
    def get(self, entry_id):
        abort_if_entry_doesnt_exist(entry_id)
        return ENTRIES[entry_id]

    def delete(self, entry_id):
        abort_if_entry_doesnt_exist(entry_id)
        del ENTRIES[entry_id]
        return '', 204

    def put(self, entry_id):
        args = parser.parse_args()
        user = {'user': args['user']}
        ENTRIES[entry_id] = user
        return user, 201


# shows a list of all entries, and lets you POST to add new entries
class EntryList(Resource):
    def get(self):
        return ENTRIES

    def post(self):
        args = parser.parse_args()
        entry_id = int(max(ENTRIES.keys()).lstrip('entry')) + 1
        entry_id = 'entry%i' % entry_id
        ENTRIES[entry_id] = {'user': args['user'], 'description': 'empty', 'password': 'password4'}
        return ENTRIES[entry_id], 201


##
# Actually setup the Api resource routing here
##


api.add_resource(EntryList, '/entries')
api.add_resource(Entry, '/entries/<entry_id>')

if __name__ == '__main__':
    app.run(debug=True)
