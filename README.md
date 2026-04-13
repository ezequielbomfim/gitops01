# Projeto prático de GitOps usando **Go**, **Docker**, **GitHub Actions**, **Kubernetes**, **Kustomize** e **ArgoCD**.

````markdown
# GitOps 01

Projeto prático de GitOps usando **Go**, **Docker**, **GitHub Actions**, **Kubernetes**, **Kustomize** e **ArgoCD**.

## Visão geral

Este repositório demonstra um fluxo simples de GitOps em que:

1. a aplicação é construída em Go
2. a imagem Docker é gerada e publicada pelo GitHub Actions
3. o `kustomization.yaml` é atualizado com a nova tag da imagem
4. o ArgoCD detecta a mudança no Git
5. o cluster Kubernetes é sincronizado com o estado desejado

A ideia central é usar o **Git como fonte da verdade** para o ambiente.

## Tecnologias utilizadas

- Go
- Docker
- GitHub Actions
- Kubernetes
- Kind
- Kustomize
- ArgoCD

## Estrutura do projeto
├── .github/workflows/
│   └── cd.yaml
├── k8s/
│   ├── deployment.yaml
│   ├── service.yaml
│   └── kustomization.yaml
├── Dockerfile
├── go.mod
└── main.go
````

## Como o fluxo funciona

### 1. Aplicação

A aplicação é um web server simples em Go.

### 2. Build da imagem

O GitHub Actions faz o build da imagem Docker e publica no Docker Hub.

### 3. Atualização do manifesto

Após publicar a imagem, o workflow atualiza o `kustomization.yaml` com a nova tag baseada no SHA do commit.

### 4. Commit da alteração

O próprio pipeline faz commit e push dessa alteração no repositório.

### 5. Sincronização com ArgoCD

O ArgoCD observa o repositório Git e identifica quando o estado desejado mudou. Depois disso, a aplicação pode ser sincronizada no cluster.

## Exemplo do fluxo GitOps

```text
Alteração no código
↓
Push no GitHub
↓
GitHub Actions builda e publica a imagem
↓
GitHub Actions atualiza o kustomization.yaml
↓
Commit/push da nova tag no Git
↓
ArgoCD detecta mudança
↓
Kubernetes sincroniza com o novo estado
```

## Pipeline

O pipeline executa, de forma resumida:

* checkout do código
* build e push da imagem Docker
* setup do Kustomize
* update dos recursos Kubernetes
* commit da nova versão
* push para a branch principal

## Kubernetes e Kustomize

Os manifests Kubernetes ficam na pasta `k8s`.

O arquivo `kustomization.yaml` é responsável por atualizar declarativamente a imagem usada no deployment, permitindo que o repositório registre exatamente qual versão deve estar no ar.

## ArgoCD

O ArgoCD é usado como agente GitOps para:

* detectar diferença entre Git e cluster
* mostrar status da aplicação
* sincronizar mudanças
* visualizar histórico
* executar rollback
* inspecionar logs, eventos e diff

## Objetivo do projeto

Este projeto foi criado para consolidar na prática conceitos de:

* GitOps
* CI/CD
* deploy declarativo
* reconciliação de ambiente
* integração entre pipeline, Git e Kubernetes

## Melhorias futuras

* separar código e manifests em repositórios diferentes
* adicionar README com arquitetura visual
* criar ambiente de homologação e produção
* testar sync automático no ArgoCD
* expandir a aplicação para um cenário mais próximo do mundo real

## Autor

**Ezequiel Bomfim**

* LinkedIn: [https://www.linkedin.com/in/ezequiel-bomfim](https://www.linkedin.com/in/ezequiel-bomfim)
* GitHub: [https://github.com/ezequielbomfim](https://github.com/ezequielbomfim)

```markdown
## Aprendizados

Durante este projeto, foram praticados conceitos como:

- uso do Git como fonte da verdade
- build e versionamento de imagem com SHA do commit
- atualização declarativa de manifests com Kustomize
- sincronização de ambiente com ArgoCD
- visibilidade operacional com diff, histórico e rollback
```
[1]: https://github.com/ezequielbomfim/gitops01 "GitHub - ezequielbomfim/gitops01: GitOps - Docker - GitHubActions - Kubernetes - ArgoCD · GitHub"
