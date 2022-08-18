#!/bin/sh -l

# ENV
APPID=$1
TOKENARGO=$2
ENV=$3
APPSYNC="$APPID-$ENV"
ARGOURL='argocd-server.argocd.svc.cluster.local'

echo -e "\033[0;36m ======> APP $APPSYNC \033[0m\n"
argocd app get "$APPSYNC" --server "$ARGOURL" --grpc-web --insecure --auth-token "$TOKENARGO"

sleep 5

echo -e "\033[0;36m======> SYNC $APPSYNC \033[0m\n"
argocd app sync "$APPSYNC" --server "$ARGOURL" --grpc-web --insecure --auth-token "$TOKENARGO"

echo -e "\033[0;36m======> WAIT SYNC $APPSYNC \033[0m\n"
argocd app wait "$APPSYNC" --server "$ARGOURL" --grpc-web --insecure --auth-token "$TOKENARGO"

echo -e "\033[0;36m======> DONE \033[0m\n"