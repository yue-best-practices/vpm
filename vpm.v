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
        case 'ls':
            cmd_ls()
        case 'rm':
            cmd_rm(args)
        default:
            cmd_default(cmd)
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