From: shreeya.patel23498 at gmail.com (Shreeya Patel)
Date: Sat, 13 Jul 2019 15:45:14 +0530
Subject: [Linux-kernel-mentees] [PATCH 5.2 00/61] 5.2.1-stable review
In-Reply-To: <20190712121620.632595223@linuxfoundation.org>
References: <20190712121620.632595223@linuxfoundation.org>
Message-ID: <c32535cfc39724655c7ed0933cae44a779d120f9.camel@gmail.com>
List-Id: <linux-kernel-mentees.lists.linuxfoundation.org>

On Fri, 2019-07-12 at 14:19 +0200, Greg Kroah-Hartman wrote:
> This is the start of the stable review cycle for the 5.2.1 release.
> There are 61 patches in this series, all will be posted as a response
> to this one.  If anyone has any issues with these being applied,
> please
> let me know.
> 
> Responses should be made by Sun 14 Jul 2019 12:14:36 PM UTC.
> Anything received after that time might be too late.
> 
> The whole patch series can be found in one patch at:
> 	
> https://www.kernel.org/pub/linux/kernel/v5.x/stable-review/patch-5.2.1-rc1.gz
> or in the git tree and branch at:
> 	git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-
> stable-rc.git linux-5.2.y
> and the diffstat can be found below.
> 

Compiled and booted successfully. No dmesg regressions.

Thanks

> thanks,
> 
> greg k-h
> 
> -------------
> Pseudo-Shortlog of commits:
> 
> Greg Kroah-Hartman <gregkh at linuxfoundation.org>
>     Linux 5.2.1-rc1
> 
> Arnd Bergmann <arnd at arndb.de>
>     staging: rtl8712: reduce stack usage, again
> 
> Dave Stevenson <dave.stevenson at raspberrypi.org>
>     staging: bcm2835-camera: Handle empty EOS buffers whilst
> streaming
> 
> Dave Stevenson <dave.stevenson at raspberrypi.org>
>     staging: bcm2835-camera: Remove check of the number of buffers
> supplied
> 
> Dave Stevenson <dave.stevenson at raspberrypi.org>
>     staging: bcm2835-camera: Ensure all buffers are returned on
> disable
> 
> Dave Stevenson <dave.stevenson at raspberrypi.org>
>     staging: bcm2835-camera: Replace spinlock protecting context_map
> with mutex
> 
> Colin Ian King <colin.king at canonical.com>
>     staging: fsl-dpaa2/ethsw: fix memory leak of switchdev_work
> 
> Nicolas Saenz Julienne <nsaenzjulienne at suse.de>
>     staging: vchiq: revert "switch to wait_for_completion_killable"
> 
> Nicolas Saenz Julienne <nsaenzjulienne at suse.de>
>     staging: vchiq: make wait events interruptible
> 
> Nicolas Saenz Julienne <nsaenzjulienne at suse.de>
>     staging: vchiq_2835_arm: revert "quit using custom
> down_interruptible()"
> 
> Vishnu DASA <vdasa at vmware.com>
>     VMCI: Fix integer overflow in VMCI handle arrays
> 
> Ross Zwisler <zwisler at chromium.org>
>     Revert "x86/build: Move _etext to actual end of .text"
> 
> Christian Lamparter <chunkeey at gmail.com>
>     carl9170: fix misuse of device driver API
> 
> Suzuki K Poulose <suzuki.poulose at arm.com>
>     coresight: tmc-etf: Do not call smp_processor_id from preemptible
> 
> Suzuki K Poulose <suzuki.poulose at arm.com>
>     coresight: tmc-etr: alloc_perf_buf: Do not call smp_processor_id
> from preemptible
> 
> Suzuki K Poulose <suzuki.poulose at arm.com>
>     coresight: tmc-etr: Do not call smp_processor_id() from
> preemptible
> 
> Suzuki K Poulose <suzuki.poulose at arm.com>
>     coresight: etb10: Do not call smp_processor_id from preemptible
> 
> Dan Carpenter <dan.carpenter at oracle.com>
>     coresight: Potential uninitialized variable in probe()
> 
> Fabrice Gasnier <fabrice.gasnier at st.com>
>     iio: adc: stm32-adc: add missing vdda-supply
> 
> Todd Kjos <tkjos at android.com>
>     binder: return errors from buffer copy functions
> 
> Todd Kjos <tkjos at android.com>
>     binder: fix memory leak in error path
> 
> Nick Desaulniers <ndesaulniers at google.com>
>     lkdtm: support llvm-objcopy
> 
> Sebastian Parschauer <s.parschauer at gmx.de>
>     HID: Add another Primax PIXART OEM mouse quirk
> 
> Sergio Paracuellos <sergio.paracuellos at gmail.com>
>     staging: mt7621-pci: fix PCIE_FTS_NUM_LO macro
> 
> Ian Abbott <abbotti at mev.co.uk>
>     staging: comedi: amplc_pci230: fix null pointer deref on
> interrupt
> 
> Stefan Wahren <wahrenst at gmx.net>
>     staging: bcm2835-camera: Restore return behavior of
> ctrl_set_bitrate()
> 
> Ajay Singh <ajay.kathat at microchip.com>
>     staging: wilc1000: fix error path cleanup in
> wilc_wlan_initialize()
> 
> Ian Abbott <abbotti at mev.co.uk>
>     staging: comedi: dt282x: fix a null pointer deref on interrupt
> 
> Christian Lamparter <chunkeey at gmail.com>
>     p54: fix crash during initialization
> 
> Nikolaus Voss <nikolaus.voss at loewensteinmedical.de>
>     drivers/usb/typec/tps6598x.c: fix 4CC cmd write
> 
> Nikolaus Voss <nikolaus.voss at loewensteinmedical.de>
>     drivers/usb/typec/tps6598x.c: fix portinfo width
> 
> Yoshihiro Shimoda <yoshihiro.shimoda.uh at renesas.com>
>     usb: renesas_usbhs: add a workaround for a race condition of
> workqueue
> 
> Martin Blumenstingl <martin.blumenstingl at googlemail.com>
>     usb: dwc2: use a longer AHB idle timeout in dwc2_core_reset()
> 
> Kiruthika Varadarajan <Kiruthika.Varadarajan at harman.com>
>     usb: gadget: ether: Fix race between gether_disconnect and
> rx_submit
> 
> Fei Yang <fei.yang at intel.com>
>     usb: gadget: f_fs: data_len used before properly set
> 
> Alan Stern <stern at rowland.harvard.edu>
>     p54usb: Fix race between disconnect and firmware loading
> 
> Oliver Barta <o.barta89 at gmail.com>
>     Revert "serial: 8250: Don't service RX FIFO if interrupts are
> disabled"
> 
> J?rgen Storvist <jorgen.storvist at gmail.com>
>     USB: serial: option: add support for GosunCn ME3630 RNDIS mode
> 
> Andreas Fritiofson <andreas.fritiofson at unjo.com>
>     USB: serial: ftdi_sio: add ID for isodebug v1
> 
> Brian Norris <briannorris at chromium.org>
>     mwifiex: Don't abort on small, spec-compliant vendor IEs
> 
> Andy Lutomirski <luto at kernel.org>
>     Documentation/admin: Remove the vsyscall=native documentation
> 
> Tim Chen <tim.c.chen at linux.intel.com>
>     Documentation: Add section about CPU vulnerabilities for Spectre
> 
> Dianzhang Chen <dianzhangchen0 at gmail.com>
>     x86/tls: Fix possible spectre-v1 in do_get_thread_area()
> 
> Dianzhang Chen <dianzhangchen0 at gmail.com>
>     x86/ptrace: Fix possible spectre-v1 in ptrace_get_debugreg()
> 
> Song Liu <songliubraving at fb.com>
>     perf header: Assign proper ff->ph in
> perf_event__synthesize_features()
> 
> Adrian Hunter <adrian.hunter at intel.com>
>     perf thread-stack: Fix thread stack return from kernel for
> kernel-only case
> 
> John Garry <john.garry at huawei.com>
>     perf pmu: Fix uncore PMU alias list for ARM64
> 
> Adrian Hunter <adrian.hunter at intel.com>
>     perf intel-pt: Fix itrace defaults for perf script intel-pt
> documentation
> 
> Adrian Hunter <adrian.hunter at intel.com>
>     perf auxtrace: Fix itrace defaults for perf script
> 
> Adrian Hunter <adrian.hunter at intel.com>
>     perf intel-pt: Fix itrace defaults for perf script
> 
> Douglas Anderson <dianders at chromium.org>
>     block, bfq: NULL out the bic when it's no longer valid
> 
> Ming Lei <ming.lei at redhat.com>
>     block: fix .bi_size overflow
> 
> Vadim Sukhomlinov <sukhomlinov at google.com>
>     tpm: Fix TPM 1.2 Shutdown sequence to prevent future TPM
> operations
> 
> Kees Cook <keescook at chromium.org>
>     tpm: Actually fail on TPM errors during "get random"
> 
> Kailang Yang <kailang at realtek.com>
>     ALSA: hda/realtek - Headphone Mic can't record after S3
> 
> Takashi Iwai <tiwai at suse.de>
>     ALSA: usb-audio: Fix parse of UAC2 Extension Units
> 
> Mauro Carvalho Chehab <mchehab+samsung at kernel.org>
>     media: stv0297: fix frequency range limit
> 
> Steven J. Magnani <steve.magnani at digidescorp.com>
>     udf: Fix incorrect final NOT_ALLOCATED (hole) extent length
> 
> Hongjie Fang <hongjiefang at asrmicro.com>
>     fscrypt: don't set policy for a dead directory
> 
> Christophe Leroy <christophe.leroy at c-s.fr>
>     crypto: talitos - rename alternative AEAD algos.
> 
> Eric Biggers <ebiggers at google.com>
>     crypto: lrw - use correct alignmask
> 
> Christophe Leroy <christophe.leroy at c-s.fr>
>     crypto: talitos - fix hash on SEC1.
> 
> 
> -------------
> 
> Diffstat:
> 
>  Documentation/admin-guide/hw-vuln/index.rst        |   1 +
>  Documentation/admin-guide/hw-vuln/spectre.rst      | 697
> +++++++++++++++++++++
>  Documentation/admin-guide/kernel-parameters.txt    |   6 -
>  Documentation/userspace-api/spec_ctrl.rst          |   2 +
>  Makefile                                           |   4 +-
>  arch/x86/kernel/ptrace.c                           |   5 +-
>  arch/x86/kernel/tls.c                              |   9 +-
>  arch/x86/kernel/vmlinux.lds.S                      |   6 +-
>  block/bfq-iosched.c                                |   1 +
>  block/bio.c                                        |  10 +-
>  crypto/lrw.c                                       |   2 +-
>  drivers/android/binder.c                           | 157 +++--
>  drivers/android/binder_alloc.c                     |  44 +-
>  drivers/android/binder_alloc.h                     |  22 +-
>  drivers/char/tpm/tpm-chip.c                        |   6 +-
>  drivers/char/tpm/tpm1-cmd.c                        |   7 +-
>  drivers/char/tpm/tpm2-cmd.c                        |   7 +-
>  drivers/crypto/talitos.c                           |  85 +--
>  drivers/hid/hid-ids.h                              |   1 +
>  drivers/hid/hid-quirks.c                           |   1 +
>  drivers/hwtracing/coresight/coresight-etb10.c      |   6 +-
>  drivers/hwtracing/coresight/coresight-funnel.c     |   1 +
>  drivers/hwtracing/coresight/coresight-tmc-etf.c    |   6 +-
>  drivers/hwtracing/coresight/coresight-tmc-etr.c    |  13 +-
>  drivers/iio/adc/stm32-adc-core.c                   |  21 +-
>  drivers/media/dvb-frontends/stv0297.c              |   2 +-
>  drivers/misc/lkdtm/Makefile                        |   3 +-
>  drivers/misc/vmw_vmci/vmci_context.c               |  80 +--
>  drivers/misc/vmw_vmci/vmci_handle_array.c          |  38 +-
>  drivers/misc/vmw_vmci/vmci_handle_array.h          |  29 +-
>  drivers/net/wireless/ath/carl9170/usb.c            |  39 +-
>  drivers/net/wireless/intersil/p54/p54usb.c         |  43 +-
>  drivers/net/wireless/intersil/p54/txrx.c           |   5 +-
>  drivers/net/wireless/marvell/mwifiex/fw.h          |  12 +-
>  drivers/net/wireless/marvell/mwifiex/scan.c        |  18 +-
>  drivers/net/wireless/marvell/mwifiex/sta_ioctl.c   |   4 +-
>  drivers/net/wireless/marvell/mwifiex/wmm.c         |   2 +-
>  drivers/staging/comedi/drivers/amplc_pci230.c      |   3 +-
>  drivers/staging/comedi/drivers/dt282x.c            |   3 +-
>  drivers/staging/fsl-dpaa2/ethsw/ethsw.c            |   1 +
>  drivers/staging/mt7621-pci/pci-mt7621.c            |   2 +-
>  drivers/staging/rtl8712/rtl871x_ioctl_linux.c      | 157 +++--
>  .../vc04_services/bcm2835-camera/bcm2835-camera.c  |  43 +-
>  .../vc04_services/bcm2835-camera/controls.c        |  19 +-
>  .../vc04_services/bcm2835-camera/mmal-vchiq.c      |  32 +-
>  .../vc04_services/bcm2835-camera/mmal-vchiq.h      |   3 +
>  .../interface/vchiq_arm/vchiq_2835_arm.c           |   2 +-
>  .../vc04_services/interface/vchiq_arm/vchiq_arm.c  |  21 +-
>  .../vc04_services/interface/vchiq_arm/vchiq_core.c |  31 +-
>  .../vc04_services/interface/vchiq_arm/vchiq_util.c |   6 +-
>  drivers/staging/wilc1000/wilc_netdev.c             |  12 +-
>  drivers/tty/serial/8250/8250_port.c                |   3 +-
>  drivers/usb/dwc2/core.c                            |   2 +-
>  drivers/usb/gadget/function/f_fs.c                 |   3 +-
>  drivers/usb/gadget/function/u_ether.c              |   6 +-
>  drivers/usb/renesas_usbhs/fifo.c                   |  34 +-
>  drivers/usb/serial/ftdi_sio.c                      |   1 +
>  drivers/usb/serial/ftdi_sio_ids.h                  |   6 +
>  drivers/usb/serial/option.c                        |   1 +
>  drivers/usb/typec/tps6598x.c                       |   6 +-
>  fs/crypto/policy.c                                 |   2 +
>  fs/iomap.c                                         |   2 +-
>  fs/udf/inode.c                                     |  93 ++-
>  fs/xfs/xfs_aops.c                                  |   2 +-
>  include/linux/bio.h                                |  18 +-
>  include/linux/vmw_vmci_defs.h                      |  11 +-
>  include/uapi/linux/usb/audio.h                     |  37 ++
>  sound/pci/hda/patch_realtek.c                      |   2 +-
>  sound/usb/mixer.c                                  |  16 +-
>  tools/perf/Documentation/intel-pt.txt              |  10 +-
>  tools/perf/util/auxtrace.c                         |   3 +-
>  tools/perf/util/header.c                           |   1 +
>  tools/perf/util/intel-pt.c                         |   3 +-
>  tools/perf/util/pmu.c                              |  28 +-
>  tools/perf/util/thread-stack.c                     |  30 +-
>  75 files changed, 1523 insertions(+), 527 deletions(-)
> 
> 
