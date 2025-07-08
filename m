Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E59441F949
	for <linux-kernel-mentees@lists.linux.dev>; Tue,  8 Jul 2025 00:14:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751933693; cv=none; b=Tq0ZC61TUuGcV+ZLwshf7kcnSQ7AH3X6THjyMlnTRzD6HPglVK765BU/yyHOQhtc32OMgEbhlU48YVe9kUNX00PU0j3WF75uTzhE99vEGVtJ41uuSu1A9TFfaLAo/GF2jDVXcWj1COBq0LMHBEmfqSQUGGlIiQFCEFIDYNazN/g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751933693; c=relaxed/simple;
	bh=dmlr9QU9PejKKi6yw4+ngRoaBiSbg3gp5UFCg3+6BGA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Y0sdFNcst8Wn5rqsvSuC1DK96flQGLIt2jg0a937qAlE4aeDKPR1si9iK72GZSlw/CVb5V6dX6cJD1hwvQNJrNSjwjo1IUFx3GVSPTS6dfgpOiS/eS3hdqU4EexSP0Daoe7P+klT8n6pBA8CuT7LEwUroD5F5ZLhQk/gfZ7ADTQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=j3rbGoj/; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="j3rbGoj/"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-234c5b57557so34616195ad.3
        for <linux-kernel-mentees@lists.linux.dev>; Mon, 07 Jul 2025 17:14:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751933691; x=1752538491; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZetFX6wW4YDbBAC0JxzbJ3+PwShQwl335DiD7tIdsd4=;
        b=j3rbGoj/kvTjiknN1fw2Dn99E42iI88HRutI/fED0+5RK307u0pWUa1+IIMzt9wiI3
         RfyNoJePp8aCg5/jrDC6L16/6Bgad04ScqxL9FZH+n7IFnlGWwr6/Z4b86o0CarlV4ZR
         NGri4PEEFJqc4CNn7YcDCTX1Yv2iUgRcEh6VU0zxGiUIRASgFcM1wS3SGoxyoWeihhy2
         sbCk3XUL6h+BPq7hPeXOMTITVFAsstaFaksu0f5x7vOvsv+7zGu9I80HyghZttIdnH7l
         44Pq7mFjmkOd7cTgkvWukCBGuS/7HD3eNKIYeZhaDJDreWyY9Q7MCwXwhhgc1ossMzfM
         n1Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751933691; x=1752538491;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZetFX6wW4YDbBAC0JxzbJ3+PwShQwl335DiD7tIdsd4=;
        b=BiqnEVBs/cWlpTvq63s+nN8Z8jfvOBJCgk6PMqkDvfTikKV7IbNCfv3g3ZiVWxVmXb
         zqK2Ll1xWrx6JmGWeemeofaQ0OkOKLMgUMUWnybDeKkrB95/+7A7f60xQ14YPbMzvNrU
         3Tpg/5zQW0PkEchvVeH10qoqplmY3nkYfnc4Smdf3XDkaGzCXwF25Z/2hDhSSbQ5Vebd
         6rM/qN26pJsBrh+pWDcswhEUMusHr+tg/yfvJOcJGhDVNLRCvwwQ9V5mDnl6PsIfFQUc
         PWl3k50by2Krv5ZYom9GyunSkqb/4ocsZgKhNpX0ITde1WVw9YcrbsfTW26ImoImHiiK
         7lwg==
X-Forwarded-Encrypted: i=1; AJvYcCUV40OyGXIoRQ3mo5JXWoaZS17sL6U8s1Rm25R/u1b/eRPY/xlsmoNioTzIszgN4iPpIawtZiygR8K2NQmnPbIipLKZcA==@lists.linux.dev
X-Gm-Message-State: AOJu0YzHID4Bk+3hoU3IS4Aj0CMrjKmcE76mC401tEZYmDsnN4eyOL/R
	jLBgTUGmsBrg22T/Xz8fNimZuqRIYg1MezaYP4gi4TBBKOJS7oW/JIWt
X-Gm-Gg: ASbGnctkDRMbfZBIL6xZayI6yYwEphGjFN0OGsjpgIb/L8B3/HGQgc7eK4PekOtTCHZ
	xL0hAxuIW02hJ4maDUA1l0ZW3UKt8+3/GpiMn8jIlLEyDWRg6Bdvc4jubKGWhAntTggvz8V7BGf
	bdLPXW9/hqxTM/dy89ty0TzADN77HAEIqh5cHMkwnFYiSkUPMOOqLLkC9MloNW2a9m+wegYwgbY
	YBLok7JxFI0zw34jL0bbQ1vxyjTw2eQpDnRGA8bsMzZ4ySbtzVQsHF7kib9lxnrN8CDiG0eJfCh
	q+9lHi4vJHX+HFWQFJtsLNtVg+moDF2C2gEbfvfBPDocSwn3y6i0Obj/YawekZaHNlwFtQrQIGK
	Jscu5bR5t
X-Google-Smtp-Source: AGHT+IG8TGYBMB1axi5fHGbVJ42BJ87cjqsFjSk1o0khIde1Z/ZybxhjiWb4KmGSQ8SCNbMNkpEj1g==
X-Received: by 2002:a17:903:2784:b0:234:986c:66e0 with SMTP id d9443c01a7336-23c85d8f78dmr180752565ad.4.1751933691057;
        Mon, 07 Jul 2025 17:14:51 -0700 (PDT)
Received: from localhost.localdomain ([115.137.3.141])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-31c22055c73sm481201a91.1.2025.07.07.17.14.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Jul 2025 17:14:50 -0700 (PDT)
From: Ryan Chung <seokwoo.chung130@gmail.com>
To: jgross@suse.com,
	sstabellini@kernel.org,
	oleksandr_tyshchenko@epam.com
Cc: linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linux.dev,
	Ryan Chung <seokwoo.chung130@gmail.com>
Subject: [PATCH v3] xen-pciback: Replace scnprintf() with sysfs_emit_at()
Date: Tue,  8 Jul 2025 09:14:40 +0900
Message-ID: <20250708001444.86155-1-seokwoo.chung130@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250624070443.11740-1-seokwoo.chung130@gmail.com>
References: <20250624070443.11740-1-seokwoo.chung130@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This is the third revision (v3) of this patch series.
No changes since v2—only adding Reviewed-by lines.

Reviewed-by: Juergen Gross <jgross@suse.com>
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

