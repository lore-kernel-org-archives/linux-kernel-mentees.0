Return-Path: <SRS0=5+BN=GH=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 89A6AC433DB
	for <linux-kernel-mentees@archiver.kernel.org>; Mon,  4 Jan 2021 13:26:01 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2121C207AE
	for <linux-kernel-mentees@archiver.kernel.org>; Mon,  4 Jan 2021 13:26:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2121C207AE
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id EB0A885F71;
	Mon,  4 Jan 2021 13:26:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 04x0LC1VNuJ0; Mon,  4 Jan 2021 13:25:59 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id BE75785D3D;
	Mon,  4 Jan 2021 13:25:59 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id BB0C1C088B;
	Mon,  4 Jan 2021 13:25:59 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 6E77BC013A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  4 Jan 2021 13:25:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 5D2C886885
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  4 Jan 2021 13:25:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0M0oTm9P2O02
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  4 Jan 2021 13:25:56 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com
 [209.85.214.178])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 6B6C786881
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  4 Jan 2021 13:25:56 +0000 (UTC)
Received: by mail-pl1-f178.google.com with SMTP id b8so14551361plx.0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 04 Jan 2021 05:25:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=q2Ns+KjaRZiIsqBfJstvkjNabzsP3wbjh23QJIKvTaQ=;
 b=STliCOHi+BniAN4CW92qMeW9sEIcA6vcok1EnJrRyBL/4kgENH+LM10rO8BFViAWJ2
 APbsUfs7c4I88HUC3+Av6kJlLlsbkGssFhlXmjaCbBCdMQomCj3Dy4TfyP6qtQOdbA07
 j4w3xGIQe5Gl+b6FDSe7iPvtcXJHYoxQ3km5ZP3h7DvxX1Qb6CRfmUsh8e0sXH6OLcwH
 BzUgFrmVXB3O1pd7Tg80FV07Eq6QBgFPa4uYBpuGC6/vWNyfUXLDLgoPliPPLGgrEtnK
 quf0diaKbM9jIO2zJ3yNQe9SyKA1e360lXh+daiSkTju3NZxqmArCyrKowyqGPNct8Mh
 NGtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=q2Ns+KjaRZiIsqBfJstvkjNabzsP3wbjh23QJIKvTaQ=;
 b=Nnda16qp7Av0WxhOEK8wfGmBwSagXj8rBKFrosjiXMjce2B+HczTcPrh3AClM8cumF
 RujfxXc4n8VuyP3m/zvI+YxIfR86yAx31fNaZif6ZW+eLq/MZHTslgLPnYkV6aMYic/x
 /gHCmMLPp68g/K8MHfA3mQYWstnDHyvksC3meEKJ2f9+Nnzl6f6EDbfa8jdF8ElUJ0XN
 pUDqoHJEsdP0dK4kQB/V1BQHdM8J9GTxA0Q85LOlL1+oLeatRs2w9OpTlCIahwhOpDAb
 HrOSXaQVhk9ungdo6Dn9t61cxUfzD14AsuRraOFvprrYO9rO25+CIYrIKTZLLfdHKt8T
 Sf8Q==
X-Gm-Message-State: AOAM530cCC5wS+7VB3ji2+DXz7e/3OiLgM5Dv8lr2Fx3nI3/IesiJlxT
 kGOGpYA+YqVDH632CdijHHs=
X-Google-Smtp-Source: ABdhPJxgZ+NczQrO9cSetESw9/UyWN/mIfIT2DG9nazS5hC9/lMO81MQvJzaAtt+AL0ZhVWJceZxrw==
X-Received: by 2002:a17:90a:3d0b:: with SMTP id
 h11mr29185809pjc.188.1609766755896; 
 Mon, 04 Jan 2021 05:25:55 -0800 (PST)
Received: from localhost.localdomain ([2405:201:9004:68a1:dd5e:15ee:643c:b4db])
 by smtp.gmail.com with ESMTPSA id c10sm21479605pjn.22.2021.01.04.05.25.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Jan 2021 05:25:55 -0800 (PST)
From: Dwaipayan Ray <dwaipayanray1@gmail.com>
To: lukas.bulwahn@gmail.com
Date: Mon,  4 Jan 2021 18:55:36 +0530
Message-Id: <20210104132536.38016-2-dwaipayanray1@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210104132536.38016-1-dwaipayanray1@gmail.com>
References: <20210104132536.38016-1-dwaipayanray1@gmail.com>
MIME-Version: 1.0
Cc: dwaipayanray1@gmail.com, linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [PATCH] checkpatch: add a new check for
	strcpy/strlcpy uses
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

strcpy() performs no bounds checking on the destination buffer.
This could result in linear overflows beyond the end of the buffer.

strlcpy() reads the entire source buffer first. This read
may exceed the destination size limit. This can be both inefficient
and lead to linear read overflows.

The safe replacement to both of these is to use strscpy() instead.
Add a new checkpatch warning which alerts the user on finding usage of
strcpy() or strlcpy().

Signed-off-by: Dwaipayan Ray <dwaipayanray1@gmail.com>
---
 scripts/checkpatch.pl | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
index d6a4d25b0972..0003fd9de62c 100755
--- a/scripts/checkpatch.pl
+++ b/scripts/checkpatch.pl
@@ -6604,6 +6604,13 @@ sub process {
 			}
 		}
 
+# Check for strcpy/strlcpy uses
+		if (defined($stat) &&
+		    $stat =~ /^\+(?:.*?)\b(str[l]?cpy)\s*\(/) {
+			WARN("PREFER_STRSCPY",
+			     "Prefer strscpy() over $1()\n" . "$here\n$stat\n");
+		}
+
 # Check for memcpy(foo, bar, ETH_ALEN) that could be ether_addr_copy(foo, bar)
 #		if ($perl_version_ok &&
 #		    defined $stat &&
-- 
2.27.0

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
