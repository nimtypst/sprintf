#import "/src/lib.typ": *

#assert.eq(sprintf("1%s_%.3f-%06d$", "abc", 3.13159, 123),
  "1abc_3.132-000123$"
)

#assert.eq(sprintf-map("%(key)s",  (key: 4.2)), "4.2")


#assert.eq(sprintf("%s | %06d | %.2f%%", "item", 42, 7.5), "item | 000042 | 7.50%")
