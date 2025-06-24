Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F23E22258C
	for <linux-kernel-mentees@lists.linux.dev>; Tue, 24 Jun 2025 07:04:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750748697; cv=none; b=Ay8HdtQo+lEogKRlm12ZOKd9us54zqzTn2RcxAi/fd8o2dYOOqxeJQu9JS6Uwv+1ciBQ4DQME3cvsYunjhLlV+TJgTU7NrG9sRGTnPh5FRsEvhztHaM2RDfmjRbgMc5aAGGvmMXYZZ89k9X8E/NoPcZ+o5kaKYwTNpCRsg1qyn4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750748697; c=relaxed/simple;
	bh=WQIe86JuUNhj2gkklQzuWuDuGEmfX2qJAnjURmdjQsM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=AsCdO+zOKZLbbD/WGdlsg2SeqThqxjd+y5L+xC0b/6UTuWTSbGP9aYS0gM2mSnhrw9kH3LbzDx6+ndUhGgnt6kfHVymuZ7QiDFf1GPMpOgEkZsqK8tO+/Ud6C9wG0bWr7u6udG59pKQtOdAqqa8W8IIrlwD2usCIs6+Uyw4qs64=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SQ/taTul; arc=none smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SQ/taTul"
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-313154270bbso5530626a91.2
        for <linux-kernel-mentees@lists.linux.dev>; Tue, 24 Jun 2025 00:04:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750748694; x=1751353494; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=NFaPEwYqVk8swUeuusja02739T2S2QTaLE27xP5T8F4=;
        b=SQ/taTulh/ntlbwlGmA5z8/QrpfQxZBUhiN0tdiJNIWfD7xnPjN0AnOp8j2qC5aTl5
         gj1WvW4UoVnUCzsmymPuWuBCg3FvtEAHVh+qywl4CAfHFcqOmTikppcAOrNlFzqViCbZ
         hCgPPJvn3IZaOr2zzwFASPHeYTarHo3fpMlmiXcYDbsfUlHGH7ALp/UFIehZkbc1TE2T
         GeyFLYsJs0iyWRbtbI4ih1w2yjbdjeyzkU8TdXrAZcCVUUk6Wow0g2OPMMdtNrgFeurq
         ZDX0sc7lBXi8TJXC3WKFTMTaJ/OB+8OMzHWoosV2tDznxdnmlPgh/zGdD4SApME/yuUG
         w0jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750748694; x=1751353494;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NFaPEwYqVk8swUeuusja02739T2S2QTaLE27xP5T8F4=;
        b=Ge5jxA11ZZyZuU18MHyDg7U+kz8vEIFsC6hpqcxNpy9ZdiOIB1KVG4QuDl0GV6RpKS
         /IPHAzdrLHPpZ1akKO4gLS9SLR7wJEkyHkDIouEApWcqnb4dFD8tWJqM5e3/0x3BnhR9
         262EDm6RbktFDftISkNUrivpeolit9CDBSpBVaT0m0fMf2xoWsxGLoqT3nvZ7DNKax23
         Of5xsUR4lTmZlXBpId1AXtBRQJi29zWO6ZL3Q3CaeNFrU34LWYpl2TOi0VR/1kPj8FNA
         TPqIKUUzgaS4UOVU6sjcuMYaiuTf3cypiGXW1vf9h0xiqlfVLI4iqANzeUBt+oSMpRuu
         GrOw==
X-Forwarded-Encrypted: i=1; AJvYcCVxcgVE1YZfaANfHAMGqok6ayn2QI8NbmKgktbxbgSXSe6bF/lPyrsBu8uZFI2Ahld76CxI3ERwxpa3S6djnvCudek5HQ==@lists.linux.dev
X-Gm-Message-State: AOJu0Yz6eM+gWdySiPqLn3VIIt3cmvw3lR9tXcLgv5HKp6zEJnbC1eXw
	1BMKo55LQYpOp+82Kz8sSt/CX+dccf/vJ52FdTUGOX1KVb1m17h+Jg5z
X-Gm-Gg: ASbGnct7rGYFJf952pWOnIIfALqat/syV0zWbXTJ7gN7zqLpNongAh95op+uqZpjiOx
	TbHMvQ1a2JDDIhzoBuEZoymwa7Zh5W99KySlg1ucPS+F2WQ0mUS6cze/kgoNNA02xiTm+I6nleN
	Fm16/qTA//JYTiks3YyiHQE/FCWF26sYBNAL8GyQKm6hDiK+NrzVPWRSIGd5iy44JB5XZiPCJhN
	NJbyGUhukmrBQifdmB0bJN3MsLG0ByT0ZVjAeqJDhIcAf6GWgjHH/Y7aJ2MTw6KHuTUYk6nADmJ
	Kswk2s6P4a72dvyxOkYg8HbC+I9JBzvfs4hp57F8LfenBG2kbAJcopb0+ic0FiWgACdTXdz2foo
	G23a3
X-Google-Smtp-Source: AGHT+IEhlwIsSspUcRAJkdSSVmCisgdMIL1hyOAtY/muUDQ/EBJGGCf1AuTRLdemhb2h+4QRgwCiMA==
X-Received: by 2002:a17:90b:3cc5:b0:312:959:dc4d with SMTP id 98e67ed59e1d1-3159d6260efmr25628648a91.7.1750748694011;
        Tue, 24 Jun 2025 00:04:54 -0700 (PDT)
Received: from seokw-960QHA.lan ([210.100.209.148])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3159e06acfesm10479145a91.36.2025.06.24.00.04.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Jun 2025 00:04:53 -0700 (PDT)
From: Ryan Chung <seokwoo.chung130@gmail.com>
To: jgross@suse.com,
	sstabellini@kernel.org,
	oleksandr_tyshchenko@epam.com
Cc: linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linux.dev,
	Ryan Chung <seokwoo.chung130@gmail.com>
Subject: [PATCH v2] xen-pciback: Replace scnprintf() with sysfs_emit_at()
Date: Tue, 24 Jun 2025 16:04:42 +0900
Message-ID: <20250624070443.11740-1-seokwoo.chung130@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This change uses sysfs_emit() API usage for sysfs 'show'
functions as recommended from Documentation/filesystems/sysfs.rst.

No functional change intended.
Signed-off-by: Ryan Chung <seokwoo.chung130@gmail.com>
---
 drivers/xen/xen-pciback/pci_stub.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/xen/xen-pciback/pci_stub.c b/drivers/xen/xen-pciback/pci_stub.c
index 5c2f829d5b0b..045e74847fe6 100644
--- a/drivers/xen/xen-pciback/pci_stub.c
+++ b/drivers/xen/xen-pciback/pci_stub.c
@@ -1261,7 +1261,7 @@ static ssize_t slots_show(struct device_driver *drv, char *buf)
 		if (count >= PAGE_SIZE)
 			break;
 
-		count += scnprintf(buf + count, PAGE_SIZE - count,
+		count += sysfs_emit_at(buf, count,
 				   "%04x:%02x:%02x.%d\n",
 				   pci_dev_id->domain, pci_dev_id->bus,
 				   PCI_SLOT(pci_dev_id->devfn),
@@ -1290,7 +1290,7 @@ static ssize_t irq_handlers_show(struct device_driver *drv, char *buf)
 		if (!dev_data)
 			continue;
 		count +=
-		    scnprintf(buf + count, PAGE_SIZE - count,
+		    sysfs_emit_at(buf, count,
 			      "%s:%s:%sing:%ld\n",
 			      pci_name(psdev->dev),
 			      dev_data->isr_on ? "on" : "off",
@@ -1375,7 +1375,7 @@ static ssize_t quirks_show(struct device_driver *drv, char *buf)
 		if (count >= PAGE_SIZE)
 			goto out;
 
-		count += scnprintf(buf + count, PAGE_SIZE - count,
+		count += sysfs_emit_at(buf, count,
 				   "%02x:%02x.%01x\n\t%04x:%04x:%04x:%04x\n",
 				   quirk->pdev->bus->number,
 				   PCI_SLOT(quirk->pdev->devfn),
@@ -1391,7 +1391,7 @@ static ssize_t quirks_show(struct device_driver *drv, char *buf)
 			if (count >= PAGE_SIZE)
 				goto out;
 
-			count += scnprintf(buf + count, PAGE_SIZE - count,
+			count += sysfs_emit_at(buf, count,
 					   "\t\t%08x:%01x:%08x\n",
 					   cfg_entry->base_offset +
 					   field->offset, field->size,
@@ -1462,7 +1462,7 @@ static ssize_t permissive_show(struct device_driver *drv, char *buf)
 		if (!dev_data || !dev_data->permissive)
 			continue;
 		count +=
-		    scnprintf(buf + count, PAGE_SIZE - count, "%s\n",
+		    sysfs_emit_at(buf, count, "%s\n",
 			      pci_name(psdev->dev));
 	}
 	spin_unlock_irqrestore(&pcistub_devices_lock, flags);
@@ -1521,7 +1521,7 @@ static ssize_t allow_interrupt_control_show(struct device_driver *drv,
 		if (!dev_data || !dev_data->allow_interrupt_control)
 			continue;
 		count +=
-		    scnprintf(buf + count, PAGE_SIZE - count, "%s\n",
+		    sysfs_emit_at(buf, count, "%s\n",
 			      pci_name(psdev->dev));
 	}
 	spin_unlock_irqrestore(&pcistub_devices_lock, flags);
-- 
2.43.0

