Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 745A9378813
	for <linux-kernel-mentees@lists.linux.dev>; Wed, 24 Jun 2026 20:12:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782331950; cv=none; b=ceTZBaAutBpiG/TIz24Ow8MiP5J3eDbNkgcXAaIAkdWGFJmvcqCrAe81k3vDSqdNcDzHPYccZzTSYx8nBTjdzuDNHLmEP4NvJck0IPH9Y3clWaTKV4vl1HIuVoCEAHStaph998im+VVCSoAF8BfyIPyOb8NOM624to6TKNUE8HM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782331950; c=relaxed/simple;
	bh=YoZxzfoiX8EcBU6UADmbkS4MH0uM9Es49SnxDgSI19k=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=L/Ks5PItksHIAcMP1znzbmGkYoulqxN/ve+Uit8AnlxlgaKYrrvWyUSNRpjxLjTFLwgaIHAvyPnqedwF7htOvLS2lAC9G+e/OsY5sZd+6X2yFkrn5UW8u7VVTUZ+Pivod36u3igvHKaOZN7EKJzzELFbX0yikeAVbIERzYjiIAg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=n6sMn9mA; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="n6sMn9mA"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4923139e940so9539035e9.3
        for <linux-kernel-mentees@lists.linux.dev>; Wed, 24 Jun 2026 13:12:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782331948; x=1782936748; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=TtljtMLD5Lx+86GpxRMdGqKBkOQqfEYshOUkEZdK634=;
        b=n6sMn9mA8ZkFpOilMBA3Q1eMnhfu2CIqc5OHlg2tW7i+V1qsHgvli1P6nW0cxEqpQh
         t8KRDFcB6QVYbZzw8yLVRC6kYhJE84ZZwFo3/xKjKIEOchiu62VvlWgQcu+O+hOLJAyV
         V8C5RkYmFWzgGXHQNAwK/25kYVtZGMcxqaUlhLg2QeIQZ4Oh8j1VK8gzvDOe0qF+E6rr
         nDJKbWOjWx9akpd0lydGnF5haIZGumqiZ1DvOqrdK5GLIbNHEJcWrlfbjPSRRl9i4PDY
         F9ICPP5ieh3Te26VSvpRDG8HvhOrsoYq1goPLt0eNvFtnRLo+YFOsYhG6MbRdWJUbrsj
         ULvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782331948; x=1782936748;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TtljtMLD5Lx+86GpxRMdGqKBkOQqfEYshOUkEZdK634=;
        b=G8Nof/Wv9HT/32CuOadGn9cQ+Nx3uI378wS+8xAxG+Swm1xG0KzpQypkmt1lXcGPtN
         ypRcU1mUoLYV6tZxnVwrY9LYL9YjbZyh0rJVFn7cBbx6LcjAO914K1MiX/5IbtLX7VHO
         0sWuFi+g2U6kATvBBofyJWfMdM5khwSPixeS3eyTqP2a9fdOPfnKdrgB6WQIfc/YdqLH
         wH33W9Vk1Rm4KHpvqAdM+NjLaUw8znsBelXubft4bzB9KutbFBooV7Eb6bCEXVKcCbyi
         rgnCqBB9I2eXeXFKlODDlctJ6vH7GjRzHT9uq0LRWCo0DwXwP+V8TiJM2O2PwqU2lg/g
         gtPw==
X-Forwarded-Encrypted: i=1; AFNElJ80rtKrqre91PlWtNnRArsuXf9IkmtTZ1k2l9soHnBnK1XSCGqZaBIb8pR+K/psFtuFsSHo2t9RrVxuPFumys58KssFbA==@lists.linux.dev
X-Gm-Message-State: AOJu0YzTgBKr4s9MS2w5MqwFitn/kMnQwF0xKm/X63ZulLZpjM/+Obb7
	HyUReDZCdHVXSJHxLPtHOTDk3EMZ6N2aEYGNGE23IS8WLS1pqU/d3ZgVeYv1qqwH
X-Gm-Gg: AfdE7cm4orrr8bVKvlgVkJghe+cMqejJTVkVxXRdJn1eyZwarbuGLFm2p9b8pqVDBuT
	bBvF9ujLjSXVjIwqC41ZXvpAZB2QId3sKoJ8cKMS6+F8EdRN+ED5R8Caz/HOz8Dvaqh4MeZTxwT
	CuRt28Ah6EVgJT8+2JjR+SzjWFo38VH8vFjQCrgV2VLL8vURFuQGfGf4oYUs+O6CAjsZC5003qx
	CRqizwyVX7LNywDypHE555b2vC1PLwXavRunuATSH61EY9YQw515t21ZpuncpP8+OCktg8FUzfe
	xQW4dnCBSPMh8KgGfBL62oJhSQ3LSPFN55iVUIKTZEMindP0ki6gcSS4RdG/Ja94qZNDKI2XN4X
	IUQ5P43KEtghlSsS1AjyPaeHXMTVdLHtavXgRBtUuKaPUNbBsaJcKARK6Ims13xmsOEuSvUPSYG
	B9zeGfDLdN4a+cIkox2ILhbMxQpn/qdv1M/tRVrxJzQ+L7zDaDYTbH46u3BEjDBJiS3WU3yLpre
	Min
X-Received: by 2002:a05:600c:81c5:b0:492:4ed1:77cf with SMTP id 5b1f17b1804b1-4925b35338bmr109849825e9.11.1782331947642;
        Wed, 24 Jun 2026 13:12:27 -0700 (PDT)
Received: from torre-GIGABYTE-B550-AORUS-ELITE-V2 (212.pool95-21-2.static.orange.es. [95.21.2.212])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-46c2279b85csm9032612f8f.28.2026.06.24.13.12.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Jun 2026 13:12:27 -0700 (PDT)
From: =?UTF-8?q?=C3=93scar=20Meg=C3=ADa=20L=C3=B3pez?= <megia.oscar@gmail.com>
To: virtualization@lists.linux.dev,
	linux-kernel-mentees@lists.linux.dev
Cc: =?UTF-8?q?=C3=93scar=20Meg=C3=ADa=20L=C3=B3pez?= <megia.oscar@gmail.com>
Subject: [PATCH] drm/qxl: fix use-after-free in qxl_irq_handler on PCI
Date: Wed, 24 Jun 2026 22:12:18 +0200
Message-ID: <20260624201218.71628-1-megia.oscar@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

while :; do
    echo [pci qxl id] > /sys/bus/pci/drivers/qxl/unbind
    echo [pci qxl id] > /sys/bus/pci/drivers/qxl/bind
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
o  default_idle_call+0x37/0x60
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

I followed these steps to unload driver at link.

Added Disable the device from generating IRQs, Release the IRQ (free_irq())
at the start of qxl_pci_remove() to ensure no IRQs fire
after teardown begins.

Added at end Disable the device.

Assisted-by: OpenCode:1.17.8-Big Pickle
Fixes: 48bd85808443 ("drm/qxl: Convert to Linux IRQ interfaces")
Signed-off-by: Óscar Megía López <megia.oscar@gmail.com>
Link: https://www.kernel.org/doc/html/latest/PCI/pci.html
---
 drivers/gpu/drm/qxl/qxl_drv.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/gpu/drm/qxl/qxl_drv.c b/drivers/gpu/drm/qxl/qxl_drv.c
index 1e6a2392d7c6..1613547c1856 100644
--- a/drivers/gpu/drm/qxl/qxl_drv.c
+++ b/drivers/gpu/drm/qxl/qxl_drv.c
@@ -154,12 +154,19 @@ static void
 qxl_pci_remove(struct pci_dev *pdev)
 {
 	struct drm_device *dev = pci_get_drvdata(pdev);
+	struct qxl_device *qdev = to_qxl(dev);
+
+	qdev->ram_header->int_mask = 0;
+	outb(0, qdev->io_base + QXL_IO_UPDATE_IRQ);
+	free_irq(pdev->irq, dev);
+	cancel_work_sync(&qdev->client_monitors_config_work);
 
 	drm_kms_helper_poll_fini(dev);
 	drm_dev_unregister(dev);
 	drm_atomic_helper_shutdown(dev);
 	if (pci_is_vga(pdev) && pdev->revision < 5)
 		vga_put(pdev, VGA_RSRC_LEGACY_IO);
+	pci_disable_device(pdev);
 }
 
 static void
-- 
2.54.0

