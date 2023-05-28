#include <linux/types.h>

#include <bpf/bpf_helpers.h>

int main(void) {
  bpf_printk("Hello World");
  return 0;
}
