module main
import os
import json

// 获取命令行参数
fn get_args()[]string{
    return os.args
}

// 获取vroot环境变量
fn get_v_root_path()string{
    return os.getenv('VROOT')
}

// 获取包管理文件存储路径
fn get_store_path()string{
    return os.getwd()+'/'+PKG_NAME
}

// 删除包管理文件
fn rm_store_path(){
    os.rm(get_store_path())
}

// 检测包管理文件是否存在
fn check_store_exist()bool{
    return os.file_exists(get_store_path())
}

// 获取项目默认名称(当前所在目录名称)
fn get_default_project_name()string{
    return os.filename(os.getwd())
}

// 获取vlib路径
fn get_vlib_path()string{
    return '$VROOT/vlib'
}

// 检测vlib是否存在
fn check_vlib_exist()bool{
    return os.dir_exists(get_vlib_path())
}

// 根据store结构体，生成json
fn generate_store_tempate(store Store)string{
    // use json.encode
    // mut result :='{"name":"$store.name","packages":['
    // if store.packages.len>0{
    //     for i,p in store.packages{
    //         result+='{"name":"$p.name","repo":"$p.repo"}'
    //         if i<store.packages.len-1{
    //             result+=','
    //         }
    //     }
    // }
    // result+=']}'
    return json.encode(store)
}

// 从git url 上获取 lib 名称
fn get_lib_name(git_url string)string{
    mut name:=os.filename(git_url)
    if name.ends_with('.git'){
        name=name.replace('.git','')
    }
    return name
}
// 检测是否是git url
fn is_git_url(url string)bool{
    return url.starts_with('https://git') || url.starts_with('git@')
}

// 将json数据写到文件
fn write_to_json(content string){
    path:=get_store_path()
    file:=os.create(path) or {
        println('create file "$path" failed!')
        return 
    }
    file.write(content)
    file.close()
}

// 保存下载的包信息写入到vpm.json文件
fn save_pkginfo_to_store(pkg_info PkgInfo){
    mut store:=load_to_store() or {
        load_store_failed()
        return 
    }
    if check_pkg_exist_in_store(store.packages,pkg_info){
        return 
    }
    store.packages << pkg_info
    content:=generate_store_tempate(store)
    write_to_json(content)
}

// 检测包是否已经存在vpm.json
fn check_pkg_exist_in_store(packages []PkgInfo,pkg_info PkgInfo)bool{
    for p in packages{
        if p.name==pkg_info.name{
            return true
        }
    }
    return false
}

// 获取vpm.json结构体
fn load_to_store()?Store{
    path:=get_store_path()
    content:=os.read_file(path) or {
        println('read file $path failed!')
        return error('read file $path failed!')
    }

    store:=json.decode(Store,content) or {
        println('json decode failed!')
        return error('json decode failed!')
    }
    return store
}

// 通过git下载包
fn fetch_pkg_from_git(lib_name,git_url string)PkgInfo{
    pkg_info:=PkgInfo{name:lib_name,repo:git_url}
    lib_path:=get_vlib_path()+'/$lib_name'
    //检测lib_path 是否已经存在
    if os.dir_exists(lib_path){
        println('package "$lib_name" already exist')
        return pkg_info
    }
    // clone lib
    println('fetching "$lib_name" from "$git_url" ...')
    git_res:=os.exec('git clone $git_url $lib_path')
    println(git_res)
    return pkg_info
}

// 从请求参数上获取命令
fn get_cmd(args []string)string{
    return args[1]
}