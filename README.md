# Kustomize ArgoCD manifests

GitHub action used kustomize applications manifests

## Inputs

- **appid:** The App ID;
- **tokenargo:** The ArgoCD token to authenticate;
- **env:** The app env (develop|homolog|prod);

**OBS.:** All inputs are **required**

## Outputs

There are no outputs for this action

## Example usage

```yaml
      - name: ArgoCD Sync
        uses: platformbuilders/github-actions-argocd-sync@master
        with:
          appid: ${{ secrets.APP_ID }}
          env: 'develop'
          tokenargo: ${{ secrets.TOKENARGO }}
          argourl: <ArgoCD URL:443>
```

## How to send updates?
If you wants to update or make changes in module code you should use the **develop** branch of this repository, you can test your module changes passing the `@develop` in module calling. Ex.:

```yaml
      # Example using this actions
      - name: ArgoCD Sync
        uses: platformbuilders/github-actions-argocd-sync@develop
        with:
          appid: ${{ secrets.APP_ID }}
          env: 'develop'
          tokenargo: ${{ secrets.TOKENARGO }}
          argourl: <ArgoCD URL:443>
```
After execute all tests you can open a pull request to the master branch.