local function map(m, k, v)
  vim.keymap.set(m, k, v, { silent = true })
end

map("n", "<leader>r", "<CMD>source $MYVIMRC<CR>")

map("n", "<c-s>", "<CMD>w<CR>")
map("n", "<c-\\>", "<CMD>vs<CR>")
map("n", "<leader>s", "<CMD>Sort<CR>")
map("n", "<c-a-j>", "<Esc><CMD>m .+1<CR>==")
map("n", "<c-a-k>", "<Esc><CMD>m .-2<CR>==")

map("v", "<c-a-j>", "<CMD>m '>+1<CR>==")
map("v", "<c-a-k>", "<CMD>m '<-2<CR>==")

-- Buffers
map("n", "<leader>cc", "<CMD>bd<CR>")
map("n", "<leader>ca", "<CMD>%bd<CR>")

-- Splits Mgmt
map("n", "<c-h>", "<c-w>h");
map("n", "<c-j>", "<c-w>j");
map("n", "<c-k>", "<c-w>k");
map("n", "<c-l>", "<c-w>l");

map("n", "<c-Left>", "<CMD>:vertical resize +3<CR>");
map("n", "<c-Right>", "<CMD>:vertical resize -3<CR>");
map("n", "<c-Up>", "<CMD>:resize +3<CR>");
map("n", "<c-Down>", "<CMD>:resize -3<CR>");