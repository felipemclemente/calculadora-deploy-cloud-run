# Calculadora — Deploy Cloud Run

Scripts utilitários para **build e deploy da Calculadora Yaman no Google Cloud Run**.

Este repositório centraliza os scripts responsáveis por:

- Build das imagens Docker
- Push para o Artifact Registry
- Deploy para Cloud Run
- Verificação básica de saúde do serviço após deploy

---

## Autenticação na GCP

Antes de executar qualquer deploy, é necessário autenticar no Google Cloud:

```bash
gcloud auth login
```

## Deploy API

Execute o script informando a versão da imagem.

```bash
./deploy-api.sh [version]
```

## Deploy Front

Execute o script informando a versão da imagem.

```bash
./deploy-front.sh [version]
```
