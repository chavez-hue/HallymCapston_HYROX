import '../models/run_session.dart';
import '../models/user_model.dart';

const dummyUser = UserModel(
  name: 'HYROX',
  puzzles: 12,
  pace: '5’40”',
  totalTime: '12h 20m',
);

const dummyRuns = [
  RunSession(
    title: 'Morning Run',
    distance: '3.2 km',
    pace: '5’38”',
    time: '18:10',
  ),
  RunSession(
    title: 'River Side Run',
    distance: '5.0 km',
    pace: '5’45”',
    time: '28:40',
  ),
  RunSession(
    title: 'Night Puzzle Run',
    distance: '4.1 km',
    pace: '5’20”',
    time: '21:52',
  ),
];