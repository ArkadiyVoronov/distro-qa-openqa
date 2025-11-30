## 🔧 Architecture

```mermaid
graph LR
  A[GitHub Actions] -->|Trigger| B(Terraform)
  B --> C[Cloud VM: openQA Web UI]
  B --> D[Cloud VM: Worker 1 KVM]
  B --> E[Cloud VM: Worker 2 KVM]
  C -->|Schedules test| D
  C -->|Schedules test| E
  F[Custom ISO] -->|HTTPS| C
  D -->|Records video| G[(openQA Storage)]
  E -->|Records video| G
  G -->|Generates| H[HTML Report]
  H --> I[GitHub Pages / S3]
```

### Компоненты:

- **openQA Web UI**: координатор тестов, веб-интерфейс, API
- **Worker Nodes**: KVM-машины с включённой виртуализацией
- **Storage**: общий том для ISO, needles, видео, отчётов
- **GitHub Actions**: триггер развёртывания и загрузки ISO
