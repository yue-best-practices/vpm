module main
const (
    PKG_NAME = 'vpm.json'
    VERSION = '0.0.2'
    VROOT = get_v_root_path()
)

struct PkgInfo {
    name string
    repo string
}

struct Store{
    name string
mut:
    packages []PkgInfo
}

fn exec(args []string){
    if args.len==1{
        introduction()
        return 
    }
    cmd:=get_cmd(args)
    match cmd {
        'init' {
            cmd_init(args)
        }
        'clean' {
            cmd_clean()
        }
        'get' {
            cmd_get(args)
        }
        'help' {
            cmd_help()
        }
        '-h' {
            cmd_help()
        }    
        '-v' {
            cmd_version()
        }
        'version' {
            cmd_version()
        }
        'install' {
            cmd_install()
        }
        'ls' {
            cmd_ls()
        }
        'rm' {
            cmd_rm(args)
        }
        else {
            cmd_default(cmd)
        }
    }
}

fn main() {
    if VROOT==''{
        println('Env "VROOT" not set yet. You need set VROOT first.')
        return 
    }
    if !check_vlib_exist(){
        println('vlib not found! Please check if "VROOT" is set correctly.')
        return 
    }
    exec(get_args())
}