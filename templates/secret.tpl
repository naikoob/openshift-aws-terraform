apiVersion: v1
kind: Secret
type: Opaque
metadata:
  namespace: ${secret-namespace}
  name: ${secret-name}
data:
  aws_access_key_id: ${aws-access-key-id}
  aws_secret_access_key: ${aws-secret-access-key}
  credentials: ${aws-credentials}
