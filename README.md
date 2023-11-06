# Helix.nvim

/!\ This plugin in under development, use at your own risks !

## Installation

## Support

### Configuration

#### Editor section

> Refer to [documentation](https://docs.helix-editor.com/configuration.html#editor-section)

| Configuration key           | Working | Comment                                                                     |
| --------------------------- | ------- | --------------------------------------------------------------------------- |
| `scrolloff`                 | Yes     |                                                                             |
| `mouse`                     | Yes     | Need testing                                                                |
| `middle-click-paste`        | No      | Works with mouse configuration                                              |
| `scroll-lines`              | No      |                                                                             |
| `shell`                     | No      |                                                                             |
| `line-number`               | Yes     | Gitsign at the wrong position                                               |
| `cursorline`                | Yes     |                                                                             |
| `cursorcolumn`              | Yes     |                                                                             |
| `gutters`                   | No      |                                                                             |
| `auto-completion`           | No      |                                                                             |
| `auto-format`               | No      |                                                                             |
| `auto-save`                 | No      |                                                                             |
| `idle-timeout`              | Yes     |                                                                             |
| `preview-completion-insert` | No      |                                                                             |
| `completion-trigger-len`    | No      |                                                                             |
| `completion-replace`        | No      |                                                                             |
| `auto-info`                 | No      |                                                                             |
| `true-color`                | Yes     |                                                                             |
| `undercurl`                 | No      |                                                                             |
| `rulers`                    | Yes     |                                                                             |
| `bufferline`                | No      |                                                                             |
| `color-modes`               | No      |                                                                             |
| `text-width`                | No      |                                                                             |
| `workspace-lsp-roots`       | No      |                                                                             |
| `default-line-ending`       | No      |                                                                             |
| `insert-final-newline`      | No      | Always true                                                                 |

#### Soft-wrap section

> Refer to [documentation](https://docs.helix-editor.com/configuration.html#editorsoft-wrap-section)

| Configuration key           | Working | Comment                                                                     |
| --------------------------- | ------- | --------------------------------------------------------------------------- |
| `enable`                    | Yes     |                                                                             |
| `max-wrap`                  | No      |                                                                             |
| `max-indent-retain`         | No      |                                                                             |
| `wrap-indicator`            | No      |                                                                             |
| `wrap-at-text-width`        | No      |                                                                             |

#### Cursor-shape section

> Refer to [documentation](https://docs.helix-editor.com/configuration.html#editorcursor-shape-section)

| Configuration key           | Working | Comment                                                                     |
| --------------------------- | ------- | --------------------------------------------------------------------------- |
| `normal`                    | Yes     |                                                                             |
| `insert`                    | Yes     |                                                                             |
| `select`                    | Yes     |                                                                             |

### Commands

Functions are available in lua through `helix.cmd`

### Keymap

