## 🧪 GitHub-Native openQA Demo

This repository demonstrates **openQA running entirely inside GitHub Actions**, using **QEMU emulation (TCG)** instead of KVM.

> ✅ No external cloud required  
> ✅ Fully reproducible in CI  
> ✅ Ideal for portfolio and learning

### Limitations

- No hardware virtualization → slower tests
- Only lightweight ISOs work (e.g., Alpine, tiny CoreOS)
- Not suitable for full Linux distro installs (too slow)

### For Production Use

See the `terraform/` directory (coming soon) for **cloud-based openQA** with KVM on Hetzner/Yandex.
