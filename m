Return-Path: <SRS0=W7xB=CP=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B7720C43461
	for <linux-kernel-mentees@archiver.kernel.org>; Sun,  6 Sep 2020 20:12:13 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1FC93208B3
	for <linux-kernel-mentees@archiver.kernel.org>; Sun,  6 Sep 2020 20:12:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="L4BXwmWD"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1FC93208B3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 7C58A85B3B;
	Sun,  6 Sep 2020 20:12:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tCHOCZrux6Pr; Sun,  6 Sep 2020 20:12:10 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 99CCC85B11;
	Sun,  6 Sep 2020 20:12:10 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 8A340C0859;
	Sun,  6 Sep 2020 20:12:10 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 238CFC0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun,  6 Sep 2020 20:12:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id F0E0F203FB
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun,  6 Sep 2020 20:12:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1Og9rZonqbai
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun,  6 Sep 2020 20:12:07 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pg1-f193.google.com (mail-pg1-f193.google.com
 [209.85.215.193])
 by silver.osuosl.org (Postfix) with ESMTPS id C8840203FA
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun,  6 Sep 2020 20:12:07 +0000 (UTC)
Received: by mail-pg1-f193.google.com with SMTP id 67so7004693pgd.12
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 06 Sep 2020 13:12:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=fMygZrwawBCdGQ2bBFDMvJ3Y2e+cfl4sBDGo7UGztys=;
 b=L4BXwmWDvemqRJGMuLN9aM59ZoBRJbDiKherzXRYsVuFip8Ct5P0Xo8HzEgxOnEJLk
 fEyfQiKDUZOHF7XLgfXFHdnmZV23yYOSKwrO+2/N5ssNQqqzPcbIFZSzGkLgJkbe3i62
 jVEIcuIDzeDD26X5lY8scOfzlkXBvamq5dkXqjiDZFCv3RgLpISw25ly12G/Cwk6S48R
 MFu21cff5CVj4VjLwvZnL7yQqKjP2MNNMaf4lZ5rn4QRtDxvA3usHQiJiCMZMPGo5szU
 zEn3dnxBuKOgnQ72NzwoQBdCEQMXWuzfwh0XH5wGr5Hf4M0fWz1Xf8slBxWjg0Dedy/p
 lBQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=fMygZrwawBCdGQ2bBFDMvJ3Y2e+cfl4sBDGo7UGztys=;
 b=WquT/QuqVy+n3sKcpmjAG+MU4VU4Dbp/2gn/wRRoprZ6UXCY6Iinm3jMMT64L74TDG
 mhXBRfblXkdAC+lFy5ft+RLaN2u33AAiLrobAM6lAL9v9d35j4Z3i6eS8MLEH3KVMbSC
 6kvvlkM0ZaJf/wPqF8pNrsgazudYmxiZStxQqmZPP8YKztdrufujlrKlXguOFIMkvx2L
 AzfsrDoHELyvDldeIA78c0NNbOsxa6hO2CTNB+VLEVhL3gr6YjFGCTM0RpsQwsRXh1XX
 xxQZZ4mCpdVo1grS951ILiKBAsQvQ05mAgGwkE8rQOkra4WAz8fXIMF/APNqKhf9c2LY
 rMgg==
X-Gm-Message-State: AOAM5329hIdl8G744V0AexR8ApITHS/C/cKKlDWjYr5Z2LyH+5Bz9PGz
 Tr2utAJbY+ioN7qqsMCDSXADR+OIh25wvjv0
X-Google-Smtp-Source: ABdhPJwnui4bywCc/fybs+kbVubILOVIYNhTsWjZV7ufrjbUJTklHsHiivFQmhkzH7GUlBTPus5McA==
X-Received: by 2002:a62:5e04:: with SMTP id s4mr17619755pfb.67.1599423126651; 
 Sun, 06 Sep 2020 13:12:06 -0700 (PDT)
Received: from localhost.localdomain ([49.207.209.246])
 by smtp.gmail.com with ESMTPSA id v12sm10705735pgk.81.2020.09.06.13.12.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 06 Sep 2020 13:12:05 -0700 (PDT)
From: Anant Thazhemadam <anant.thazhemadam@gmail.com>
To: 
Date: Mon,  7 Sep 2020 01:41:56 +0530
Message-Id: <20200906201158.14014-1-anant.thazhemadam@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Cc: Jean-Philippe Brucker <jean-philippe@linaro.org>,
 Anant Thazhemadam <anant.thazhemadam@gmail.com>,
 Joerg Roedel <jroedel@suse.de>, Saravana Kannan <saravanak@google.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>, linux-kernel@vger.kernel.org,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 syzbot+b8639c8dcb5ec4483d4f@syzkaller.appspotmail.com,
 Dan Williams <dan.j.williams@intel.com>,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [PATCH] block : Fix use-after-free Read in
	delete_partition
X-BeenThere: linux-kernel-mentees@lists.linuxfoundation.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: <linux-kernel-mentees.lists.linuxfoundation.org>
List-Unsubscribe: <https://lists.linuxfoundation.org/mailman/options/linux-kernel-mentees>, 
 <mailto:linux-kernel-mentees-request@lists.linuxfoundation.org?subject=unsubscribe>
List-Archive: <http://lists.linuxfoundation.org/pipermail/linux-kernel-mentees/>
List-Post: <mailto:linux-kernel-mentees@lists.linuxfoundation.org>
List-Help: <mailto:linux-kernel-mentees-request@lists.linuxfoundation.org?subject=help>
List-Subscribe: <https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees>, 
 <mailto:linux-kernel-mentees-request@lists.linuxfoundation.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

A use-after-free read of the kobject member being casted out to the
device structure containing it seems to be potentially possible
due to unsafe casting using container_of (since an edge case such
as when the ptr being casted might be NULL or problematic is not
accounted for).
Using container_of_safe resolves this issue, with no obvious tradeoffs
and without considerable expense.

Reported-by: syzbot+b8639c8dcb5ec4483d4f@syzkaller.appspotmail.com
Tested-by: syzbot+b8639c8dcb5ec4483d4f@syzkaller.appspotmail.com
Signed-off-by: Anant Thazhemadam <anant.thazhemadam@gmail.com>
---
 include/linux/device.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/linux/device.h b/include/linux/device.h
index ca18da4768e3..aeb70b7a37e6 100644
--- a/include/linux/device.h
+++ b/include/linux/device.h
@@ -643,7 +643,7 @@ struct device_link {
 
 static inline struct device *kobj_to_dev(struct kobject *kobj)
 {
-	return container_of(kobj, struct device, kobj);
+	return container_of_safe(kobj, struct device, kobj);
 }
 
 /**
-- 
2.25.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
