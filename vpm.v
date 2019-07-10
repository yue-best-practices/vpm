module main
import os
import json
const (
    PKG_NAME = '.vpm.json'
    VERSION = '0.0.1'
    VROOT = os.getenv('VROOT')
)

struct PkgInfo {
    name string
    repo string
}

struct Store{
    name string
    packages []PkgInfo
}

fn exec(args []string){
    if args.len==1{
        introduction()
        return 
    }
    cmd:=get_cmd(args)
    switch cmd {
        case 'init':
            cmd_init(args)
        case 'clean':
            cmd_clean()
        case 'get':
            cmd_get(args)
        case 'help':
            cmd_help()
        case '-h':
            cmd_help()
        case '-v':
            cmd_version()
        case 'version':
            cmd_version()
        case 'install':
            cmd_install()
        default:
            cmd_default(cmd)
    }
}

fn main() {
    if VROOT==''{
        println('Env "VROOT" not set yet. You need set VROOT first.')
        return 
    }
    vlib_path:=get_vlib_path()
    if !os.dir_exists(vlib_path){
        println('vlib not found! Please check if "VROOT" is set correctly.')
        return 
    }
    exec(os.args)
}