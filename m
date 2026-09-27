Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D2933BBFC9
	for <linux-kernel-mentees@lists.linux.dev>; Sun, 27 Sep 2026 10:10:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790503858; cv=none; b=ppjCmLD9S8B4mFF3Q6vt8VFT2RaXJ8/LxVDOhOocUNaig2ox4pjsW/k/Kwv3b7QngYlY/S80y9N2tM65oPSp5DQuBNXKP5nkc/NXVSDP0UEJuykSkYA6VRSxvdAFMAJH03YbUanfGFVRQ8YG13xcmXP9SUsgzQG0nZcnwmnHIHw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790503858; c=relaxed/simple;
	bh=fSmSskI8VE/EVxV1z56H9ldUZamb/IQToTx09gb86c4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=og0ihxngm65vuplLZ/wD2SMwmp7o70oqkyJRA+eY+8V69Qxm79eEFBgj6vCL/p4lDvjzMHniiZ7jCl/3Jgl9bCKUThtJ+OpXK63cHzktc4WpRIv9mi0dkrSvrQjge2jKmL1/j7AgadK2zDAQNJCRx5THDGLN0HE8z8g6qyqUpK0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CkZBJ03z; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CkZBJ03z"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49e71cdb22bso15330095e9.2
        for <linux-kernel-mentees@lists.linux.dev>; Sun, 27 Sep 2026 03:10:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790503855; x=1791108655; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bxkdMpW5uls3bj2hzuo50IQLuq2BV88+7Gd3LoVozGo=;
        b=CkZBJ03zq5noJFTroYEgRFcSlfepfRwAqstjcU/TIdtl9XY84z9BugSo1BmqQDzPs0
         uAaLvw+RuNsxHRKzKCHM260TbWWZ+EyIbOraiBUEiugBohON+Br7Opx2RjoPftRkzZ0o
         lXIJKa9D2McoXVbIY3x1Oe316zgn8gcfB8yjHE0+zi1meB0QzpyfjMIepvvoaALx93v5
         I4Jp3kqwvIZ4yopTZXx1qX8EMw9xzK+bOwvkAIF3IhOJASNrw/8F2JP1PQ4QHlIfVDtx
         3ntjZvVE2VG+0pQorCURhCf9SDUwWDasFYnHw/5oldzEbvngtAt+78T2pYLauUxv/QQr
         kKcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790503855; x=1791108655;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=bxkdMpW5uls3bj2hzuo50IQLuq2BV88+7Gd3LoVozGo=;
        b=kE9OS46EtourMiOfYwA/azoz0soLA++10190ErpB72VSrW+80D+J/8rfTjbjXKPt5n
         VbxA+vZE3VQZw0IQTL5YCC1GTbk5s6/RVm/iCPj6mgw43gNAJmuuyUGW/VsBBF/fKAHa
         Iyy6e3udbkftHkMal0YtA0DLTgBdaDq3HnZErASGOmdm4cUv46P9dAb9dlhCip4aDTZW
         LeZZtqMbJcgfc8jrrBC5e4h+htCUuBl/hEC1FuDQ1phiOFZNP0+Rbw4f+txXdfIqUNHC
         zsbWr3/oHhS5p3mXzcaBRCufOhozRBVWZ+vBzLmU9X/vOBBpHWrchH1v9WSEbAhbNbcM
         vkfg==
X-Forwarded-Encrypted: i=1; AKwUvBz4NfrIuiMgwqoGf98Ch3ij9hXo1owZaz9IusYQ5Qe9h+Qb5crpEVO5Z3p1Qe8411hdwmIAnYqCw8MBCdBufRUdmRUx7A==@lists.linux.dev
X-Gm-Message-State: AFuF++n+TsqEszJz44CjolkyIJ94OxP5w1H6TWqLjlpcphRxpNDfV1Cf
	jA/aoqRAYaQV/8kn3KeTh7dTHIesmwqe2r+o2cpAA4kjuSVDHFySMkaS
X-Gm-Gg: AYBFou13qoFNb59gcxTktQlIMRuZeh+ICI29vOOHJ60kCSSGhQqMCGODBL10KhHEOwn
	dDdLuq8JayaM9kwgASemLSH96dpNXuV6Q+e1KREjIsBvpBkuxrAizI5DKo/b2+gR65JrannvK2D
	wP13Qh7vkC6WU1vnxMEQogxdBRp39BHqUPMorAj5hXQLGGc3+waEK8ojbP6VQFgjjyoT25jz23S
	s9rD9OTDB/XG4FOICJE1AInDW9FsyyxcNHJ++HVeIlx9Xme+YnvSlGnQmbqtsKLiX+KzHesnmt5
	bDQuRVyI5CAbYpw8MWbhooxuo2+/5ujwn5b1JHtJtcosw4ymkVklq+IKOvEyMRW+chCdvhYRzor
	DyCMw08+k5h4aDGFsXiB8MHnI7w6vuYEjFaWYQtwPRnTPMDppqBeuJbrJrnkAbtQaXxbou3uwUw
	U0btZ6bZ95slCetE+pawQEKyh3AvCAefNZIzCz/g9OQ/A3/yhsrp9rewzTmsQlMFSvDpsPmhPaS
	GZ128Wa/3U9qgQTl/OKE3c/3nGk05PVbtD03KVPsaoHVio2iWoThglGI0A3q8rCGlQWFNBO
X-Received: by 2002:a05:600c:1391:b0:49f:c18a:61c8 with SMTP id 5b1f17b1804b1-49fe66ff2c3mr187004185e9.29.1790503854348;
        Sun, 27 Sep 2026 03:10:54 -0700 (PDT)
Received: from torre-GIGABYTE-B550-AORUS-ELITE-V2 (212.pool95-21-2.static.orange.es. [95.21.2.212])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49ff285550asm125782045e9.3.2026.09.27.03.10.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2026 03:10:53 -0700 (PDT)
From: =?UTF-8?q?=C3=93scar=20Meg=C3=ADa=20L=C3=B3pez?= <megia.oscar@gmail.com>
To: Dave Airlie <airlied@redhat.com>,
	Gerd Hoffmann <kraxel@redhat.com>
Cc: =?UTF-8?q?=C3=93scar=20Meg=C3=ADa=20L=C3=B3pez?= <megia.oscar@gmail.com>,
	virtualization@lists.linux.dev,
	spice-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linux.dev
Subject: [PATCH v4] drm/qxl: fix use-after-free in qxl_irq_handler on PCI
Date: Sun, 27 Sep 2026 12:10:08 +0200
Message-ID: <20260927101026.45411-1-megia.oscar@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Executing below script:

i=0;\
while [ 1 -eq 1 ]; do\
  i=$((i+1)); echo 0000:00:01.0 > /sys/bus/pci/drivers/qxl/unbind;\
  if (($i%1000==0)); then\
      echo loops=$i; free;\
      grep nr_free_pages /proc/vmstat;\
      grep -E "VmallocUsed|Slab|Reclaimable|SUnreclaim" /proc/meminfo;\
      sync; echo 3 > /proc/sys/vm/drop_caches;\
      echo 1 > /proc/sys/vm/compact_memory;\
      udevadm settle;\
      free;\
      grep nr_free_pages /proc/vmstat;\
      grep -E "VmallocUsed|Slab|Reclaimable|SUnreclaim" /proc/meminfo;\
      uptime;\
  fi;\
  echo 0000:00:01.0 > /sys/bus/pci/drivers/qxl/bind;\
done

After a few seconds, it reports:

==================================================================
BUG: KASAN: slab-use-after-free in qxl_irq_handler+0x269/0x2b0
Read of size 8 at addr ffff888001c6cd48 by task swapper/0/0

CPU: 0 UID: 0 PID: 0 Comm: swapper/0 Not tainted
     7.1.0-10963-g1a3746ccbb0a #31 PREEMPT(lazy)
Hardware name: QEMU Standard PC (Q35 + ICH9, 2009),
               BIOS Arch Linux 1.17.0-2-2 04/01/2014
Call Trace:
 <IRQ>
 dump_stack_lvl+0x4d/0x70
 print_report+0x14b/0x4b0
 ? __pfx__raw_spin_lock_irqsave+0x10/0x10
 ? profile_tick+0x56/0x90
 ? tick_nohz_handler+0x23c/0x5c0
 kasan_report+0x117/0x140
 ? qxl_irq_handler+0x269/0x2b0
 ? qxl_irq_handler+0x269/0x2b0
 ? __pfx_qxl_irq_handler+0x10/0x10
 qxl_irq_handler+0x269/0x2b0
 ? __pfx_qxl_irq_handler+0x10/0x10
 ? __pfx_qxl_irq_handler+0x10/0x10
 __handle_irq_event_percpu+0x116/0x450
 ? __pfx__raw_spin_lock+0x10/0x10
 handle_irq_event+0xa6/0x1c0
 handle_fasteoi_irq+0x271/0xb10
 ? __pfx_handle_fasteoi_irq+0x10/0x10
 __common_interrupt+0x60/0x130
 common_interrupt+0x7a/0x90
 </IRQ>
 <TASK>
  asm_common_interrupt+0x26/0x40
 RIP: 0010:pv_native_safe_halt+0xf/0x20
 Code: 42 de 00 c3 cc cc cc cc 0f 1f 00 90 90 90 90 90 90 90 90 90
       90 90 90 90 90 90 90 f3 0f 1e fa eb 07 0f 00 2d a3 cf 20 00
       fb f4 <c3> cc cc cc cc 66 2e 0f 1f 84 00 00 00 00 00 66 90
       90 90 90 90 90
 RSP: 0018:ffffffffb8207e48 EFLAGS: 00000206
 RAX: ffff8880b296f000 RBX: ffffffffb82146c0 RCX: 0000000000000001
 RDX: 0000000000000001 RSI: 0000000000000004 RDI: 0000000000067a04
 RBP: fffffbfff70428d8 R08: ffffffffb7247e1d R09: 1ffff1100d846202
 R10: ffffed100d846203 R11: ffffed100d846203 R12: 0000000000000000
 R13: 0000000000000000 R14: 1ffffffff7040fcd R15: dffffc0000000000
  ? ct_kernel_exit.constprop.0+0x9d/0xc0
  default_idle+0x9/0x10
  default_idle_call+0x37/0x60
  do_idle+0x3a8/0x5d0
  ? __pfx___schedule+0x10/0x10
  ? __pfx_do_idle+0x10/0x10
  cpu_startup_entry+0x4e/0x60
  rest_init+0x11a/0x120
  start_kernel+0x382/0x390
  x86_64_start_reservations+0x24/0x30
  x86_64_start_kernel+0xd6/0xe0
  common_startup_64+0x13e/0x158
  </TASK>

The qxl_pci_remove() function does not call free_irq(), allowing the IRQ
handler to fire after the device has been torn down, accessing freed
memory (qdev->ram_header, qdev->io_base).

Added Disable the device from generating IRQs, Release the IRQ
at the start of qxl_pci_remove() to ensure no IRQs fire
after teardown begins.

Assisted-by: OpenCode:1.17.13-Big Pickle/DeepSeek V4 Flash
Fixes: 48bd85808443 ("drm/qxl: Convert to Linux IRQ interfaces")
Signed-off-by: Óscar Megía López <megia.oscar@gmail.com>
---
Changes in v2:
  - Updated qxl_ttm_init to add ttm_device_fini on error in
    qxl_ttm_init_mem_type.

Changes in v3:
  - Added free_irq on qxl_probe unload.
  - Set to NULL after free on qxl_device_fini and
    added idr_destroy on release_idr and surf_id_idr.
  - Free client_monitors_config.

Changes in v4:
  - Delete all code unnecessary. Leave only code to fix the BUG.
---
 drivers/gpu/drm/qxl/qxl_drv.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/qxl/qxl_drv.c b/drivers/gpu/drm/qxl/qxl_drv.c
index 1e6a2392d7c6..54c1b8a3c723 100644
--- a/drivers/gpu/drm/qxl/qxl_drv.c
+++ b/drivers/gpu/drm/qxl/qxl_drv.c
@@ -155,6 +155,9 @@ qxl_pci_remove(struct pci_dev *pdev)
 {
 	struct drm_device *dev = pci_get_drvdata(pdev);
 
+	disable_irq(pdev->irq);
+	free_irq(pdev->irq, dev);
+
 	drm_kms_helper_poll_fini(dev);
 	drm_dev_unregister(dev);
 	drm_atomic_helper_shutdown(dev);
-- 
2.55.0

