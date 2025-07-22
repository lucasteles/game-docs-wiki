# Docs Template Mugen

[![](./docs/logo.png)](#)


Template for Game Design Document Wiki Site

> [!TIP]
> **🔓 Default Password:** `Password@Secret!123`

## Documentation:
- [Site](https://lucasteles.github.io/game-docs-wiki)
- [Wiki](./docs/index.md)


## How run local?

You will need [.NET](https://dotnet.microsoft.com/en-us/download) installed:

On windows PowerShell execute:

```powershell
$ ./docs/build.ps1
```

Alternatively

```sh
$ dotnet tool install -g docfx
$ cd ./docs
$ docfx --serve

```

## How to GitHub Actions?

Look at [this workflow file](./.github/workflows/docs.yml)

> [!NOTE]
> This template use [staticrypt](https://github.com/robinmoisson/staticrypt) for password "protection".

Set this action secrets on your repository:

- `SITE_PASSWORD`: The site password
- `SITE_SALT`: Salt for the password (must be a 32 character long hexadecimal string)
- `STATICRYPT_REMEMBER`: How many days the user "session" will last
