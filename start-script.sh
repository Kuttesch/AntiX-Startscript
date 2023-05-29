#!/bin/bash

# Funktion zum Überprüfen der WLAN-Verbindung
check_wifi_connection() {
  nmcli device wifi | grep "WLAN-NAME" | grep "connected"
  if [ $? -eq 0 ]; then
    return 0
  else
    return 1
  fi
}

# Funktion zum Verbinden mit dem WLAN
connect_to_wifi() {
  echo "Verbinde mit WLAN..."
  nmcli device wifi connect "WLAN-NAME" password "WLAN-PASSWORT"
}

# Funktion zum Begrenzen der CPU auf 1 GHz
limit_cpu_frequency() {
  echo "Begrenze CPU-Frequenz auf 1 GHz..."
  for ((i=0; i<$(nproc); i++))
  do
    echo "1000000" > /sys/devices/system/cpu/cpu$i/cpufreq/scaling_max_freq
  done
}

# Funktion zum Starten von Firefox im Vollbildmodus mit der HTML-Datei
start_firefox_with_html() {
  echo "Starte Firefox im Vollbildmodus..."
  firefox -url "file:///home/deinbenutzername/Uhr/dein-html-dokument.html" -fullscreen -foreground
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

# Starte Firefox im Vollbildmodus mit HTML-Dokument
start_firefox_with_html
