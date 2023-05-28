#include <linux/bpf.h>
#include <bpf/bpf_helpers.h>

//char LICENSE[] SEC("license") = "Dual BSD/GPL";

int main(void) {
  bpf_printk("Hello World");
  return 0;
}
