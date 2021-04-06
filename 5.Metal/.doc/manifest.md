# :scroll: [Manifeste](https://kubernetes.io/docs/reference/glossary/?all=true#term-manifest)

Spécification d'un objet API Kubernetes au format JSON ou YAML.

Un manifeste spécifie l'état souhaité d'un objet que Kubernetes conservera lorsque vous appliquez le manifeste. Chaque fichier de configuration peut contenir plusieurs manifestes.

:round_pushpin: Utilisation du manifeste avec un [here document](https://en.wikipedia.org/wiki/Here_document) -- avec séparateur `EOF` (End Of File)

```yaml
$ kubectl apply --filename - <<EOF

Le fichier yaml entre dans cet espace séparé par le séparateur EOF

---
EOF
```

