/**
暂时封装一些关于array数组的操作
*/
module main

// []string 截取
fn string_array_slice(arr []string,start,end int)[]string{
    mut res:=[]string
    if start>=end || start>=arr.len{
        return res
    }
    for start<arr.len && start<end{
        res<<arr[start]
        start++
    }
    return res
}

// []string 去重
fn string_array_distinct(arr []string)[]string{
    mut res:=[]string
    for v in arr{
        if !res.contains(v){
            res<<v
        }
    }
    return res
}