Return-Path: <SRS0=ogxK=3S=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.3 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 736A8C33CB2
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 29 Jan 2020 04:49:44 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 497DC20702
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 29 Jan 2020 04:49:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UoP4u8MV"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 497DC20702
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 2638A835C4;
	Wed, 29 Jan 2020 04:49:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Iv9YlaqX_uyQ; Wed, 29 Jan 2020 04:49:43 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 2AAC4835CD;
	Wed, 29 Jan 2020 04:49:43 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 189BAC0178;
	Wed, 29 Jan 2020 04:49:43 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id A3392C0171
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 29 Jan 2020 04:49:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 9F9FD86BAD
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 29 Jan 2020 04:49:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GDIEnfkZ9bZv
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 29 Jan 2020 04:49:41 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mail-qt1-f195.google.com (mail-qt1-f195.google.com
 [209.85.160.195])
 by whitealder.osuosl.org (Postfix) with ESMTPS id D8492861A7
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 29 Jan 2020 04:49:40 +0000 (UTC)
Received: by mail-qt1-f195.google.com with SMTP id l19so6721533qtq.8
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 28 Jan 2020 20:49:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=31Aj6+KBPh1bOjE08uzZPSEk81edXgSHdm2y9/BE59U=;
 b=UoP4u8MVYaHSh0lQ0CToFR7wVs5l9FMNIYG+EoJ2TjZlj5rMx8DlCblQ0fG45jt+bt
 XTDyg1wpki8RokPl1Gyp4SqjQ/6seMnTH9tS83IwNTRvJxCMg49aQI7kyxYu+5SBq1g4
 h2me12E039PowgbZqxNFWkpIUfGWgi6ynqX4urRZAplZSttCT20LKLOqAE8BYCPXZbav
 +rmH/KmiobzLERmCdcAN+8pExiOVr5ldXQrEgAJUNNIB1r4FiozAXCTUTD2m3yJo4dAL
 LLMtSOAJEczi7AKimv975xcpdcZWlHAK2KfShFgmqh6TjA5pyj4FXyOh/7xALdTevYsg
 2DLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=31Aj6+KBPh1bOjE08uzZPSEk81edXgSHdm2y9/BE59U=;
 b=KQ4bMkgCEiMcYW1BTeJdmwQ/RUexoLw71TuBaejt/rLUoeFH9I4Tml3CAfEisAYZeL
 2quggc87RZ7SgdpeRPk4/Q2XfAKFgLAc51NmR6QLdgsop6PYHLNpXuQkmN98kd94qjb4
 IUspX0beIkLh5yKamf3VzK+zNBerbvKCjIVsmDJZKiGEsjcIEnInkRBcMkyzdjqVIv8P
 w4fjKUWo23sIfWqpfJWrO4o64BySxeLrzQjtK8/Ry414zfwcZ38K3RD1zUOB66c6VxdX
 nJ9ODMo0Q5oW5WAOzBDmQotiP7x4tvFzoh+Vpkexh0qFBXklvdTm5R2bm3gruYdSee0R
 wS4w==
X-Gm-Message-State: APjAAAWxo0UHiCF1Hkjs8EcKujzQZ5DQK6Ex1RS2dSxHSXL5xrFMOW7w
 SDJIZKOSxxCCljURiSC6Pvg=
X-Google-Smtp-Source: APXvYqySEOvpOfPwuPAFigyoMeaNy8kB5ev0eFWXmvpgdh/4wtngluVayTjmQ0BWfvkogWWUwPnO/g==
X-Received: by 2002:ac8:4890:: with SMTP id i16mr24359522qtq.211.1580273379691; 
 Tue, 28 Jan 2020 20:49:39 -0800 (PST)
Received: from localhost.localdomain ([2804:14d:72b1:8920:a2ce:f815:f14d:bfac])
 by smtp.gmail.com with ESMTPSA id a22sm487320qtd.48.2020.01.28.20.49.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Jan 2020 20:49:39 -0800 (PST)
From: "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>
X-Google-Original-From: Daniel W. S. Almeida
To: corbet@lwn.net,
	mchehab+samsung@kernel.org
Date: Wed, 29 Jan 2020 01:49:17 -0300
Message-Id: <20200129044917.566906-6-dwlsalmeida@gmail.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200129044917.566906-1-dwlsalmeida@gmail.com>
References: <20200129044917.566906-1-dwlsalmeida@gmail.com>
MIME-Version: 1.0
Cc: linux-kernel-mentees@lists.linuxfoundation.org,
 "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>, linux-doc@vger.kernel.org
Subject: [Linux-kernel-mentees] [PATCH v2 5/5] Documentation: nfs:
	knfsd-stats: convert to ReST
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

From: "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>

Convert knfsd-stats.txt to ReST. Content remains mostly the same.

Signed-off-by: Daniel W. S. Almeida <dwlsalmeida@gmail.com>
---
 Documentation/filesystems/nfs/index.rst         |  1 +
 .../nfs/{knfsd-stats.txt => knfsd-stats.rst}    | 17 ++++++++---------
 2 files changed, 9 insertions(+), 9 deletions(-)
 rename Documentation/filesystems/nfs/{knfsd-stats.txt => knfsd-stats.rst} (95%)

diff --git a/Documentation/filesystems/nfs/index.rst b/Documentation/filesystems/nfs/index.rst
index a0a678af921b..65805624e39b 100644
--- a/Documentation/filesystems/nfs/index.rst
+++ b/Documentation/filesystems/nfs/index.rst
@@ -10,3 +10,4 @@ NFS
    rpc-cache
    rpc-server-gss
    nfs41-server
+   knfsd-stats
diff --git a/Documentation/filesystems/nfs/knfsd-stats.txt b/Documentation/filesystems/nfs/knfsd-stats.rst
similarity index 95%
rename from Documentation/filesystems/nfs/knfsd-stats.txt
rename to Documentation/filesystems/nfs/knfsd-stats.rst
index 1a5d82180b84..80bcf13550de 100644
--- a/Documentation/filesystems/nfs/knfsd-stats.txt
+++ b/Documentation/filesystems/nfs/knfsd-stats.rst
@@ -1,7 +1,9 @@
-
+============================
 Kernel NFS Server Statistics
 ============================
 
+:Authors: Greg Banks <gnb@sgi.com> - 26 Mar 2009
+
 This document describes the format and semantics of the statistics
 which the kernel NFS server makes available to userspace.  These
 statistics are available in several text form pseudo files, each of
@@ -18,7 +20,7 @@ by parsing routines.  All other lines contain a sequence of fields
 separated by whitespace.
 
 /proc/fs/nfsd/pool_stats
-------------------------
+========================
 
 This file is available in kernels from 2.6.30 onwards, if the
 /proc/fs/nfsd filesystem is mounted (it almost always should be).
@@ -109,15 +111,12 @@ this case), or the transport can be enqueued for later attention
 (sockets-enqueued counts this case), or the packet can be temporarily
 deferred because the transport is currently being used by an nfsd
 thread.  This last case is not very interesting and is not explicitly
-counted, but can be inferred from the other counters thus:
+counted, but can be inferred from the other counters thus::
 
-packets-deferred = packets-arrived - ( sockets-enqueued + threads-woken )
+	packets-deferred = packets-arrived - ( sockets-enqueued + threads-woken )
 
 
 More
-----
-Descriptions of the other statistics file should go here.
-
+====
 
-Greg Banks <gnb@sgi.com>
-26 Mar 2009
+Descriptions of the other statistics file should go here.
-- 
2.25.0

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
