from locust import HttpUser, task, between

class MyUser(HttpUser):
    wait_time = between(1, 1)

    @task
    def index(self):
        self.client.get("/?sleep=1")
