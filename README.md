# HDI_ORDA_Dynamic_Sort_v17

![platform](https://img.shields.io/badge/platform-4D%2021-blue) ![license](https://img.shields.io/github/license/miyako/HDI_ORDA_Dynamic_Sort_v17)

**How do I use ORDA structure information to write generic code?**

A 4D "How Do I" (HDI) example that reads the datastore structure through ORDA and builds a generic, table-agnostic sort dialog: pick any dataclass, choose attributes (including those of related entities), order them, and sort the entity selection -- without a single hard-coded table or field name.

## Overview

| | |
|---|---|
| **Topic** | ORDA, dynamic list boxes, generic code |
| **Original version** | 4D v17 |
| **Project format** | 4D project (`.4DProject`), compatibility 21.1 |
| **Minimum version** | 4D 21 (the splash screen reports the version the original example required, v17) |
| **Platforms** | macOS, Windows |
| **License** | [MIT](LICENSE) |

## Features

- Lists every dataclass of `ds` and opens a sort window for the selected one.
- Builds list box columns at runtime from dataclass attributes (`storage` and `relatedEntity`).
- Expands a related entity (e.g. `school`, `state`) to expose its attributes as sort paths such as `school.name`.
- Lets the user add, remove and reorder sort criteria, and toggle ascending/descending.
- Sorts with `entitySelection.orderBy(collection)`.
- Imports sample data from `Resources/*.4ie` into empty dataclasses on first launch.

## Points of interest

| Topic | Where |
|-------|-------|
| Reading structure with ORDA (`ds`, `dataClass[attribute].kind`, `relatedDataClass`) | `Forms/Table_Sort/method.4dm`, `Methods/expandRelatedDataClass.4dm` |
| Dynamic columns with `LISTBOX INSERT COLUMN FORMULA` and `This.attr` / `This.related.attr` formulas | `Forms/Table_Sort/method.4dm` |
| Building the `orderBy` collection (`propertyPath` / `descending`) | `Forms/Table_Sort/ObjectMethods/SortButton.4dm` |
| `collection.findIndex()` with a callback method | `Methods/findStorage.4dm` |
| List box meta expression (`metaSource`) | `Methods/decorateAttributeList.4dm` |
| Collection-based list boxes bound to `Form` | `Forms/Table_Sort/form.4DForm`, `Forms/HDI2/form.4DForm` |
| Startup splash: `CALL WORKER`, non-blocking `DIALOG(...; *)`, window reuse | `Methods/00_Start.4dm`, `Forms/HDI/ObjectMethods/BtnDemo.4dm` |

## Modern 4D practices used

- **Declarations**: `var` and `#DECLARE` only; no `C_*` directives.
- **Localisation**: all UI text uses XLIFF (`:xliff:` references in forms and menus, `Localized string` in code), in English and Japanese -- see `Resources/{en,ja}.lproj`.
- **Dark mode**: `automatic` / `automaticAlternate` colours and `prefers-color-scheme` rules in `Project/Sources/styleSheets.css`.
- **macOS Tahoe (Liquid Glass)**: button heights set per `form-theme` in `styleSheets_mac.css` (27px vs 23px for classic).
- **Menus**: standard actions (`quit`, `undo`, `cut`, ...) instead of one-line wrapper methods.
- **Method visibility**: subroutines are `invisible`; only the `00_Start` entry point is listed in the Run dialog.
- **List boxes**: `truncateMode: none` and `resizingMode: legacy`, including the columns created at runtime.

## Getting started

1. Open `Project/ORDA_Dynamic_Sort_v17.4DProject` with 4D 21 or later.
2. Run the `00_Start` method (it also runs automatically on startup).
3. Press **Demo**, select a table on the **Table selection** tab, then build a sort and press **Sort**.

## Project structure

```
Project/Sources/
  Methods/            00_Start (entry point), ORDA helpers, compiler methods
  Forms/HDI           splash / about screen
  Forms/HDI2          info tab + table selection
  Forms/Table_Sort    the generic sort dialog
  TableForms/         generated input/output forms per table
  styleSheets*.css    dark mode and platform/theme styling
Resources/
  {en,ja}.lproj/      XLIFF localisation
  *.4ie, *.4si        sample data and import settings
```

## References

- Blog post: [Write generic code with ORDA](https://blog.4d.com/write-generic-code-with-orda/)
- 4D documentation: [ORDA](https://developer.4d.com/docs/ORDA/overview), [EntitySelection.orderBy()](https://developer.4d.com/docs/API/EntitySelectionClass#orderby), [Form CSS](https://developer.4d.com/docs/FormEditor/stylesheets)

## Origin

Originally a binary `.4DB` example from the 4D blog, converted to a project with 4D 21 and modernised with the help of GitHub Copilot.

- Original download: https://download.4d.com/4DBlog/Tips/4D_v17/ORDA_Dynamic_Sort_v17.zip
