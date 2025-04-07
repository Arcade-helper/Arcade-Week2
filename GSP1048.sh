read -p "${YELLOW_TEXT}${BOLD_TEXT}Enter the region:: ${RESET_FORMAT}" REGION
export REGION=$REGION

gcloud spanner instances create banking-instance \
--config=regional-$REGION  \
--description="arcadecrew" \
--nodes=1

gcloud spanner databases create banking-db --instance=banking-instance

gcloud spanner instances create banking-instance-2 \
--config=regional-$REGION  \
--description="arcadecrew" \
--nodes=2

gcloud spanner databases create banking-db-2 --instance=banking-instance-2

gcloud spanner databases ddl update banking-db --instance=banking-instance --ddl="CREATE TABLE Customer (
  CustomerId STRING(36) NOT NULL,
  Name STRING(MAX) NOT NULL,
  Location STRING(MAX) NOT NULL,
) PRIMARY KEY (CustomerId);"

