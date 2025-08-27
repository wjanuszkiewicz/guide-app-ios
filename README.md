# GuideApp iOS

Стартовый шаблон городского гида на SwiftUI.

## Функциональность
- Таббар: Главная, Карта (MapLibre + MapTiler), Экскурсии, Профиль
- Онбординг с авторизацией: Email/Пароль, Телефон, Apple, Гость
- Локализация: ru / en

## Требования
- Xcode 15+
- iOS 15+
- SwiftUI
- Firebase (Auth)
- MapLibre, MapTiler API key

## Настройка
1. Скачайте зависимости через Swift Package Manager (MapLibre, Firebase)
2. Добавьте GoogleService-Info.plist в проект
3. В `Views/Map/MapView.swift` установите свой ключ MapTiler: `key=...`
4. В `Info.plist` укажите тексты разрешений на геолокацию

## Сборка
Откройте проект в Xcode, выберите устройство/симулятор и запустите.

## Структура
- `Views/` — экраны приложения
- `ViewModels/` — модели представления
- `Services/` — сервисы (Auth, Firebase, Аудио, Локация)
- `Models/` — модели данных
- `Resources/` — локализации и ассеты

