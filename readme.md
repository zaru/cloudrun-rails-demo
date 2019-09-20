## usage

```
$ gcloud config set project <project-name>
$ gcloud builds submit --tag gcr.io/<project-name>/rails-demo
$ gcloud beta run deploy --image gcr.io/<project-name>/rails-demo \
  --memory 1024Mi \
  --platform managed \
  --region asia-northeast1
```