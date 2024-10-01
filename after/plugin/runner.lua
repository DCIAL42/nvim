require('code_runner').setup({
    filetype = {
        python = "python -u",
        cpp= {
            "g++ $dir/$fileName -o $dir/$fileNameWithoutExt && $dir/$fileNameWithoutExt",
            "$dir/$fileNameWithoutExt.exe",
        },
        javascript = "node $dir/$fileName",
    },
})
