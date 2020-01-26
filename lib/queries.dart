const readMeetups = '''
query MyQuery {
  meetups {
    addr
    location
    mod
    time
    id
  }
}
''';
const postMeetups = '''
mutation MyMutation {
  __typename
  insert_meetups(objects: {addr: "janakpuri", location: "delhi", mod: 1, time: "2020-11-05T13:15:30Z"}) {
    returning {
      id
    }
  }
}
''';
const readBooks = '''
query MyQuery {
  __typename
  book_or_movie {
    description
    name
  }
}
''';

const readMods = '''
query MyQuery {
  __typename
  mods {
    email
    name
    ph
  }
}
''';
