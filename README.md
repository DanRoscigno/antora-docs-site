Docker container and Makefile are from https://blog.swwomm.com/2020/10/antora-quick-start-tutorial.html

GitHub workflow is from Antora docs (I added the `npx gulp bundle`, which seems to be needed)

```
mkdir -p content/documentation/modules/ROOT/pages/
vi content/documentation/modules/ROOT/pages/index.adoc
vi Makefile
vi antora-playbook.yml
vi content/documentation/antora.yml
npx gulp bundle
make antora.build
make antora.run
```
