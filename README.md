# [Uniqush](https://uniqush.org/) Dockerized 

This is a dockerized Uniqush setup. This Debian-based image contains Uniqush, a redis server has to be run separately.

## Running using docker-compose

```
git git@github.com:andersonkxiass/docker-uniqush.git && cd docker-uniqush
docker-compose up -d
```

Checking if is running `http://localhost:9898/version`. You should see something like:

`uniqush-push 2.4.0`

Checking if redis is OK `http://localhost:9898/psps` You should see something like:

`{"services":{},"code":"UNIQUSH_SUCCESS"}`

## Using Uniqush

**For FCM**

`curl http://localhost:9898/addpsp -d service=myservice -d pushservicetype=fcm -d projectid="YOUR PROJECT ID" -d apikey="YOUR API KEY"`

```
{
  "type": "AddPushServiceProvider",
  "date": 1518876191,
  "status": 0,
  "details": {
    "service": "myservice",
    "from": "172.20.0.1:44104",
    "pushServiceProvider": "fcm:bc9d2a56f1d2ddd53166795799ba5d88f3f71d02",
    "code": "UNIQUSH_SUCCESS"
  }
}
```
