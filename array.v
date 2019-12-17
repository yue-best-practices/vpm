/**
暂时封装一些关于array数组的操作
*/
module main

// []string 去重
fn string_array_distinct(arr []string)[]string{
    mut res:=[]string
    for v in arr{
        if !v in res{
            res<<v
        }
    }
    return res
}