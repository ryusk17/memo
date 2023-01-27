if exists('b:did_ftplugin_typescript')
    finish
endif
let b:did_ftplugin_typescript = 1

let g:syntastic_typescript_tsc_args = "--experimentalDecorators --target ES5"
