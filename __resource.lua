resource_manifest_version '77731fab-63ca-442c-a67b-abc70f28dfa5'

client_script {
  'Config.lua',
  'Client/*.lua',
  'Client/*.lua',
}

server_script {
  "@vrp/lib/utils.lua",
  'Config.lua',
  'Server/*.lua',
}

ui_page('Html/ui.html')

files {
    'Html/ui.html',
    'Html/js/script.js',
    'Html/css/style.css',
    'Html/img/cursor.png',
    'Html/img/radio.png'
}
