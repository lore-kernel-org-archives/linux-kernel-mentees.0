Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B6611990B7
	for <linux-kernel-mentees@lists.linux.dev>; Sun, 22 Jun 2025 12:10:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750594214; cv=none; b=dKt7zNmwJ4+Tv8t9QkNj4ys+44OcGd4d6dyvk8AnX1LCGTwo7vnvULsTc6E92tetmzNA9FQj7YEllTSNm9RZl42gY8cwMhPb19fqh5JzcW0YHrY0vUYiCiMT9vlbPd1uA9E25DCUwR1EO5tMQ9TVdSTqGPWon5gyuHDQ0H8dRlw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750594214; c=relaxed/simple;
	bh=GPJghAiVi7VOk63edVJqM24DcZ/CIPgZ1+4yLmkPb4A=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=NCqos7qczZicQ1IHz9QLgHK+QhdXNEoLKH2UUkkCJHvJeIilPI1JX/KqCH7gWK310IPOtwUdxixWk2DVPe0tOjkVTgi8Y5vl45zKLs+AlbbE3liDKmteV2fF+NGbvpGNZOh/Nzp0MgqcqguTXEgAdpoglmlVizMWfEhe4axwSow=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JZl3538q; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JZl3538q"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2350fc2591dso27526305ad.1
        for <linux-kernel-mentees@lists.linux.dev>; Sun, 22 Jun 2025 05:10:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750594212; x=1751199012; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=vGN8wUzqZT1QG27/qcAPHinagutLgUrz9NBWB07ySsQ=;
        b=JZl3538qmney3v++YAwH2/SjJSuVmyDzrzUuXoZb8NKpVBW2tArDXN2KU5qrCEczGV
         NIHgToxQNrHQ41L+2mf7zykj/sNuUW0Qi5Beh4W/dg93on4d/YRmIN+B2j3XVma3qPVs
         xhymLol1x6nTVWgEYZO8pesQFDV4RanCFaX5JRkeEXfDyiJeEGs7UOI0I4JMUOWDFKQo
         tTAPcntSHGhCO+0b7+KMUj79RJMQ1HdsL4hzZ+sEeOpL2Ts+g1tqUSYZ8g2JhxvoqLOi
         p5LeZ9bFIF/8MTfyqhqIEBC8Jzvx/z/rZivMApmkAQAXTATB0vD03ynaHuIZJOeImSj/
         VLTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750594212; x=1751199012;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vGN8wUzqZT1QG27/qcAPHinagutLgUrz9NBWB07ySsQ=;
        b=KlDi6URf3dLVHYM6GBE2xjtlFRzHHSiVy1GJ8DAr+cIp2aAFd1TkUYjWWvOCWs+prn
         7kW9f3Cpxry81lnk8tc8zyQmBlX+TMzdvDMI7h0KzWw2xFwsOwFFjgJZUBwA/XxAICO1
         muJy0vwlZoHX+8QWL9fpVrJzDE90QKwmB0C1TVICdvVsY1TT2QFWTD1jLoQmAtdG9P4S
         3dVK3iOxXSunpPsgdb7HDeTaBbw7lUFZUy1FYN4asoB6zL8UahZ+Tpo7FYzOl1tDxovc
         jC62AJfFdb9q1J9KJOdY1VHRX3WD7Tk8rsdDla0vRpRl3/feOQWkHURlReVDDmXwyzla
         SicA==
X-Forwarded-Encrypted: i=1; AJvYcCU4cp+yNd1aYX6gCynYQ8vgXT57evaO8kxe1FCam977k6Wu3jhwR7EfsEDRnB0gYT06KNzf7eau4N3nd7sMU6PVBWCDTg==@lists.linux.dev
X-Gm-Message-State: AOJu0YxtXU7YV7WOe6Fwcfc1Oecz/fKZ+8ApTSeYpQ3qTgJzRfwf/yTD
	NJXb1JCSCIC5jaJI45AtABP1ZXLz6T+UOoXw2CQvgXqmvtFv9xQ7vNZA
X-Gm-Gg: ASbGncsoI0V1JHFT0ee99dqd5n0Awb/KMdIXdb6AJdgQCvWS6CbhVwwgjdDZqmOIvoc
	SdYWHTYlJBc0INqlPY3kg+9klKnXpr6g6fcMV1N909DwHdl+56fc76U2IbqS1rmyLa6yKSuAF0O
	0ka9u3X7s1wPIFlVix+dh64YvtHgWDi8R1JJM7JUIcgEAYJnmUm+FXYsSBGfmjwcN3w3zaelh4L
	mfS+jrITIPLzmdsE7RbRPxtFH5VYdZX32WU34ntbWsON1eWk5eQ3hpxc9WCgmFPRmsdvzCuhf7o
	ILMXe/joxLYHr0iWs6kRd8sz5FSpjYBEQ/iqJQjxW+mD8bqrla+Bg6mUIrh6sXgwSUCzoZVthAn
	IEUXdIh70zA==
X-Google-Smtp-Source: AGHT+IGvdawMvIJY2ifIVY5mQKrQfzDv/WHMHmDJxnhRFUaxlfdkEFCX9tHKTzTnj0IwvQ5q9m5ElA==
X-Received: by 2002:a17:902:e54e:b0:215:6c5f:d142 with SMTP id d9443c01a7336-237db0d5a62mr114971305ad.20.1750594212310;
        Sun, 22 Jun 2025 05:10:12 -0700 (PDT)
Received: from localhost.localdomain ([2401:4900:a059:4a3d:406c:f7fc:472d:e49b])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-237d86f381bsm60677085ad.220.2025.06.22.05.10.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Jun 2025 05:10:11 -0700 (PDT)
From: Pranav Tyagi <pranav.tyagi03@gmail.com>
To: dave@stgolabs.net,
	jonathan.cameron@huawei.com,
	dave.jiang@intel.com,
	alison.schofield@intel.com,
	vishal.l.verma@intel.com,
	ira.weiny@intel.com,
	dan.j.williams@intel.com,
	linux-cxl@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: ming.li@zohomail.com,
	rrichter@amd.com,
	peterz@infradead.org,
	skhan@linuxfoundation.org,
	linux-kernel-mentees@lists.linux.dev,
	Pranav Tyagi <pranav.tyagi03@gmail.com>
Subject: [PATCH] cxl/memdev: automate cleanup with __free()
Date: Sun, 22 Jun 2025 17:39:58 +0530
Message-ID: <20250622120958.475765-1-pranav.tyagi03@gmail.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use the scope based resource management (defined in linux/cleanup.h) to
automate the lifetime control of struct cxl_mbox_transfer_fw. This
eliminates explicit kfree() calls and makes the code more robust and
maintainable in presence of early returns.

Signed-off-by: Pranav Tyagi <pranav.tyagi03@gmail.com>
---
 drivers/cxl/core/memdev.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/cxl/core/memdev.c b/drivers/cxl/core/memdev.c
index f88a13adf7fa..be73a6099cb6 100644
--- a/drivers/cxl/core/memdev.c
+++ b/drivers/cxl/core/memdev.c
@@ -7,6 +7,7 @@
 #include <linux/slab.h>
 #include <linux/idr.h>
 #include <linux/pci.h>
+#include <linux/cleanup.h>
 #include <cxlmem.h>
 #include "trace.h"
 #include "core.h"
@@ -802,11 +803,11 @@ static int cxl_mem_activate_fw(struct cxl_memdev_state *mds, int slot)
 static int cxl_mem_abort_fw_xfer(struct cxl_memdev_state *mds)
 {
 	struct cxl_mailbox *cxl_mbox = &mds->cxlds.cxl_mbox;
-	struct cxl_mbox_transfer_fw *transfer;
 	struct cxl_mbox_cmd mbox_cmd;
 	int rc;
 
-	transfer = kzalloc(struct_size(transfer, data, 0), GFP_KERNEL);
+	struct cxl_mbox_transfer_fw *transfer __free(kfree) =
+		kzalloc(struct_size(transfer, data, 0), GFP_KERNEL);
 	if (!transfer)
 		return -ENOMEM;
 
@@ -822,7 +823,6 @@ static int cxl_mem_abort_fw_xfer(struct cxl_memdev_state *mds)
 	transfer->action = CXL_FW_TRANSFER_ACTION_ABORT;
 
 	rc = cxl_internal_send_cmd(cxl_mbox, &mbox_cmd);
-	kfree(transfer);
 	return rc;
 }
 
@@ -880,7 +880,7 @@ static enum fw_upload_err cxl_fw_write(struct fw_upload *fwl, const u8 *data,
 	struct cxl_dev_state *cxlds = &mds->cxlds;
 	struct cxl_mailbox *cxl_mbox = &cxlds->cxl_mbox;
 	struct cxl_memdev *cxlmd = cxlds->cxlmd;
-	struct cxl_mbox_transfer_fw *transfer;
+	struct cxl_mbox_transfer_fw *transfer __free(kfree);
 	struct cxl_mbox_cmd mbox_cmd;
 	u32 cur_size, remaining;
 	size_t size_in;
@@ -970,7 +970,6 @@ static enum fw_upload_err cxl_fw_write(struct fw_upload *fwl, const u8 *data,
 	rc = FW_UPLOAD_ERR_NONE;
 
 out_free:
-	kfree(transfer);
 	return rc;
 }
 
-- 
2.49.0

