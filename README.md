### Why?
EndeavourOS (and Arch) don't have good enough defaults. This is my attempt at getting my system buttery smooth. 

1. Since user experience is more important that performance fairness on all applications, this package
    a. Moves to linux-zen which detects and prioritizes "interactive" processes
    b. Renice window manager to give it higher priority 

2. Sets "my" mouse lag to as low as possible by increasing power level on USB ports to max and never letting them auto switch-off. Based on my calculations, this will result in 4.38 kWh extra power consumption per year (In PNW, this is an extra $0.65 USD per year, at $0.15/kWh)

### Installation

```
curl -sL https://naveen.github.io/naveen-arch/setup.sh | bash
```
