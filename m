From: skunberg.kelsey at gmail.com (Kelsey Skunberg)
Date: Wed,  3 Jul 2019 18:08:19 -0600
Subject: [Linux-kernel-mentees] [PATCH 2/2] lspci: Add lspci support to
	decode "pci=earlydump" output
In-Reply-To: <20190704000819.25050-1-skunberg.kelsey@gmail.com>
References: <20190704000819.25050-1-skunberg.kelsey@gmail.com>
Message-ID: <20190704000819.25050-3-skunberg.kelsey@gmail.com>
List-Id: <linux-kernel-mentees.lists.linuxfoundation.org>

From: Bjorn Helgaas <bhelgaas at google.com>

Booting the kernel with the "pci=earlydump" parameter produces a hexdump
of PCI configuration space in the dmesg log.

Add lspci support to decode the hexdump produced with "pci=earlydump".
Full dmesg log can be passed to lspci to decode PCI configuration space
information. Pass dmesg log using the following command:

  $ lspci -F <file-name>

tests/dmesg-dump is a sample output file of dmesg with "pci=earlydump"
from: https://bugzilla.kernel.org/show_bug.cgi?id=202425

Signed-off-by: Kelsey Skunberg <skunberg.kelsey at gmail.com>
---
 lib/dump.c       |   75 +-
 tests/dmesg-dump | 1795 ++++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 1837 insertions(+), 33 deletions(-)
 create mode 100644 tests/dmesg-dump

diff --git a/lib/dump.c b/lib/dump.c
index d22bb3c..027aed9 100644
--- a/lib/dump.c
+++ b/lib/dump.c
@@ -70,7 +70,7 @@ dump_init(struct pci_access *a)
 {
   char *name = pci_get_param(a, "dump.name");
   FILE *f;
-  char buf[256];
+  char buf[1024];
   struct pci_dev *dev = NULL;
   int len, mn, bn, dn, fn, i, j;
 
@@ -80,11 +80,11 @@ dump_init(struct pci_access *a)
     a->error("dump: Cannot open %s: %s", name, strerror(errno));
   while (fgets(buf, sizeof(buf)-1, f))
     {
-      char *z = strchr(buf, '\n');
+      char *z = strchr(buf, '\n'), *p;
       if (!z)
 	{
 	  fclose(f);
-	  a->error("dump: line too long or unterminated");
+	  a->error("dump: line too long or unterminated '%s'", buf);
 	}
       *z-- = 0;
       if (z >= buf && *z == '\r')
@@ -97,8 +97,12 @@ dump_init(struct pci_access *a)
       while (isblank(*z))
 	z++;
 
+      p = strstr(z, "pci ");
+      if (p && strstr(p, "config space:"))
+        z = p + 4;
       if (dump_validate(z, "##:##.# ") && sscanf(z, "%x:%x.%d", &bn, &dn, &fn) == 3 ||
 	  dump_validate(z, "####:##:##.# ") && sscanf(z, "%x:%x:%x.%d", &mn, &bn, &dn, &fn) == 4 ||
+	  dump_validate(z, "####:##:##.#:") && sscanf(z, "%x:%x:%x.%d", &mn, &bn, &dn, &fn) == 4 ||
           dump_validate(z, "B## D## F##: ") && sscanf(z, "B%x D%x F%d", &bn, &dn, &fn) == 3)
 	{
 	  dev = pci_get_dev(a, mn, bn, dn, fn);
@@ -107,40 +111,45 @@ dump_init(struct pci_access *a)
 	}
       else if (!len)
 	dev = NULL;
-      else if (dev && (z = dump_skip_optional(z, "Offset ")) &&
-	       (dump_validate(z, "##: ") || dump_validate(z, "###: ")) &&
-	       sscanf(z, "%x: ", &i) == 1)
-	{
-	  struct dump_data *dd = dev->aux;
-	  z = strchr(z, ':') + 1;
-	  while (isblank(*z))
-	    z++;
-	  while (isxdigit(z[0]) && isxdigit(z[1]) && (!z[2] || z[2] == ' ') &&
-		 sscanf(z, "%x", &j) == 1 && j < 256)
-	    {
-	      if (i >= 4096)
+      else
+        {
+          if (z[0] == '[')
+            z = strchr(z, ']') + 1;
+          if (dev && (z = dump_skip_optional(z, "Offset ")) &&
+             (dump_validate(z, "###: ") || (z = dump_skip_optional(z, " ")) &&
+              dump_validate(z, "########: ")) && sscanf(z, "%x: ", &i) == 1)
+  	    {
+	      struct dump_data *dd = dev->aux;
+	      z = strchr(z, ':') + 1;
+	      while (isblank(*z))
+		z++;
+	      while (isxdigit(z[0]) && isxdigit(z[1]) && (!z[2] || z[2] == ' ') &&
+		     sscanf(z, "%x", &j) == 1 && j < 256)
 		{
-		  fclose(f);
-		  a->error("dump: At most 4096 bytes of config space are supported");
+		  if (i >= 4096)
+		    {
+		      fclose(f);
+		      a->error("dump: At most 4096 bytes of config space are supported");
+		    }
+		  if (i >= dd->allocated)	/* Need to re-allocate the buffer */
+		    {
+		      dump_alloc_data(dev, 4096);
+		      memcpy(((struct dump_data *) dev->aux)->data, dd->data, 256);
+		      pci_mfree(dd);
+		      dd = dev->aux;
+		    }
+		  dd->data[i++] = j;
+		  if (i > dd->len)
+		    dd->len = i;
+		  z += 2;
+		  while (isblank(*z))
+		    z++;
 		}
-	      if (i >= dd->allocated)	/* Need to re-allocate the buffer */
+	      if (*z)
 		{
-		  dump_alloc_data(dev, 4096);
-		  memcpy(((struct dump_data *) dev->aux)->data, dd->data, 256);
-		  pci_mfree(dd);
-		  dd = dev->aux;
+		  fclose(f);
+		  a->error("dump: Malformed line");
 		}
-	      dd->data[i++] = j;
-	      if (i > dd->len)
-		dd->len = i;
-	      z += 2;
-	      while (isblank(*z))
-	        z++;
-	    }
-	  if (*z)
-	    {
-	      fclose(f);
-	      a->error("dump: Malformed line");
 	    }
 	}
     }
diff --git a/tests/dmesg-dump b/tests/dmesg-dump
new file mode 100644
index 0000000..5753d57
--- /dev/null
+++ b/tests/dmesg-dump
@@ -0,0 +1,1795 @@
+[    0.000000] Linux version 4.20.6-arch1-1-ARCH-dirty (robert at polaris) (gcc version 7.3.1 20180406 (GCC)) #2 SMP PREEMPT Mon Feb 4 20:10:14 CET 2019
+[    0.000000] Command line: BOOT_IMAGE=/vmlinuz-linux root=UUID=f1d80e90-edaf-4e2d-ae51-77d0411d36ab rw cryptdevice=/dev/disk/by-partlabel/root:cryptroot:allow-discards nvidia-drm.modeset=1 scsi_mod.use_blk_mq=1 video=vesa:off pci=earlydump log_buf_len=10M
+[    0.000000] KERNEL supported cpus:
+[    0.000000]   Intel GenuineIntel
+[    0.000000]   AMD AuthenticAMD
+[    0.000000]   Hygon HygonGenuine
+[    0.000000]   Centaur CentaurHauls
+[    0.000000] x86/fpu: Supporting XSAVE feature 0x001: 'x87 floating point registers'
+[    0.000000] x86/fpu: Supporting XSAVE feature 0x002: 'SSE registers'
+[    0.000000] x86/fpu: Supporting XSAVE feature 0x004: 'AVX registers'
+[    0.000000] x86/fpu: xstate_offset[2]:  576, xstate_sizes[2]:  256
+[    0.000000] x86/fpu: Enabled xstate features 0x7, context size is 832 bytes, using 'compacted' format.
+[    0.000000] BIOS-provided physical RAM map:
+[    0.000000] BIOS-e820: [mem 0x0000000000000000-0x000000000009ffff] usable
+[    0.000000] BIOS-e820: [mem 0x00000000000a0000-0x00000000000fffff] reserved
+[    0.000000] BIOS-e820: [mem 0x0000000000100000-0x0000000009bfffff] usable
+[    0.000000] BIOS-e820: [mem 0x0000000009c00000-0x0000000009ffffff] reserved
+[    0.000000] BIOS-e820: [mem 0x000000000a000000-0x000000000a1fffff] usable
+[    0.000000] BIOS-e820: [mem 0x000000000a200000-0x000000000a209fff] ACPI NVS
+[    0.000000] BIOS-e820: [mem 0x000000000a20a000-0x000000000affffff] usable
+[    0.000000] BIOS-e820: [mem 0x000000000b000000-0x000000000b01ffff] reserved
+[    0.000000] BIOS-e820: [mem 0x000000000b020000-0x00000000ca1e2fff] usable
+[    0.000000] BIOS-e820: [mem 0x00000000ca1e3000-0x00000000ca202fff] ACPI data
+[    0.000000] BIOS-e820: [mem 0x00000000ca203000-0x00000000da4bcfff] usable
+[    0.000000] BIOS-e820: [mem 0x00000000da4bd000-0x00000000da624fff] reserved
+[    0.000000] BIOS-e820: [mem 0x00000000da625000-0x00000000da62efff] ACPI data
+[    0.000000] BIOS-e820: [mem 0x00000000da62f000-0x00000000da73dfff] usable
+[    0.000000] BIOS-e820: [mem 0x00000000da73e000-0x00000000daafefff] ACPI NVS
+[    0.000000] BIOS-e820: [mem 0x00000000daaff000-0x00000000db832fff] reserved
+[    0.000000] BIOS-e820: [mem 0x00000000db833000-0x00000000db8dcfff] type 20
+[    0.000000] BIOS-e820: [mem 0x00000000db8dd000-0x00000000ddffffff] usable
+[    0.000000] BIOS-e820: [mem 0x00000000de000000-0x00000000dfffffff] reserved
+[    0.000000] BIOS-e820: [mem 0x00000000f8000000-0x00000000fbffffff] reserved
+[    0.000000] BIOS-e820: [mem 0x00000000fd100000-0x00000000fdffffff] reserved
+[    0.000000] BIOS-e820: [mem 0x00000000fea00000-0x00000000fea0ffff] reserved
+[    0.000000] BIOS-e820: [mem 0x00000000feb80000-0x00000000fec01fff] reserved
+[    0.000000] BIOS-e820: [mem 0x00000000fec10000-0x00000000fec10fff] reserved
+[    0.000000] BIOS-e820: [mem 0x00000000fec30000-0x00000000fec30fff] reserved
+[    0.000000] BIOS-e820: [mem 0x00000000fed00000-0x00000000fed00fff] reserved
+[    0.000000] BIOS-e820: [mem 0x00000000fed40000-0x00000000fed44fff] reserved
+[    0.000000] BIOS-e820: [mem 0x00000000fed80000-0x00000000fed8ffff] reserved
+[    0.000000] BIOS-e820: [mem 0x00000000fedc2000-0x00000000fedcffff] reserved
+[    0.000000] BIOS-e820: [mem 0x00000000fedd4000-0x00000000fedd5fff] reserved
+[    0.000000] BIOS-e820: [mem 0x00000000fee00000-0x00000000feefffff] reserved
+[    0.000000] BIOS-e820: [mem 0x00000000ff000000-0x00000000ffffffff] reserved
+[    0.000000] BIOS-e820: [mem 0x0000000100000000-0x000000081f37ffff] usable
+[    0.000000] NX (Execute Disable) protection: active
+[    0.000000] efi: EFI v2.60 by American Megatrends
+[    0.000000] efi:  ACPI 2.0=0xca1e3000  ACPI=0xca1e3000  SMBIOS=0xdb7a0000  SMBIOS 3.0=0xdb79f000  ESRT=0xd77e9198  MEMATTR=0xd7c19018 
+[    0.000000] SMBIOS 3.1.1 present.
+[    0.000000] DMI: System manufacturer System Product Name/ROG STRIX X470-F GAMING, BIOS 4207 12/07/2018
+[    0.000000] tsc: Fast TSC calibration failed
+[    0.000000] e820: update [mem 0x00000000-0x00000fff] usable ==> reserved
+[    0.000000] e820: remove [mem 0x000a0000-0x000fffff] usable
+[    0.000000] last_pfn = 0x81f380 max_arch_pfn = 0x400000000
+[    0.000000] MTRR default type: uncachable
+[    0.000000] MTRR fixed ranges enabled:
+[    0.000000]   00000-9FFFF write-back
+[    0.000000]   A0000-BFFFF write-through
+[    0.000000]   C0000-FFFFF write-protect
+[    0.000000] MTRR variable ranges enabled:
+[    0.000000]   0 base 000000000000 mask FFFF80000000 write-back
+[    0.000000]   1 base 000080000000 mask FFFFC0000000 write-back
+[    0.000000]   2 base 0000C0000000 mask FFFFE0000000 write-back
+[    0.000000]   3 disabled
+[    0.000000]   4 disabled
+[    0.000000]   5 disabled
+[    0.000000]   6 disabled
+[    0.000000]   7 disabled
+[    0.000000] TOM2: 0000000820000000 aka 33280M
+[    0.000000] x86/PAT: Configuration [0-7]: WB  WC  UC- UC  WB  WP  UC- WT  
+[    0.000000] e820: update [mem 0xe0000000-0xffffffff] usable ==> reserved
+[    0.000000] last_pfn = 0xde000 max_arch_pfn = 0x400000000
+[    0.000000] esrt: Reserving ESRT space from 0x00000000d77e9198 to 0x00000000d77e91d0.
+[    0.000000] check: Scanning 1 areas for low memory corruption
+[    0.000000] Base memory trampoline at [(____ptrval____)] 96000 size 24576
+[    0.000000] Using GB pages for direct mapping
+[    0.000000] BRK [0x4eb001000, 0x4eb001fff] PGTABLE
+[    0.000000] BRK [0x4eb002000, 0x4eb002fff] PGTABLE
+[    0.000000] BRK [0x4eb003000, 0x4eb003fff] PGTABLE
+[    0.000000] BRK [0x4eb004000, 0x4eb004fff] PGTABLE
+[    0.000000] BRK [0x4eb005000, 0x4eb005fff] PGTABLE
+[    0.000000] BRK [0x4eb006000, 0x4eb006fff] PGTABLE
+[    0.000000] BRK [0x4eb007000, 0x4eb007fff] PGTABLE
+[    0.000000] BRK [0x4eb008000, 0x4eb008fff] PGTABLE
+[    0.000000] BRK [0x4eb009000, 0x4eb009fff] PGTABLE
+[    0.000000] BRK [0x4eb00a000, 0x4eb00afff] PGTABLE
+[    0.000000] BRK [0x4eb00b000, 0x4eb00bfff] PGTABLE
+[    0.000000] BRK [0x4eb00c000, 0x4eb00cfff] PGTABLE
+[    0.000000] printk: log_buf_len: 16777216 bytes
+[    0.000000] printk: early log buf free: 124876(95%)
+[    0.000000] Secure boot could not be determined
+[    0.000000] RAMDISK: [mem 0x37545000-0x37a99fff]
+[    0.000000] ACPI: Early table checksum verification disabled
+[    0.000000] ACPI: RSDP 0x00000000CA1E3000 000024 (v02 ALASKA)
+[    0.000000] ACPI: XSDT 0x00000000CA1E3098 0000A4 (v01 ALASKA A M I    01072009 AMI  00010013)
+[    0.000000] ACPI: FACP 0x00000000CA1F2050 000114 (v06 ALASKA A M I    01072009 AMI  00010013)
+[    0.000000] ACPI BIOS Warning (bug): Optional FADT field Pm2ControlBlock has valid Length but zero Address: 0x0000000000000000/0x1 (20181003/tbfadt-624)
+[    0.000000] ACPI: DSDT 0x00000000CA1E31D0 00EE80 (v02 ALASKA A M I    01072009 INTL 20120913)
+[    0.000000] ACPI: FACS 0x00000000DAAE7D80 000040
+[    0.000000] ACPI: APIC 0x00000000CA1F2168 0000DE (v03 ALASKA A M I    01072009 AMI  00010013)
+[    0.000000] ACPI: FPDT 0x00000000CA1F2248 000044 (v01 ALASKA A M I    01072009 AMI  00010013)
+[    0.000000] ACPI: FIDT 0x00000000CA1F2290 00009C (v01 ALASKA A M I    01072009 AMI  00010013)
+[    0.000000] ACPI: SSDT 0x00000000CA202D68 0000BF (v01 AMD    AMD PT   00001000 INTL 20120913)
+[    0.000000] ACPI: SSDT 0x00000000CA1F2388 008C98 (v02 AMD    AMD ALIB 00000002 MSFT 04000000)
+[    0.000000] ACPI: SSDT 0x00000000CA1FB020 002314 (v01 AMD    AMD CPU  00000001 AMD  00000001)
+[    0.000000] ACPI: CRAT 0x00000000CA1FD338 000F50 (v01 AMD    AMD CRAT 00000001 AMD  00000001)
+[    0.000000] ACPI: CDIT 0x00000000CA1FE288 000029 (v01 AMD    AMD CDIT 00000001 AMD  00000001)
+[    0.000000] ACPI: SSDT 0x00000000CA1FE2B8 002DA8 (v01 AMD    AMD AOD  00000001 INTL 20120913)
+[    0.000000] ACPI: MCFG 0x00000000CA201060 00003C (v01 ALASKA A M I    01072009 MSFT 00010013)
+[    0.000000] ACPI: HPET 0x00000000CA2010A0 000038 (v01 ALASKA A M I    01072009 AMI  00000005)
+[    0.000000] ACPI: SSDT 0x00000000CA2010D8 000024 (v01 AMDFCH FCHZP    00001000 INTL 20120913)
+[    0.000000] ACPI: UEFI 0x00000000CA201100 000042 (v01                 00000000      00000000)
+[    0.000000] ACPI: IVRS 0x00000000CA201148 0000D0 (v02 AMD    AMD IVRS 00000001 AMD  00000000)
+[    0.000000] ACPI: SSDT 0x00000000CA201218 001B4E (v01 AMD    AmdTable 00000001 INTL 20120913)
+[    0.000000] ACPI: Local APIC address 0xfee00000
+[    0.000000] No NUMA configuration found
+[    0.000000] Faking a node at [mem 0x0000000000000000-0x000000081f37ffff]
+[    0.000000] NODE_DATA(0) allocated [mem 0x81f37c000-0x81f37ffff]
+[    0.000000] Zone ranges:
+[    0.000000]   DMA      [mem 0x0000000000001000-0x0000000000ffffff]
+[    0.000000]   DMA32    [mem 0x0000000001000000-0x00000000ffffffff]
+[    0.000000]   Normal   [mem 0x0000000100000000-0x000000081f37ffff]
+[    0.000000]   Device   empty
+[    0.000000] Movable zone start for each node
+[    0.000000] Early memory node ranges
+[    0.000000]   node   0: [mem 0x0000000000001000-0x000000000009ffff]
+[    0.000000]   node   0: [mem 0x0000000000100000-0x0000000009bfffff]
+[    0.000000]   node   0: [mem 0x000000000a000000-0x000000000a1fffff]
+[    0.000000]   node   0: [mem 0x000000000a20a000-0x000000000affffff]
+[    0.000000]   node   0: [mem 0x000000000b020000-0x00000000ca1e2fff]
+[    0.000000]   node   0: [mem 0x00000000ca203000-0x00000000da4bcfff]
+[    0.000000]   node   0: [mem 0x00000000da62f000-0x00000000da73dfff]
+[    0.000000]   node   0: [mem 0x00000000db8dd000-0x00000000ddffffff]
+[    0.000000]   node   0: [mem 0x0000000100000000-0x000000081f37ffff]
+[    0.000000] Zeroed struct page in unavailable ranges: 14268 pages
+[    0.000000] Initmem setup node 0 [mem 0x0000000000001000-0x000000081f37ffff]
+[    0.000000] On node 0 totalpages: 8371140
+[    0.000000]   DMA zone: 64 pages used for memmap
+[    0.000000]   DMA zone: 28 pages reserved
+[    0.000000]   DMA zone: 3999 pages, LIFO batch:0
+[    0.000000]   DMA32 zone: 14051 pages used for memmap
+[    0.000000]   DMA32 zone: 899237 pages, LIFO batch:63
+[    0.000000]   Normal zone: 116686 pages used for memmap
+[    0.000000]   Normal zone: 7467904 pages, LIFO batch:63
+[    0.000000] ACPI: PM-Timer IO Port: 0x808
+[    0.000000] ACPI: Local APIC address 0xfee00000
+[    0.000000] ACPI: LAPIC_NMI (acpi_id[0xff] high edge lint[0x1])
+[    0.000000] IOAPIC[0]: apic_id 17, version 33, address 0xfec00000, GSI 0-23
+[    0.000000] IOAPIC[1]: apic_id 18, version 33, address 0xfec01000, GSI 24-55
+[    0.000000] ACPI: INT_SRC_OVR (bus 0 bus_irq 0 global_irq 2 dfl dfl)
+[    0.000000] ACPI: INT_SRC_OVR (bus 0 bus_irq 9 global_irq 9 low level)
+[    0.000000] ACPI: IRQ0 used by override.
+[    0.000000] ACPI: IRQ9 used by override.
+[    0.000000] Using ACPI (MADT) for SMP configuration information
+[    0.000000] ACPI: HPET id: 0x10228201 base: 0xfed00000
+[    0.000000] smpboot: Allowing 16 CPUs, 0 hotplug CPUs
+[    0.000000] PM: Registered nosave memory: [mem 0x00000000-0x00000fff]
+[    0.000000] PM: Registered nosave memory: [mem 0x000a0000-0x000fffff]
+[    0.000000] PM: Registered nosave memory: [mem 0x09c00000-0x09ffffff]
+[    0.000000] PM: Registered nosave memory: [mem 0x0a200000-0x0a209fff]
+[    0.000000] PM: Registered nosave memory: [mem 0x0b000000-0x0b01ffff]
+[    0.000000] PM: Registered nosave memory: [mem 0xca1e3000-0xca202fff]
+[    0.000000] PM: Registered nosave memory: [mem 0xda4bd000-0xda624fff]
+[    0.000000] PM: Registered nosave memory: [mem 0xda625000-0xda62efff]
+[    0.000000] PM: Registered nosave memory: [mem 0xda73e000-0xdaafefff]
+[    0.000000] PM: Registered nosave memory: [mem 0xdaaff000-0xdb832fff]
+[    0.000000] PM: Registered nosave memory: [mem 0xdb833000-0xdb8dcfff]
+[    0.000000] PM: Registered nosave memory: [mem 0xde000000-0xdfffffff]
+[    0.000000] PM: Registered nosave memory: [mem 0xe0000000-0xf7ffffff]
+[    0.000000] PM: Registered nosave memory: [mem 0xf8000000-0xfbffffff]
+[    0.000000] PM: Registered nosave memory: [mem 0xfc000000-0xfd0fffff]
+[    0.000000] PM: Registered nosave memory: [mem 0xfd100000-0xfdffffff]
+[    0.000000] PM: Registered nosave memory: [mem 0xfe000000-0xfe9fffff]
+[    0.000000] PM: Registered nosave memory: [mem 0xfea00000-0xfea0ffff]
+[    0.000000] PM: Registered nosave memory: [mem 0xfea10000-0xfeb7ffff]
+[    0.000000] PM: Registered nosave memory: [mem 0xfeb80000-0xfec01fff]
+[    0.000000] PM: Registered nosave memory: [mem 0xfec02000-0xfec0ffff]
+[    0.000000] PM: Registered nosave memory: [mem 0xfec10000-0xfec10fff]
+[    0.000000] PM: Registered nosave memory: [mem 0xfec11000-0xfec2ffff]
+[    0.000000] PM: Registered nosave memory: [mem 0xfec30000-0xfec30fff]
+[    0.000000] PM: Registered nosave memory: [mem 0xfec31000-0xfecfffff]
+[    0.000000] PM: Registered nosave memory: [mem 0xfed00000-0xfed00fff]
+[    0.000000] PM: Registered nosave memory: [mem 0xfed01000-0xfed3ffff]
+[    0.000000] PM: Registered nosave memory: [mem 0xfed40000-0xfed44fff]
+[    0.000000] PM: Registered nosave memory: [mem 0xfed45000-0xfed7ffff]
+[    0.000000] PM: Registered nosave memory: [mem 0xfed80000-0xfed8ffff]
+[    0.000000] PM: Registered nosave memory: [mem 0xfed90000-0xfedc1fff]
+[    0.000000] PM: Registered nosave memory: [mem 0xfedc2000-0xfedcffff]
+[    0.000000] PM: Registered nosave memory: [mem 0xfedd0000-0xfedd3fff]
+[    0.000000] PM: Registered nosave memory: [mem 0xfedd4000-0xfedd5fff]
+[    0.000000] PM: Registered nosave memory: [mem 0xfedd6000-0xfedfffff]
+[    0.000000] PM: Registered nosave memory: [mem 0xfee00000-0xfeefffff]
+[    0.000000] PM: Registered nosave memory: [mem 0xfef00000-0xfeffffff]
+[    0.000000] PM: Registered nosave memory: [mem 0xff000000-0xffffffff]
+[    0.000000] [mem 0xe0000000-0xf7ffffff] available for PCI devices
+[    0.000000] Booting paravirtualized kernel on bare hardware
+[    0.000000] clocksource: refined-jiffies: mask: 0xffffffff max_cycles: 0xffffffff, max_idle_ns: 6370452778343963 ns
+[    0.000000] random: get_random_bytes called from start_kernel+0x96/0x54a with crng_init=0
+[    0.000000] setup_percpu: NR_CPUS:320 nr_cpumask_bits:320 nr_cpu_ids:16 nr_node_ids:1
+[    0.000000] percpu: Embedded 45 pages/cpu @(____ptrval____) s147456 r8192 d28672 u262144
+[    0.000000] pcpu-alloc: s147456 r8192 d28672 u262144 alloc=1*2097152
+[    0.000000] pcpu-alloc: [0] 00 01 02 03 04 05 06 07 [0] 08 09 10 11 12 13 14 15 
+[    0.000000] Built 1 zonelists, mobility grouping on.  Total pages: 8240311
+[    0.000000] Policy zone: Normal
+[    0.000000] Kernel command line: BOOT_IMAGE=/vmlinuz-linux root=UUID=f1d80e90-edaf-4e2d-ae51-77d0411d36ab rw cryptdevice=/dev/disk/by-partlabel/root:cryptroot:allow-discards nvidia-drm.modeset=1 scsi_mod.use_blk_mq=1 video=vesa:off pci=earlydump log_buf_len=10M
+[    0.000000] Calgary: detecting Calgary via BIOS EBDA area
+[    0.000000] Calgary: Unable to locate Rio Grande table in EBDA - bailing!
+[    0.000000] Memory: 32737236K/33484560K available (12293K kernel code, 1239K rwdata, 3464K rodata, 1500K init, 4092K bss, 747324K reserved, 0K cma-reserved)
+[    0.000000] SLUB: HWalign=64, Order=0-3, MinObjects=0, CPUs=16, Nodes=1
+[    0.000000] ftrace: allocating 34883 entries in 137 pages
+[    0.000000] rcu: Preemptible hierarchical RCU implementation.
+[    0.000000] rcu: 	CONFIG_RCU_FANOUT set to non-default value of 32.
+[    0.000000] rcu: 	RCU dyntick-idle grace-period acceleration is enabled.
+[    0.000000] rcu: 	RCU restricting CPUs from NR_CPUS=320 to nr_cpu_ids=16.
+[    0.000000] rcu: 	RCU priority boosting: priority 1 delay 500 ms.
+[    0.000000] 	Tasks RCU enabled.
+[    0.000000] rcu: RCU calculated value of scheduler-enlistment delay is 30 jiffies.
+[    0.000000] rcu: Adjusting geometry for rcu_fanout_leaf=16, nr_cpu_ids=16
+[    0.000000] NR_IRQS: 20736, nr_irqs: 1096, preallocated irqs: 16
+[    0.000000] rcu: 	Offload RCU callbacks from CPUs: (none).
+[    0.000000] Console: colour dummy device 80x25
+[    0.000000] printk: console [tty0] enabled
+[    0.000000] ACPI: Core revision 20181003
+[    0.000000] clocksource: hpet: mask: 0xffffffff max_cycles: 0xffffffff, max_idle_ns: 133484873504 ns
+[    0.000000] hpet clockevent registered
+[    0.000000] APIC: Switch to symmetric I/O mode setup
+[    0.003333] Switched APIC routing to physical flat.
+[    0.003333] ..TIMER: vector=0x30 apic1=0 pin1=2 apic2=-1 pin2=-1
+[    0.023333] tsc: PIT calibration matches HPET. 1 loops
+[    0.023333] tsc: Detected 3692.638 MHz processor
+[    0.000005] clocksource: tsc-early: mask: 0xffffffffffffffff max_cycles: 0x6a745763c20, max_idle_ns: 881590569239 ns
+[    0.000009] Calibrating delay loop (skipped), value calculated using timer frequency.. 7388.99 BogoMIPS (lpj=12308793)
+[    0.000010] pid_max: default: 32768 minimum: 301
+[    0.001045] LSM: Security Framework initializing
+[    0.001046] Yama: becoming mindful.
+[    0.001049] AppArmor: AppArmor disabled by boot time parameter
+[    0.004611] Dentry cache hash table entries: 4194304 (order: 13, 33554432 bytes)
+[    0.007065] Inode-cache hash table entries: 2097152 (order: 12, 16777216 bytes)
+[    0.007139] Mount-cache hash table entries: 65536 (order: 7, 524288 bytes)
+[    0.007195] Mountpoint-cache hash table entries: 65536 (order: 7, 524288 bytes)
+[    0.007372] mce: CPU supports 23 MCE banks
+[    0.007387] LVT offset 1 assigned for vector 0xf9
+[    0.007443] LVT offset 2 assigned for vector 0xf4
+[    0.007453] Last level iTLB entries: 4KB 1024, 2MB 1024, 4MB 512
+[    0.007453] Last level dTLB entries: 4KB 1536, 2MB 1536, 4MB 768, 1GB 0
+[    0.007455] Spectre V2 : Mitigation: Full AMD retpoline
+[    0.007456] Spectre V2 : Spectre v2 / SpectreRSB mitigation: Filling RSB on context switch
+[    0.007460] Spectre V2 : mitigation: Enabling conditional Indirect Branch Prediction Barrier
+[    0.007461] Spectre V2 : User space: Vulnerable
+[    0.007462] Speculative Store Bypass: Mitigation: Speculative Store Bypass disabled via prctl and seccomp
+[    0.007607] Freeing SMP alternatives memory: 28K
+[    0.013339] smpboot: CPU0: AMD Ryzen 7 2700X Eight-Core Processor (family: 0x17, model: 0x8, stepping: 0x2)
+[    0.030017] Performance Events: Fam17h core perfctr, AMD PMU driver.
+[    0.030021] ... version:                0
+[    0.030022] ... bit width:              48
+[    0.030022] ... generic registers:      6
+[    0.030023] ... value mask:             0000ffffffffffff
+[    0.030024] ... max period:             00007fffffffffff
+[    0.030024] ... fixed-purpose events:   0
+[    0.030025] ... event mask:             000000000000003f
+[    0.036679] rcu: Hierarchical SRCU implementation.
+[    0.060023] NMI watchdog: Enabled. Permanently consumes one hw-PMU counter.
+[    0.066686] smp: Bringing up secondary CPUs ...
+[    0.106691] x86: Booting SMP configuration:
+[    0.106692] .... node  #0, CPUs:        #1  #2  #3  #4  #5  #6  #7  #8  #9 #10 #11 #12 #13 #14 #15
+[    0.668837] smp: Brought up 1 node, 16 CPUs
+[    0.668837] smpboot: Max logical packages: 1
+[    0.668837] smpboot: Total of 16 processors activated (118211.93 BogoMIPS)
+[    0.670569] devtmpfs: initialized
+[    0.670569] x86/mm: Memory block size: 128MB
+[    0.671407] PM: Registering ACPI NVS region [mem 0x0a200000-0x0a209fff] (40960 bytes)
+[    0.671407] PM: Registering ACPI NVS region [mem 0xda73e000-0xdaafefff] (3936256 bytes)
+[    0.671407] clocksource: jiffies: mask: 0xffffffff max_cycles: 0xffffffff, max_idle_ns: 6370867519511994 ns
+[    0.671407] futex hash table entries: 4096 (order: 6, 262144 bytes)
+[    0.671407] pinctrl core: initialized pinctrl subsystem
+[    0.671407] RTC time: 14:38:54, date: 02/06/19
+[    0.671407] NET: Registered protocol family 16
+[    0.671407] audit: initializing netlink subsys (disabled)
+[    0.671407] audit: type=2000 audit(1549463933.693:1): state=initialized audit_enabled=0 res=1
+[    0.671407] cpuidle: using governor ladder
+[    0.671407] cpuidle: using governor menu
+[    0.671407] ACPI: bus type PCI registered
+[    0.671407] acpiphp: ACPI Hot Plug PCI Controller Driver version: 0.5
+[    0.671407] PCI: MMCONFIG for domain 0000 [bus 00-3f] at [mem 0xf8000000-0xfbffffff] (base 0xf8000000)
+[    0.671407] PCI: MMCONFIG at [mem 0xf8000000-0xfbffffff] reserved in E820
+[    0.671407] PCI: Using configuration type 1 for base access
+[    0.673369] HugeTLB registered 1.00 GiB page size, pre-allocated 0 pages
+[    0.673369] HugeTLB registered 2.00 MiB page size, pre-allocated 0 pages
+[    0.673420] ACPI: Added _OSI(Module Device)
+[    0.673421] ACPI: Added _OSI(Processor Device)
+[    0.673421] ACPI: Added _OSI(3.0 _SCP Extensions)
+[    0.673421] ACPI: Added _OSI(Processor Aggregator Device)
+[    0.673422] ACPI: Added _OSI(Linux-Dell-Video)
+[    0.673423] ACPI: Added _OSI(Linux-Lenovo-NV-HDMI-Audio)
+[    0.683743] ACPI: 7 ACPI AML tables successfully acquired and loaded
+[    0.685766] ACPI: [Firmware Bug]: BIOS _OSI(Linux) query ignored
+[    0.688407] ACPI: EC: EC started
+[    0.688408] ACPI: EC: interrupt blocked
+[    0.688494] ACPI: \_SB_.PCI0.SBRG.EC0_: Used as first EC
+[    0.688496] ACPI: \_SB_.PCI0.SBRG.EC0_: GPE=0x2, EC_CMD/EC_SC=0x66, EC_DATA=0x62
+[    0.688497] ACPI: \_SB_.PCI0.SBRG.EC0_: Used as boot DSDT EC to handle transactions
+[    0.688497] ACPI: Interpreter enabled
+[    0.688509] ACPI: (supports S0 S3 S4 S5)
+[    0.688510] ACPI: Using IOAPIC for interrupt routing
+[    0.688908] PCI: Using host bridge windows from ACPI; if necessary, use "pci=nocrs" and report a bug
+[    0.689180] ACPI: Enabled 4 GPEs in block 00 to 1F
+[    0.696798] ACPI: PCI Root Bridge [PCI0] (domain 0000 [bus 00-ff])
+[    0.696801] acpi PNP0A08:00: _OSC: OS supports [ExtendedConfig ASPM ClockPM Segments MSI]
+[    0.696958] acpi PNP0A08:00: _OSC: platform does not support [PCIeHotplug SHPCHotplug PME LTR]
+[    0.697110] acpi PNP0A08:00: _OSC: OS now controls [AER PCIeCapability]
+[    0.697118] acpi PNP0A08:00: [Firmware Info]: MMCONFIG for domain 0000 [bus 00-3f] only partially covers this bridge
+[    0.697405] PCI host bridge to bus 0000:00
+[    0.697406] pci_bus 0000:00: root bus resource [io  0x0000-0x03af window]
+[    0.697407] pci_bus 0000:00: root bus resource [io  0x03e0-0x0cf7 window]
+[    0.697408] pci_bus 0000:00: root bus resource [io  0x03b0-0x03df window]
+[    0.697409] pci_bus 0000:00: root bus resource [io  0x0d00-0xefff window]
+[    0.697409] pci_bus 0000:00: root bus resource [mem 0x000a0000-0x000bffff window]
+[    0.697410] pci_bus 0000:00: root bus resource [mem 0x000c0000-0x000dffff window]
+[    0.697411] pci_bus 0000:00: root bus resource [mem 0xe0000000-0xfec2ffff window]
+[    0.697412] pci_bus 0000:00: root bus resource [mem 0xfee00000-0xffffffff window]
+[    0.697413] pci_bus 0000:00: root bus resource [bus 00-ff]
+[    0.697417] pci 0000:00:00.0: [1022:1450] type 00 class 0x060000
+[    0.697418] pci 0000:00:00.0: config space:
+[    0.698094] 00000000: 22 10 50 14 00 00 00 00 00 00 00 06 00 00 80 00
+[    0.698095] 00000010: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
+[    0.698095] 00000020: 00 00 00 00 00 00 00 00 00 00 00 00 43 10 47 87
+[    0.698096] 00000030: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
+[    0.698096] 00000040: 00 00 00 00 00 00 00 00 80 00 00 00 10 00 80 00
+[    0.698097] 00000050: 43 10 47 87 00 00 00 00 00 00 00 00 00 00 00 00
+[    0.698097] 00000060: 1d 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
+[    0.698097] 00000070: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
+[    0.698098] 00000080: 00 00 00 00 08 01 00 00 00 00 00 00 00 00 00 00
+[    0.698098] 00000090: 00 00 00 e0 00 00 00 00 00 00 00 00 00 00 00 00
+[    0.698099] 000000a0: 00 00 00 00 ff ff ff ff 00 00 00 00 00 00 00 00
+[    0.698099] 000000b0: 00 00 00 00 00 00 00 00 00 00 30 14 04 02 00 00
+[    0.698099] 000000c0: 00 00 00 00 00 00 00 00 ff ff ff ff 00 00 00 00
+[    0.698100] 000000d0: 00 00 00 00 ff ff ff ff 00 00 00 00 00 00 00 00
+[    0.698100] 000000e0: 46 00 30 01 ff ff ff ff 00 00 00 00 00 00 00 00
+[    0.698100] 000000f0: 00 00 00 00 00 80 80 00 00 00 00 00 ff ff ff ff
+[    0.698172] pci 0000:00:00.2: [1022:1451] type 00 class 0x080600
+[    0.698173] pci 0000:00:00.2: config space:
+[    0.698988] 00000000: 22 10 51 14 00 00 10 00 00 00 06 08 00 00 80 00
+[    0.698988] 00000010: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
+[    0.698989] 00000020: 00 00 00 00 00 00 00 00 00 00 00 00 43 10 47 87
+[    0.698989] 00000030: 00 00 00 00 40 00 00 00 00 00 00 00 ff 00 00 00
+[    0.698990] 00000040: 0f 64 0b 19 01 00 b8 fe 00 00 00 00 00 00 00 00
+[    0.698990] 00000050: 40 30 20 00 80 00 00 00 00 00 00 00 00 00 00 00
+[    0.698990] 00000060: 00 00 00 00 05 74 84 00 00 00 00 00 00 00 00 00
+[    0.698991] 00000070: 00 00 00 00 08 00 03 a8 43 10 47 87 00 2b 00 00
+[    0.698991] 00000080: da 1a 20 62 cf cf 03 00 00 00 00 00 00 00 00 00
+[    0.698992] 00000090: 00 00 00 00 00 00 00 00 02 00 00 00 00 00 00 00
+[    0.698992] 000000a0: 00 00 00 00 bf 07 00 2c 10 9c 73 0e 00 00 00 00
+[    0.698992] 000000b0: 00 00 00 00 00 00 00 00 75 00 00 00 00 00 00 00
+[    0.698993] 000000c0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
+[    0.698993] 000000d0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
+[    0.698994] 000000e0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
+[    0.698994] 000000f0: 00 00 00 00 ff ff ff ff 00 00 00 00 ff ff ff ff
+[    0.699083] pci 0000:00:01.0: [1022:1452] type 00 class 0x060000
+[    0.699083] pci 0000:00:01.0: config space:
+[    0.699115] 00000000: 22 10 52 14 00 00 00 00 00 00 00 06 00 00 80 00
+[    0.699115] 00000010: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
+[    0.699116] 00000020: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
+[    0.699116] 00000030: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
+[    0.699116] 00000040: 80 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
+[    0.699117] 00000050: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
+[    0.699117] 00000060: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
+[    0.699118] 00000070: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
+[    0.699118] 00000080: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
+[    0.699118] 00000090: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
+[    0.699119] 000000a0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
+[    0.699119] 000000b0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
+[    0.699120] 000000c0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
+[    0.699120] 000000d0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
+[    0.699120] 000000e0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
+[    0.699121] 000000f0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
+[    0.699123] pci 0000:00:01.0: disabling Extended Tags (this device can't handle them)
+[    0.699185] pci 0000:00:01.3: [1022:1453] type 01 class 0x060400
+[    0.699186] pci 0000:00:01.3: config space:
+[    0.699696] 00000000: 22 10 53 14 07 00 10 00 00 00 04 06 10 00 81 00
+[    0.699696] 00000010: 00 00 00 00 00 00 00 00 00 01 09 00 c1 d1 00 20
+[    0.699697] 00000020: 20 f7 50 f7 01 f4 f1 f5 00 00 00 00 00 00 00 00
+[    0.699697] 00000030: 00 00 00 00 50 00 00 00 00 00 00 00 ff 00 10 00
+[    0.699697] 00000040: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
+[    0.699698] 00000050: 01 58 03 c8 00 00 00 00 10 a0 42 01 22 80 00 00
+[    0.699698] 00000060: 50 28 00 00 43 f8 72 01 40 00 43 70 00 00 04 00
+[    0.699699] 00000070: 00 00 40 01 00 00 01 00 00 00 00 00 bf 01 70 00
+[    0.699699] 00000080: 06 00 00 00 0e 00 00 00 03 00 1f 00 00 00 00 00
+[    0.699699] 00000090: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
+[    0.699700] 000000a0: 05 c0 80 00 00 00 00 00 00 00 00 00 00 00 00 00
+[    0.699700] 000000b0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
+[    0.699700] 000000c0: 0d c8 00 00 43 10 47 87 08 00 03 a8 00 00 00 00
+[    0.699701] 000000d0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
+[    0.699701] 000000e0: 00 00 00 00 ff ff ff ff 00 00 00 00 00 00 00 00
+[    0.699702] 000000f0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
+[    0.699804] pci 0000:00:01.3: PME# supported from D0 D3hot D3cold
+[    0.699904] pci 0000:00:02.0: [1022:1452] type 00 class 0x060000
+[    0.699905] pci 0000:00:02.0: config space:
+[    0.699934] 00000000: 22 10 52 14 00 00 00 00 00 00 00 06 00 00 80 00
+[    0.699935] 00000010: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
+[    0.699935] 00000020: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
+[    0.699935] 00000030: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
+[    0.699936] 00000040: 80 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
+[    0.699936] 00000050: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
+[    0.699937] 00000060: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
+[    0.699937] 00000070: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
+[    0.699937] 00000080: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
+[    0.699938] 00000090: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
+[    0.699938] 000000a0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
+[    0.699938] 000000b0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
+[    0.699939] 000000c0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
+[    0.699939] 000000d0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
+[    0.699939] 000000e0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
+[    0.699940] 000000f0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
+[    0.699942] pci 0000:00:02.0: disabling Extended Tags (this device can't handle them)
+[    0.700013] pci 0000:00:03.0: [1022:1452] type 00 class 0x060000
+[    0.700014] pci 0000:00:03.0: config space:
+[    0.701405] 00000000: 22 10 52 14 00 00 00 00 00 00 00 06 00 00 80 00
+[    0.701406] 00000010: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
+[    0.701406] 00000020: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
+[    0.701407] 00000030: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
+[    0.701407] 00000040: 80 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
+[    0.701407] 00000050: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
+[    0.701408] 00000060: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
+[    0.701408] 00000070: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
+[    0.701408] 00000080: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
+[    0.701409] 00000090: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
+[    0.701409] 000000a0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
+[    0.701410] 000000b0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
+[    0.701410] 000000c0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
+[    0.701410] 000000d0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
+[    0.701411] 000000e0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
+[    0.701411] 000000f0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
+[    0.701413] pci 0000:00:03.0: disabling Extended Tags (this device can't handle them)
+[    0.701475] pci 0000:00:03.1: [1022:1453] type 01 class 0x060400
+[    0.701475] pci 0000:00:03.1: config space:
+[    0.701521] 00000000: 22 10 53 14 07 00 10 00 00 00 04 06 10 00 81 00
+[    0.701522] 00000010: 00 00 00 00 00 00 00 00 00 0a 0a 00 e1 e1 00 20
+[    0.701522] 00000020: 00 f6 00 f7 01 e0 f1 f1 00 00 00 00 00 00 00 00
+[    0.701522] 00000030: 00 00 00 00 50 00 00 00 00 00 00 00 ff 00 18 00
+[    0.701523] 00000040: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
+[    0.701523] 00000050: 01 58 03 c8 00 00 00 00 10 a0 42 01 22 80 00 00
+[    0.701524] 00000060: 30 29 00 00 03 79 73 00 40 00 01 f1 00 00 04 00
+[    0.701524] 00000070: 00 00 40 01 00 00 01 00 00 00 00 00 bf 01 70 00
+[    0.701524] 00000080: 06 00 00 00 0e 00 00 00 03 00 1f 00 00 00 00 00
+[    0.701525] 00000090: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
+[    0.701525] 000000a0: 05 c0 80 00 00 00 00 00 00 00 00 00 00 00 00 00
+[    0.701526] 000000b0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
+[    0.701526] 000000c0: 0d c8 00 00 43 10 47 87 08 00 03 a8 00 00 00 00
+[    0.701526] 000000d0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
+[    0.701527] 000000e0: 00 00 00 00 ff ff ff ff 00 00 00 00 00 00 00 00
+[    0.701527] 000000f0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
+[    0.701564] pci 0000:00:03.1: disabling Extended Tags
+[    0.701651] pci 0000:00:03.1: PME# supported from D0 D3hot D3cold
+[    0.701768] pci 0000:00:04.0: [1022:1452] type 00 class 0x060000
+[    0.701769] pci 0000:00:04.0: config space:
+[    0.701799] 00000000: 22 10 52 14 00 00 00 00 00 00 00 06 00 00 80 00
+[    0.701799] 00000010: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
+[    0.701800] 00000020: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
+[    0.701800] 00000030: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
+[    0.701800] 00000040: 80 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
+[    0.701801] 00000050: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
+[    0.701801] 00000060: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
+[    0.701802] 00000070: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
+[    0.701802] 00000080: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
+[    0.701802] 00000090: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
+[    0.701803] 000000a0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
+[    0.701803] 000000b0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
+[    0.701803] 000000c0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
+[    0.701804] 000000d0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
+[    0.701804] 000000e0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
+[    0.701805] 000000f0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
+[    0.701807] pci 0000:00:04.0: disabling Extended Tags (this device can't handle them)
+[    0.701887] pci 0000:00:07.0: [1022:1452] type 00 class 0x060000
+[    0.701888] pci 0000:00:07.0: config space:
+[    0.701918] 00000000: 22 10 52 14 00 00 00 00 00 00 00 06 00 00 80 00
+[    0.701918] 00000010: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
+[    0.701918] 00000020: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
+[    0.701919] 00000030: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
+[    0.701919] 00000040: 80 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
+[    0.701920] 00000050: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
+[    0.701920] 00000060: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
+[    0.701920] 00000070: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
+[    0.701921] 00000080: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
+[    0.701921] 00000090: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
+[    0.701922] 000000a0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
+[    0.701922] 000000b0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
+[    0.701922] 000000c0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
+[    0.701923] 000000d0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
+[    0.701923] 000000e0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
+[    0.701923] 000000f0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
+[    0.701925] pci 0000:00:07.0: disabling Extended Tags (this device can't handle them)
+[    0.701985] pci 0000:00:07.1: [1022:1454] type 01 class 0x060400
+[    0.701986] pci 0000:00:07.1: config space:
+[    0.702018] 00000000: 22 10 54 14 07 00 10 00 00 00 04 06 10 00 81 00
+[    0.702019] 00000010: 00 00 00 00 00 00 00 00 00 0b 0b 00 f1 01 00 00
+[    0.702019] 00000020: 60 f7 80 f7 f1 ff 01 00 00 00 00 00 00 00 00 00
+[    0.702020] 00000030: ff 00 00 00 50 00 00 00 00 00 00 00 ff 01 10 00
+[    0.702020] 00000040: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
+[    0.702020] 00000050: 01 58 03 c8 00 00 00 00 10 a0 42 00 22 80 00 00
+[    0.702021] 00000060: 30 28 00 00 03 0d 70 00 40 00 03 71 00 00 00 00
+[    0.702021] 00000070: 00 00 40 00 00 00 01 00 00 00 00 00 00 00 00 00
+[    0.702022] 00000080: 00 00 00 00 0e 00 00 00 43 00 1f 00 00 00 00 00
+[    0.702022] 00000090: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
+[    0.702022] 000000a0: 05 c0 80 00 00 00 00 00 00 00 00 00 00 00 00 00
+[    0.702023] 000000b0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
+[    0.702023] 000000c0: 0d c8 00 00 22 10 54 14 08 00 03 a8 00 00 00 00
+[    0.702023] 000000d0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
+[    0.702024] 000000e0: 00 00 00 00 ff ff ff ff 00 00 00 00 00 00 00 00
+[    0.702024] 000000f0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
+[    0.702123] pci 0000:00:07.1: PME# supported from D0 D3hot D3cold
+[    0.702226] pci 0000:00:08.0: [1022:1452] type 00 class 0x060000
+[    0.702226] pci 0000:00:08.0: config space:
+[    0.702248] 00000000: 22 10 52 14 00 00 00 00 00 00 00 06 00 00 80 00
+[    0.702248] 00000010: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
+[    0.702249] 00000020: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
+[    0.702249] 00000030: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
+[    0.702250] 00000040: 80 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
+[    0.702250] 00000050: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
+[    0.702250] 00000060: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
+[    0.702251] 00000070: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
+[    0.702251] 00000080: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
+[    0.702252] 00000090: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
+[    0.702252] 000000a0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
+[    0.702252] 000000b0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
+[    0.702253] 000000c0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
+[    0.702253] 000000d0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
+[    0.702254] 000000e0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
+[    0.702254] 000000f0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
+[    0.702256] pci 0000:00:08.0: disabling Extended Tags (this device can't handle them)
+[    0.702318] pci 0000:00:08.1: [1022:1454] type 01 class 0x060400
+[    0.702318] pci 0000:00:08.1: config space:
+[    0.702997] 00000000: 22 10 54 14 07 00 10 00 00 00 04 06 10 00 81 00
+[    0.702997] 00000010: 00 00 00 00 00 00 00 00 00 0c 0c 00 f1 01 00 00
+[    0.702998] 00000020: 90 f7 90 f7 f1 ff 01 00 00 00 00 00 00 00 00 00
+[    0.702998] 00000030: ff 00 00 00 50 00 00 00 00 00 00 00 ff 01 10 00
+[    0.702999] 00000040: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
+[    0.702999] 00000050: 01 58 03 c8 00 00 00 00 10 a0 42 00 22 80 00 00
+[    0.702999] 00000060: 30 28 00 00 03 0d 70 00 40 00 03 71 00 00 00 00
+[    0.703000] 00000070: 00 00 40 00 00 00 01 00 00 00 00 00 00 00 00 00
+[    0.703000] 00000080: 00 00 00 00 0e 00 00 00 43 00 1f 00 00 00 00 00
+[    0.703001] 00000090: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
+[    0.703001] 000000a0: 05 c0 80 00 00 00 00 00 00 00 00 00 00 00 00 00
+[    0.703001] 000000b0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
+[    0.703002] 000000c0: 0d c8 00 00 22 10 54 14 08 00 03 a8 00 00 00 00
+[    0.703002] 000000d0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
+[    0.703003] 000000e0: 00 00 00 00 ff ff ff ff 00 00 00 00 00 00 00 00
+[    0.703003] 000000f0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
+[    0.703105] pci 0000:00:08.1: PME# supported from D0 D3hot D3cold
+[    0.703245] pci 0000:00:14.0: [1022:790b] type 00 class 0x0c0500
+[    0.703245] pci 0000:00:14.0: config space:
+[    0.703404] 00000000: 22 10 0b 79 03 04 20 02 59 00 05 0c 00 00 80 00
+[    0.703404] 00000010: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
+[    0.703405] 00000020: 00 00 00 00 00 00 00 00 00 00 00 00 43 10 47 87
+[    0.703405] 00000030: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
+[    0.703406] 00000040: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
+[    0.703406] 00000050: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
+[    0.703406] 00000060: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
+[    0.703407] 00000070: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
+[    0.703407] 00000080: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
+[    0.703407] 00000090: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
+[    0.703408] 000000a0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
+[    0.703408] 000000b0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
+[    0.703409] 000000c0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
+[    0.703409] 000000d0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
+[    0.703409] 000000e0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
+[    0.703410] 000000f0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
+[    0.703624] pci 0000:00:14.3: [1022:790e] type 00 class 0x060100
+[    0.703625] pci 0000:00:14.3: config space:
+[    0.703783] 00000000: 22 10 0e 79 0f 00 20 02 51 00 01 06 00 00 80 00
+[    0.703783] 00000010: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
+[    0.703784] 00000020: 00 00 00 00 00 00 00 00 00 00 00 00 43 10 47 87
+[    0.703784] 00000030: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
+[    0.703785] 00000040: 04 00 00 00 d5 ff 03 ff 07 ff 30 03 00 00 00 fd
+[    0.703785] 00000050: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
+[    0.703785] 00000060: 00 00 00 00 30 02 20 ff 00 00 0f 00 00 ff ff ff
+[    0.703786] 00000070: 67 45 23 00 0c 00 00 00 90 02 00 00 07 0a 00 00
+[    0.703786] 00000080: 08 00 03 a8 00 00 00 00 00 00 00 00 00 00 00 00
+[    0.703787] 00000090: 68 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
+[    0.703787] 000000a0: 02 00 c1 fe 2f 01 00 00 00 00 00 00 00 00 00 00
+[    0.703787] 000000b0: 00 00 00 00 00 00 00 00 04 00 e9 3f 00 00 00 00
+[    0.703788] 000000c0: 00 00 00 00 00 00 00 00 00 00 00 80 00 00 f7 ff
+[    0.703788] 000000d0: 86 ff fd 08 42 00 00 00 00 00 00 00 00 00 00 00
+[    0.703789] 000000e0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
+[    0.703789] 000000f0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
+[    0.704003] pci 0000:00:18.0: [1022:1460] type 00 class 0x060000
+[    0.704004] pci 0000:00:18.0: config space:
+[    0.704016] 00000000: 22 10 60 14 00 00 00 00 00 00 00 06 00 00 80 00
+[    0.704016] 00000010: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
+[    0.704016] 00000020: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
+[    0.704017] 00000030: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
+[    0.704017] 00000040: 13 00 00 00 2f 12 97 00 1f 1f 1f 0f 11 00 00 00
+[    0.704017] 00000050: 1f 07 00 00 00 00 00 00 00 00 00 00 00 00 00 00
+[    0.704018] 00000060: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
+[    0.704018] 00000070: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
+[    0.704019] 00000080: 41 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
+[    0.704020] 00000090: 01 00 00 00 00 00 00 00 05 04 04 04 04 04 04 04
+[    0.704020] 000000a0: 43 00 00 0c 40 00 00 00 40 00 00 00 40 00 00 00
+[    0.704021] 000000b0: 40 00 00 00 40 00 00 00 40 00 00 00 40 00 00 00
+[    0.704021] 000000c0: 13 c0 00 00 04 e0 00 00 00 00 00 00 04 00 00 00
+[    0.704021] 000000d0: 00 00 00 00 04 00 00 00 00 00 00 00 04 00 00 00
+[    0.704022] 000000e0: 00 00 00 00 04 00 00 00 00 00 00 00 04 00 00 00
+[    0.704022] 000000f0: 00 00 00 00 04 00 00 00 00 00 00 00 04 00 00 00
+[    0.704069] pci 0000:00:18.1: [1022:1461] type 00 class 0x060000
+[    0.704069] pci 0000:00:18.1: config space:
+[    0.704081] 00000000: 22 10 61 14 00 00 00 00 00 00 00 06 00 00 80 00
+[    0.704082] 00000010: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
+[    0.704082] 00000020: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
+[    0.704082] 00000030: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
+[    0.704083] 00000040: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
+[    0.704083] 00000050: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
+[    0.704084] 00000060: 05 05 04 04 00 00 00 00 00 00 00 00 00 00 00 00
+[    0.704084] 00000070: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
+[    0.704084] 00000080: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
+[    0.704085] 00000090: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
+[    0.704085] 000000a0: 00 42 42 42 ff 01 ff 01 e0 00 00 00 00 00 00 00
+[    0.704085] 000000b0: 01 00 00 00 00 00 00 00 08 00 00 00 00 00 00 00
+[    0.704086] 000000c0: 01 00 00 00 81 fc 06 00 00 00 00 00 00 00 00 00
+[    0.704086] 000000d0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
+[    0.704087] 000000e0: 00 00 00 00 00 00 00 00 00 00 00 00 1f bf 1f 0b
+[    0.704087] 000000f0: 0f 5d 1d 05 1f 7f bf 05 1f bf ff 03 0f 57 f7 01
+[    0.704134] pci 0000:00:18.2: [1022:1462] type 00 class 0x060000
+[    0.704134] pci 0000:00:18.2: config space:
+[    0.704146] 00000000: 22 10 62 14 00 00 00 00 00 00 00 06 00 00 80 00
+[    0.704147] 00000010: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
+[    0.704147] 00000020: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
+[    0.704148] 00000030: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
+[    0.704148] 00000040: 80 10 1f 00 08 09 40 09 80 00 00 00 11 00 00 00
+[    0.704148] 00000050: 04 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
+[    0.704149] 00000060: 00 00 00 00 00 00 00 00 19 50 06 00 11 06 04 10
+[    0.704149] 00000070: 00 01 00 02 00 04 00 08 00 10 00 20 00 40 00 80
+[    0.704149] 00000080: 0f de 00 00 ff df 00 00 07 00 00 06 00 00 00 00
+[    0.704150] 00000090: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
+[    0.704150] 000000a0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
+[    0.704150] 000000b0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
+[    0.704151] 000000c0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
+[    0.704151] 000000d0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
+[    0.704152] 000000e0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
+[    0.704152] 000000f0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
+[    0.704198] pci 0000:00:18.3: [1022:1463] type 00 class 0x060000
+[    0.704199] pci 0000:00:18.3: config space:
+[    0.704211] 00000000: 22 10 63 14 00 00 00 00 00 00 00 06 00 00 80 00
+[    0.704211] 00000010: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
+[    0.704212] 00000020: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
+[    0.704212] 00000030: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
+[    0.704212] 00000040: 04 00 00 00 00 00 00 00 01 00 00 00 27 01 00 00
+[    0.704213] 00000050: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
+[    0.704213] 00000060: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
+[    0.704214] 00000070: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
+[    0.704214] 00000080: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
+[    0.704214] 00000090: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
+[    0.704215] 000000a0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
+[    0.704215] 000000b0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
+[    0.704215] 000000c0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
+[    0.704216] 000000d0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
+[    0.704216] 000000e0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
+[    0.704216] 000000f0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
+[    0.704263] pci 0000:00:18.4: [1022:1464] type 00 class 0x060000
+[    0.704264] pci 0000:00:18.4: config space:
+[    0.704276] 00000000: 22 10 64 14 00 00 00 00 00 00 00 06 00 00 80 00
+[    0.704276] 00000010: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
+[    0.704277] 00000020: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
+[    0.704277] 00000030: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
+[    0.704277] 00000040: 02 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
+[    0.704278] 00000050: 51 10 01 00 41 18 03 00 00 00 00 00 89 01 04 00
+[    0.704278] 00000060: 08 02 00 00 00 00 00 00 00 00 00 00 00 00 00 00
+[    0.704278] 00000070: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
+[    0.704279] 00000080: 04 00 00 00 04 00 00 00 04 00 00 00 04 00 00 00
+[    0.704279] 00000090: 22 10 60 14 22 10 60 14 00 00 00 00 00 00 00 00
+[    0.704280] 000000a0: 43 00 00 00 43 00 00 00 22 10 60 14 22 10 60 14
+[    0.704280] 000000b0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
+[    0.704280] 000000c0: 01 00 00 00 01 00 02 00 00 00 02 01 03 0b 0e 00
+[    0.704281] 000000d0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
+[    0.704281] 000000e0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
+[    0.704281] 000000f0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
+[    0.704327] pci 0000:00:18.5: [1022:1465] type 00 class 0x060000
+[    0.704328] pci 0000:00:18.5: config space:
+[    0.704340] 00000000: 22 10 65 14 00 00 00 00 00 00 00 06 00 00 80 00
+[    0.704340] 00000010: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
+[    0.704340] 00000020: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
+[    0.704341] 00000030: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
+[    0.704341] 00000040: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
+[    0.704342] 00000050: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
+[    0.704342] 00000060: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
+[    0.704342] 00000070: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
+[    0.704343] 00000080: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
+[    0.704343] 00000090: 00 00 d7 01 01 00 00 00 01 00 00 00 00 00 00 00
+[    0.704343] 000000a0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
+[    0.704344] 000000b0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
+[    0.704344] 000000c0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
+[    0.704344] 000000d0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
+[    0.704345] 000000e0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
+[    0.704345] 000000f0: 00 00 00 00 00 00 00 00 00 00 00 00 80 00 00 00
+[    0.704391] pci 0000:00:18.6: [1022:1466] type 00 class 0x060000
+[    0.704391] pci 0000:00:18.6: config space:
+[    0.704403] 00000000: 22 10 66 14 00 00 00 00 00 00 00 06 00 00 80 00
+[    0.704404] 00000010: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
+[    0.704404] 00000020: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
+[    0.704404] 00000030: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
+[    0.704405] 00000040: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
+[    0.704405] 00000050: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
+[    0.704405] 00000060: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
+[    0.704406] 00000070: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
+[    0.704406] 00000080: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
+[    0.704406] 00000090: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
+[    0.704407] 000000a0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
+[    0.704407] 000000b0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
+[    0.704408] 000000c0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
+[    0.704408] 000000d0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 0f 00
+[    0.704408] 000000e0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
+[    0.704409] 000000f0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
+[    0.704455] pci 0000:00:18.7: [1022:1467] type 00 class 0x060000
+[    0.704456] pci 0000:00:18.7: config space:
+[    0.704468] 00000000: 22 10 67 14 00 00 00 00 00 00 00 06 00 00 80 00
+[    0.704468] 00000010: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
+[    0.704468] 00000020: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
+[    0.704469] 00000030: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
+[    0.704469] 00000040: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
+[    0.704469] 00000050: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
+[    0.704470] 00000060: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
+[    0.704470] 00000070: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
+[    0.704471] 00000080: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
+[    0.704471] 00000090: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
+[    0.704471] 000000a0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
+[    0.704472] 000000b0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
+[    0.704472] 000000c0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
+[    0.704472] 000000d0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
+[    0.704473] 000000e0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
+[    0.704473] 000000f0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
+[    0.705139] pci 0000:01:00.0: [1022:43d0] type 00 class 0x0c0330
+[    0.705140] pci 0000:01:00.0: config space:
+[    0.705191] 00000000: 22 10 d0 43 06 00 10 00 01 30 03 0c 10 00 80 00
+[    0.705191] 00000010: 04 00 5a f7 00 00 00 00 00 00 00 00 00 00 00 00
+[    0.705191] 00000020: 00 00 00 00 00 00 00 00 00 00 00 00 21 1b 42 11
+[    0.705192] 00000030: 00 00 00 00 50 00 00 00 00 00 00 00 0b 01 00 00
+[    0.705192] 00000040: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
+[    0.705193] 00000050: 05 68 86 00 00 00 00 00 00 00 00 00 00 00 00 00
+[    0.705193] 00000060: 31 40 00 00 00 00 00 00 11 78 07 00 00 20 00 00
+[    0.705193] 00000070: 80 20 00 00 00 00 00 00 01 80 43 c0 08 00 00 00
+[    0.705194] 00000080: 10 00 12 00 22 8c 00 00 50 28 19 00 43 dc 42 00
+[    0.705194] 00000090: 40 00 43 10 00 00 00 00 00 00 40 00 00 00 00 00
+[    0.705194] 000000a0: 00 00 00 00 00 08 00 00 00 00 00 00 0e 00 00 00
+[    0.705195] 000000b0: 03 00 06 00 00 00 00 00 00 00 00 00 00 00 00 00
+[    0.705195] 000000c0: 00 00 00 00 21 1b 01 02 00 00 00 00 00 00 00 00
+[    0.705196] 000000d0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
+[    0.705196] 000000e0: 00 00 00 00 00 00 01 60 00 00 00 00 00 00 00 00
+[    0.705196] 000000f0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
+[    0.705217] pci 0000:01:00.0: reg 0x10: [mem 0xf75a0000-0xf75a7fff 64bit]
+[    0.705290] pci 0000:01:00.0: PME# supported from D3hot D3cold
+[    0.705357] pci 0000:01:00.1: [1022:43c8] type 00 class 0x010601
+[    0.705358] pci 0000:01:00.1: config space:
+[    0.705408] 00000000: 22 10 c8 43 06 00 10 00 01 01 06 01 10 00 80 00
+[    0.705409] 00000010: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
+[    0.705409] 00000020: 00 00 00 00 00 00 58 f7 00 00 00 00 21 1b 62 10
+[    0.705409] 00000030: 00 00 50 f7 50 00 00 00 00 00 00 00 0a 02 00 00
+[    0.705410] 00000040: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
+[    0.705410] 00000050: 05 78 80 00 00 00 00 00 00 00 00 00 00 00 00 00
+[    0.705410] 00000060: 00 00 00 00 00 00 00 00 11 78 07 00 00 20 00 00
+[    0.705411] 00000070: 80 20 00 00 00 00 00 00 01 80 43 c0 08 00 00 00
+[    0.705411] 00000080: 10 00 12 00 22 8c 00 00 50 28 19 00 43 dc 42 00
+[    0.705412] 00000090: 40 00 43 10 00 00 00 00 00 00 40 00 00 00 00 00
+[    0.705412] 000000a0: 00 00 00 00 00 00 00 00 00 00 00 00 0e 00 00 00
+[    0.705412] 000000b0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
+[    0.705413] 000000c0: 00 00 00 00 21 1b 01 02 00 00 00 00 00 00 00 00
+[    0.705413] 000000d0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
+[    0.705414] 000000e0: cc 0d 00 00 01 01 01 01 00 00 00 00 00 00 00 00
+[    0.705414] 000000f0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
+[    0.705456] pci 0000:01:00.1: reg 0x24: [mem 0xf7580000-0xf759ffff]
+[    0.705463] pci 0000:01:00.1: reg 0x30: [mem 0xf7500000-0xf757ffff pref]
+[    0.705498] pci 0000:01:00.1: PME# supported from D3hot D3cold
+[    0.705547] pci 0000:01:00.2: [1022:43c6] type 01 class 0x060400
+[    0.705548] pci 0000:01:00.2: config space:
+[    0.705598] 00000000: 22 10 c6 43 07 00 10 00 01 00 04 06 10 00 81 00
+[    0.705599] 00000010: 00 00 00 00 00 00 00 00 01 02 09 00 c1 d1 00 00
+[    0.705599] 00000020: 20 f7 40 f7 01 f4 f1 f5 00 00 00 00 00 00 00 00
+[    0.705600] 00000030: 00 00 00 00 50 00 00 00 00 00 00 00 0f 03 10 00
+[    0.705600] 00000040: 04 00 c3 fe 00 00 00 00 01 00 00 00 00 00 00 00
+[    0.705600] 00000050: 05 78 80 00 00 00 00 00 00 00 00 00 00 00 00 00
+[    0.705601] 00000060: 00 00 00 00 00 00 00 00 11 78 07 00 00 20 00 00
+[    0.705601] 00000070: 80 20 00 00 00 00 00 00 01 80 43 c0 08 00 00 00
+[    0.705601] 00000080: 10 c0 52 00 22 80 00 00 50 28 19 00 43 dc 42 00
+[    0.705602] 00000090: 40 00 43 10 00 00 00 00 00 00 40 00 00 00 00 00
+[    0.705602] 000000a0: 00 00 00 00 00 00 00 00 00 00 00 00 0e 00 00 00
+[    0.705603] 000000b0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
+[    0.705603] 000000c0: 0d 00 00 00 21 1b 01 02 00 00 00 00 00 00 00 00
+[    0.705603] 000000d0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
+[    0.705604] 000000e0: 63 1a 97 da 14 ba 42 8a 45 c7 71 32 a5 f4 2c 2d
+[    0.705604] 000000f0: a8 39 1e bc 74 d8 da a1 95 9d 8c 64 3f 1a 77 70
+[    0.705671] pci 0000:01:00.2: PME# supported from D3hot D3cold
+[    0.705746] pci 0000:00:01.3: PCI bridge to [bus 01-09]
+[    0.705749] pci 0000:00:01.3:   bridge window [io  0xc000-0xdfff]
+[    0.705751] pci 0000:00:01.3:   bridge window [mem 0xf7200000-0xf75fffff]
+[    0.705754] pci 0000:00:01.3:   bridge window [mem 0xf4000000-0xf5ffffff 64bit pref]
+[    0.705841] pci 0000:02:00.0: [1022:43c7] type 01 class 0x060400
+[    0.705842] pci 0000:02:00.0: config space:
+[    0.705895] 00000000: 22 10 c7 43 03 00 10 00 01 00 04 06 10 00 01 00
+[    0.705896] 00000010: 00 00 00 00 00 00 00 00 02 03 03 00 f1 01 00 00
+[    0.705896] 00000020: f0 ff 00 00 f1 ff 01 00 00 00 00 00 00 00 00 00
+[    0.705896] 00000030: ff 00 00 00 50 00 00 00 00 00 00 00 0b 01 10 00
+[    0.705897] 00000040: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
+[    0.705897] 00000050: 05 78 80 00 00 00 00 00 00 00 00 00 00 00 00 00
+[    0.705898] 00000060: 00 00 00 00 00 00 00 00 11 78 07 00 00 20 00 00
+[    0.705898] 00000070: 80 20 00 00 00 00 00 00 01 80 43 c0 08 00 00 00
+[    0.705898] 00000080: 10 c0 62 01 22 80 00 00 50 28 10 00 22 7c 73 00
+[    0.705899] 00000090: 00 00 01 10 00 0d 08 00 00 00 48 00 00 00 00 00
+[    0.705899] 000000a0: 00 00 00 00 00 08 00 00 00 00 00 00 06 00 00 00
+[    0.705899] 000000b0: 02 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
+[    0.705900] 000000c0: 0d 00 00 00 21 1b 06 33 00 00 00 00 00 00 00 00
+[    0.705900] 000000d0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
+[    0.705900] 000000e0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
+[    0.705901] 000000f0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
+[    0.705979] pci 0000:02:00.0: PME# supported from D3hot D3cold
+[    0.706043] pci 0000:02:02.0: [1022:43c7] type 01 class 0x060400
+[    0.706043] pci 0000:02:02.0: config space:
+[    0.706097] 00000000: 22 10 c7 43 03 00 10 00 01 00 04 06 10 00 01 00
+[    0.706097] 00000010: 00 00 00 00 00 00 00 00 02 04 04 00 f1 01 00 00
+[    0.706097] 00000020: f0 ff 00 00 f1 ff 01 00 00 00 00 00 00 00 00 00
+[    0.706098] 00000030: ff 00 00 00 50 00 00 00 00 00 00 00 0f 01 10 00
+[    0.706098] 00000040: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
+[    0.706098] 00000050: 05 78 80 00 00 00 00 00 00 00 00 00 00 00 00 00
+[    0.706099] 00000060: 00 00 00 00 00 00 00 00 11 78 07 00 00 20 00 00
+[    0.706099] 00000070: 80 20 00 00 00 00 00 00 01 80 43 c0 08 00 00 00
+[    0.706100] 00000080: 10 c0 62 01 22 80 00 00 50 28 10 00 12 7c 73 02
+[    0.706100] 00000090: 00 00 11 10 00 0d 08 00 00 00 00 00 00 00 00 00
+[    0.706100] 000000a0: 00 00 00 00 00 08 00 00 00 00 00 00 06 00 00 00
+[    0.706101] 000000b0: 02 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
+[    0.706101] 000000c0: 0d 00 00 00 21 1b 06 33 00 00 00 00 00 00 00 00
+[    0.706101] 000000d0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
+[    0.706102] 000000e0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
+[    0.706102] 000000f0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
+[    0.706180] pci 0000:02:02.0: PME# supported from D3hot D3cold
+[    0.706243] pci 0000:02:03.0: [1022:43c7] type 01 class 0x060400
+[    0.706244] pci 0000:02:03.0: config space:
+[    0.706297] 00000000: 22 10 c7 43 07 00 10 00 01 00 04 06 10 00 01 00
+[    0.706297] 00000010: 00 00 00 00 00 00 00 00 02 05 05 00 d1 d1 00 00
+[    0.706298] 00000020: 40 f7 40 f7 01 f4 f1 f5 00 00 00 00 00 00 00 00
+[    0.706298] 00000030: 00 00 00 00 50 00 00 00 00 00 00 00 05 01 10 00
+[    0.706298] 00000040: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
+[    0.706299] 00000050: 05 78 80 00 00 00 00 00 00 00 00 00 00 00 00 00
+[    0.706299] 00000060: 00 00 00 00 00 00 00 00 11 78 07 00 00 20 00 00
+[    0.706299] 00000070: 80 20 00 00 00 00 00 00 01 80 43 c0 08 00 00 00
+[    0.706300] 00000080: 10 c0 62 01 22 80 00 00 50 28 10 00 12 7c 73 03
+[    0.706300] 00000090: 00 00 11 30 00 0d 08 00 00 00 48 01 00 00 00 00
+[    0.706300] 000000a0: 00 00 00 00 00 08 00 00 00 00 00 00 06 00 00 00
+[    0.706301] 000000b0: 02 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
+[    0.706301] 000000c0: 0d 00 00 00 21 1b 06 33 00 00 00 00 00 00 00 00
+[    0.706302] 000000d0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
+[    0.706302] 000000e0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
+[    0.706302] 000000f0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
+[    0.706380] pci 0000:02:03.0: PME# supported from D3hot D3cold
+[    0.706442] pci 0000:02:04.0: [1022:43c7] type 01 class 0x060400
+[    0.706443] pci 0000:02:04.0: config space:
+[    0.706496] 00000000: 22 10 c7 43 07 00 10 00 01 00 04 06 10 00 01 00
+[    0.706496] 00000010: 00 00 00 00 00 00 00 00 02 06 06 00 f1 01 00 00
+[    0.706497] 00000020: 30 f7 30 f7 f1 ff 01 00 00 00 00 00 00 00 00 00
+[    0.706497] 00000030: ff 00 00 00 50 00 00 00 00 00 00 00 0b 01 10 00
+[    0.706497] 00000040: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
+[    0.706498] 00000050: 05 78 80 00 00 00 00 00 00 00 00 00 00 00 00 00
+[    0.706498] 00000060: 00 00 00 00 00 00 00 00 11 78 07 00 00 20 00 00
+[    0.706498] 00000070: 80 20 00 00 00 00 00 00 01 80 43 c0 08 00 00 00
+[    0.706499] 00000080: 10 c0 62 01 22 80 00 00 50 28 10 00 22 7c 73 04
+[    0.706499] 00000090: 40 00 22 70 00 0d 08 00 00 00 48 01 00 00 00 00
+[    0.706499] 000000a0: 00 00 00 00 00 08 00 00 00 00 00 00 06 00 00 00
+[    0.706500] 000000b0: 02 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
+[    0.706500] 000000c0: 0d 00 00 00 21 1b 06 33 00 00 00 00 00 00 00 00
+[    0.706501] 000000d0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
+[    0.706501] 000000e0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
+[    0.706501] 000000f0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
+[    0.706579] pci 0000:02:04.0: PME# supported from D3hot D3cold
+[    0.706643] pci 0000:02:06.0: [1022:43c7] type 01 class 0x060400
+[    0.706644] pci 0000:02:06.0: config space:
+[    0.706698] 00000000: 22 10 c7 43 03 00 10 00 01 00 04 06 10 00 01 00
+[    0.706699] 00000010: 00 00 00 00 00 00 00 00 02 07 07 00 f1 01 00 00
+[    0.706699] 00000020: f0 ff 00 00 f1 ff 01 00 00 00 00 00 00 00 00 00
+[    0.706699] 00000030: ff 00 00 00 50 00 00 00 00 00 00 00 0f 01 10 00
+[    0.706700] 00000040: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
+[    0.706700] 00000050: 05 78 80 00 00 00 00 00 00 00 00 00 00 00 00 00
+[    0.706701] 00000060: 00 00 00 00 00 00 00 00 11 78 07 00 00 20 00 00
+[    0.706701] 00000070: 80 20 00 00 00 00 00 00 01 80 43 c0 08 00 00 00
+[    0.706701] 00000080: 10 c0 62 01 22 80 00 00 50 28 10 00 12 7c 73 06
+[    0.706702] 00000090: 00 00 11 10 00 0d 08 00 00 00 00 00 00 00 00 00
+[    0.706702] 000000a0: 00 00 00 00 00 08 00 00 00 00 00 00 06 00 00 00
+[    0.706702] 000000b0: 02 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
+[    0.706703] 000000c0: 0d 00 00 00 21 1b 06 33 00 00 00 00 00 00 00 00
+[    0.706703] 000000d0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
+[    0.706704] 000000e0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
+[    0.706704] 000000f0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
+[    0.706782] pci 0000:02:06.0: PME# supported from D3hot D3cold
+[    0.706847] pci 0000:02:07.0: [1022:43c7] type 01 class 0x060400
+[    0.706848] pci 0000:02:07.0: config space:
+[    0.706902] 00000000: 22 10 c7 43 07 00 10 00 01 00 04 06 10 00 01 00
+[    0.706902] 00000010: 00 00 00 00 00 00 00 00 02 08 08 00 c1 c1 00 00
+[    0.706903] 00000020: 20 f7 20 f7 f1 ff 01 00 00 00 00 00 00 00 00 00
+[    0.706903] 00000030: 00 00 00 00 50 00 00 00 00 00 00 00 05 01 10 00
+[    0.706904] 00000040: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
+[    0.706904] 00000050: 05 78 80 00 00 00 00 00 00 00 00 00 00 00 00 00
+[    0.706905] 00000060: 00 00 00 00 00 00 00 00 11 78 07 00 00 20 00 00
+[    0.706905] 00000070: 80 20 00 00 00 00 00 00 01 80 43 c0 08 00 00 00
+[    0.706906] 00000080: 10 c0 62 01 22 80 00 00 50 28 10 00 12 7c 73 07
+[    0.706906] 00000090: 40 00 11 70 00 0d 08 00 00 00 48 01 00 00 00 00
+[    0.706907] 000000a0: 00 00 00 00 00 08 00 00 00 00 00 00 06 00 00 00
+[    0.706907] 000000b0: 02 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
+[    0.706907] 000000c0: 0d 00 00 00 21 1b 06 33 00 00 00 00 00 00 00 00
+[    0.706908] 000000d0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
+[    0.706908] 000000e0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
+[    0.706909] 000000f0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
+[    0.706987] pci 0000:02:07.0: PME# supported from D3hot D3cold
+[    0.707057] pci 0000:02:09.0: [1022:43c7] type 01 class 0x060400
+[    0.707058] pci 0000:02:09.0: config space:
+[    0.707111] 00000000: 22 10 c7 43 03 00 10 00 01 00 04 06 10 00 01 00
+[    0.707111] 00000010: 00 00 00 00 00 00 00 00 02 09 09 00 f1 01 00 00
+[    0.707112] 00000020: f0 ff 00 00 f1 ff 01 00 00 00 00 00 00 00 00 00
+[    0.707112] 00000030: ff 00 00 00 50 00 00 00 00 00 00 00 0a 01 10 00
+[    0.707113] 00000040: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
+[    0.707113] 00000050: 05 78 80 00 00 00 00 00 00 00 00 00 00 00 00 00
+[    0.707113] 00000060: 00 00 00 00 00 00 00 00 11 78 07 00 00 20 00 00
+[    0.707114] 00000070: 80 20 00 00 00 00 00 00 01 80 43 c0 08 00 00 00
+[    0.707114] 00000080: 10 c0 62 01 22 80 00 00 50 28 10 00 23 78 73 09
+[    0.707114] 00000090: 00 00 01 10 00 0d 08 00 00 00 48 00 00 00 00 00
+[    0.707115] 000000a0: 00 00 00 00 00 08 00 00 00 00 00 00 0e 00 00 00
+[    0.707115] 000000b0: 03 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
+[    0.707115] 000000c0: 0d 00 00 00 21 1b 06 33 00 00 00 00 00 00 00 00
+[    0.707116] 000000d0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
+[    0.707116] 000000e0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
+[    0.707117] 000000f0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
+[    0.707194] pci 0000:02:09.0: PME# supported from D3hot D3cold
+[    0.707270] pci 0000:01:00.2: PCI bridge to [bus 02-09]
+[    0.707274] pci 0000:01:00.2:   bridge window [io  0xc000-0xdfff]
+[    0.707276] pci 0000:01:00.2:   bridge window [mem 0xf7200000-0xf74fffff]
+[    0.707280] pci 0000:01:00.2:   bridge window [mem 0xf4000000-0xf5ffffff 64bit pref]
+[    0.707315] pci 0000:02:00.0: PCI bridge to [bus 03]
+[    0.707358] pci 0000:02:02.0: PCI bridge to [bus 04]
+[    0.707419] pci 0000:05:00.0: [13c1:1004] type 00 class 0x010400
+[    0.707419] pci 0000:05:00.0: config space:
+[    0.707529] 00000000: c1 13 04 10 07 00 10 00 01 00 04 01 10 00 00 00
+[    0.707529] 00000010: 0c 00 00 f4 00 00 00 00 04 00 42 f7 00 00 00 00
+[    0.707530] 00000020: 01 d0 00 00 00 00 00 00 00 00 00 00 c1 13 04 10
+[    0.707530] 00000030: 00 00 40 f7 40 00 00 00 00 00 00 00 05 01 00 00
+[    0.707530] 00000040: 01 50 02 06 00 00 00 00 00 00 00 00 00 00 00 00
+[    0.707531] 00000050: 05 70 8a 00 00 00 00 00 00 00 00 00 00 00 00 00
+[    0.707531] 00000060: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
+[    0.707531] 00000070: 10 00 11 00 42 82 68 00 50 28 00 00 81 3c 13 00
+[    0.707532] 00000080: 08 00 11 20 00 00 00 00 c0 03 00 00 00 00 00 00
+[    0.707532] 00000090: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
+[    0.707532] 000000a0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
+[    0.707533] 000000b0: 04 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
+[    0.707533] 000000c0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
+[    0.707534] 000000d0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
+[    0.707534] 000000e0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
+[    0.707534] 000000f0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
+[    0.707571] pci 0000:05:00.0: reg 0x10: [mem 0xf4000000-0xf5ffffff 64bit pref]
+[    0.707591] pci 0000:05:00.0: reg 0x18: [mem 0xf7420000-0xf7420fff 64bit]
+[    0.707604] pci 0000:05:00.0: reg 0x20: [io  0xd000-0xd0ff]
+[    0.707629] pci 0000:05:00.0: reg 0x30: [mem 0xf7400000-0xf741ffff pref]
+[    0.707699] pci 0000:05:00.0: supports D1 D2
+[    0.707734] pci 0000:05:00.0: 2.000 Gb/s available PCIe bandwidth, limited by 2.5 GT/s x1 link at 0000:02:03.0 (capable of 16.000 Gb/s with 2.5 GT/s x8 link)
+[    0.716692] pci 0000:02:03.0: PCI bridge to [bus 05]
+[    0.716696] pci 0000:02:03.0:   bridge window [io  0xd000-0xdfff]
+[    0.716698] pci 0000:02:03.0:   bridge window [mem 0xf7400000-0xf74fffff]
+[    0.716703] pci 0000:02:03.0:   bridge window [mem 0xf4000000-0xf5ffffff 64bit pref]
+[    0.716756] pci 0000:06:00.0: [1b21:1242] type 00 class 0x0c0330
+[    0.716756] pci 0000:06:00.0: config space:
+[    0.716856] 00000000: 21 1b 42 12 06 00 10 00 00 30 03 0c 10 00 00 00
+[    0.716856] 00000010: 04 00 30 f7 00 00 00 00 00 00 00 00 00 00 00 00
+[    0.716856] 00000020: 00 00 00 00 00 00 00 00 00 00 00 00 43 10 75 86
+[    0.716857] 00000030: 00 00 00 00 50 00 00 00 00 00 00 00 0b 01 00 00
+[    0.716857] 00000040: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
+[    0.716857] 00000050: 05 68 86 00 00 00 00 00 00 00 00 00 00 00 00 00
+[    0.716858] 00000060: 30 20 00 00 00 00 00 00 11 78 07 00 00 20 00 00
+[    0.716858] 00000070: 80 20 00 00 00 00 00 00 01 80 43 c0 08 00 00 00
+[    0.716859] 00000080: 10 00 02 00 22 82 68 00 50 28 10 00 22 dc 43 01
+[    0.716859] 00000090: 40 00 22 10 00 00 00 00 00 00 00 00 00 00 00 00
+[    0.716859] 000000a0: 00 00 00 00 00 08 00 00 00 00 00 00 06 00 00 00
+[    0.716860] 000000b0: 03 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
+[    0.716860] 000000c0: 00 00 00 00 21 1b 42 12 00 00 00 00 00 00 00 00
+[    0.716860] 000000d0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
+[    0.716861] 000000e0: 00 00 00 00 c9 4f 01 32 00 00 00 00 00 00 00 00
+[    0.716861] 000000f0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
+[    0.716899] pci 0000:06:00.0: reg 0x10: [mem 0xf7300000-0xf7307fff 64bit]
+[    0.717042] pci 0000:06:00.0: PME# supported from D3hot D3cold
+[    0.717168] pci 0000:02:04.0: PCI bridge to [bus 06]
+[    0.717174] pci 0000:02:04.0:   bridge window [mem 0xf7300000-0xf73fffff]
+[    0.717212] pci 0000:02:06.0: PCI bridge to [bus 07]
+[    0.717280] pci 0000:08:00.0: [8086:1539] type 00 class 0x020000
+[    0.717280] pci 0000:08:00.0: config space:
+[    0.717421] 00000000: 86 80 39 15 07 00 10 00 03 00 00 02 10 00 00 00
+[    0.717421] 00000010: 00 00 20 f7 00 00 00 00 01 c0 00 00 00 00 22 f7
+[    0.717422] 00000020: 00 00 00 00 00 00 00 00 00 00 00 00 43 10 f0 85
+[    0.717422] 00000030: 00 00 00 00 40 00 00 00 00 00 00 00 05 01 00 00
+[    0.717423] 00000040: 01 50 23 c8 08 20 00 00 00 00 00 00 00 00 00 00
+[    0.717423] 00000050: 05 70 80 01 00 00 00 00 00 00 00 00 00 00 00 00
+[    0.717423] 00000060: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
+[    0.717424] 00000070: 11 a0 04 00 03 00 00 00 03 20 00 00 00 00 00 00
+[    0.717424] 00000080: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
+[    0.717424] 00000090: 00 00 00 00 00 00 00 00 00 00 00 00 ff ff ff ff
+[    0.717425] 000000a0: 10 00 02 00 c2 8c 00 10 50 28 10 00 11 5c 42 07
+[    0.717425] 000000b0: 40 00 11 10 00 00 00 00 00 00 00 00 00 00 00 00
+[    0.717426] 000000c0: 00 00 00 00 1f 00 00 00 00 00 00 00 00 00 00 00
+[    0.717426] 000000d0: 01 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
+[    0.717426] 000000e0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
+[    0.717427] 000000f0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
+[    0.717470] pci 0000:08:00.0: reg 0x10: [mem 0xf7200000-0xf721ffff]
+[    0.717501] pci 0000:08:00.0: reg 0x18: [io  0xc000-0xc01f]
+[    0.717517] pci 0000:08:00.0: reg 0x1c: [mem 0xf7220000-0xf7223fff]
+[    0.717679] pci 0000:08:00.0: PME# supported from D0 D3hot D3cold
+[    0.717815] pci 0000:02:07.0: PCI bridge to [bus 08]
+[    0.717820] pci 0000:02:07.0:   bridge window [io  0xc000-0xcfff]
+[    0.717822] pci 0000:02:07.0:   bridge window [mem 0xf7200000-0xf72fffff]
+[    0.717853] pci 0000:02:09.0: PCI bridge to [bus 09]
+[    0.718185] pci 0000:0a:00.0: [10de:1b82] type 00 class 0x030000
+[    0.718185] pci 0000:0a:00.0: config space:
+[    0.718253] 00000000: de 10 82 1b 07 00 10 00 a1 00 00 03 10 00 80 00
+[    0.718253] 00000010: 00 00 00 f6 0c 00 00 e0 00 00 00 00 0c 00 00 f0
+[    0.718254] 00000020: 00 00 00 00 01 e0 00 00 00 00 00 00 de 10 9d 11
+[    0.718254] 00000030: 00 00 00 f7 60 00 00 00 00 00 00 00 04 01 00 00
+[    0.718254] 00000040: de 10 9d 11 00 00 00 00 00 00 00 00 00 00 00 00
+[    0.718255] 00000050: 01 00 00 00 01 00 00 00 ce d6 23 00 00 00 00 00
+[    0.718255] 00000060: 01 68 03 00 08 00 00 00 05 78 80 00 00 00 00 00
+[    0.718256] 00000070: 00 00 00 00 00 00 00 00 10 00 12 00 e1 8d 00 00
+[    0.718256] 00000080: 30 29 09 00 03 3d 45 00 40 00 01 11 00 00 00 00
+[    0.718256] 00000090: 00 00 00 00 00 00 00 00 00 00 00 00 13 08 04 00
+[    0.718257] 000000a0: 00 00 00 00 0e 00 00 00 03 00 1f 00 00 00 00 00
+[    0.718257] 000000b0: 00 00 00 00 09 00 14 01 00 00 00 00 00 00 00 00
+[    0.718258] 000000c0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
+[    0.718258] 000000d0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
+[    0.718258] 000000e0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
+[    0.718259] 000000f0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
+[    0.718285] pci 0000:0a:00.0: reg 0x10: [mem 0xf6000000-0xf6ffffff]
+[    0.718297] pci 0000:0a:00.0: reg 0x14: [mem 0xe0000000-0xefffffff 64bit pref]
+[    0.718310] pci 0000:0a:00.0: reg 0x1c: [mem 0xf0000000-0xf1ffffff 64bit pref]
+[    0.718318] pci 0000:0a:00.0: reg 0x24: [io  0xe000-0xe07f]
+[    0.718326] pci 0000:0a:00.0: reg 0x30: [mem 0xf7000000-0xf707ffff pref]
+[    0.718333] pci 0000:0a:00.0: disabling Extended Tags
+[    0.718341] pci 0000:0a:00.0: BAR 3: assigned to efifb
+[    0.718440] pci 0000:0a:00.0: 32.000 Gb/s available PCIe bandwidth, limited by 2.5 GT/s x16 link at 0000:00:03.1 (capable of 126.016 Gb/s with 8 GT/s x16 link)
+[    0.718478] pci 0000:0a:00.1: [10de:10f0] type 00 class 0x040300
+[    0.718479] pci 0000:0a:00.1: config space:
+[    0.718546] 00000000: de 10 f0 10 06 00 10 00 a1 00 03 04 10 00 80 00
+[    0.718547] 00000010: 00 00 08 f7 00 00 00 00 00 00 00 00 00 00 00 00
+[    0.718547] 00000020: 00 00 00 00 00 00 00 00 00 00 00 00 de 10 9d 11
+[    0.718548] 00000030: 00 00 00 00 60 00 00 00 00 00 00 00 0e 02 00 00
+[    0.718548] 00000040: de 10 9d 11 00 00 00 00 00 00 00 00 00 00 00 00
+[    0.718548] 00000050: 00 00 00 00 00 00 00 00 ce d6 23 00 00 00 00 00
+[    0.718549] 00000060: 01 68 03 00 08 00 00 00 05 78 80 00 00 00 00 00
+[    0.718549] 00000070: 00 00 00 00 00 00 00 00 10 00 02 00 e1 8d 00 00
+[    0.718550] 00000080: 30 29 09 00 03 3d 45 00 43 00 01 11 00 00 00 00
+[    0.718550] 00000090: 00 00 00 00 00 00 00 00 00 00 00 00 13 08 04 00
+[    0.718550] 000000a0: 00 00 00 00 0e 00 00 00 00 00 01 00 00 00 00 00
+[    0.718551] 000000b0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
+[    0.718551] 000000c0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
+[    0.718552] 000000d0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
+[    0.718552] 000000e0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
+[    0.718552] 000000f0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
+[    0.718571] pci 0000:0a:00.1: reg 0x10: [mem 0xf7080000-0xf7083fff]
+[    0.718622] pci 0000:0a:00.1: disabling Extended Tags
+[    0.718746] pci 0000:00:03.1: PCI bridge to [bus 0a]
+[    0.718749] pci 0000:00:03.1:   bridge window [io  0xe000-0xefff]
+[    0.718751] pci 0000:00:03.1:   bridge window [mem 0xf6000000-0xf70fffff]
+[    0.718754] pci 0000:00:03.1:   bridge window [mem 0xe0000000-0xf1ffffff 64bit pref]
+[    0.719068] pci 0000:0b:00.0: [1022:145a] type 00 class 0x130000
+[    0.719069] pci 0000:0b:00.0: config space:
+[    0.719093] 00000000: 22 10 5a 14 00 00 10 00 00 00 00 13 10 00 80 00
+[    0.719094] 00000010: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
+[    0.719094] 00000020: 00 00 00 00 00 00 00 00 00 00 00 00 22 10 5a 14
+[    0.719095] 00000030: 00 00 00 00 48 00 00 00 00 00 00 00 ff 00 00 00
+[    0.719095] 00000040: 00 00 00 00 00 00 00 00 09 50 08 00 22 10 5a 14
+[    0.719095] 00000050: 01 64 03 00 08 00 00 00 00 00 00 00 00 00 00 00
+[    0.719096] 00000060: 00 00 00 00 10 00 02 00 a1 8f 00 00 30 28 09 00
+[    0.719096] 00000070: 03 0d 40 00 40 00 03 11 00 00 00 00 00 00 00 00
+[    0.719097] 00000080: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
+[    0.719097] 00000090: 0e 00 00 00 03 00 1f 00 00 00 00 00 00 00 00 00
+[    0.719097] 000000a0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
+[    0.719098] 000000b0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
+[    0.719098] 000000c0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
+[    0.719099] 000000d0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
+[    0.719099] 000000e0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
+[    0.719099] 000000f0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
+[    0.719178] pci 0000:0b:00.2: [1022:1456] type 00 class 0x108000
+[    0.719179] pci 0000:0b:00.2: config space:
+[    0.719205] 00000000: 22 10 56 14 00 00 10 00 00 00 80 10 10 00 80 00
+[    0.719205] 00000010: 00 00 00 00 00 00 00 00 00 00 70 f7 00 00 00 00
+[    0.719206] 00000020: 00 00 00 00 00 00 80 f7 00 00 00 00 22 10 56 14
+[    0.719206] 00000030: 00 00 00 00 48 00 00 00 00 00 00 00 0b 02 00 00
+[    0.719206] 00000040: 00 00 00 00 00 00 00 00 09 50 08 00 22 10 56 14
+[    0.719207] 00000050: 01 64 03 00 08 00 00 00 00 00 00 00 00 00 00 00
+[    0.719207] 00000060: 00 00 00 00 10 a0 02 00 a1 8f 00 00 30 28 09 00
+[    0.719208] 00000070: 03 0d 40 00 40 00 03 11 00 00 00 00 00 00 00 00
+[    0.719208] 00000080: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
+[    0.719208] 00000090: 0e 00 00 00 00 00 01 00 00 00 00 00 00 00 00 00
+[    0.719209] 000000a0: 05 c0 82 00 00 00 00 00 00 00 00 00 00 00 00 00
+[    0.719209] 000000b0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
+[    0.719210] 000000c0: 11 00 01 00 05 00 00 00 05 10 00 00 00 00 00 00
+[    0.719210] 000000d0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
+[    0.719210] 000000e0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
+[    0.719211] 000000f0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
+[    0.719223] pci 0000:0b:00.2: reg 0x18: [mem 0xf7700000-0xf77fffff]
+[    0.719230] pci 0000:0b:00.2: reg 0x24: [mem 0xf7800000-0xf7801fff]
+[    0.719295] pci 0000:0b:00.3: [1022:145f] type 00 class 0x0c0330
+[    0.719295] pci 0000:0b:00.3: config space:
+[    0.719321] 00000000: 22 10 5f 14 07 00 10 00 00 30 03 0c 10 00 80 00
+[    0.719322] 00000010: 04 00 60 f7 00 00 00 00 00 00 00 00 00 00 00 00
+[    0.719322] 00000020: 00 00 00 00 00 00 00 00 00 00 00 00 43 10 47 87
+[    0.719322] 00000030: 00 00 00 00 48 00 00 00 00 00 00 00 0a 03 00 00
+[    0.719323] 00000040: 00 00 00 00 00 00 00 00 09 50 08 00 43 10 47 87
+[    0.719323] 00000050: 01 64 03 c8 00 00 00 00 00 00 00 00 00 00 00 00
+[    0.719324] 00000060: 30 20 00 00 10 a0 02 00 a1 8f 00 00 30 28 19 00
+[    0.719324] 00000070: 03 0d 40 00 40 00 03 11 00 00 00 00 00 00 00 00
+[    0.719324] 00000080: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
+[    0.719325] 00000090: 0e 00 00 00 00 00 01 00 00 00 00 00 00 00 00 00
+[    0.719325] 000000a0: 05 c0 86 00 00 00 00 00 00 00 00 00 00 00 00 00
+[    0.719326] 000000b0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
+[    0.719326] 000000c0: 11 00 07 00 00 e0 0f 00 00 f0 0f 00 00 00 00 00
+[    0.719326] 000000d0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
+[    0.719327] 000000e0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
+[    0.719327] 000000f0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
+[    0.719338] pci 0000:0b:00.3: reg 0x10: [mem 0xf7600000-0xf76fffff 64bit]
+[    0.719379] pci 0000:0b:00.3: PME# supported from D0 D3hot D3cold
+[    0.719429] pci 0000:00:07.1: PCI bridge to [bus 0b]
+[    0.719432] pci 0000:00:07.1:   bridge window [mem 0xf7600000-0xf78fffff]
+[    0.719776] pci 0000:0c:00.0: [1022:1455] type 00 class 0x130000
+[    0.719777] pci 0000:0c:00.0: config space:
+[    0.719803] 00000000: 22 10 55 14 00 00 10 00 00 00 00 13 10 00 80 00
+[    0.719803] 00000010: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
+[    0.719804] 00000020: 00 00 00 00 00 00 00 00 00 00 00 00 22 10 55 14
+[    0.719804] 00000030: 00 00 00 00 48 00 00 00 00 00 00 00 ff 00 00 00
+[    0.719804] 00000040: 00 00 00 00 00 00 00 00 09 50 08 00 22 10 55 14
+[    0.719805] 00000050: 01 64 03 00 08 00 00 00 00 00 00 00 00 00 00 00
+[    0.719805] 00000060: 00 00 00 00 10 00 02 00 a1 8f 00 00 30 28 09 00
+[    0.719806] 00000070: 03 0d 40 00 40 00 03 11 00 00 00 00 00 00 00 00
+[    0.719806] 00000080: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
+[    0.719806] 00000090: 0e 00 00 00 03 00 1f 00 00 00 00 00 00 00 00 00
+[    0.719807] 000000a0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
+[    0.719807] 000000b0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
+[    0.719807] 000000c0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
+[    0.719808] 000000d0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
+[    0.719808] 000000e0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
+[    0.719808] 000000f0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
+[    0.719891] pci 0000:0c:00.2: [1022:7901] type 00 class 0x010601
+[    0.719892] pci 0000:0c:00.2: config space:
+[    0.719920] 00000000: 22 10 01 79 07 00 10 00 51 01 06 01 10 00 80 00
+[    0.719921] 00000010: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
+[    0.719921] 00000020: 00 00 00 00 00 80 90 f7 00 00 00 00 43 10 47 87
+[    0.719921] 00000030: 00 00 00 00 48 00 00 00 00 00 00 00 0f 02 00 00
+[    0.719922] 00000040: 00 00 00 00 00 00 00 00 09 50 08 00 43 10 47 87
+[    0.719922] 00000050: 01 64 23 c0 08 00 00 00 00 00 00 00 00 00 00 00
+[    0.719922] 00000060: 00 00 00 00 10 a0 02 00 a1 8f 00 00 30 28 09 00
+[    0.719923] 00000070: 03 0d 40 00 40 00 03 11 00 00 00 00 00 00 00 00
+[    0.719923] 00000080: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
+[    0.719923] 00000090: 0e 00 00 00 00 00 01 00 00 00 00 00 00 00 00 00
+[    0.719924] 000000a0: 05 d0 88 00 00 00 00 00 00 00 00 00 00 00 00 00
+[    0.719924] 000000b0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
+[    0.719925] 000000c0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
+[    0.719925] 000000d0: 12 00 10 00 0f 00 00 00 00 00 00 00 00 ff 37 f7
+[    0.719925] 000000e0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
+[    0.719926] 000000f0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
+[    0.719951] pci 0000:0c:00.2: reg 0x24: [mem 0xf7908000-0xf7908fff]
+[    0.719980] pci 0000:0c:00.2: PME# supported from D3hot D3cold
+[    0.720024] pci 0000:0c:00.3: [1022:1457] type 00 class 0x040300
+[    0.720025] pci 0000:0c:00.3: config space:
+[    0.720052] 00000000: 22 10 57 14 00 00 10 00 00 00 03 04 10 00 80 00
+[    0.720052] 00000010: 00 00 90 f7 00 00 00 00 00 00 00 00 00 00 00 00
+[    0.720053] 00000020: 00 00 00 00 00 00 00 00 00 00 00 00 43 10 23 87
+[    0.720053] 00000030: 00 00 00 00 48 00 00 00 00 00 00 00 05 03 00 00
+[    0.720053] 00000040: 00 00 00 00 00 00 00 00 09 50 08 00 43 10 23 87
+[    0.720054] 00000050: 01 64 03 c8 08 00 00 00 00 00 00 00 00 00 00 00
+[    0.720054] 00000060: 00 00 00 00 10 a0 02 00 a1 8f 00 00 30 28 09 00
+[    0.720054] 00000070: 03 0d 40 00 40 00 03 11 00 00 00 00 00 00 00 00
+[    0.720055] 00000080: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
+[    0.720055] 00000090: 0e 00 00 00 00 00 01 00 00 00 00 00 00 00 00 00
+[    0.720055] 000000a0: 05 00 80 00 00 00 00 00 00 00 00 00 00 00 00 00
+[    0.720056] 000000b0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
+[    0.720056] 000000c0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
+[    0.720057] 000000d0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
+[    0.720057] 000000e0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
+[    0.720057] 000000f0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
+[    0.720066] pci 0000:0c:00.3: reg 0x10: [mem 0xf7900000-0xf7907fff]
+[    0.720105] pci 0000:0c:00.3: PME# supported from D0 D3hot D3cold
+[    0.720156] pci 0000:00:08.1: PCI bridge to [bus 0c]
+[    0.720159] pci 0000:00:08.1:   bridge window [mem 0xf7900000-0xf79fffff]
+[    0.720512] ACPI: PCI Interrupt Link [LNKA] (IRQs 4 5 7 10 11 14 15) *0
+[    0.720562] ACPI: PCI Interrupt Link [LNKB] (IRQs 4 5 7 10 11 14 15) *0
+[    0.720604] ACPI: PCI Interrupt Link [LNKC] (IRQs 4 5 7 10 11 14 15) *0
+[    0.720658] ACPI: PCI Interrupt Link [LNKD] (IRQs 4 5 7 10 11 14 15) *0
+[    0.720708] ACPI: PCI Interrupt Link [LNKE] (IRQs 4 5 7 10 11 14 15) *0
+[    0.720748] ACPI: PCI Interrupt Link [LNKF] (IRQs 4 5 7 10 11 14 15) *0
+[    0.720787] ACPI: PCI Interrupt Link [LNKG] (IRQs 4 5 7 10 11 14 15) *0
+[    0.720826] ACPI: PCI Interrupt Link [LNKH] (IRQs 4 5 7 10 11 14 15) *0
+[    0.721222] ACPI: EC: interrupt unblocked
+[    0.721236] ACPI: EC: event unblocked
+[    0.721245] ACPI: \_SB_.PCI0.SBRG.EC0_: GPE=0x2, EC_CMD/EC_SC=0x66, EC_DATA=0x62
+[    0.721246] ACPI: \_SB_.PCI0.SBRG.EC0_: Used as boot DSDT EC to handle transactions and events
+[    0.723348] pci 0000:0a:00.0: vgaarb: setting as boot VGA device
+[    0.723350] pci 0000:0a:00.0: vgaarb: VGA device added: decodes=io+mem,owns=io+mem,locks=none
+[    0.723351] pci 0000:0a:00.0: vgaarb: bridge control possible
+[    0.723352] vgaarb: loaded
+[    0.723439] ACPI: bus type USB registered
+[    0.723447] usbcore: registered new interface driver usbfs
+[    0.723451] usbcore: registered new interface driver hub
+[    0.723479] usbcore: registered new device driver usb
+[    0.723492] pps_core: LinuxPPS API ver. 1 registered
+[    0.723492] pps_core: Software ver. 5.3.6 - Copyright 2005-2007 Rodolfo Giometti <giometti at linux.it>
+[    0.723494] PTP clock support registered
+[    0.723498] EDAC MC: Ver: 3.0.0
+[    0.723583] Registered efivars operations
+[    0.746909] PCI: Using ACPI for IRQ routing
+[    0.749569] PCI: pci_cache_line_size set to 64 bytes
+[    0.749634] e820: reserve RAM buffer [mem 0x09c00000-0x0bffffff]
+[    0.749635] e820: reserve RAM buffer [mem 0x0a200000-0x0bffffff]
+[    0.749636] e820: reserve RAM buffer [mem 0x0b000000-0x0bffffff]
+[    0.749636] e820: reserve RAM buffer [mem 0xca1e3000-0xcbffffff]
+[    0.749637] e820: reserve RAM buffer [mem 0xda4bd000-0xdbffffff]
+[    0.749638] e820: reserve RAM buffer [mem 0xda73e000-0xdbffffff]
+[    0.749638] e820: reserve RAM buffer [mem 0xde000000-0xdfffffff]
+[    0.749639] e820: reserve RAM buffer [mem 0x81f380000-0x81fffffff]
+[    0.749693] NetLabel: Initializing
+[    0.749693] NetLabel:  domain hash size = 128
+[    0.749694] NetLabel:  protocols = UNLABELED CIPSOv4 CALIPSO
+[    0.749702] NetLabel:  unlabeled traffic allowed by default
+[    0.750044] hpet0: at MMIO 0xfed00000, IRQs 2, 8, 0
+[    0.750046] hpet0: 3 comparators, 32-bit 14.318180 MHz counter
+[    0.753340] clocksource: Switched to clocksource tsc-early
+[    0.760588] VFS: Disk quotas dquot_6.6.0
+[    0.760601] VFS: Dquot-cache hash table entries: 512 (order 0, 4096 bytes)
+[    0.760649] pnp: PnP ACPI init
+[    0.760753] system 00:00: [mem 0xf8000000-0xfbffffff] has been reserved
+[    0.760756] system 00:00: Plug and Play ACPI device, IDs PNP0c01 (active)
+[    0.760825] pnp 00:01: Plug and Play ACPI device, IDs PNP0b00 (active)
+[    0.760961] system 00:02: [io  0x0300-0x030f] has been reserved
+[    0.760963] system 00:02: [io  0x0230-0x023f] has been reserved
+[    0.760964] system 00:02: [io  0x0290-0x029f] has been reserved
+[    0.760966] system 00:02: Plug and Play ACPI device, IDs PNP0c02 (active)
+[    0.761286] system 00:03: [io  0x04d0-0x04d1] has been reserved
+[    0.761288] system 00:03: [io  0x040b] has been reserved
+[    0.761289] system 00:03: [io  0x04d6] has been reserved
+[    0.761289] system 00:03: [io  0x0c00-0x0c01] has been reserved
+[    0.761290] system 00:03: [io  0x0c14] has been reserved
+[    0.761291] system 00:03: [io  0x0c50-0x0c51] has been reserved
+[    0.761292] system 00:03: [io  0x0c52] has been reserved
+[    0.761293] system 00:03: [io  0x0c6c] has been reserved
+[    0.761294] system 00:03: [io  0x0c6f] has been reserved
+[    0.761295] system 00:03: [io  0x0cd0-0x0cd1] has been reserved
+[    0.761295] system 00:03: [io  0x0cd2-0x0cd3] has been reserved
+[    0.761296] system 00:03: [io  0x0cd4-0x0cd5] has been reserved
+[    0.761297] system 00:03: [io  0x0cd6-0x0cd7] has been reserved
+[    0.761298] system 00:03: [io  0x0cd8-0x0cdf] has been reserved
+[    0.761299] system 00:03: [io  0x0800-0x089f] has been reserved
+[    0.761300] system 00:03: [io  0x0b00-0x0b0f] has been reserved
+[    0.761301] system 00:03: [io  0x0b20-0x0b3f] has been reserved
+[    0.761302] system 00:03: [io  0x0900-0x090f] has been reserved
+[    0.761302] system 00:03: [io  0x0910-0x091f] has been reserved
+[    0.761304] system 00:03: [mem 0xfec00000-0xfec00fff] could not be reserved
+[    0.761305] system 00:03: [mem 0xfec01000-0xfec01fff] could not be reserved
+[    0.761306] system 00:03: [mem 0xfedc0000-0xfedc0fff] has been reserved
+[    0.761307] system 00:03: [mem 0xfee00000-0xfee00fff] has been reserved
+[    0.761308] system 00:03: [mem 0xfed80000-0xfed8ffff] could not be reserved
+[    0.761309] system 00:03: [mem 0xfec10000-0xfec10fff] has been reserved
+[    0.761310] system 00:03: [mem 0xff000000-0xffffffff] has been reserved
+[    0.761312] system 00:03: Plug and Play ACPI device, IDs PNP0c02 (active)
+[    0.761702] pnp: PnP ACPI: found 4 devices
+[    0.767090] clocksource: acpi_pm: mask: 0xffffff max_cycles: 0xffffff, max_idle_ns: 2085701024 ns
+[    0.767152] pci 0000:02:00.0: PCI bridge to [bus 03]
+[    0.767161] pci 0000:02:02.0: PCI bridge to [bus 04]
+[    0.767170] pci 0000:02:03.0: PCI bridge to [bus 05]
+[    0.767171] pci 0000:02:03.0:   bridge window [io  0xd000-0xdfff]
+[    0.767175] pci 0000:02:03.0:   bridge window [mem 0xf7400000-0xf74fffff]
+[    0.767177] pci 0000:02:03.0:   bridge window [mem 0xf4000000-0xf5ffffff 64bit pref]
+[    0.767182] pci 0000:02:04.0: PCI bridge to [bus 06]
+[    0.767185] pci 0000:02:04.0:   bridge window [mem 0xf7300000-0xf73fffff]
+[    0.767191] pci 0000:02:06.0: PCI bridge to [bus 07]
+[    0.767199] pci 0000:02:07.0: PCI bridge to [bus 08]
+[    0.767201] pci 0000:02:07.0:   bridge window [io  0xc000-0xcfff]
+[    0.767204] pci 0000:02:07.0:   bridge window [mem 0xf7200000-0xf72fffff]
+[    0.767210] pci 0000:02:09.0: PCI bridge to [bus 09]
+[    0.767218] pci 0000:01:00.2: PCI bridge to [bus 02-09]
+[    0.767220] pci 0000:01:00.2:   bridge window [io  0xc000-0xdfff]
+[    0.767223] pci 0000:01:00.2:   bridge window [mem 0xf7200000-0xf74fffff]
+[    0.767225] pci 0000:01:00.2:   bridge window [mem 0xf4000000-0xf5ffffff 64bit pref]
+[    0.767229] pci 0000:00:01.3: PCI bridge to [bus 01-09]
+[    0.767230] pci 0000:00:01.3:   bridge window [io  0xc000-0xdfff]
+[    0.767232] pci 0000:00:01.3:   bridge window [mem 0xf7200000-0xf75fffff]
+[    0.767234] pci 0000:00:01.3:   bridge window [mem 0xf4000000-0xf5ffffff 64bit pref]
+[    0.767236] pci 0000:00:03.1: PCI bridge to [bus 0a]
+[    0.767238] pci 0000:00:03.1:   bridge window [io  0xe000-0xefff]
+[    0.767240] pci 0000:00:03.1:   bridge window [mem 0xf6000000-0xf70fffff]
+[    0.767242] pci 0000:00:03.1:   bridge window [mem 0xe0000000-0xf1ffffff 64bit pref]
+[    0.767246] pci 0000:00:07.1: PCI bridge to [bus 0b]
+[    0.767247] pci 0000:00:07.1:   bridge window [mem 0xf7600000-0xf78fffff]
+[    0.767251] pci 0000:00:08.1: PCI bridge to [bus 0c]
+[    0.767253] pci 0000:00:08.1:   bridge window [mem 0xf7900000-0xf79fffff]
+[    0.767257] pci_bus 0000:00: resource 4 [io  0x0000-0x03af window]
+[    0.767258] pci_bus 0000:00: resource 5 [io  0x03e0-0x0cf7 window]
+[    0.767258] pci_bus 0000:00: resource 6 [io  0x03b0-0x03df window]
+[    0.767259] pci_bus 0000:00: resource 7 [io  0x0d00-0xefff window]
+[    0.767260] pci_bus 0000:00: resource 8 [mem 0x000a0000-0x000bffff window]
+[    0.767261] pci_bus 0000:00: resource 9 [mem 0x000c0000-0x000dffff window]
+[    0.767262] pci_bus 0000:00: resource 10 [mem 0xe0000000-0xfec2ffff window]
+[    0.767263] pci_bus 0000:00: resource 11 [mem 0xfee00000-0xffffffff window]
+[    0.767264] pci_bus 0000:01: resource 0 [io  0xc000-0xdfff]
+[    0.767264] pci_bus 0000:01: resource 1 [mem 0xf7200000-0xf75fffff]
+[    0.767265] pci_bus 0000:01: resource 2 [mem 0xf4000000-0xf5ffffff 64bit pref]
+[    0.767266] pci_bus 0000:02: resource 0 [io  0xc000-0xdfff]
+[    0.767267] pci_bus 0000:02: resource 1 [mem 0xf7200000-0xf74fffff]
+[    0.767268] pci_bus 0000:02: resource 2 [mem 0xf4000000-0xf5ffffff 64bit pref]
+[    0.767269] pci_bus 0000:05: resource 0 [io  0xd000-0xdfff]
+[    0.767269] pci_bus 0000:05: resource 1 [mem 0xf7400000-0xf74fffff]
+[    0.767270] pci_bus 0000:05: resource 2 [mem 0xf4000000-0xf5ffffff 64bit pref]
+[    0.767271] pci_bus 0000:06: resource 1 [mem 0xf7300000-0xf73fffff]
+[    0.767272] pci_bus 0000:08: resource 0 [io  0xc000-0xcfff]
+[    0.767273] pci_bus 0000:08: resource 1 [mem 0xf7200000-0xf72fffff]
+[    0.767274] pci_bus 0000:0a: resource 0 [io  0xe000-0xefff]
+[    0.767275] pci_bus 0000:0a: resource 1 [mem 0xf6000000-0xf70fffff]
+[    0.767275] pci_bus 0000:0a: resource 2 [mem 0xe0000000-0xf1ffffff 64bit pref]
+[    0.767276] pci_bus 0000:0b: resource 1 [mem 0xf7600000-0xf78fffff]
+[    0.767277] pci_bus 0000:0c: resource 1 [mem 0xf7900000-0xf79fffff]
+[    0.767352] NET: Registered protocol family 2
+[    0.767429] tcp_listen_portaddr_hash hash table entries: 16384 (order: 6, 262144 bytes)
+[    0.767486] TCP established hash table entries: 262144 (order: 9, 2097152 bytes)
+[    0.767737] TCP bind hash table entries: 65536 (order: 8, 1048576 bytes)
+[    0.767842] TCP: Hash tables configured (established 262144 bind 65536)
+[    0.767876] UDP hash table entries: 16384 (order: 7, 524288 bytes)
+[    0.767934] UDP-Lite hash table entries: 16384 (order: 7, 524288 bytes)
+[    0.768022] NET: Registered protocol family 1
+[    0.768025] NET: Registered protocol family 44
+[    0.768267] pci 0000:0a:00.0: Video device with shadowed ROM at [mem 0x000c0000-0x000dffff]
+[    0.768278] pci 0000:0a:00.1: Linked as a consumer to 0000:0a:00.0
+[    0.768407] PCI: CLS 64 bytes, default 64
+[    0.768428] Unpacking initramfs...
+[    1.146423] Freeing initrd memory: 5460K
+[    1.146437] AMD-Vi: IOMMU performance counters supported
+[    1.146656] iommu: Adding device 0000:00:01.0 to group 0
+[    1.146749] iommu: Adding device 0000:00:01.3 to group 1
+[    1.146830] iommu: Adding device 0000:00:02.0 to group 2
+[    1.146913] iommu: Adding device 0000:00:03.0 to group 3
+[    1.146999] iommu: Adding device 0000:00:03.1 to group 4
+[    1.147076] iommu: Adding device 0000:00:04.0 to group 5
+[    1.147161] iommu: Adding device 0000:00:07.0 to group 6
+[    1.147237] iommu: Adding device 0000:00:07.1 to group 7
+[    1.147326] iommu: Adding device 0000:00:08.0 to group 8
+[    1.147407] iommu: Adding device 0000:00:08.1 to group 9
+[    1.147501] iommu: Adding device 0000:00:14.0 to group 10
+[    1.147515] iommu: Adding device 0000:00:14.3 to group 10
+[    1.147619] iommu: Adding device 0000:00:18.0 to group 11
+[    1.147634] iommu: Adding device 0000:00:18.1 to group 11
+[    1.147645] iommu: Adding device 0000:00:18.2 to group 11
+[    1.147656] iommu: Adding device 0000:00:18.3 to group 11
+[    1.147667] iommu: Adding device 0000:00:18.4 to group 11
+[    1.147679] iommu: Adding device 0000:00:18.5 to group 11
+[    1.147690] iommu: Adding device 0000:00:18.6 to group 11
+[    1.147702] iommu: Adding device 0000:00:18.7 to group 11
+[    1.147807] iommu: Adding device 0000:01:00.0 to group 12
+[    1.147828] iommu: Adding device 0000:01:00.1 to group 12
+[    1.147848] iommu: Adding device 0000:01:00.2 to group 12
+[    1.147859] iommu: Adding device 0000:02:00.0 to group 12
+[    1.147870] iommu: Adding device 0000:02:02.0 to group 12
+[    1.147880] iommu: Adding device 0000:02:03.0 to group 12
+[    1.147891] iommu: Adding device 0000:02:04.0 to group 12
+[    1.147902] iommu: Adding device 0000:02:06.0 to group 12
+[    1.147914] iommu: Adding device 0000:02:07.0 to group 12
+[    1.147924] iommu: Adding device 0000:02:09.0 to group 12
+[    1.147937] iommu: Adding device 0000:05:00.0 to group 12
+[    1.147953] iommu: Adding device 0000:06:00.0 to group 12
+[    1.147969] iommu: Adding device 0000:08:00.0 to group 12
+[    1.148068] iommu: Adding device 0000:0a:00.0 to group 13
+[    1.148094] iommu: Adding device 0000:0a:00.1 to group 13
+[    1.148181] iommu: Adding device 0000:0b:00.0 to group 14
+[    1.148262] iommu: Adding device 0000:0b:00.2 to group 15
+[    1.148349] iommu: Adding device 0000:0b:00.3 to group 16
+[    1.148432] iommu: Adding device 0000:0c:00.0 to group 17
+[    1.148519] iommu: Adding device 0000:0c:00.2 to group 18
+[    1.148601] iommu: Adding device 0000:0c:00.3 to group 19
+[    1.148792] AMD-Vi: Found IOMMU at 0000:00:00.2 cap 0x40
+[    1.148793] AMD-Vi: Extended features (0xf77ef22294ada):
+[    1.148793]  PPR NX GT IA GA PC GA_vAPIC
+[    1.148795] AMD-Vi: Interrupt remapping enabled
+[    1.148796] AMD-Vi: virtual APIC enabled
+[    1.149507] AMD-Vi: Lazy IO/TLB flushing enabled
+[    1.150256] amd_uncore: AMD NB counters detected
+[    1.150259] amd_uncore: AMD LLC counters detected
+[    1.150582] perf/amd_iommu: Detected AMD IOMMU #0 (2 banks, 4 counters/bank).
+[    1.150629] check: Scanning for low memory corruption every 60 seconds
+[    1.151034] Initialise system trusted keyrings
+[    1.151043] Key type blacklist registered
+[    1.151074] workingset: timestamp_bits=41 max_order=23 bucket_order=0
+[    1.151814] zbud: loaded
+[    1.169468] Key type asymmetric registered
+[    1.169469] Asymmetric key parser 'x509' registered
+[    1.169478] Block layer SCSI generic (bsg) driver version 0.4 loaded (major 244)
+[    1.169512] io scheduler noop registered
+[    1.169513] io scheduler deadline registered
+[    1.169534] io scheduler cfq registered (default)
+[    1.169535] io scheduler mq-deadline registered
+[    1.169535] io scheduler kyber registered
+[    1.169559] io scheduler bfq registered
+[    1.170714] aer 0000:00:01.3:pcie002: AER enabled with IRQ 28
+[    1.171667] aer 0000:00:03.1:pcie002: AER enabled with IRQ 29
+[    1.172861] aer 0000:00:07.1:pcie002: AER enabled with IRQ 30
+[    1.173091] aer 0000:00:08.1:pcie002: AER enabled with IRQ 31
+[    1.173849] shpchp: Standard Hot Plug PCI Controller Driver version: 0.4
+[    1.173893] efifb: probing for efifb
+[    1.173924] efifb: No BGRT, not showing boot graphics
+[    1.173924] efifb: framebuffer at 0xf1000000, using 8128k, total 8128k
+[    1.173925] efifb: mode is 1920x1080x32, linelength=7680, pages=1
+[    1.173926] efifb: scrolling: redraw
+[    1.173927] efifb: Truecolor: size=8:8:8:8, shift=24:16:8:0
+[    1.173954] fbcon: Deferring console take-over
+[    1.173955] fb0: EFI VGA frame buffer device
+[    1.174001] input: Power Button as /devices/LNXSYSTM:00/LNXSYBUS:00/PNP0C0C:00/input/input0
+[    1.174005] ACPI: Power Button [PWRB]
+[    1.174031] input: Power Button as /devices/LNXSYSTM:00/LNXPWRBN:00/input/input1
+[    1.174039] ACPI: Power Button [PWRF]
+[    1.174088] Monitor-Mwait will be used to enter C-1 state
+[    1.183615] Serial: 8250/16550 driver, 4 ports, IRQ sharing enabled
+[    1.184944] usbcore: registered new interface driver usbserial_generic
+[    1.184947] usbserial: USB Serial support registered for generic
+[    1.184973] rtc_cmos 00:01: RTC can wake from S4
+[    1.185211] rtc_cmos 00:01: registered as rtc0
+[    1.185220] rtc_cmos 00:01: alarms up to one month, y3k, 114 bytes nvram, hpet irqs
+[    1.185360] ledtrig-cpu: registered to indicate activity on CPUs
+[    1.185543] NET: Registered protocol family 10
+[    1.188161] Segment Routing with IPv6
+[    1.188172] NET: Registered protocol family 17
+[    1.188908] RAS: Correctable Errors collector initialized.
+[    1.188928] microcode: CPU0: patch_level=0x0800820b
+[    1.188934] microcode: CPU1: patch_level=0x0800820b
+[    1.188939] microcode: CPU2: patch_level=0x0800820b
+[    1.188944] microcode: CPU3: patch_level=0x0800820b
+[    1.188950] microcode: CPU4: patch_level=0x0800820b
+[    1.188955] microcode: CPU5: patch_level=0x0800820b
+[    1.188959] microcode: CPU6: patch_level=0x0800820b
+[    1.188964] microcode: CPU7: patch_level=0x0800820b
+[    1.188967] microcode: CPU8: patch_level=0x0800820b
+[    1.188972] microcode: CPU9: patch_level=0x0800820b
+[    1.188977] microcode: CPU10: patch_level=0x0800820b
+[    1.188981] microcode: CPU11: patch_level=0x0800820b
+[    1.188986] microcode: CPU12: patch_level=0x0800820b
+[    1.188991] microcode: CPU13: patch_level=0x0800820b
+[    1.188996] microcode: CPU14: patch_level=0x0800820b
+[    1.189001] microcode: CPU15: patch_level=0x0800820b
+[    1.189022] microcode: Microcode Update Driver: v2.2.
+[    1.189029] sched_clock: Marking stable (1212345999, -23327271)->(1319719885, -130701157)
+[    1.189576] registered taskstats version 1
+[    1.189581] Loading compiled-in X.509 certificates
+[    1.191154] Loaded X.509 cert 'Build time autogenerated kernel key: a727ac0d80c211ac88e268aca3350843bdb6ebde'
+[    1.191172] zswap: loaded using pool lzo/zbud
+[    1.193715] Key type big_key registered
+[    1.194014]   Magic number: 7:490:636
+[    1.194159] rtc_cmos 00:01: setting system clock to 2019-02-06 14:38:55 UTC (1549463935)
+[    1.195219] Freeing unused decrypted memory: 2040K
+[    1.195414] Freeing unused kernel image memory: 1500K
+[    1.227102] Write protecting the kernel read-only data: 18432k
+[    1.227669] Freeing unused kernel image memory: 2016K
+[    1.227882] Freeing unused kernel image memory: 632K
+[    1.234647] x86/mm: Checked W+X mappings: passed, no W+X pages found.
+[    1.234650] Run /init as init process
+[    1.289940] fbcon: Taking over console
+[    1.289981] Console: switching to colour frame buffer device 240x67
+[    1.336832] SCSI subsystem initialized
+[    1.338085] 3ware 9000 Storage Controller device driver for Linux v2.26.02.014.
+[    1.338111] ccp 0000:0b:00.2: enabling device (0000 -> 0002)
+[    1.339135] xhci_hcd 0000:01:00.0: xHCI Host Controller
+[    1.339139] xhci_hcd 0000:01:00.0: new USB bus registered, assigned bus number 1
+[    1.339269] cryptd: max_cpu_qlen set to 1000
+[    1.342597] libata version 3.00 loaded.
+[    1.343891] AVX2 version of gcm_enc/dec engaged.
+[    1.343892] AES CTR mode by8 optimization enabled
+[    1.344988] ccp 0000:0b:00.2: ccp enabled
+[    1.345015] ccp 0000:0b:00.2: psp initialization failed
+[    1.345017] ccp 0000:0b:00.2: enabled
+[    1.345477] ahci 0000:01:00.1: version 3.0
+[    1.345624] ahci 0000:01:00.1: SSS flag set, parallel bus scan disabled
+[    1.345676] ahci 0000:01:00.1: AHCI 0001.0301 32 slots 8 ports 6 Gbps 0xff impl SATA mode
+[    1.345678] ahci 0000:01:00.1: flags: 64bit ncq sntf stag pm led clo only pmp pio slum part sxs deso sadm sds apst 
+[    1.346691] scsi host1: ahci
+[    1.346820] scsi host2: ahci
+[    1.346915] scsi host3: ahci
+[    1.346999] scsi host4: ahci
+[    1.347090] scsi host5: ahci
+[    1.347164] scsi host6: ahci
+[    1.347251] scsi host7: ahci
+[    1.347360] scsi host8: ahci
+[    1.347413] ata1: SATA max UDMA/133 abar m131072 at 0xf7580000 port 0xf7580100 irq 45
+[    1.347415] ata2: SATA max UDMA/133 abar m131072 at 0xf7580000 port 0xf7580180 irq 45
+[    1.347417] ata3: SATA max UDMA/133 abar m131072 at 0xf7580000 port 0xf7580200 irq 45
+[    1.347419] ata4: SATA max UDMA/133 abar m131072 at 0xf7580000 port 0xf7580280 irq 45
+[    1.347421] ata5: SATA max UDMA/133 abar m131072 at 0xf7580000 port 0xf7580300 irq 45
+[    1.347423] ata6: SATA max UDMA/133 abar m131072 at 0xf7580000 port 0xf7580380 irq 45
+[    1.347424] ata7: SATA max UDMA/133 abar m131072 at 0xf7580000 port 0xf7580400 irq 45
+[    1.347426] ata8: SATA max UDMA/133 abar m131072 at 0xf7580000 port 0xf7580480 irq 45
+[    1.347613] ahci 0000:0c:00.2: AHCI 0001.0301 32 slots 1 ports 6 Gbps 0x1 impl SATA mode
+[    1.347616] ahci 0000:0c:00.2: flags: 64bit ncq sntf ilck pm led clo only pmp fbs pio slum part 
+[    1.350022] scsi host9: ahci
+[    1.350077] ata9: SATA max UDMA/133 abar m4096 at 0xf7908000 port 0xf7908100 irq 47
+[    1.394367] xhci_hcd 0000:01:00.0: hcc params 0x0200ef81 hci version 0x110 quirks 0x0000000000000410
+[    1.394663] usb usb1: New USB device found, idVendor=1d6b, idProduct=0002, bcdDevice= 4.20
+[    1.394664] usb usb1: New USB device strings: Mfr=3, Product=2, SerialNumber=1
+[    1.394665] usb usb1: Product: xHCI Host Controller
+[    1.394666] usb usb1: Manufacturer: Linux 4.20.6-arch1-1-ARCH-dirty xhci-hcd
+[    1.394667] usb usb1: SerialNumber: 0000:01:00.0
+[    1.394758] hub 1-0:1.0: USB hub found
+[    1.394775] hub 1-0:1.0: 14 ports detected
+[    1.401556] xhci_hcd 0000:01:00.0: xHCI Host Controller
+[    1.401559] xhci_hcd 0000:01:00.0: new USB bus registered, assigned bus number 2
+[    1.401562] xhci_hcd 0000:01:00.0: Host supports USB 3.10 Enhanced SuperSpeed
+[    1.401598] usb usb2: We don't know the algorithms for LPM for this host, disabling LPM.
+[    1.401614] usb usb2: New USB device found, idVendor=1d6b, idProduct=0003, bcdDevice= 4.20
+[    1.401615] usb usb2: New USB device strings: Mfr=3, Product=2, SerialNumber=1
+[    1.401616] usb usb2: Product: xHCI Host Controller
+[    1.401616] usb usb2: Manufacturer: Linux 4.20.6-arch1-1-ARCH-dirty xhci-hcd
+[    1.401617] usb usb2: SerialNumber: 0000:01:00.0
+[    1.401685] hub 2-0:1.0: USB hub found
+[    1.401697] hub 2-0:1.0: 8 ports detected
+[    1.402681] usb: port power management may be unreliable
+[    1.405716] xhci_hcd 0000:06:00.0: xHCI Host Controller
+[    1.405720] xhci_hcd 0000:06:00.0: new USB bus registered, assigned bus number 3
+[    1.464503] xhci_hcd 0000:06:00.0: hcc params 0x0200eec1 hci version 0x110 quirks 0x0000000000000010
+[    1.464790] usb usb3: New USB device found, idVendor=1d6b, idProduct=0002, bcdDevice= 4.20
+[    1.464791] usb usb3: New USB device strings: Mfr=3, Product=2, SerialNumber=1
+[    1.464792] usb usb3: Product: xHCI Host Controller
+[    1.464793] usb usb3: Manufacturer: Linux 4.20.6-arch1-1-ARCH-dirty xhci-hcd
+[    1.464793] usb usb3: SerialNumber: 0000:06:00.0
+[    1.464858] hub 3-0:1.0: USB hub found
+[    1.464864] hub 3-0:1.0: 2 ports detected
+[    1.464944] xhci_hcd 0000:06:00.0: xHCI Host Controller
+[    1.464946] xhci_hcd 0000:06:00.0: new USB bus registered, assigned bus number 4
+[    1.464947] xhci_hcd 0000:06:00.0: Host supports USB 3.1 Enhanced SuperSpeed
+[    1.464971] usb usb4: We don't know the algorithms for LPM for this host, disabling LPM.
+[    1.464984] usb usb4: New USB device found, idVendor=1d6b, idProduct=0003, bcdDevice= 4.20
+[    1.464985] usb usb4: New USB device strings: Mfr=3, Product=2, SerialNumber=1
+[    1.464986] usb usb4: Product: xHCI Host Controller
+[    1.464986] usb usb4: Manufacturer: Linux 4.20.6-arch1-1-ARCH-dirty xhci-hcd
+[    1.464987] usb usb4: SerialNumber: 0000:06:00.0
+[    1.465040] hub 4-0:1.0: USB hub found
+[    1.465047] hub 4-0:1.0: 2 ports detected
+[    1.465156] xhci_hcd 0000:0b:00.3: xHCI Host Controller
+[    1.465158] xhci_hcd 0000:0b:00.3: new USB bus registered, assigned bus number 5
+[    1.465248] xhci_hcd 0000:0b:00.3: hcc params 0x0270f665 hci version 0x100 quirks 0x0000000000000410
+[    1.465467] usb usb5: New USB device found, idVendor=1d6b, idProduct=0002, bcdDevice= 4.20
+[    1.465468] usb usb5: New USB device strings: Mfr=3, Product=2, SerialNumber=1
+[    1.465469] usb usb5: Product: xHCI Host Controller
+[    1.465470] usb usb5: Manufacturer: Linux 4.20.6-arch1-1-ARCH-dirty xhci-hcd
+[    1.465470] usb usb5: SerialNumber: 0000:0b:00.3
+[    1.465527] hub 5-0:1.0: USB hub found
+[    1.465532] hub 5-0:1.0: 4 ports detected
+[    1.465662] xhci_hcd 0000:0b:00.3: xHCI Host Controller
+[    1.465664] xhci_hcd 0000:0b:00.3: new USB bus registered, assigned bus number 6
+[    1.465665] xhci_hcd 0000:0b:00.3: Host supports USB 3.0  SuperSpeed
+[    1.465674] usb usb6: We don't know the algorithms for LPM for this host, disabling LPM.
+[    1.465688] usb usb6: New USB device found, idVendor=1d6b, idProduct=0003, bcdDevice= 4.20
+[    1.465689] usb usb6: New USB device strings: Mfr=3, Product=2, SerialNumber=1
+[    1.465689] usb usb6: Product: xHCI Host Controller
+[    1.465690] usb usb6: Manufacturer: Linux 4.20.6-arch1-1-ARCH-dirty xhci-hcd
+[    1.465691] usb usb6: SerialNumber: 0000:0b:00.3
+[    1.465747] hub 6-0:1.0: USB hub found
+[    1.465752] hub 6-0:1.0: 4 ports detected
+[    1.662860] ata9: SATA link down (SStatus 0 SControl 300)
+[    1.730042] usb 1-5: new low-speed USB device number 2 using xhci_hcd
+[    1.793377] usb 5-4: new low-speed USB device number 2 using xhci_hcd
+[    1.813406] ata1: SATA link up 6.0 Gbps (SStatus 133 SControl 300)
+[    1.813722] ata1.00: supports DRM functions and may not be fully accessible
+[    1.814632] ata1.00: ATA-11: Samsung SSD 860 EVO 250GB, RVT01B6Q, max UDMA/133
+[    1.814633] ata1.00: 488397168 sectors, multi 1: LBA48 NCQ (depth 32), AA
+[    1.816936] ata1.00: supports DRM functions and may not be fully accessible
+[    1.819663] ata1.00: configured for UDMA/133
+[    1.820332] scsi 1:0:0:0: Direct-Access     ATA      Samsung SSD 860  1B6Q PQ: 0 ANSI: 5
+[    1.822779] ata1.00: Enabling discard_zeroes_data
+[    1.822834] sd 1:0:0:0: [sda] 488397168 512-byte logical blocks: (250 GB/233 GiB)
+[    1.822841] sd 1:0:0:0: [sda] Write Protect is off
+[    1.822843] sd 1:0:0:0: [sda] Mode Sense: 00 3a 00 00
+[    1.822857] sd 1:0:0:0: [sda] Write cache: enabled, read cache: enabled, doesn't support DPO or FUA
+[    1.822948] ata1.00: Enabling discard_zeroes_data
+[    1.824089]  sda: sda1
+[    1.824250] ata1.00: Enabling discard_zeroes_data
+[    1.825332] sd 1:0:0:0: [sda] supports TCG Opal
+[    1.825333] sd 1:0:0:0: [sda] Attached SCSI disk
+[    1.974856] usb 5-4: New USB device found, idVendor=045e, idProduct=00db, bcdDevice= 1.73
+[    1.974858] usb 5-4: New USB device strings: Mfr=1, Product=2, SerialNumber=0
+[    1.974860] usb 5-4: Product: Natural? Ergonomic Keyboard 4000
+[    1.974861] usb 5-4: Manufacturer: Microsoft
+[    1.984387] usb 1-5: New USB device found, idVendor=046d, idProduct=c051, bcdDevice=30.00
+[    1.984389] usb 1-5: New USB device strings: Mfr=1, Product=2, SerialNumber=0
+[    1.984390] usb 1-5: Product: USB-PS/2 Optical Mouse
+[    1.984392] usb 1-5: Manufacturer: Logitech
+[    1.991650] hidraw: raw HID events driver (C) Jiri Kosina
+[    2.020943] usbcore: registered new interface driver usbhid
+[    2.020944] usbhid: USB HID core driver
+[    2.022022] input: Logitech USB-PS/2 Optical Mouse as /devices/pci0000:00/0000:00:01.3/0000:01:00.0/usb1/1-5/1-5:1.0/0003:046D:C051.0001/input/input2
+[    2.022057] hid-generic 0003:046D:C051.0001: input,hidraw0: USB HID v1.10 Mouse [Logitech USB-PS/2 Optical Mouse] on usb-0000:01:00.0-5/input0
+[    2.023763] input: Microsoft Natural? Ergonomic Keyboard 4000 as /devices/pci0000:00/0000:00:07.1/0000:0b:00.3/usb5/5-4/5-4:1.0/0003:045E:00DB.0002/input/input3
+[    2.080613] microsoft 0003:045E:00DB.0002: input,hidraw1: USB HID v1.11 Keyboard [Microsoft Natural? Ergonomic Keyboard 4000] on usb-0000:0b:00.3-4/input0
+[    2.080845] input: Microsoft Natural? Ergonomic Keyboard 4000 as /devices/pci0000:00/0000:00:07.1/0000:0b:00.3/usb5/5-4/5-4:1.1/0003:045E:00DB.0003/input/input4
+[    2.110384] usb 1-9: new full-speed USB device number 3 using xhci_hcd
+[    2.136812] microsoft 0003:045E:00DB.0003: input,hidraw2: USB HID v1.11 Device [Microsoft Natural? Ergonomic Keyboard 4000] on usb-0000:0b:00.3-4/input1
+[    2.160398] tsc: Refined TSC clocksource calibration: 3693.059 MHz
+[    2.160411] clocksource: tsc: mask: 0xffffffffffffffff max_cycles: 0x6a77744cfd5, max_idle_ns: 881590969987 ns
+[    2.160454] clocksource: Switched to clocksource tsc
+[    2.187059] 3w-9xxx: scsi0: AEN: WARNING (0x04:0x0006): Incomplete unit detected:unit=0.
+[    2.290460] ata2: SATA link up 6.0 Gbps (SStatus 133 SControl 300)
+[    2.290988] ata2.00: ATA-9: SAMSUNG SSD 830 Series, CXM03B1Q, max UDMA/133
+[    2.290990] ata2.00: 250069680 sectors, multi 16: LBA48 NCQ (depth 32), AA
+[    2.291264] ata2.00: configured for UDMA/133
+[    2.291434] scsi 2:0:0:0: Direct-Access     ATA      SAMSUNG SSD 830  3B1Q PQ: 0 ANSI: 5
+[    2.291679] sd 2:0:0:0: [sdb] 250069680 512-byte logical blocks: (128 GB/119 GiB)
+[    2.291694] sd 2:0:0:0: [sdb] Write Protect is off
+[    2.291696] sd 2:0:0:0: [sdb] Mode Sense: 00 3a 00 00
+[    2.291716] sd 2:0:0:0: [sdb] Write cache: enabled, read cache: enabled, doesn't support DPO or FUA
+[    2.293174]  sdb: sdb1 sdb2 sdb3 sdb4 sdb5 sdb6 sdb7
+[    2.293538] sd 2:0:0:0: [sdb] Attached SCSI disk
+[    2.300017] scsi host0: 3ware 9000 Storage Controller
+[    2.300106] 3w-9xxx: scsi0: Found a 3ware 9000 Storage Controller at 0xf7420000, IRQ: 35.
+[    2.308125] random: fast init done
+[    2.433375] usb 1-9: New USB device found, idVendor=0b05, idProduct=1872, bcdDevice= 2.00
+[    2.433378] usb 1-9: New USB device strings: Mfr=1, Product=2, SerialNumber=3
+[    2.433379] usb 1-9: Product: AURA LED Controller
+[    2.433381] usb 1-9: Manufacturer: AsusTek Computer Inc.
+[    2.433382] usb 1-9: SerialNumber: 00000000001A
+[    2.450282] hid-generic 0003:0B05:1872.0004: hiddev0,hidraw3: USB HID v1.11 Device [AsusTek Computer Inc. AURA LED Controller] on usb-0000:01:00.0-9/input0
+[    2.640397] 3w-9xxx: scsi0: Firmware FE9X 4.10.00.027, BIOS BE9X 4.08.00.004, Ports: 2.
+[    2.640872] scsi 0:0:0:0: Direct-Access     AMCC     9650SE-2LP DISK  4.10 PQ: 0 ANSI: 5
+[    2.651998] sd 0:0:0:0: [sdc] 3906228224 512-byte logical blocks: (2.00 TB/1.82 TiB)
+[    2.652179] sd 0:0:0:0: [sdc] Write Protect is off
+[    2.652180] sd 0:0:0:0: [sdc] Mode Sense: 23 00 10 00
+[    2.652518] sd 0:0:0:0: [sdc] Write cache: enabled, read cache: enabled, supports DPO and FUA
+[    2.744263]  sdc: sdc1 sdc2
+[    2.745577] sd 0:0:0:0: [sdc] Attached SCSI disk
+[    2.760057] ata3: SATA link up 6.0 Gbps (SStatus 133 SControl 300)
+[    2.760572] ata3.00: ATA-9: WDC WD20EZRZ-00Z5HB0, 80.00A80, max UDMA/133
+[    2.760574] ata3.00: 3907029168 sectors, multi 16: LBA48 NCQ (depth 32), AA
+[    2.761082] ata3.00: configured for UDMA/133
+[    2.761242] scsi 3:0:0:0: Direct-Access     ATA      WDC WD20EZRZ-00Z 0A80 PQ: 0 ANSI: 5
+[    2.761432] sd 3:0:0:0: [sdd] 3907029168 512-byte logical blocks: (2.00 TB/1.82 TiB)
+[    2.761435] sd 3:0:0:0: [sdd] 4096-byte physical blocks
+[    2.761449] sd 3:0:0:0: [sdd] Write Protect is off
+[    2.761451] sd 3:0:0:0: [sdd] Mode Sense: 00 3a 00 00
+[    2.761469] sd 3:0:0:0: [sdd] Write cache: enabled, read cache: enabled, doesn't support DPO or FUA
+[    2.838553] GPT:Primary header thinks Alt. header is not at the end of the disk.
+[    2.838555] GPT:3906228223 != 3907029167
+[    2.838556] GPT:Alternate GPT header not at the end of the disk.
+[    2.838556] GPT:3906228223 != 3907029167
+[    2.838556] GPT: Use GNU Parted to correct GPT errors.
+[    2.838562]  sdd: sdd1 sdd2
+[    2.838990] sd 3:0:0:0: [sdd] Attached SCSI disk
+[    3.071587] ata4: SATA link down (SStatus 0 SControl 300)
+[    3.543734] ata5: SATA link up 3.0 Gbps (SStatus 123 SControl 300)
+[    3.545526] ata5.00: ATA-8: ST31500541AS, CC34, max UDMA/133
+[    3.545528] ata5.00: 2930277168 sectors, multi 16: LBA48 NCQ (depth 32)
+[    3.546767] ata5.00: configured for UDMA/133
+[    3.546896] scsi 5:0:0:0: Direct-Access     ATA      ST31500541AS     CC34 PQ: 0 ANSI: 5
+[    3.547112] sd 5:0:0:0: [sde] 2930277168 512-byte logical blocks: (1.50 TB/1.36 TiB)
+[    3.547123] sd 5:0:0:0: [sde] Write Protect is off
+[    3.547124] sd 5:0:0:0: [sde] Mode Sense: 00 3a 00 00
+[    3.547141] sd 5:0:0:0: [sde] Write cache: enabled, read cache: enabled, doesn't support DPO or FUA
+[    3.641729]  sde: sde1 sde2
+[    3.643043] sd 5:0:0:0: [sde] Attached SCSI disk
+[    4.013744] ata6: SATA link up 1.5 Gbps (SStatus 113 SControl 300)
+[    4.017100] ata6.00: ATAPI: HL-DT-ST DVDRAM GH22NS50, TN01, max UDMA/100
+[    4.021779] ata6.00: configured for UDMA/100
+[    4.031937] scsi 6:0:0:0: CD-ROM            HL-DT-ST DVDRAM GH22NS50  TN01 PQ: 0 ANSI: 5
+[    4.137456] sr 6:0:0:0: [sr0] scsi3-mmc drive: 48x/48x writer dvd-ram cd/rw xa/form2 cdda tray
+[    4.137458] cdrom: Uniform CD-ROM driver Revision: 3.20
+[    4.137634] sr 6:0:0:0: Attached scsi CD-ROM sr0
+[    4.397091] ata7: SATA link down (SStatus 0 SControl 330)
+[    4.706901] ata8: SATA link down (SStatus 0 SControl 330)
+[    4.979025] device-mapper: uevent: version 1.0.3
+[    4.979076] device-mapper: ioctl: 4.39.0-ioctl (2018-04-03) initialised: dm-devel at redhat.com
+[    5.377338] NET: Registered protocol family 38
+[    5.884912] random: cryptsetup: uninitialized urandom read (2 bytes read)
+[    6.009193] EXT4-fs (dm-0): mounted filesystem with ordered data mode. Opts: (null)
+[    6.212301] systemd[1]: RTC configured in localtime, applying delta of 60 minutes to system time.
+[    6.253674] systemd[1]: systemd 240 running in system mode. (+PAM +AUDIT -SELINUX -IMA -APPARMOR +SMACK -SYSVINIT +UTMP +LIBCRYPTSETUP +GCRYPT +GNUTLS +ACL +XZ +LZ4 +SECCOMP +BLKID +ELFUTILS +KMOD +IDN2 -IDN +PCRE2 default-hierarchy=hybrid)
+[    6.270573] systemd[1]: Detected architecture x86-64.
+[    6.282699] systemd[1]: Set hostname to <polaris>.
+[    6.386002] systemd[1]: /usr/lib/systemd/system/auditd.service:12: PIDFile= references path below legacy directory /var/run/, updating /var/run/auditd.pid ? /run/auditd.pid; please update the unit file accordingly.
+[    6.433632] systemd[1]: /usr/lib/systemd/system/fancontrol.service:7: PIDFile= references path below legacy directory /var/run/, updating /var/run/fancontrol.pid ? /run/fancontrol.pid; please update the unit file accordingly.
+[    6.434665] systemd[1]: Reached target Login Prompts.
+[    6.434991] systemd[1]: Listening on LVM2 metadata daemon socket.
+[    6.438508] systemd[1]: Created slice system-netctl\x2difplugd.slice.
+[    6.438780] systemd[1]: Listening on LVM2 poll daemon socket.
+[    6.438848] systemd[1]: Started Forward Password Requests to Wall Directory Watch.
+[    6.450505] EXT4-fs (dm-0): re-mounted. Opts: discard,data=ordered
+[    6.458965] random: lvm: uninitialized urandom read (4 bytes read)
+[    6.459079] sd 1:0:0:0: Attached scsi generic sg0 type 0
+[    6.459102] sd 2:0:0:0: Attached scsi generic sg1 type 0
+[    6.459126] sd 0:0:0:0: Attached scsi generic sg2 type 0
+[    6.459147] sd 3:0:0:0: Attached scsi generic sg3 type 0
+[    6.459168] sd 5:0:0:0: Attached scsi generic sg4 type 0
+[    6.459189] sr 6:0:0:0: Attached scsi generic sg5 type 5
+[    6.464383] audit: type=1130 audit(1549460340.768:2): pid=1 uid=0 auid=4294967295 ses=4294967295 msg='unit=lvm2-lvmetad comm="systemd" exe="/usr/lib/systemd/systemd" hostname=? addr=? terminal=? res=success'
+[    6.466346] audit: type=1130 audit(1549460340.768:3): pid=1 uid=0 auid=4294967295 ses=4294967295 msg='unit=systemd-binfmt comm="systemd" exe="/usr/lib/systemd/systemd" hostname=? addr=? terminal=? res=success'
+[    6.467754] loop: module loaded
+[    6.475780] random: systemd-random-: uninitialized urandom read (512 bytes read)
+[    6.476340] audit: type=1130 audit(1549460340.778:4): pid=1 uid=0 auid=4294967295 ses=4294967295 msg='unit=systemd-random-seed comm="systemd" exe="/usr/lib/systemd/systemd" hostname=? addr=? terminal=? res=success'
+[    6.480113] acpi_cpufreq: overriding BIOS provided _PSD data
+[    6.489816] vboxdrv: loading out-of-tree module taints kernel.
+[    6.489928] vboxdrv: module verification failed: signature and/or required key missing - tainting kernel
+[    6.493365] vboxdrv: Found 16 processor cores
+[    6.495149] random: crng init done
+[    6.502627] audit: type=1130 audit(1549460340.804:5): pid=1 uid=0 auid=4294967295 ses=4294967295 msg='unit=systemd-journald comm="systemd" exe="/usr/lib/systemd/systemd" hostname=? addr=? terminal=? res=success'
+[    6.513499] vboxdrv: TSC mode is Invariant, tentative frequency 3693038702 Hz
+[    6.513500] vboxdrv: Successfully loaded version 5.2.22 (interface 0x00290001)
+[    6.513888] audit: type=1130 audit(1549460340.818:6): pid=1 uid=0 auid=4294967295 ses=4294967295 msg='unit=systemd-udev-trigger comm="systemd" exe="/usr/lib/systemd/systemd" hostname=? addr=? terminal=? res=success'
+[    6.514894] VBoxNetFlt: Successfully started.
+[    6.515829] audit: type=1130 audit(1549460340.818:7): pid=1 uid=0 auid=4294967295 ses=4294967295 msg='unit=systemd-tmpfiles-setup-dev comm="systemd" exe="/usr/lib/systemd/systemd" hostname=? addr=? terminal=? res=success'
+[    6.516860] systemd-journald[500]: Received request to flush runtime journal from PID 1
+[    6.521729] VBoxPciLinuxInit
+[    6.521732] vboxpci: IOMMU found
+[    6.525063] VBoxNetAdp: Successfully started.
+[    6.525770] audit: type=1130 audit(1549460340.828:8): pid=1 uid=0 auid=4294967295 ses=4294967295 msg='unit=systemd-modules-load comm="systemd" exe="/usr/lib/systemd/systemd" hostname=? addr=? terminal=? res=success'
+[    6.644605] audit: type=1130 audit(1549460340.948:9): pid=1 uid=0 auid=4294967295 ses=4294967295 msg='unit=systemd-sysctl comm="systemd" exe="/usr/lib/systemd/systemd" hostname=? addr=? terminal=? res=success'
+[    6.722914] audit: type=1130 audit(1549460341.024:10): pid=1 uid=0 auid=4294967295 ses=4294967295 msg='unit=systemd-udevd comm="systemd" exe="/usr/lib/systemd/systemd" hostname=? addr=? terminal=? res=success'
+[    6.749602] acpi PNP0C14:02: duplicate WMI GUID 05901221-D566-11D1-B2F0-00A0C9062910 (first instance was on PNP0C14:01)
+[    6.765742] piix4_smbus 0000:00:14.0: SMBus Host Controller at 0xb00, revision 0
+[    6.765746] piix4_smbus 0000:00:14.0: Using register 0x02 for SMBus port selection
+[    6.774257] sp5100_tco: SP5100/SB800 TCO WatchDog Timer Driver
+[    6.774380] sp5100-tco sp5100-tco: Using 0xfed80b00 for watchdog MMIO address
+[    6.774390] sp5100-tco sp5100-tco: Watchdog hardware is disabled
+[    6.775601] IPMI message handler: version 39.2
+[    6.778842] ipmi device interface
+[    6.781254] dca service started, version 1.12.1
+[    6.784358] Linux agpgart interface v0.103
+[    6.800481] igb: Intel(R) Gigabit Ethernet Network Driver - version 5.4.0-k
+[    6.800483] igb: Copyright (c) 2007-2014 Intel Corporation.
+[    6.811797] snd_hda_intel 0000:0a:00.1: Disabling MSI
+[    6.811807] snd_hda_intel 0000:0a:00.1: Handle vga_switcheroo audio client
+[    6.811919] snd_hda_intel 0000:0c:00.3: enabling device (0000 -> 0002)
+[    6.829861] pps pps0: new PPS source ptp0
+[    6.829864] igb 0000:08:00.0: added PHC on eth0
+[    6.829865] igb 0000:08:00.0: Intel(R) Gigabit Ethernet Network Connection
+[    6.829868] igb 0000:08:00.0: eth0: (PCIe:2.5Gb/s:Width x1) 0c:9d:92:11:a3:ca
+[    6.829869] igb 0000:08:00.0: eth0: PBA No: FFFFFF-0FF
+[    6.829871] igb 0000:08:00.0: Using MSI-X interrupts. 2 rx queue(s), 2 tx queue(s)
+[    6.841214] snd_hda_codec_realtek hdaudioC1D0: autoconfig for ALC1220: line_outs=3 (0x14/0x15/0x16/0x0/0x0) type:line
+[    6.841217] snd_hda_codec_realtek hdaudioC1D0:    speaker_outs=0 (0x0/0x0/0x0/0x0/0x0)
+[    6.841220] snd_hda_codec_realtek hdaudioC1D0:    hp_outs=1 (0x1b/0x0/0x0/0x0/0x0)
+[    6.841221] snd_hda_codec_realtek hdaudioC1D0:    mono: mono_out=0x0
+[    6.841223] snd_hda_codec_realtek hdaudioC1D0:    dig-out=0x1e/0x0
+[    6.841224] snd_hda_codec_realtek hdaudioC1D0:    inputs:
+[    6.841226] snd_hda_codec_realtek hdaudioC1D0:      Front Mic=0x19
+[    6.841227] snd_hda_codec_realtek hdaudioC1D0:      Rear Mic=0x18
+[    6.841229] snd_hda_codec_realtek hdaudioC1D0:      Line=0x1a
+[    6.846013] kvm: Nested Virtualization enabled
+[    6.846022] kvm: Nested Paging enabled
+[    6.846023] SVM: Virtual VMLOAD VMSAVE supported
+[    6.846024] SVM: Virtual GIF supported
+[    6.857207] input: HD-Audio Generic Front Mic as /devices/pci0000:00/0000:00:08.1/0000:0c:00.3/sound/card1/input5
+[    6.857263] input: HD-Audio Generic Rear Mic as /devices/pci0000:00/0000:00:08.1/0000:0c:00.3/sound/card1/input6
+[    6.857334] input: HD-Audio Generic Line as /devices/pci0000:00/0000:00:08.1/0000:0c:00.3/sound/card1/input7
+[    6.857387] input: HD-Audio Generic Line Out Front as /devices/pci0000:00/0000:00:08.1/0000:0c:00.3/sound/card1/input8
+[    6.857518] input: HD-Audio Generic Line Out Surround as /devices/pci0000:00/0000:00:08.1/0000:0c:00.3/sound/card1/input9
+[    6.857576] input: HD-Audio Generic Line Out CLFE as /devices/pci0000:00/0000:00:08.1/0000:0c:00.3/sound/card1/input10
+[    6.857621] input: HD-Audio Generic Front Headphone as /devices/pci0000:00/0000:00:08.1/0000:0c:00.3/sound/card1/input11
+[    7.497653] audit: type=1130 audit(1549460341.801:11): pid=1 uid=0 auid=4294967295 ses=4294967295 msg='unit=systemd-cryptsetup at cryptroot comm="systemd" exe="/usr/lib/systemd/systemd" hostname=? addr=? terminal=? res=success'
+[    7.504761] nvidia: module license 'NVIDIA' taints kernel.
+[    7.504762] Disabling lock debugging due to kernel taint
+[    7.523420] nvidia-nvlink: Nvlink Core is being initialized, major device number 238
+[    7.523803] nvidia 0000:0a:00.0: vgaarb: changed VGA decodes: olddecodes=io+mem,decodes=none:owns=io+mem
+[    7.552249] mousedev: PS/2 mouse device common for all mice
+[    7.612854] Adding 8000364k swap on /dev/mapper/swap.  Priority:-2 extents:1 across:8000364k SSDscFS
+[    7.624086] NVRM: loading NVIDIA UNIX x86_64 Kernel Module  415.27  Thu Dec 20 17:25:03 CST 2018 (using threaded interrupts)
+[    7.653840] input: HDA NVidia HDMI/DP,pcm=3 as /devices/pci0000:00/0000:00:03.1/0000:0a:00.1/sound/card0/input12
+[    7.653880] input: HDA NVidia HDMI/DP,pcm=7 as /devices/pci0000:00/0000:00:03.1/0000:0a:00.1/sound/card0/input13
+[    7.653909] input: HDA NVidia HDMI/DP,pcm=8 as /devices/pci0000:00/0000:00:03.1/0000:0a:00.1/sound/card0/input14
+[    7.653938] input: HDA NVidia HDMI/DP,pcm=9 as /devices/pci0000:00/0000:00:03.1/0000:0a:00.1/sound/card0/input15
+[    7.695930] nvidia-modeset: Loading NVIDIA Kernel Mode Setting Driver for UNIX platforms  415.27  Thu Dec 20 17:06:08 CST 2018
+[    7.698108] [drm] [nvidia-drm] [GPU ID 0x00000a00] Loading driver
+[    8.235144] resource sanity check: requesting [mem 0x000c0000-0x000fffff], which spans more than PCI Bus 0000:00 [mem 0x000c0000-0x000dffff window]
+[    8.235301] caller _nv001094rm+0xe3/0x1d0 [nvidia] mapping multiple BARs
+[    8.571222] EXT4-fs (dm-2): mounting ext2 file system using the ext4 subsystem
+[    8.574423] EXT4-fs (dm-2): mounted filesystem without journal. Opts: discard
+[    8.878945] [drm] Supports vblank timestamp caching Rev 2 (21.10.2013).
+[    8.878946] [drm] No driver support for vblank timestamp query.
+[    9.207743] [drm] Initialized nvidia-drm 0.0.0 20160202 for 0000:0a:00.0 on minor 0
+[   10.068334] EXT4-fs (dm-3): mounted filesystem with ordered data mode. Opts: data=ordered
+[   11.206028] EXT4-fs (dm-4): mounted filesystem with ordered data mode. Opts: discard,data=ordered
+[   11.527461] kauditd_printk_skb: 12 callbacks suppressed
+[   11.527462] audit: type=1130 audit(1549460345.831:24): pid=1 uid=0 auid=4294967295 ses=4294967295 msg='unit=systemd-timesyncd comm="systemd" exe="/usr/lib/systemd/systemd" hostname=? addr=? terminal=? res=success'
+[   11.545353] audit: type=1130 audit(1549460345.848:25): pid=1 uid=0 auid=4294967295 ses=4294967295 msg='unit=netctl-ifplugd at eth0 comm="systemd" exe="/usr/lib/systemd/systemd" hostname=? addr=? terminal=? res=success'
+[   11.550356] audit: type=1130 audit(1549460345.854:26): pid=1 uid=0 auid=4294967295 ses=4294967295 msg='unit=cronie comm="systemd" exe="/usr/lib/systemd/systemd" hostname=? addr=? terminal=? res=success'
+[   11.559755] audit: type=1130 audit(1549460345.861:27): pid=1 uid=0 auid=4294967295 ses=4294967295 msg='unit=dbus comm="systemd" exe="/usr/lib/systemd/systemd" hostname=? addr=? terminal=? res=success'
+[   11.561836] audit: type=1130 audit(1549460345.864:28): pid=1 uid=0 auid=4294967295 ses=4294967295 msg='unit=cpupower comm="systemd" exe="/usr/lib/systemd/systemd" hostname=? addr=? terminal=? res=success'
+[   11.563278] audit: type=1130 audit(1549460345.864:29): pid=1 uid=0 auid=4294967295 ses=4294967295 msg='unit=alsa-restore comm="systemd" exe="/usr/lib/systemd/systemd" hostname=? addr=? terminal=? res=success'
+[   11.565225] audit: type=1130 audit(1549460345.868:30): pid=1 uid=0 auid=4294967295 ses=4294967295 msg='unit=systemd-user-sessions comm="systemd" exe="/usr/lib/systemd/systemd" hostname=? addr=? terminal=? res=success'
+[   11.574099] IPv6: ADDRCONF(NETDEV_UP): eth0: link is not ready
+[   11.669385] audit: type=1130 audit(1549460345.971:31): pid=1 uid=0 auid=4294967295 ses=4294967295 msg='unit=ntpd comm="systemd" exe="/usr/lib/systemd/systemd" hostname=? addr=? terminal=? res=success'
+[   11.670525] audit: type=1130 audit(1549460345.974:32): pid=1 uid=0 auid=4294967295 ses=4294967295 msg='unit=lm_sensors comm="systemd" exe="/usr/lib/systemd/systemd" hostname=? addr=? terminal=? res=success'
+[   11.672052] audit: type=1130 audit(1549460345.974:33): pid=1 uid=0 auid=4294967295 ses=4294967295 msg='unit=fancontrol comm="systemd" exe="/usr/lib/systemd/systemd" hostname=? addr=? terminal=? res=success'
+[   18.067816] kauditd_printk_skb: 11 callbacks suppressed
+[   18.067818] audit: type=1006 audit(1549460352.371:45): pid=1320 uid=0 old-auid=4294967295 auid=1000 tty=(none) old-ses=4294967295 ses=2 res=1
+[   18.079326] audit: type=1130 audit(1549460352.381:46): pid=1 uid=0 auid=4294967295 ses=4294967295 msg='unit=user-runtime-dir at 1000 comm="systemd" exe="/usr/lib/systemd/systemd" hostname=? addr=? terminal=? res=success'
+[   18.084006] audit: type=1006 audit(1549460352.387:47): pid=1324 uid=0 old-auid=4294967295 auid=1000 tty=(none) old-ses=4294967295 ses=3 res=1
+[   18.126576] audit: type=1130 audit(1549460352.427:48): pid=1 uid=0 auid=4294967295 ses=4294967295 msg='unit=user at 1000 comm="systemd" exe="/usr/lib/systemd/systemd" hostname=? addr=? terminal=? res=success'
+[   20.878155] audit: type=1130 audit(1549460355.181:49): pid=1 uid=0 auid=4294967295 ses=4294967295 msg='unit=rtkit-daemon comm="systemd" exe="/usr/lib/systemd/systemd" hostname=? addr=? terminal=? res=success'
+[   24.277700] igb 0000:08:00.0 eth0: igb: eth0 NIC Link is Up 100 Mbps Full Duplex, Flow Control: RX/TX
+[   24.277946] IPv6: ADDRCONF(NETDEV_CHANGE): eth0: link becomes ready
+[   28.580534] audit: type=1131 audit(1549460362.880:50): pid=1 uid=0 auid=4294967295 ses=4294967295 msg='unit=user at 995 comm="systemd" exe="/usr/lib/systemd/systemd" hostname=? addr=? terminal=? res=success'
+[   28.614900] audit: type=1131 audit(1549460362.917:51): pid=1 uid=0 auid=4294967295 ses=4294967295 msg='unit=user-runtime-dir at 995 comm="systemd" exe="/usr/lib/systemd/systemd" hostname=? addr=? terminal=? res=success'
-- 
2.20.1
