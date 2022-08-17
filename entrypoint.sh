#!/bin/sh -l

argo version --short

# ENV
APPID=$1
TOKENARGO=$2
ENV=$3
APPSYNC="$APPID-$ENV"
ARGOURL='argocd-server.argocd.svc.cluster.local'

echo -e "\033[0;36m ======> APP $APPSYNC \033[0m\n"
argo app get "$APPSYNC" --server "$ARGOURL" --grpc-web --insecure-skip-tls-verify --auth-token "$TOKENARGO"

sleep 5

echo -e "\033[0;36m======> SYNC $APPSYNC \033[0m\n"
argo app sync "$APPSYNC" --server "$ARGOURL" --grpc-web --insecure --auth-token "$TOKENARGO"

echo -e "\033[0;36m======> DONE \033[0m\n"