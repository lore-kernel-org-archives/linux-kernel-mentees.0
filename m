Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 301E914F112
	for <linux-kernel-mentees@lists.linux.dev>; Sat,  8 Nov 2025 14:18:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762611537; cv=none; b=RiYfiSAyme1FcAY6+Vht/QRCKVYWUmTQwul3HmwF8QJbiP+TpuRnndsFhquAgEtxyM+vc0dsWpxUDNpxTYEC/ru6fbSbrwbrhSq0nsLjizTOCLbK40zAWB34yL8JReZ5tCCUY+GHFZt7Jx02x9VVONxGpyflWzvSKys4naJjNCU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762611537; c=relaxed/simple;
	bh=ZAWBzX0a54WgVpMoNdpAYLQpNuDibi0QFmX+nolbDCI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=nPxOWvmjSSYEymQz3MUxhDGtw+vQt9rm7PamRrWcjpwXO9vlevVIPKS4yi6ZRpOo+8Ojt59RHJSm4o67aGzCkM+DlecbxPMDhFzW8cT1pAKobddexWnmvwTmetD51wWKm6TABk/YgYgE7qg5R/CPZH+3cgX1z9+tPQu87acvi54=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ee.vjti.ac.in; spf=none smtp.mailfrom=ee.vjti.ac.in; dkim=pass (1024-bit key) header.d=vjti.ac.in header.i=@vjti.ac.in header.b=DA3RviF6; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ee.vjti.ac.in
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ee.vjti.ac.in
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=vjti.ac.in header.i=@vjti.ac.in header.b="DA3RviF6"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2964d616df7so21061235ad.3
        for <linux-kernel-mentees@lists.linux.dev>; Sat, 08 Nov 2025 06:18:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=vjti.ac.in; s=google; t=1762611535; x=1763216335; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+tbABRM++smOTjrYwL9jZfiTdA+E+dTcCgbmNoRiaFk=;
        b=DA3RviF6mFoyElWFsnt5tbzWujJDWBK/WKK7/sqhJ9oBBTQ7UZZ9dSp9hL/FDq5nfY
         esS/EdAeu+1tOb7HLWSVtySNqMtKeUgaQCeVDNEszn/lhlU7ZE+aDTnS7FlgWsYk5WZJ
         4q6bV9E1E2TjqIrLDzL2hei9AvK8OogsvBthY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762611535; x=1763216335;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=+tbABRM++smOTjrYwL9jZfiTdA+E+dTcCgbmNoRiaFk=;
        b=rU7ENPOD59qRSl+0fkOUsaZhoIymckfJPQkb724irf3aSpN4wLUtk/vxZI+uS5EbXh
         VrqSGpQkd+P6qm8AhmXBrDKI9Cf3ECmgBAmgyDlXcBr2yFn5ysKGM20vjtYItcii8xMm
         eld6B1jtY2NjaJzxoSWsZN+H3LUZtqGDvePcj+/FZ7HtBLeyWnD06Ry2HLfArQt0zJ8D
         v4R0kJV0IzFNWWEBNehRBNdHGjFy9xJSw8ACeAFVPizJgvMbGoHYxsx/S4fePd8P7Qcp
         NX5z7A8mab8SUHw5iQy+I347DLTI+HVSaGSLMc+C/GUZGN1+bu7wsbCwbidPMq4J9BDC
         ByFg==
X-Forwarded-Encrypted: i=1; AJvYcCXliXDG6PanPOkapo2+LrmHkRPxA/yFOTBDxhE/SjJaLlK70TK19DqiEzaBoVIVDEa15kp68lS3OVqB4nDqtNEMvRB7zQ==@lists.linux.dev
X-Gm-Message-State: AOJu0Yw6+ZacknTQ+grMCHE7zIMxA1vmAHv/lQGft/WRtd5/nOCE3qXG
	Ku4DKma4vJTgfqkQ+zcjoujKPneXSBEQLn0AbTUXKlK0BUyQOpP7WaFYW7swnlNibnM=
X-Gm-Gg: ASbGnctwksuhSpu9sqOory9tIXdj6Wf0xTJcX/SV16GsuHdLvc6ycuXEtj2NdSMlkq1
	vmMPexrrk77YoHpqMqQkJo9Fk50BFT2ksuEmFhzBj2Axa6A+fSiqSxcSEN1A7TqWnkuT756pp4s
	15UERK+rdhQJVMBhTEVrdIWMzPdEvCS12qKbpMlo1pkhJ1fe9lfJ4InzZBUqt4FTefxz0eKAvJ4
	W1X4faKJeJ8u7eqPvAZXKuSSiUkWCbe4PEx2lFAVCd0fOa+HUsODtD9iNvfWN+ODr1MnZ23tAXm
	HYBjUHHzEKFr7pQEUrhNmT4wG9h6MzHfA5D4VScl2d8jdFY/5fu4PBTzkMrxklZtILH1TUcu9jM
	eMGYJe+j+7fRN1J/V6nBCTXOquT2iWsXWEqodABpYZ02IdZgSrRNQIV7SQhO+/HpjhYm/anEioK
	4RDB7C9J9lNRk9CZgbgAbNraF7imO8XeilICuDKX01nC5T
X-Google-Smtp-Source: AGHT+IFCeb0OWUAtDUt6hRwnA2ps8eQb2CSjpBUF+IDZHNXFG8VCogkyWXts3NiibrXsnC+yerYFLw==
X-Received: by 2002:a17:902:da4b:b0:295:557e:7465 with SMTP id d9443c01a7336-297e540a394mr32978555ad.11.1762611535569;
        Sat, 08 Nov 2025 06:18:55 -0800 (PST)
Received: from ranegod-HP-ENVY-x360-Convertible-13-bd0xxx.. ([2405:201:31:d016:940a:b59:9e93:d45a])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29650e5a33bsm91980345ad.47.2025.11.08.06.18.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Nov 2025 06:18:54 -0800 (PST)
From: ssrane_b23@ee.vjti.ac.in
X-Google-Original-From: ssranevjti@gmail.com
To: shaggy@kernel.org
Cc: jfs-discussion@lists.sourceforge.net,
	linux-kernel@vger.kernel.org,
	akpm@linux-foundation.org,
	dsterba@suse.com,
	david@redhat.com,
	shivankg@amd.com,
	skhan@linuxfoundation.org,
	linux-kernel-mentees@lists.linux.dev,
	david.hunter.linux@gmail.com,
	khalid@kernel.org,
	Shaurya Rane <ssrane_b23@ee.vjti.ac.in>,
	syzbot+e87be72c9a6fe69996f5@syzkaller.appspotmail.com
Subject: [PATCH v3] jfs: Initialize synclist in metapage allocation
Date: Sat,  8 Nov 2025 19:48:34 +0530
Message-Id: <20251108141834.46428-2-ssranevjti@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251108141834.46428-1-ssranevjti@gmail.com>
References: <20251108141834.46428-1-ssranevjti@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Shaurya Rane <ssrane_b23@ee.vjti.ac.in>

The synclist field in struct metapage was not being initialized during
allocation in alloc_metapage(), leading to list corruption when the
metapage is later added to a transaction's sync list.

When diUpdatePMap() calls list_add(&mp->synclist, &tblk->synclist), if
the synclist field contains stale data from a previous allocation (such
as LIST_POISON values from a freed list node), the list debugging code
detects the corruption and triggers a stack segment fault.

This issue is intermittent because it only manifests when recycled
memory happens to contain poison values in the synclist field. The bug
was discovered by syzbot, which creates specific filesystem patterns
that reliably trigger this uninitialized memory usage.

Initialize the synclist field with INIT_LIST_HEAD() in alloc_metapage()
to ensure it's in a valid state before being used in list operations.
This is consistent with how the wait queue is initialized in the same
function.

Reported-by: syzbot+e87be72c9a6fe69996f5@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=e87be72c9a6fe69996f5
Signed-off-by: Shaurya Rane <ssrane_b23@ee.vjti.ac.in>

---
Tested:
 - Tested locally with syzbot reproducer, no errors observed
Changelog:
- Correct bug link
- Corrected patch format

 fs/jfs/jfs_metapage.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/fs/jfs/jfs_metapage.c b/fs/jfs/jfs_metapage.c
index 871cf4fb3636..77c512a0a42b 100644
--- a/fs/jfs/jfs_metapage.c
+++ b/fs/jfs/jfs_metapage.c
@@ -269,6 +269,7 @@ static inline struct metapage *alloc_metapage(gfp_t gfp_mask)
 		mp->data = NULL;
 		mp->clsn = 0;
 		mp->log = NULL;
+		INIT_LIST_HEAD(&mp->synclist);
 		init_waitqueue_head(&mp->wait);
 	}
 	return mp;
-- 
2.34.1

