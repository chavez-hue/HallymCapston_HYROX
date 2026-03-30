# Data Flow

## Auth

### Sign Up
입력:
- name
- id
- password

출력:
- userId
- name
- signUp success

### Login
입력:
- id
- password

출력:
- userId
- name
- login success


## Run

### Start Run
입력:
- userId
- startTime

출력:
- runId
- start success

### Save Run
입력:
- runId
- userId
- distance
- pace
- duration
- path
- createdAt

출력:
- save success

### Get Run History
입력:
- userId

출력:
- run list


## User

### Get User Profile
입력:
- userId

출력:
- name
- puzzles
- average pace
- total time