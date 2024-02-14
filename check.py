import requests

def make_socks5_request():
    # Фиксированный URL-адрес для запроса
    url = "https://google.com"

    # Настройки SOCKS5 прокси без аутентификации
    socks5_proxy = "socks5://127.0.0.1:1070"

    # Выполнение GET-запроса через SOCKS5 прокси
    response = requests.get(url, proxies={'http': socks5_proxy, 'https': socks5_proxy})

    # Вывод результата запроса
    print(response.status_code)


if __name__ == "__main__":
    make_socks5_request()
