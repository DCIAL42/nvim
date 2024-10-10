require('code_runner').setup({
    filetype = {
        python = "python3 -u",
        cpp= {
            "g++ $dir/$fileName -o $dir/$fileNameWithoutExt && $dir/$fileNameWithoutExt",
            "$dir/$fileNameWithoutExt.exe",
        },
        javascript = "node $dir/$fileName",
    },
})
