# vyatta-dhcp-option-6rd-reporter

**NOTICE:** This package is not maintained, I published it in case it's helpful for someone. My USG has been sunset.

This package sends IPv6 OPTION_6RD DHCP events to the UniFi controller.

Can be used to listen to controller events and updating IPv6 RD (Rapid Deployment) configuration in `gateway.config.json` and re-provisioning the USG.

## Installation

This package requires [vyatta-dhcp-global-option](https://github.com/mafredri/vyatta-dhcp-global-option).

```console
# Install vyatta-dhcp-global-option
curl -sSL -o /tmp/dhcp-global-option-0.0.2-1.deb https://github.com/mafredri/vyatta-dhcp-global-option/releases/download/v0.0.2/dhcp-global-option-0.0.2-1.deb
sudo dpkg -i /tmp/dhcp-global-option-0.0.2-1.deb

# Install vyatta-dhcp-option-6rd-reporter
curl -sSL -o /tmp/dhcp-option-6rd-reporter-0.0.1-1.deb https://github.com/mafredri/vyatta-dhcp-option-6rd-reporter/releases/download/v0.0.1/dhcp-option-6rd-reporter-0.0.1-1.deb
sudo dpkg -i /tmp/dhcp-option-6rd-reporter-0.0.1-1.deb
```

### Automatic restore after firmware upgrade

```console
mkdir -p /config/data/firstboot/install-packages
mv /tmp/dhcp-global-option-0.0.2-1.deb /tmp/dhcp-option-6rd-reporter-0.0.1-1.deb /config/data/firstboot/install-packages
```

## Configure

[Configure OPTION_6RD](https://github.com/mafredri/vyatta-dhcp-global-option#enable-option-6rd-request) to start receiving events.

## Example

### Event received by the UniFi Controller

```json
{
  "event_string": "EVT_GW_DHCP6RD",
  "interface": "eth0",
  "local_ip": "80.78.100.100",
  "option_6rd": "10 30 8093 8095 60460 0 0 0 0 0 80.80.255.254",
  "reason": "REBOOT"
}
```
