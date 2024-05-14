## Terms 
Terms used to define the components of a storymap. May not always align with Hugo and stroymap.js terminology.

- Storymap: A collection of one or more Sections.
- Section: A series of one or more Panels. Scrolling to the bottom of a section displays a link to the next section.
- Panel: Content displayed in the foreground. Scrolling to the bottom of a panel displays the next panel, and updates the leaflet layer as needed.
- Map: Leaflet map displayed in the background. The current panels can change the layers displayed and move the focus and zoom level.

## Directory Structure
- `content/story/`: Current home of storymap content within this Hugo instance.
    - `demo/`: Examples and templates of displaying content within a storymap.
    - `scaling/`: Directory for the HQP Scaling group to populate with content.
    - `dev/`: Used for developing and testing new features without breaking the content above.

## Authoring Content
Content is authored as a collection of panels within a section. Individual panels are written in markdown. They can include images, trigger map events on the map layer, and interactive widgets for displaying data (under development, but verified).

### Basic
Format content using markdown syntax. Reference images using markdown and store them in an /images folder alongside your .md files. Use markdown comments to indicate desired formatting (eg. `<!--- This image should float left of the text above --->`).

### Frontmatter fields
At the top of each panel markdown file, the following arguments can be used to control how a panel is rendered.
- `name`: Quoted string. Short name for internal use.
- `weight`: Numeric. Order to display storymap panels, from low to high. 
- `title`: Quoted string. Storymap section title, used in menus (and potentially in section headers).
- `layout`: Quoted string. Archetype/template used to render content.
- `splash`: true|false. Center text content for title panes. Likely to be deprecated in favor of layout.
- `layers`: Quoted, comma delineated string. Basemaps and layers to render in leaflet map.
- `lat`: Numeric. Latitude of leaflet map center.
- `lon`: Numeric. Longitude of leaflet map center.
- `zoom`: Numeric. Zoom level of leaflet map center. https://leafletjs.com/examples/zoom-levels/
- `background_media`: Quoted string. Image to display over leaflet map but behind pane content. File should be in `section_name/images/image.jpg` and can be referenced in a panel markdown with this path `image.jpg`
- `visible`: true|false. Whether to render/display the panel. Useful for drafting.

### Images
Images can be directly inserted using markdown syntax. However, markdown*hugo does not allow formatting images directly, so we implemented a shortcode work around.

### Data Layers
Large geospatial and/or tabular datasets should be uploaded to the data portal. For individual cases, work with the data manager.

## Development
### Install vscode (recommended)
Feature packed source code editor. Simplifies file editting, previewing, and git management.

### Install Hugo (recommended)
Useful for live previewing content.

### Pull this repository
Pull this repository, navigate to the directory in vscode, run `hugo server` in the terminal, and create/edit content. Limit changes to the `content` directories to keep future merges manageable.

## Roadmap

### Documentation
- Image formatting.

### Features
- Menus/scrollspy