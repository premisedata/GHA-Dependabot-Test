from googleapiclient import discovery

project = "963616447866"

service = discovery.build('serviceusage', 'v1')
request = service.services().list(
    parent=f"projects/{project}",
    filter="state:DISABLED"
)
response = request.execute()
print(response)
