module main
fn introduction(){
    println('Thank you for using vpm.')
    println('If you have any questions, please send an email to 1814888800@qq.com')
}
fn store_exist_warning(){
    println('$PKG_NAME already exist!')
}
fn store_init_warning(){
    println('$PKG_NAME create failed!')
}
fn store_init_success(){
    println('$PKG_NAME init success')
}

fn fetch_done(lib_name string){
    println('fetch "$lib_name" done')
}

fn command_not_found(cmd string){
    println('command "$cmd" not found')
}

fn install_complete(){
    println('install done')
}