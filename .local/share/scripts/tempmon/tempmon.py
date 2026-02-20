#!/usr/bin/env python3
import psutil
import time
import subprocess
import socket

def shell_exec(command : str):
    print("shell execute : ", command)
    result = subprocess.run(command, shell = True, capture_output = True, text = True)
    if result.returncode != 0:
        print(f"failed to run \"{command}\"")
        print(f"stderr : {result.stderr}")
    return result


def get_temp():
    temps = psutil.sensors_temperatures()
    coretemp = temps.get("coretemp")
    if not coretemp:
        return None
    maxtemp = 0
    for temp in coretemp:
        if temp.label == "Package id 0":
            maxtemp = temp.current
            break
    return maxtemp

socket_path = "/run/routined.sock"
buffer_size = 1024
def send_request(request):
    sock = socket.socket(socket.AF_UNIX)
    sock.connect(socket_path)
    sock.send(request.encode())
    reply = sock.recv(buffer_size).decode("utf-8")
    return reply

# 1 -> Balanced 2 -> Performance
def query_mode():
    reply = send_request("Query")
    if reply.find("0xab") != -1:
        return 2
    return 1

if __name__ == "__main__":
    print("started ...")
    shell_exec("notify-send \"Monitoring Temperatures 🌡️\" -e -t 3000")
    while True:
        mode = query_mode()
        core_no = 0
        temp = get_temp()
        if temp > 90 and mode != 2:
            shell_exec("notify-send \"Enabling G-Mode 🥵\" -e -t 1500")
            send_request("Performance")
        elif temp < 65 and mode != 1:
            shell_exec("notify-send \"Disabling G-Mode 🥶\" -e -t 1500")
            send_request("Balanced")
        time.sleep(5)
