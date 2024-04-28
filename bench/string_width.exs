string = "เปิดเส้นทางสู่ความสำเร็จในต่างแดนผู้นำ"

Benchee.run(
  %{
    "ThaSpace.string_width/1" =>
      fn ->
        ThaiSpace.string_width(string)
      end,
    "ThaSpace.string_width2/1" =>
      fn ->
        ThaiSpace.string_width2(string)
      end,
    },
  time: 10,
  memory_time: 2
)
