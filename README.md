# The Recipe Drop — iOS app

A native iOS shell (Capacitor 8) around [therecipedrop.ae](https://therecipedrop.ae) that adds native
Bluetooth, so **Brew Mode** can connect to an xBloom coffee machine on iPhone (Safari can't).

- The app loads the live site, so site updates show up in the app without a new build.
- Bluetooth: `@capacitor-community/bluetooth-le`. The site's `src/lib/xbloomBle.js` detects the app and uses it.
- Builds and uploads to TestFlight with Codemagic (`codemagic.yaml`).

Bundle ID: `ae.therecipedrop.app`
