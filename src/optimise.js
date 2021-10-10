module.exports = f => {
    f.id = f.properties.OBJECTID
    const props = {}
    for (const key in f.properties) {
        // delete all names properties except 'wb_name' in order to reduce tile size
        if (key.indexOf('NAME') > -1){
            if (key !== 'WB_NAME') continue
        }
        props[key.toLowerCase()] = f.properties[key]
    }
    f.properties = props
    f.tippecanoe = {
        minzoom: 0,
        maxzoom: 10,
        layer: 'wb_countries'
    }
    return f
}