#include "vmlinux.h"
#include <bpf/bpf_helpers.h>

//char LICENSE[] SEC("license") = "Dual BSD/GPL";

SEC("tp/syscalls/sys_enter_execve")
int handle_execve(void *ctx)
{
  bpf_printk("Hello World\n");
  return 0;
}

char LICENSE[] SEC("license") = "GPL";
