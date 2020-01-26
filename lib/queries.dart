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
