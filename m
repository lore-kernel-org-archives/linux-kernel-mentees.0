From: linux.bhar at gmail.com (Bharath Vedartham)
Date: Sun, 14 Apr 2019 12:57:40 +0530
Subject: [Linux-kernel-mentees] lkmp: [1] Stable release report
Message-ID: <20190414072740.GA16190@bharath12345-Inspiron-5559>
List-Id: <linux-kernel-mentees.lists.linuxfoundation.org>

Hi all, 

This is my first stable release report. It is not at all perfect but I
would like some feedback on how to do this properly, so that I can
improve from the next report on.

I used my generic kernel as reference for dmesg.(4.4.0-145-generic)
I have built the stable kernel with the default .config file rather than
using my machines config file. 

This is my machine details:
5.1.0-rc3 #1 SMP Sat Apr 13 18:41:40 IST 2019 x86_64 x86_64 x86_64 GNU/Linux
Currently running the latest stable release.

Dmesg:

There were no KERN_ALERT, KERN_EMERG level messages for generic and stable
kernels. 
KERN_ERR level:
(for stable release)
tpm_crb MSFT0101:00: [Firmware Bug]: ACPI region does not cover the
entire command/response buffer. [mem 0xfed40000-0xfed4087f flags 0x200]
vs fed40080 f80
tpm_crb MSFT0101:00: [Firmware Bug]: ACPI region does not cover the
entire command/response buffer. [mem 0xfed40000-0xfed4087f flags 0x200]
vs fed40080 f80

(for generic kernel)
tpm_crb MSFT0101:00: can't request region for resource [mem
0xfed40080-0xfed40fff]
radeon 0000:01:00.0: VCE init error (-22).
radeon 0000:01:00.0: VCE init error (-22).
radeon 0000:01:00.0: VCE init error (-22).

KERN_WARN level:
(for stable release)
ENERGY_PERF_BIAS: Set to 'normal', was 'performance'
ENERGY_PERF_BIAS: View and update with x86_energy_perf_policy(8)
i8042: Warning: Keylock active
wmi_bus wmi_bus-PNP0C14:00: WQBC data block query control method not
found
ATPX version 1, functions 0x00000033
ATPX Hybrid Graphics
psmouse serio1: synaptics: The touchpad can support a better bus than
the too old PS/2 protocol. Make sure MOUSE_PS2_SYNAPTICS_SMBUS and
RMI4_SMB are enabled to get a better touchpad experience.
i915 0000:00:02.0: Direct firmware load for i915/skl_dmc_ver1_27.bin
failed with error -2
i2c_hid i2c-DLLC6B2:00: i2c-DLLC6B2:00 supply vdd not found, using dummy
regulator
i2c_hid i2c-DLLC6B2:00: i2c-DLLC6B2:00 supply vddl not found, using
dummy regulator
uvcvideo 1-5:1.0: Entity type for entity Extension 4 was not
initialized!
uvcvideo 1-5:1.0: Entity type for entity Extension 7 was not
initialized!
uvcvideo 1-5:1.0: Entity type for entity Processing 2 was not
initialized!
uvcvideo 1-5:1.0: Entity type for entity Camera 1 was not initialized!
kauditd_printk_skb: 7 callbacks suppressed

(for generic kernel)
ACPI: RSDP 0x0000000077FD4000 000024 (v02 DELL  )
ACPI: XSDT 0x0000000077FD40B8 0000F4 (v01 DELL   CBX3     01072009 AMI
00010013)
ACPI: FACP 0x0000000077FF1C88 00010C (v05 DELL   CBX3     01072009 AMI
00010013)
ACPI: DSDT 0x0000000077FD4240 01DA46 (v02 DELL   CBX3     01072009 INTL
20120913)
ACPI: FACS 0x0000000077F97F80 000040
ACPI: APIC 0x0000000077FF1D98 000084 (v03 DELL   CBX3     01072009 AMI
00010013)
ACPI: FPDT 0x0000000077FF1E20 000044 (v01 DELL   CBX3     01072009 AMI
00010013)
ACPI: FIDT 0x0000000077FF1E68 00009C (v01 DELL   CBX3     01072009 AMI
00010013)
ACPI: MCFG 0x0000000077FF1F08 00003C (v01 DELL   CBX3     01072009 MSFT
00000097)
ACPI: HPET 0x0000000077FF1F48 000038 (v01 DELL   CBX3     01072009 AMI.
0005000B)
ACPI: SSDT 0x0000000077FF1F80 000315 (v01 SataRe SataTabl 00001000 INTL
20120913)
ACPI: LPIT 0x0000000077FF2298 000094 (v01 INTEL  SKL-ULT  00000000 MSFT
0000005F)
ACPI: SSDT 0x0000000077FF2330 000248 (v02 INTEL  sensrhub 00000000 INTL
20120913)
ACPI: SSDT 0x0000000077FF2578 002BAE (v02 INTEL  PtidDevc 00001000 INTL
20120913)
ACPI: SSDT 0x0000000077FF5128 000C45 (v02 INTEL  Ther_Rvp 00001000 INTL
20120913)
ACPI: DBGP 0x0000000077FF5D70 000034 (v01 INTEL           00000000 MSFT
0000005F)
ACPI: DBG2 0x0000000077FF5DA8 000054 (v00 INTEL           00000000 MSFT
0000005F)
ACPI: SSDT 0x0000000077FF5E00 000740 (v02 INTEL  xh_rvp07 00000000 INTL
20120913)
ACPI: BOOT 0x0000000077FF6540 000028 (v01 DELL   CBX3     01072009 AMI
00010013)
ACPI: SSDT 0x0000000077FF6568 003531 (v02 SaSsdt SaSsdt   00003000 INTL
20120913)
ACPI: UEFI 0x0000000077FF9AA0 000042 (v01                 00000000
00000000)
ACPI: SSDT 0x0000000077FF9AE8 000E58 (v02 CpuRef CpuSsdt  00003000 INTL
20120913)
ACPI: MSDM 0x0000000077FFA940 000055 (v03 DELL   CBX3     06222004 AMI
00010013)
ACPI: SLIC 0x0000000077FFA998 000176 (v03 DELL   CBX3     01072009 MSFT
00010013)
ACPI: SSDT 0x0000000077FFAB10 000527 (v02 SgRef  SgPch    00001000 INTL
20120913)
ACPI: DMAR 0x0000000077FFB038 0000F0 (v01 INTEL  SKL      00000001 INTL
00000001)
ACPI: TPM2 0x0000000077FFB128 000034 (v03        Tpm2Tabl 00000001 AMI
00000000)
ACPI: SSDT 0x0000000077FFB160 000DC8 (v01 AmdRef AmdTabl  00001000 INTL
20120913)
ACPI: ASF! 0x0000000077FFBF28 0000A5 (v32 INTEL   HCG     00000001 TFSM
000F4240)
ACPI: BGRT 0x0000000077FFBFD0 000038 (v00 ?\xffffffa2ry
01072009 AMI  00010013)
ACPI: 10 ACPI AML tables successfully acquired and loaded
ENERGY_PERF_BIAS: Set to 'normal', was 'performance'
ENERGY_PERF_BIAS: View and update with x86_energy_perf_policy(8)
 #2 #3
 PCCT header not found.
 ACPI: Executed 21 blocks of module-level executable AML code
 ACPI: Dynamic OEM Table Load:
 ACPI: SSDT 0xFFFF880278973000 00061E (v02 PmRef  Cpu0Ist  00003000 INTL
 20120913)
 ACPI: Dynamic OEM Table Load:
 ACPI: SSDT 0xFFFF880278A54800 00037F (v02 PmRef  Cpu0Cst  00003001 INTL
 20120913)
 ACPI: Dynamic OEM Table Load:
 ACPI: SSDT 0xFFFF880278973800 0005AA (v02 PmRef  ApIst    00003000 INTL
 20120913)
 ACPI: Dynamic OEM Table Load:
 ACPI: SSDT 0xFFFF8802789ED200 000119 (v02 PmRef  ApCst    00003000 INTL
 20120913)
 ACPI: Enabled 6 GPEs in block 00 to 7F
 tpm_crb: probe of MSFT0101:00 failed with error -16
 i8042: Warning: Keylock active
 r8169 0000:03:00.0: can't disable ASPM; OS doesn't have ASPM control
 CRAT table not found
 ATPX version 1, functions 0x00000033
 audit_printk_skb: 21 callbacks suppressed

I ran kselftests as root but I am unsure on how to effectively
communicate the results of kselftests? I also think that some of the
dmesgs might be specific to my machine and may not be generic.

I would love some feedback on this report. 

Is it ok if I prefix my stable release reports with a number to keep
track of how  many reports I have submitted? 
eg:- [2] Stable release report will be my 2nd stable release report. 

Thank you,
Bharath Vedartham
