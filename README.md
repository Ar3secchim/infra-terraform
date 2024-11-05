# Projeto Terraform para Configuração de VPC

Este projeto Terraform configura uma VPC (Virtual Private Cloud) na AWS, incluindo subnets, internet gateway, nat gateway e route table.

## Estrutura do Projeto

```plaintext
├── .gitignore
├── .terraform/
│ ├── providers/
│ │ ├── registry.terraform.io/
│ │ │ ├── hashicorp/
│ │ │ │ ├── aws/
│ │ │ │ │ ├── 5.74.0/
│ │ │ │ │ │ ├── linux_amd64/
│ │ │ │ │ │ │ ├── LICENSE.txt
│ │ │ │ │ │ │ ├── terraform-provider-aws_v5.74.0_x5
├── .terraform.lock.hcl
├── main.tf ├── output.tf
├── terraform.out
├── terraform.tfstate
├── terraform.tfstate.backup
├── terraform.tfvars
├── variable.tf
└── vpc.tf
```

## Arquivos Principais

- **main.tf**: Arquivo principal que define os recursos e configurações do Terraform.
- **output.tf**: Define as saídas do Terraform.
- **terraform.tfvars**: Contém os valores das variáveis usadas no projeto.
- **variable.tf**: Declaração das variáveis usadas no projeto.
- **vpc.tf**: Configuração da VPC, subnets, internet gateway, nat gateway e route table.

## Variáveis

As variáveis são declaradas no arquivo `variable.tf`. Aqui está um exemplo de como declarar uma variável:

```terraform
  variable "VPC-CIDR" {
    description = "The CIDR block for the VPC"
    type        = string
    default     = "10.0.0.0/16"
  }
```

## Como Usar

1. Clone o repositório:

```bash
  git clone
```

2. Inicialize o Terraform:

```bash
  terraform init
```

3. Executar o comando abaixo para gerar um arquivo de configuração. Verifique a saída: Após a execução bem-sucedida, você verá as saídas definidas no arquivo `<NOME_DO_AQUIVO>`.

```bash
  terraform plan -out= <NOME_DO_AQUIVO>   
```

4. Aplique a configuração:

> lembrando que tem que ter as configuraçoes de user da aws configuradas no seu computador

```bash
  terraform apply
```

Você pode passar variáveis diretamente na linha de comando ou usar um arquivo `terraform.tfvars` para definir os valores das variáveis.

**Limpeza**
Para destruir os recursos criados pelo Terraform, execute:

```bash
  terraform destroy
```

**Licença**
Este projeto está licenciado sob a MIT License.
