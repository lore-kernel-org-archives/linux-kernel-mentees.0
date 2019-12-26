Return-Path: <SRS0=To5p=2Q=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.3 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B77D4C2D0C0
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 26 Dec 2019 21:20:00 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7F3AD2080D
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 26 Dec 2019 21:20:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SDHhuQQp"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7F3AD2080D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 43D5384A43;
	Thu, 26 Dec 2019 21:20:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zhaSm8rX0NLp; Thu, 26 Dec 2019 21:19:59 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 78CFD84317;
	Thu, 26 Dec 2019 21:19:59 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 636AEC1797;
	Thu, 26 Dec 2019 21:19:59 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id C5015C0881
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 26 Dec 2019 21:19:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id B1E7B2046A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 26 Dec 2019 21:19:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HqKakLH74WuR
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 26 Dec 2019 21:19:56 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com
 [209.85.216.53])
 by silver.osuosl.org (Postfix) with ESMTPS id A3A3120461
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 26 Dec 2019 21:19:56 +0000 (UTC)
Received: by mail-pj1-f53.google.com with SMTP id a6so3838306pjh.2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 26 Dec 2019 13:19:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=3ZydGvrZJ5soQdjVtyWBSup80fHqEvz+pQXJo9U+D68=;
 b=SDHhuQQpKJbVXlc0Rqy9JNq14aEeqmzeFEXjQVA3ZvD2o5KXv44ZC8JPsOXN0Xh2D2
 ubb68n7e/rIkmOVSBCCBl5yGjCXqrk9XNo4IdWK8Tz+v4dJzHCcTSFgzq2zryijP5ZHR
 Kto4xagJbDT6RmnabUoI9NTZWzpg03osJJyYIy5uAGJTI70WdNk9I1Q67EbstC/F7KjB
 d1yiCShdRIhOWOlr1DE3iSavFRzYDks+/BGYr+lMp3b3cAjIuUNfEQhFaYmSMiLkZfJY
 47adXVpZWEA+Ia3Xxq1wrgSkg9XKGVxAIVJjO2KO8ZB6jdC0+vbCuXSUtCUgw4j7Vxad
 JcyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=3ZydGvrZJ5soQdjVtyWBSup80fHqEvz+pQXJo9U+D68=;
 b=S+oSVYowUAiE8LhiMRhY/rGSEEHCP2OMqH/jrYlINj1s/jpIqTrieT264of7F29g95
 g6uORL/elSuh77/4yvwApmgNRE9E2U3HS8kbLasMIf1VY2+kAjCYhuhxBgab6UWZVTGn
 JzFuni+HjgqkYy8RVYsUtCc9quhluIqWyrhomjRExhNho1t9n6LS8m1HvcjEE0hUD34x
 IaLppan2hbCBiXhGfCgekIJmZoaZ2TyUsbESODFDodeLCbRbRMlO/uI/0EMx+yrokMtE
 On7e3usEszvRs6G2wcrgDvEJ3d7u/loDCkWIcSNcb+gNJJDH5If/5LDzNf0WWtD0fA5o
 ohMg==
X-Gm-Message-State: APjAAAVLd0nqxQkEl8swCDetNeaRkfDgjDWFYLEMUpv9Fo9EfSFdEZhC
 HInUVfLte/4wkzPHmdaEyc0=
X-Google-Smtp-Source: APXvYqzDdV0v9wFzWnGGJyGBrHWO9iwfcaRWW2+4jjXfBWGMNQnRY93tazrBZ6vNMg5c/ZHINpOoyQ==
X-Received: by 2002:a17:902:b589:: with SMTP id
 a9mr48727838pls.256.1577395196139; 
 Thu, 26 Dec 2019 13:19:56 -0800 (PST)
Received: from localhost.localdomain ([2804:14d:72b1:8920:a2ce:f815:f14d:bfac])
 by smtp.gmail.com with ESMTPSA id b22sm35114380pft.110.2019.12.26.13.19.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Dec 2019 13:19:55 -0800 (PST)
From: "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>
X-Google-Original-From: Daniel W. S. Almeida
To: corbet@lwn.net,
	mchehab+samsung@kernel.org
Date: Thu, 26 Dec 2019 18:19:42 -0300
Message-Id: <cover.1577394517.git.dwlsalmeida@gmail.com>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
Cc: linux-kernel@vger.kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org,
 "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>, linux-doc@vger.kernel.org
Subject: [Linux-kernel-mentees] [PATCH 0/5] Documentation: nfs: Convert a
	few documents to RST and move them to admin-guide
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

This series converts a few docs in Documentation/filesystems/nfs to RST.
The docs were also moved into admin-guide because they contain information
that might be useful for system administrators

Most changes are related to aesthetics and presentation, i.e. the content
itself remains mostly untouched. The use of markup was limited in order
not to negatively impact the plain-text reading experience.

Daniel W. S. Almeida (5):
  Documentation: convert nfs.txt to ReST
  Documentation: nfsroot.txt: convert to ReST
  Documentation: nfs-rdma: convert to ReST
  Documentation: convert nfsd-admin-interfaces to ReST
  Documentation: nfs: idmapper: convert to ReST

 Documentation/admin-guide/index.rst           |   1 +
 Documentation/admin-guide/nfs/index.rst       |  13 +
 .../nfs/nfs-client.rst}                       |  91 +++---
 .../nfs/nfs-idmapper.rst}                     |  31 +-
 Documentation/admin-guide/nfs/nfs-rdma.rst    | 290 ++++++++++++++++++
 .../nfs/nfsd-admin-interfaces.rst}            |  19 +-
 .../nfs/nfsroot.rst}                          | 140 +++++----
 Documentation/filesystems/nfs/nfs-rdma.txt    | 274 -----------------
 8 files changed, 453 insertions(+), 406 deletions(-)
 create mode 100644 Documentation/admin-guide/nfs/index.rst
 rename Documentation/{filesystems/nfs/nfs.txt => admin-guide/nfs/nfs-client.rst} (72%)
 rename Documentation/{filesystems/nfs/idmapper.txt => admin-guide/nfs/nfs-idmapper.rst} (81%)
 create mode 100644 Documentation/admin-guide/nfs/nfs-rdma.rst
 rename Documentation/{filesystems/nfs/nfsd-admin-interfaces.txt => admin-guide/nfs/nfsd-admin-interfaces.rst} (70%)
 rename Documentation/{filesystems/nfs/nfsroot.txt => admin-guide/nfs/nfsroot.rst} (83%)
 delete mode 100644 Documentation/filesystems/nfs/nfs-rdma.txt

-- 
2.24.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
