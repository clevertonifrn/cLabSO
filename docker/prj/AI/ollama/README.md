# Ollama Docker

Container Docker para executar Ollama localmente com armazenamento persistente de modelos.

## Quick Start
```bash
make build    # Constrói imagem
make runDS    # Inicia servidor
make sh       # Acessa shell
make stopDS   # Para servidor
```

## Uso
```bash
ollama pull llama3.2    # Baixa modelo
ollama run llama3.2     # Executa modelo
# API disponível em http://localhost:11434
```

## Links Úteis

- https://github.com/ollama/ollama
- https://ollama.com/library
- https://github.com/p-lemonish/ollama-x-opencode - Exemplo de configuração com opencode.ai
- https://github.com/anomalyco/opencode/issues/729
- https://www.youtube.com/watch?v=oSRdjwtKI3E