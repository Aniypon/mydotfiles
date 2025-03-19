local M = {}

function M.compile_and_run_cpp()
    local filename = vim.fn.expand("%:p")
    local basename = vim.fn.expand("%:r")
    local output_file = "output.txt"
    local input_file = "input.txt"

    -- Проверка расширения файла (.cpp или .c)
    local valid_extensions = { "cpp", "c" }
    local valid_file = false
    for _, ext in ipairs(valid_extensions) do
        if filename:match("%." .. ext .. "$") then
            valid_file = true
            break
        end
    end

    if not valid_file then
        vim.api.nvim_err_writeln("Не является файлом C или C++.")
        return
    end

    -- Создание файлов input.txt и output.txt, если их нет
    io.open(input_file, "a+"):close()
    io.open(output_file, "a+"):close()

    -- Закрываем все окна, связанные с input.txt и output.txt (если открыты)
    for _, buf in ipairs(vim.api.nvim_list_bufs()) do
        local bufname = vim.api.nvim_buf_get_name(buf)
        if bufname:match(input_file) or bufname:match(output_file) then
            vim.api.nvim_buf_delete(buf, { force = true })
        end
    end

    -- Расположение окон:
    -- 1. Открываем input.txt в верхнем левом углу
    vim.cmd("topleft vsp " .. input_file)

    -- 2. Открываем output.txt снизу от input.txt
    vim.cmd("belowright split " .. output_file)

    -- 3. Возвращаемся к исходному файлу (код программы)
    vim.cmd("vertical resize 30%") -- Уменьшаем ширину левого окна
    vim.cmd("wincmd l")            -- Переход в правое окно (код программы)

    -- Компиляция и запуск программы с перенаправлением ввода/вывода
    local compile_cmd =
        string.format("g++ %s -o %s && ./%s < %s > %s", filename, basename, basename, input_file, output_file)

    vim.cmd("silent w") -- Сохранение текущего файла
    vim.cmd("silent !clear") -- Очистка терминала перед запуском команды
    vim.cmd("silent !" .. compile_cmd) -- Выполнение команды компиляции и запуска программы
end

return M



