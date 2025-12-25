import datetime

def handler(event, context):
    return {
        "message": "Hello from Terraform Lambda",
        "time": datetime.datetime.utcnow().isoformat()
    }
