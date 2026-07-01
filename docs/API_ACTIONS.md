# 📚 XUI.ONE Admin API Action Reference

This document lists commonly used XUI.ONE Admin API action names by category.

> ⚠️ Note: Action names and required parameters may vary between XUI.ONE versions. For `create_*` and `edit_*` actions, the most reliable method is to perform the same operation in the panel and inspect the request in your browser's Developer Tools > Network tab.

---

## 🔎 General information

```text
mysql_query
user_info
get_users
get_lines
get_mags
get_enigmas
get_streams
get_channels
get_stations
get_movies
get_series_list
get_episodes
```

---

## 👤 User API

```text
get_users
get_user
create_user
edit_user
delete_user
disable_user
enable_user
```

Example:

```bash
curl -k "$XUI_BASE_URL?api_key=$XUI_API_KEY&action=get_user&id=1"
```

---

## 📺 Line API

```text
get_lines
get_line
create_line
edit_line
delete_line
disable_line
enable_line
ban_line
unban_line
```

Example:

```bash
curl -k "$XUI_BASE_URL?api_key=$XUI_API_KEY&action=get_line&id=123"
```

---

## 📦 Package API

```text
get_packages
get_package
create_package
edit_package
delete_package
```

Some older examples may use the `packages` action. Test both variants on your own panel if needed.

---

## 🧱 Bouquet API

```text
get_bouquets
get_bouquet
create_bouquet
edit_bouquet
delete_bouquet
```

---

## 📱 MAG API

```text
get_mags
get_mag
create_mag
edit_mag
delete_mag
disable_mag
enable_mag
ban_mag
unban_mag
convert_mag
```

---

## 📟 Enigma API

```text
get_enigmas
get_enigma
create_enigma
edit_enigma
delete_enigma
disable_enigma
enable_enigma
ban_enigma
unban_enigma
convert_enigma
```

---

## 📡 Stream API

```text
get_streams
get_stream
create_stream
edit_stream
start_stream
stop_stream
delete_stream
```

---

## 📺 Channel API

```text
get_channels
get_channel
create_channel
edit_channel
start_channel
stop_channel
delete_channel
```

---

## 📻 Station API

```text
get_stations
get_station
create_station
edit_station
start_station
stop_station
delete_station
```

---

## 🎬 Movie API

```text
get_movies
get_movie
create_movie
edit_movie
start_movie
stop_movie
delete_movie
```

---

## 📚 Series API

```text
get_series_list
get_series
create_series
edit_series
delete_series
```

---

## 🎞️ Episode API

```text
get_episodes
get_episode
create_episode
edit_episode
delete_episode
start_episode
stop_episode
```

---

## 🗂️ Category API

```text
get_categories
get_category
create_category
edit_category
delete_category
```

---

## 🕒 EPG API

```text
get_epgs
get_epg
create_epg
edit_epg
delete_epg
reload_epg
```

---

## 🖥️ Server API

```text
get_servers
get_server
install_server
edit_server
delete_server
install_proxy
edit_proxy
```

Server stats example:

```bash
curl -k "$XUI_BASE_URL?api_key=$XUI_API_KEY&action=get_server_stats&server_id=1"
```

---

## 🧾 Logs and connection APIs

```text
activity_logs
live_connections
credit_logs
client_logs
user_logs
stream_errors
watch_output
system_logs
login_logs
restream_logs
mag_events
```

---

## 👥 Group API

```text
get_groups
get_group
create_group
edit_group
delete_group
```

---

## 🎛️ Transcoding profile API

```text
get_transcode_profiles
get_transcode_profile
create_transcode_profile
edit_transcode_profile
delete_transcode_profile
```

---

## 🌐 RTMP IP API

```text
get_rtmp_ips
get_rtmp_ip
create_rtmp_ip
edit_rtmp_ip
delete_rtmp_ip
```

---

## 👨‍💼 Sub-reseller API

```text
get_subresellers
get_subreseller
create_subreseller
edit_subreseller
delete_subreseller
```

---

## 📁 Watch folder API

```text
get_watch_folders
get_watch_folder
create_watch_folder
edit_watch_folder
delete_watch_folder
reload_watch_folder
```

---

## 🚫 Blocked ISP / user agent / IP APIs

```text
get_blocked_isps
add_blocked_isp
delete_blocked_isp

get_blocked_uas
add_blocked_ua
delete_blocked_ua

get_blocked_ips
add_blocked_ip
delete_blocked_ip
flush_blocked_ips
```

---

## 🔑 Access code API

```text
get_access_codes
get_access_code
create_access_code
edit_access_code
delete_access_code
```

---

## 🧬 HMAC API

```text
get_hmacs
get_hmac
create_hmac
edit_hmac
delete_hmac
```

---

## ⚙️ Settings, statistics, and maintenance APIs

```text
get_settings
edit_settings
get_server_stats
get_fpm_status
get_rtmp_stats
get_free_space
get_pids
get_certificate_info
reload_nginx
clear_temp
clear_streams
update_blacklist
get_directory
kill_pid
kill_connection
reload_cache
```

Server-specific actions often require `server_id`.

Example:

```bash
curl -k "$XUI_BASE_URL?api_key=$XUI_API_KEY&action=get_free_space&server_id=1"
```

---

## ⚠️ Notes about create and edit actions

For actions such as `create_line`, `edit_stream`, `create_movie`, or `edit_settings`, required fields may differ by version and panel configuration.

Recommended workflow:

1. Open the XUI.ONE panel in your browser.
2. Open Developer Tools > Network.
3. Perform the same action manually in the panel.
4. Inspect the submitted request payload.
5. Reuse the same parameter names in your API call.

Never publish real panel data or credentials when sharing examples.
