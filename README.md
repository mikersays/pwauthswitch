## Description:

This script toggles the `PasswordAuthentication` setting in the `sshd_config` file. Specifically, it will either activate or deactivate password authentication for SSH based on the current setting in the configuration file.

---

## Usage:

```bash
./ssh_switch.sh
```

---

## Requirements:

- The script must be executed on a system where `sshd` (OpenSSH server) is installed.
- The user must have root privileges to execute this script, as it modifies the `sshd_config` file and reloads the SSH daemon.
- The user must set the sshd_config's PasswordAuthentication line to `PasswordAuthentication no`.

---

## How It Works:

1. **Root Check**: The script first checks if it's run by the root user. If not, it'll display an error message and exit.

2. **Password Authentication Deactivation**: If the `PasswordAuthentication no` line is commented out in the `sshd_config` file, this script will uncomment it, thereby deactivating password authentication.

3. **Password Authentication Activation**: If the `PasswordAuthentication no` line is present and uncommented, the script will comment it out, thereby activating password authentication.

4. **Reload SSHD**: After making changes, it reloads the SSH daemon to apply the new settings.

5. If neither of the conditions in points 2 and 3 is met, the script will prompt the user to check the configuration manually.

---

## Notes:

- Ensure you have another way of accessing your system if password authentication is turned off, such as using SSH keys.
- Before making any changes to system configurations, it's always a good practice to backup your config files.
- Always ensure that you understand the implications of enabling or disabling password authentication for SSH. Disabling password authentication can increase security by ensuring only those with SSH keys can login. However, if you rely solely on passwords and accidentally disable this feature without having set up SSH keys, you could lock yourself out of the system.

---

## Disclaimer:

This script comes as-is, without any guarantees. Always review and test scripts in a safe environment before deploying them in production.
