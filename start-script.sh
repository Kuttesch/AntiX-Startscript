#!/bin/bash

# Überprüfen der WLAN-Verbindung
check_wifi_connection() {
  nmcli device wifi | grep "WLAN-NAME" | grep "connected"
  if [ $? -eq 0 ]; then
    return 0
  else
    return 1
  fi
}

# Verbinden mit dem WLAN
connect_to_wifi() {
  echo "Verbinde mit WLAN..."
  nmcli device wifi connect "WLAN-NAME" password "WLAN-PASSWORT"
}

# Begrenzen der CPU-Frequenz auf 1 GHz
limit_cpu_frequency() {
  echo "Begrenze CPU-Frequenz auf 1 GHz..."
  cpupower frequency-set -d 1GHz
}

# Ausblenden des Mauszeigers
hide_mouse_cursor() {
  echo "Blende den Mauszeiger aus..."
  xsetroot -cursor_name none
}

# Überprüfen, ob bereits eine WLAN-Verbindung besteht
check_wifi_connection

if [ $? -eq 0 ]; then
  echo "Bereits mit dem WLAN verbunden."
else
  echo "Keine WLAN-Verbindung vorhanden. Versuche WLAN-Verbindung herzustellen..."
  connect_to_wifi
fi

# Begrenze CPU auf 1 GHz
limit_cpu_frequency

# Ausblenden des Mauszeigers
hide_mouse_cursor

# Starte Firefox im Vollbildmodus mit HTML-Dokument
echo "Starte Firefox im Vollbildmodus..."
firefox --new-window "file:///home/deinbenutzername/Uhr/dein-html-dokument.html" -kiosk

