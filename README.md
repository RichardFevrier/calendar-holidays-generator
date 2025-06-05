# 📅 Calendar Holidays Generator

Generate long-term holiday calendars in `.ics` format — currently only for France.

## 🧭 Overview

**Calendar Holidays Generator** is a simple tool that creates a standards-compliant iCalendar (`.ics`) file containing major **French holidays over a 150-year window**.

Most public calendars only span a few years, which can limit long-term planning or archival use. This tool fills that gap by generating a comprehensive holiday calendar.

🔗 **Get the latest generated calendar:**
➡️ [Latest Release](https://github.com/RichardFevrier/calendar-holidays-generator/releases/latest)

Currently, only French holidays are supported — but adding other countries is easy, and contributions are very welcome!

---

## ⚙️ How to Build and Run

This project is written in the [Odin programming language](https://odin-lang.org/).  
Make sure Odin and its [dependencies](https://odin-lang.org/docs/install/) are installed first.

### 🛠️ Build

```
odin build src -out=calendar-holidays-generator
```

### 🚀 Run

```
./calendar-holidays-generator
```

This will generate a file named `{calendar-name}.ics` inside the `output/` directory.

## 🤝 Contributions

Pull requests and issues are welcome!
Want to add support for holidays in your country? Please do — it's easy to extend.

## 📝 License

This project is licensed under the MPL-2.0.
