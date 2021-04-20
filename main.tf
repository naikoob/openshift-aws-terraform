// openshift installer user and policy
resource "aws_iam_user" "openshift-installer" {
  name = "openshift-installer"
}

resource "aws_iam_policy" "openshift-installer" {
  name   = "openshift-installer-policy"
  policy = data.aws_iam_policy_document.openshift-installer.json
}

resource "aws_iam_user_policy_attachment" "openshift-installer" {
  user       = aws_iam_user.openshift-installer.name
  policy_arn = aws_iam_policy.openshift-installer.arn
}

resource "aws_iam_access_key" "openshift-installer" {
  user = aws_iam_user.openshift-installer.name
}

resource "local_file" "openshift-installer-credentials" {
  filename = "generated-files/installer-credentials"
  content = templatefile("templates/credentials.tpl", {
    aws-access-key-id     = aws_iam_access_key.openshift-installer.id
    aws-secret-access-key = aws_iam_access_key.openshift-installer.secret
    profile-name          = "openshift-installer"
  })
}


// openshift cloud credentials operator user and policy
resource "aws_iam_user" "openshift-cloud-credentials-operator" {
  name = "openshift-cloud-credentials-operator"
}

resource "aws_iam_policy" "openshift-cloud-credentials-operator" {
  name   = "openshift-cloud-credentials-operator-policy"
  policy = data.aws_iam_policy_document.openshift-cloud-credentials-operator.json
}

resource "aws_iam_user_policy_attachment" "openshift-cloud-credentials-operator" {
  user       = aws_iam_user.openshift-cloud-credentials-operator.name
  policy_arn = aws_iam_policy.openshift-cloud-credentials-operator.arn
}

resource "aws_iam_access_key" "openshift-cloud-credentials-operator" {
  user = aws_iam_user.openshift-cloud-credentials-operator.name
}

resource "local_file" "openshift-cloud-credentials-operator-secret" {
  filename = "generated-files/secrets/cloud-credentials-operator-secret.yaml"
  content = templatefile("templates/secret.tpl", {
    secret-namespace      = "openshift-cloud-credential-operator"
    secret-name           = "cloud-credential-operator-iam-ro-creds"
    aws-access-key-id     = base64encode(aws_iam_access_key.openshift-cloud-credentials-operator.id)
    aws-secret-access-key = base64encode(aws_iam_access_key.openshift-cloud-credentials-operator.secret)
    aws-credentials = base64encode(templatefile("templates/credentials.tpl", {
      aws-access-key-id     = aws_iam_access_key.openshift-cloud-credentials-operator.id
      aws-secret-access-key = aws_iam_access_key.openshift-cloud-credentials-operator.secret
      profile-name          = "default"
    }))
  })
}


// openshift image registry operator user and policy
resource "aws_iam_user" "openshift-image-registry-operator" {
  name = "openshift-image-registry-operator"
}

resource "aws_iam_policy" "openshift-image-registry-operator" {
  name   = "openshift-image-registry-operator-policy"
  policy = data.aws_iam_policy_document.openshift-image-registry-operator.json
}

resource "aws_iam_user_policy_attachment" "openshift-image-registry-operator" {
  user       = aws_iam_user.openshift-image-registry-operator.name
  policy_arn = aws_iam_policy.openshift-image-registry-operator.arn
}

resource "aws_iam_access_key" "openshift-image-registry-operator" {
  user = aws_iam_user.openshift-image-registry-operator.name
}

resource "local_file" "openshift-image-registry-operator-secret" {
  filename = "generated-files/secrets/image-registry-operator-secret.yaml"
  content = templatefile("templates/secret.tpl", {
    secret-namespace      = "openshift-image-registry"
    secret-name           = "installer-cloud-credentials"
    aws-access-key-id     = base64encode(aws_iam_access_key.openshift-image-registry-operator.id)
    aws-secret-access-key = base64encode(aws_iam_access_key.openshift-image-registry-operator.secret)
    aws-credentials = base64encode(templatefile("templates/credentials.tpl", {
      aws-access-key-id     = aws_iam_access_key.openshift-image-registry-operator.id
      aws-secret-access-key = aws_iam_access_key.openshift-image-registry-operator.secret
      profile-name          = "default"
    }))
  })
}


// openshift ingress operator user and policy
resource "aws_iam_user" "openshift-ingress-operator" {
  name = "openshift-ingress-operator"
}

resource "aws_iam_policy" "openshift-ingress-operator" {
  name   = "openshift-ingress-operator-policy"
  policy = data.aws_iam_policy_document.openshift-ingress-operator.json
}

resource "aws_iam_user_policy_attachment" "openshift-ingress-operator" {
  user       = aws_iam_user.openshift-ingress-operator.name
  policy_arn = aws_iam_policy.openshift-ingress-operator.arn
}

resource "aws_iam_access_key" "openshift-ingress-operator" {
  user = aws_iam_user.openshift-ingress-operator.name
}

resource "local_file" "openshift-ingress-operator-secret" {
  filename = "generated-files/secrets/ingress-operator-secret.yaml"
  content = templatefile("templates/secret.tpl", {
    secret-namespace      = "openshift-ingress-operator"
    secret-name           = "cloud-credentials"
    aws-access-key-id     = base64encode(aws_iam_access_key.openshift-ingress-operator.id)
    aws-secret-access-key = base64encode(aws_iam_access_key.openshift-ingress-operator.secret)
    aws-credentials = base64encode(templatefile("templates/credentials.tpl", {
      aws-access-key-id     = aws_iam_access_key.openshift-ingress-operator.id
      aws-secret-access-key = aws_iam_access_key.openshift-ingress-operator.secret
      profile-name          = "default"
    }))
  })
}


// openshift machine api operator user and policy
resource "aws_iam_user" "openshift-machine-api-operator" {
  name = "openshift-machine-api-operator"
}

resource "aws_iam_policy" "openshift-machine-api-operator" {
  name   = "openshift-machine-api-operator-policy"
  policy = data.aws_iam_policy_document.openshift-machine-api-operator.json
}

resource "aws_iam_user_policy_attachment" "openshift-machine-api-operator" {
  user       = aws_iam_user.openshift-machine-api-operator.name
  policy_arn = aws_iam_policy.openshift-machine-api-operator.arn
}

resource "aws_iam_access_key" "openshift-machine-api-operator" {
  user = aws_iam_user.openshift-machine-api-operator.name
}

resource "local_file" "openshift-machine-api-operator-secret" {
  filename = "generated-files/secrets/machine-api-operator-secret.yaml"
  content = templatefile("templates/secret.tpl", {
    secret-namespace      = "openshift-machine-api"
    secret-name           = "aws-cloud-credentials"
    aws-access-key-id     = base64encode(aws_iam_access_key.openshift-machine-api-operator.id)
    aws-secret-access-key = base64encode(aws_iam_access_key.openshift-machine-api-operator.secret)
    aws-credentials = base64encode(templatefile("templates/credentials.tpl", {
      aws-access-key-id     = aws_iam_access_key.openshift-machine-api-operator.id
      aws-secret-access-key = aws_iam_access_key.openshift-machine-api-operator.secret
      profile-name          = "default"
    }))
  })
}

// openshift storage operator user and policy
resource "aws_iam_user" "openshift-storage-operator" {
  name = "openshift-storage-operator"
}

resource "aws_iam_policy" "openshift-storage-operator" {
  name   = "openshift-storage-operator-policy"
  policy = data.aws_iam_policy_document.openshift-storage-operator.json
}

resource "aws_iam_user_policy_attachment" "openshift-storage-operator" {
  user       = aws_iam_user.openshift-storage-operator.name
  policy_arn = aws_iam_policy.openshift-storage-operator.arn
}

resource "aws_iam_access_key" "openshift-storage-operator" {
  user = aws_iam_user.openshift-storage-operator.name
}

resource "local_file" "openshift-storage-operator-secret" {
  filename = "generated-files/secrets/storage-operator-secret.yaml"
  content = templatefile("templates/secret.tpl", {
    secret-namespace      = "openshift-cluster-csi-drivers"
    secret-name           = "ebs-cloud-credentials"
    aws-access-key-id     = base64encode(aws_iam_access_key.openshift-storage-operator.id)
    aws-secret-access-key = base64encode(aws_iam_access_key.openshift-storage-operator.secret)
    aws-credentials = base64encode(templatefile("templates/credentials.tpl", {
      aws-access-key-id     = aws_iam_access_key.openshift-storage-operator.id
      aws-secret-access-key = aws_iam_access_key.openshift-storage-operator.secret
      profile-name          = "default"
    }))
  })
}
