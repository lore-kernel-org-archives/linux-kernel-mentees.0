Return-Path: <SRS0=mlYZ=3Q=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.3 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 93567C33CB7
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 27 Jan 2020 10:15:16 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 640B520702
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 27 Jan 2020 10:15:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XvfG0jLH"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 640B520702
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 4272F2047A;
	Mon, 27 Jan 2020 10:15:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bSqwdhNYb6EB; Mon, 27 Jan 2020 10:15:15 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id B992920026;
	Mon, 27 Jan 2020 10:15:15 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id A8FF0C0177;
	Mon, 27 Jan 2020 10:15:15 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 7BED4C0171
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 27 Jan 2020 10:15:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 6A52F20026
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 27 Jan 2020 10:15:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id r3iixskGMSKq
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 27 Jan 2020 10:15:12 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pj1-f68.google.com (mail-pj1-f68.google.com
 [209.85.216.68])
 by silver.osuosl.org (Postfix) with ESMTPS id AD1082047A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 27 Jan 2020 10:15:12 +0000 (UTC)
Received: by mail-pj1-f68.google.com with SMTP id f2so1904338pjq.1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 27 Jan 2020 02:15:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=+sMuF5qnUnN9Y8onz/B4zeL75IEd/ON79HtlJ1XRPFg=;
 b=XvfG0jLHnDaERvZ+WHnA6vywBGhXrHvlvVwQUv0Fu1WZ7t0zp8NsGU5a79TLmuRaBB
 iwIoJ68Yt2jM7poch61FpjmrNMxATkPBXcCBJWwlSTWJB5UQZ88YVS1cfJlPVbQjAn8R
 5z5b22IOLyq0OoTJh7cLUWuTdskuujTeyua0KrDNwgInvmIErZbLq8sy/ID9fdY8dFgs
 pN3jPCzKBDX68gWQ+Fb7cmWaTeEZGx9h13gLS0aNc6ON2NFexL5S9d+0XLs9ridT6ybi
 zoZjwzyNSHdgGVwE4Z22cYIh3UtS5m+cAImSt0VSHhZbn3x/GKQsSVGTqxJVJeFwnEuM
 2TCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=+sMuF5qnUnN9Y8onz/B4zeL75IEd/ON79HtlJ1XRPFg=;
 b=BB5o8Y1NKHHy9elHAaT0Uocs1+RqgOsG5iE7aWgmcKEspLcOgJTXFLU1ddpoUH6mXS
 9YtdSq8b9okCSb3yy6No8np4zgwq2Xhds5L2gakoJS2rDrUPIN78wqScjzvproPVNyEH
 GqLVT3CrCnaRc51gb1/mtgEw+cj1dMnrsnqggL3KqsmQpUFKynvE/Y7CeFSSKxyo8U96
 rhDquaAdEOIIQQZ2XAqGoVDgNT1ylrBONE+GU2EBEuFL1ziuiKq/2UzxsAO+hnMHB0Ez
 j28xdzpOTXZCDpFBQTLwwHncfUwEyDKfZtey4g2kwVTkivc80IC/3Vatp7LlUuzkbsXJ
 M0pw==
X-Gm-Message-State: APjAAAWvsdJdrM1BhUa5R4GA8zkNfKI236TbLq+DJo5I+7TLcn5r1XVK
 jTwtftobmeE9l9wxrjeVLWE=
X-Google-Smtp-Source: APXvYqwpspdRYPpxmAb+3sp5DfpMT0p35fOj7YL4PbTXIAGdRlX3cKuYysRJEfediyYGYOmDYq1j7w==
X-Received: by 2002:a17:90a:c983:: with SMTP id
 w3mr13584404pjt.121.1580120112342; 
 Mon, 27 Jan 2020 02:15:12 -0800 (PST)
Received: from localhost.localdomain ([2405:205:c902:a5e9:3956:8df2:aee5:9cf6])
 by smtp.gmail.com with ESMTPSA id s15sm15504138pgq.4.2020.01.27.02.15.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Jan 2020 02:15:11 -0800 (PST)
From: Pragat Pandya <pragat.pandya@gmail.com>
To: valdis.kletnieks@vt.edu,
	gregkh@linuxfoundation.org
Date: Mon, 27 Jan 2020 15:43:31 +0530
Message-Id: <20200127101343.20415-11-pragat.pandya@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200127101343.20415-1-pragat.pandya@gmail.com>
References: <20200127101343.20415-1-pragat.pandya@gmail.com>
Cc: devel@driverdev.osuosl.org, Pragat Pandya <pragat.pandya@gmail.com>,
 linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [PATCH 10/22] staging: exfat: Rename
	variable "SecSize" to "sec_size"
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

Change all the occurrences of "SecSize" to "sec_size" in exfat.

Signed-off-by: Pragat Pandya <pragat.pandya@gmail.com>
---
 drivers/staging/exfat/exfat.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/exfat/exfat.h b/drivers/staging/exfat/exfat.h
index a228350acdb4..58292495bb57 100644
--- a/drivers/staging/exfat/exfat.h
+++ b/drivers/staging/exfat/exfat.h
@@ -237,7 +237,7 @@ struct part_info_t {
 };
 
 struct dev_info_t {
-	u32      SecSize;    /* sector size in bytes */
+	u32      sec_size;    /* sector size in bytes */
 	u32      DevSize;    /* block device size in sectors */
 };
 
-- 
2.17.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
