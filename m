Return-Path: <SRS0=6+LU=35=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.3 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 06D1BC35250
	for <linux-kernel-mentees@archiver.kernel.org>; Sun,  9 Feb 2020 15:35:15 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CE4FE20726
	for <linux-kernel-mentees@archiver.kernel.org>; Sun,  9 Feb 2020 15:35:14 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="k8V7I4kD"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CE4FE20726
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id AD1D786DE2;
	Sun,  9 Feb 2020 15:35:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tJ31bHZ9vgW7; Sun,  9 Feb 2020 15:35:13 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 8C8C681DD5;
	Sun,  9 Feb 2020 15:35:13 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 7CB5BC07FE;
	Sun,  9 Feb 2020 15:35:13 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id ACBE9C0171
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun,  9 Feb 2020 15:35:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id A93ED20425
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun,  9 Feb 2020 15:35:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id f2wfyXU8l10z
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun,  9 Feb 2020 15:35:11 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pf1-f193.google.com (mail-pf1-f193.google.com
 [209.85.210.193])
 by silver.osuosl.org (Postfix) with ESMTPS id 21B0820117
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun,  9 Feb 2020 15:35:11 +0000 (UTC)
Received: by mail-pf1-f193.google.com with SMTP id y73so2401174pfg.2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 09 Feb 2020 07:35:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=wJEO2wGMQKJV/ohpKPyAeBTsL/tteXWNt2JClbfnv8c=;
 b=k8V7I4kDs2EneTmD/2fFVHyS+EQi2hIinkVj3L+Ks1W/KB0pIBMGZpgXtisJsfOigd
 CvW2TZy7FA3VluMP6Hj8p77KIIiE+IjWSkJSCqhQw1oGOvsWcqNmQ0EgcuXggLMCc9zp
 TERhR9YNlIIr+ik52Ocr0d27V/N9XXC6KNmFDlJgMMsHjyRqYP1YhA6bMdDnIU4Xz7m4
 sZqzGOxf7Hjy6morkPmXnc/abuW53uVphYSg4PB/UtKXb4/+wEHuPGjuV72saw7B4eDo
 mbjPCcBuN6HetWjS3B8FE0cCLJZGULCQX3YLfHc4yxISbVgjDsdSxOC/3xcUxVYBULSu
 X/kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=wJEO2wGMQKJV/ohpKPyAeBTsL/tteXWNt2JClbfnv8c=;
 b=JFWMCZcuDkzMUxis8kcqGoyPBmEasuuusK10qRQu7r3LqxPApxR31R4/irQlwGCwiY
 I5dO6bzPb9WIf/TtjkizGMSJ/HY7/muWNbsmOzFQTY0TCsLCmSRG9EYXB7n4J6EwND79
 /zTQCPM+UVFDwtjpLMaZWAAIJYpnRgT15A0MrGZPe8duqyUh/L0junwgWuW+iyNX6Jv2
 kpdLu4BWOInZm9f2a64FzwRSj+wfvnfjnzr3/WxkzREX1K1zXj3ixOZ9h1SFMbmU1OPB
 QGtraVygXFi8aruvJs/XrFxIE2+JezQPmX32OwDnSHo8lUgch8+SvlQa0xeUO4pNy0lf
 ncCQ==
X-Gm-Message-State: APjAAAXxpY+ujFmIyBqrMaV2Hwt7tIW8dFRW2jom9NzXrm9RHBU6XbtE
 d5kqHcXpxTnvlFOAClDoCds=
X-Google-Smtp-Source: APXvYqw8yCg6wVwBM2m81xmUuy2nfZCMu+0ART74xY0kB8P1d24f8vBX8/H5p/5JWp8n0ZJaBPZ/MA==
X-Received: by 2002:a63:3084:: with SMTP id w126mr9540094pgw.169.1581262510673; 
 Sun, 09 Feb 2020 07:35:10 -0800 (PST)
Received: from localhost.localdomain ([2405:204:22ac:7250:d1c8:6411:2f12:731d])
 by smtp.gmail.com with ESMTPSA id c11sm9451702pfo.170.2020.02.09.07.35.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 09 Feb 2020 07:35:10 -0800 (PST)
From: Jaskaran Singh <jaskaransingh7654321@gmail.com>
To: cocci@systeme.lip6.fr
Date: Sun,  9 Feb 2020 21:04:51 +0530
Message-Id: <20200209153452.11837-3-jaskaransingh7654321@gmail.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200209153452.11837-1-jaskaransingh7654321@gmail.com>
References: <20200209153452.11837-1-jaskaransingh7654321@gmail.com>
MIME-Version: 1.0
Cc: julia.lawall@inria.fr, Jaskaran Singh <jaskaransingh7654321@gmail.com>,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [PATCH v4 2/3] tests: Add space between *
	and const in ptrconstptr.res
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

A space is now added between the * and qualifier. Reflect this
change in the ptrconstptr test case.

Signed-off-by: Jaskaran Singh <jaskaransingh7654321@gmail.com>
---
 tests/ptrconstptr.res | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/ptrconstptr.res b/tests/ptrconstptr.res
index f5b2210c..1d0c3c1d 100644
--- a/tests/ptrconstptr.res
+++ b/tests/ptrconstptr.res
@@ -1,3 +1,3 @@
 void main() {
-	const char *const *y;
+	const char * const *y;
 }
-- 
2.21.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
