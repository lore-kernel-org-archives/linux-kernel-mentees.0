Return-Path: <SRS0=yYPO=KQ=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CC933C433B4
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 21 May 2021 10:56:54 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6A07E613B6
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 21 May 2021 10:56:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6A07E613B6
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3193D60DDA;
	Fri, 21 May 2021 10:56:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kGXZcvoEf11s; Fri, 21 May 2021 10:56:53 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5DEAF605F5;
	Fri, 21 May 2021 10:56:53 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 3C65AC000D;
	Fri, 21 May 2021 10:56:53 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 874E8C0001
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 21 May 2021 10:56:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 76B7660DCF
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 21 May 2021 10:56:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1FKPbU-_9bZl
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 21 May 2021 10:56:51 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com
 [IPv6:2607:f8b0:4864:20::1034])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 50B8A605F5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 21 May 2021 10:56:51 +0000 (UTC)
Received: by mail-pj1-x1034.google.com with SMTP id
 o17-20020a17090a9f91b029015cef5b3c50so7125130pjp.4
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 21 May 2021 03:56:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=OMj8UtOKZd2HOLgsJ4v7RT7nDBlE06n7wLRp+Jshv9w=;
 b=BgB4kpW5A/BbrQiQVfXgfJTrpLCeXZJPZF/CzwXU203w6je18yLXBPaT3JGzmagOtN
 GoS1c/SuqBFc2MXZELZPK06DXRA3cik8qFBehjGCT3OHVbU/VqR9wAYXlDNcTJgYedBg
 y3y6HmUnp0RuFrnFpQDsbFg8kvbVntYvwtGSqJgHNBRcHMVeVTS5gq6wnyHOMffMGOnx
 MFew+SheuWR5BPQ/8RCgWs1GkGGTlPWX8i3SuvPxTgGcVyIxF31uGu3btU7KjoAX/0yc
 UrQVriS3v7rPp2h+5Ta0xBG9hYIUecqQaHRiDltG9by4lfHNttUug4GY7IlWdrmP+vHA
 hraw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=OMj8UtOKZd2HOLgsJ4v7RT7nDBlE06n7wLRp+Jshv9w=;
 b=I6o29YLnmaWEHLQi91TsPAchKjzcJaCVjl0SSI3MY1YXmbmNPNgv3GqFweHhuyb0Hb
 hXLK6ES3cOzBFhCBPngsRHqngYgZfUigWwAneYMbHPPG8Q0/L69M9K69RCJUzusgJjTJ
 VqJ6bvKPrx+9rZh6n4qVFiamSERxVRRuqP+ZDr9OR2yLVA/jROr9SzprypkEZvHJdw9I
 l8UUdte+dmrHp3RC8L3DmkTJz9lfGi2eCMxCJ6J+kfOlekgXkqhQNtwWXdsLJjvPkHb2
 norfzVEgjTh5MoMDl1vrEtdH1QCJDoEIvFm0ljtdjnfOp5wRsGVk35s3fNuLLjl52ojV
 fhwg==
X-Gm-Message-State: AOAM532MXcr4SWw2VGw4xOE47qEz7eDiX196xAJK4Q29NqlUFakPMGJK
 aIz4MEQlpcZAo7ESTvn7VGs=
X-Google-Smtp-Source: ABdhPJzG5m+mqW5TAplKQGYXrKfzeh+aTFi5d3vDnPDZB6b9NzKBhXTuMBU7MazvagTwaQY5e+Y7GQ==
X-Received: by 2002:a17:902:ee54:b029:ef:8497:e097 with SMTP id
 20-20020a170902ee54b02900ef8497e097mr11468049plo.22.1621594610712; 
 Fri, 21 May 2021 03:56:50 -0700 (PDT)
Received: from localhost.localdomain ([139.167.194.135])
 by smtp.gmail.com with ESMTPSA id c195sm4337309pfb.144.2021.05.21.03.56.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 May 2021 03:56:50 -0700 (PDT)
From: Aviral Gupta <shiv14112001@gmail.com>
To: viro@zeniv.linux.org.uk,
	shuah@kernal.org
Subject: [PATCH] This commit fixes the error generated due to the wrong
 indentation which does not follow the codding style norms set by Linux-kernel
 and space- bar is used in place of tab to give space which causes a visual
 error for some compilers
Date: Fri, 21 May 2021 16:26:54 +0530
Message-Id: <20210521105654.4046-1-shiv14112001@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Cc: linux-fsdevel@vger.kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org, linux-kernel@vger.kernel.org
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

ERROR: switch and case should be at the same indent
+	switch (whence) {
+		case 1:
[...]
+		case 0:
[...]
+		default:
ERROR: code indent should use tabs where possible
+                              void (*callback)(struct dentry *))$

Signed-off-by: Aviral Gupta <shiv14112001@gmail.com>
---
 fs/libfs.c | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/fs/libfs.c b/fs/libfs.c
index e9b29c6ffccb..a7a9deec546c 100644
--- a/fs/libfs.c
+++ b/fs/libfs.c
@@ -138,15 +138,15 @@ loff_t dcache_dir_lseek(struct file *file, loff_t offset, int whence)
 {
 	struct dentry *dentry = file->f_path.dentry;
 	switch (whence) {
-		case 1:
-			offset += file->f_pos;
-			fallthrough;
-		case 0:
-			if (offset >= 0)
-				break;
-			fallthrough;
-		default:
-			return -EINVAL;
+	case 1:
+		offset += file->f_pos;
+		fallthrough;
+	case 0:
+		if (offset >= 0)
+			break;
+		fallthrough;
+	default:
+		return -EINVAL;
 	}
 	if (offset != file->f_pos) {
 		struct dentry *cursor = file->private_data;
@@ -266,7 +266,7 @@ static struct dentry *find_next_child(struct dentry *parent, struct dentry *prev
 }
 
 void simple_recursive_removal(struct dentry *dentry,
-                              void (*callback)(struct dentry *))
+				void (*callback)(struct dentry *))
 {
 	struct dentry *this = dget(dentry);
 	while (true) {
-- 
2.25.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
