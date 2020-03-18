Return-Path: <SRS0=wOYV=5D=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.6 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 389B3C1975A
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 18 Mar 2020 01:51:18 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0294F206EC
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 18 Mar 2020 01:51:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=massaru-org.20150623.gappssmtp.com header.i=@massaru-org.20150623.gappssmtp.com header.b="bK7HSU7n"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0294F206EC
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=massaru.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id CA7048844A;
	Wed, 18 Mar 2020 01:51:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KQOAfDIAOA-A; Wed, 18 Mar 2020 01:51:17 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 6B8EB883ED;
	Wed, 18 Mar 2020 01:51:17 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 5A643C1D74;
	Wed, 18 Mar 2020 01:51:17 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 903FDC013E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 18 Mar 2020 01:51:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 7DD4320422
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 18 Mar 2020 01:51:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DO+43243HDxM
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 18 Mar 2020 01:51:15 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mail-qt1-f196.google.com (mail-qt1-f196.google.com
 [209.85.160.196])
 by silver.osuosl.org (Postfix) with ESMTPS id 373FD20396
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 18 Mar 2020 01:51:15 +0000 (UTC)
Received: by mail-qt1-f196.google.com with SMTP id z12so155429qtq.5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 17 Mar 2020 18:51:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=massaru-org.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=e8mUgYv+VKT2lr8NVjxyrZkvepp6x+zOsg4I0gqSpQ8=;
 b=bK7HSU7nkxVi8N68R6DfHPbiWxaVW78DHfW/0t4Y0v+5qyL8eg51xPR3nZ0Wzg6Bt7
 Qhv7Ahge/U9gbih6y8vJA57rgTTXLEzfHKO2gxOZ7hl0RL6//bv80luVlUmheoYwj9JQ
 IgG7O9rlJvhbh+Rni//aek0qY84uUPEVJiNaWVbt2spo9UOr3ILhXYqBZPgHCMrE706f
 6QdqN74tZAqbnqTLQpHRwyL28Kf8xiqEwo/xXtIiVwBIQosDann+ji+kwB1FNGZH5uT1
 +Gi+Ruwakj7VqvwX1dxSpZXAJFQAvEoL/7mbZyYRdOKXTCA9HTEabCWLiFqRitq75pGD
 odMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=e8mUgYv+VKT2lr8NVjxyrZkvepp6x+zOsg4I0gqSpQ8=;
 b=DMcf7fl2TPrucEaLNQQY8TJqfJ/UjPWcp4ptfWhFPfy5p/pLFekQkwReDZjHP69jdJ
 xyOHyHoUpW8awfwKujmxu5ZPhoeyFj3IQV2mnDY8cvaTstYobzI1OcYc7IEw/WOh8apB
 mp9noPMprHxNTFztFNPrjU11dXsh79Bl51/guojzbyNULtESMKAzK9SqhjOlzx44Llub
 jsG5TgYqbjOB68Oarseh9pjIzwwpbIMaKHtM0ZstysnMQnxbGIBJtBlXXDwDGkJp38Vr
 ckSZxLZpErBJjt/VYv1RKTyDWrP5eICGl1HUQ957LywW1zzFnJRDHi6kdwevTUC4+iYy
 rfLQ==
X-Gm-Message-State: ANhLgQ1/O/ASTwJYtzlGB7SBTmtbkxjuJb637KNC6xpd9mr0V/9jutvc
 7g2blRkqmnzDRlYZPoLNNeUbcAXp6m/dGhlw
X-Google-Smtp-Source: ADFU+vv33OmGqzWo180ijpGFSaQFry+2s8NTwr1853i6DLNMIoAIbKnqoq618kLR2Mp5a55kGPz7gQ==
X-Received: by 2002:a37:d285:: with SMTP id f127mr1829475qkj.107.1584495792610; 
 Tue, 17 Mar 2020 18:43:12 -0700 (PDT)
Received: from bbking.lan ([2804:14c:4a5:36c::cd2])
 by smtp.gmail.com with ESMTPSA id m1sm3740883qtm.22.2020.03.17.18.43.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Mar 2020 18:43:10 -0700 (PDT)
From: Vitor Massaru Iha <vitor@massaru.org>
To: 
Date: Tue, 17 Mar 2020 22:43:03 -0300
Message-Id: <7efa62f727eb176341fc0cdfcd47c890ff424451.1584494902.git.vitor@massaru.org>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <cover.1584494902.git.vitor@massaru.org>
References: <cover.1584494902.git.vitor@massaru.org>
MIME-Version: 1.0
Cc: linux-fsdevel@vger.kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org, linux-kernel@vger.kernel.org,
 willy@infradead.org
Subject: [Linux-kernel-mentees] [PATCH 2/2] xarray: Add missing blank line
	after declaration
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

Fix checkpatch warning: "WARNING: Missing a blank line after declarations"
in include/linux/xarray.h:1504

Signed-off-by: Vitor Massaru Iha <vitor@massaru.org>
---
 include/linux/xarray.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/linux/xarray.h b/include/linux/xarray.h
index a7dec1ec0967..61f83aca2326 100644
--- a/include/linux/xarray.h
+++ b/include/linux/xarray.h
@@ -1624,6 +1624,7 @@ static inline unsigned int xas_find_chunk(struct xa_state *xas, bool advance,
 	if (XA_CHUNK_SIZE == BITS_PER_LONG) {
 		if (offset < XA_CHUNK_SIZE) {
 			unsigned long data = *addr & (~0UL << offset);
+
 			if (data)
 				return __ffs(data);
 		}
-- 
2.21.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
