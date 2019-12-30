Return-Path: <SRS0=vtN2=2U=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.4 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D1E29C2D0C3
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 30 Dec 2019 04:56:15 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9453720663
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 30 Dec 2019 04:56:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qqAIQc1W"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9453720663
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 627F384514;
	Mon, 30 Dec 2019 04:56:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6Nilao-sV5eH; Mon, 30 Dec 2019 04:56:14 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id DD7AB834D6;
	Mon, 30 Dec 2019 04:56:14 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id C3AA3C18DC;
	Mon, 30 Dec 2019 04:56:14 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 6DC7BC077D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 30 Dec 2019 04:56:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 57BEC85DE0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 30 Dec 2019 04:56:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pwECQArgVLgy
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 30 Dec 2019 04:56:12 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com
 [209.85.215.181])
 by hemlock.osuosl.org (Postfix) with ESMTPS id CD73885D22
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 30 Dec 2019 04:56:12 +0000 (UTC)
Received: by mail-pg1-f181.google.com with SMTP id b9so17425997pgk.12
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 29 Dec 2019 20:56:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=IVpMyu8Fw0MXecqQ4gT1BLcDBkmAuorpSplnF3n4Kow=;
 b=qqAIQc1WcTrG7GhRA7fAVuFT3OMKm09P5JRZpiACaCOJKZrskmEovAJU7WdeN1Ugsw
 sKNiL3pTG6mEmyHzAjWDyMXMVchyogdABINc/q7a8ttwczl/goJ5/QVqLNCheYXF4i59
 LZN7lI09aHDqSaqaK0MBM77ZLwCZbYWV74LdDGsaY6wt0uR9PPhDx6kxqPMo6wfxwA+R
 GOK+6nnf43Tff9JoX+CVZDOiiImpsew0XRgqv1VIOsbqRpbui5kT4SPevT8WyQ5C2UNO
 Vkr0DUyvX427haKWq7DVk4xZBfj6wWJLitrGZw7XaTed7PxCNPJPmZgchXrisVjL0dmE
 EhUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=IVpMyu8Fw0MXecqQ4gT1BLcDBkmAuorpSplnF3n4Kow=;
 b=SM2sJIU7/H+j+8r/iXwek0CiW1Ipr5vBL8AEt5ds8x9Ir4CaFhwxdJHSldQJ85czJ9
 /jzpJmcnUja1/8QtSaP+BmVNUTxH5+H2pS0EkkN6tRqbWNVVJIHzibZ9Z+0LUVcEDiz7
 56QMmG/vFBgTaeq8pAQToW65nwuhmO0Cz3NPQte/pEicqDGfkIKtOGHEcuaz9Sijd/xG
 0j1WBB7hVQkAbv5gXVC9p66VPVhX8shJIYVeOuv+w5rwf9bhxzI1FV57jvgN4p/RfLuR
 O7mBCk5ZJ4rnynFW4yDapqKfzSDzlbufi8kwotbaSgHxlEjdYlTnKx15Q6mZVilo5Htl
 mWQw==
X-Gm-Message-State: APjAAAXBLOFZaw+MeAHEfHe1unjR4TAkDul5lF8GlQFFTAgO3Ssb+eGr
 GUzcLWY203lEQPR65NpYJKY=
X-Google-Smtp-Source: APXvYqzaSD2agHTs8zTCTxRqp0olWnCnWnOCwVT1fbYoaRRCutEBd86i43Vlu6eryjAGy/phDRhKvQ==
X-Received: by 2002:a63:3dc6:: with SMTP id
 k189mr68428892pga.396.1577681772284; 
 Sun, 29 Dec 2019 20:56:12 -0800 (PST)
Received: from localhost.localdomain ([2804:14d:72b1:8920:da15:c0bd:33c1:e2ad])
 by smtp.gmail.com with ESMTPSA id b1sm22373189pjw.4.2019.12.29.20.56.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 29 Dec 2019 20:56:11 -0800 (PST)
From: "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>
X-Google-Original-From: Daniel W. S. Almeida
To: corbet@lwn.net,
	mchehab+samsung@kernel.org
Date: Mon, 30 Dec 2019 01:55:54 -0300
Message-Id: <cover.1577681164.git.dwlsalmeida@gmail.com>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
Cc: linux-kernel@vger.kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org,
 "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>, linux-doc@vger.kernel.org
Subject: [Linux-kernel-mentees] [PATCH v2 0/8] Documentation: nfs: Convert a
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

Changes in v2
-------------
Also convert pnfs-block-server.txt, pnfs-scsi-server.txt and fault_injection.txt


Daniel W. S. Almeida (8):
  Documentation: convert nfs.txt to ReST
  Documentation: nfsroot.txt: convert to ReST
  Documentation: nfs-rdma: convert to ReST
  Documentation: convert nfsd-admin-interfaces to ReST
  Documentation: nfs: idmapper: convert to ReST
  Documentation: nfs: convert pnfs-block-server to ReST
  Documentation: nfs: pnfs-scsi-server: convert to ReST
  Documentation: nfs: fault_injection: convert to ReST

 Documentation/admin-guide/index.rst           |   1 +
 .../nfs/fault_injection.rst}                  |   5 +-
 Documentation/admin-guide/nfs/index.rst       |  16 +
 .../nfs/nfs-client.rst}                       |  91 +++---
 .../nfs/nfs-idmapper.rst}                     |  31 +-
 Documentation/admin-guide/nfs/nfs-rdma.rst    | 290 ++++++++++++++++++
 .../nfs/nfsd-admin-interfaces.rst}            |  19 +-
 .../nfs/nfsroot.rst}                          | 140 +++++----
 .../nfs/pnfs-block-server.rst}                |  25 +-
 .../nfs/pnfs-scsi-server.rst}                 |   1 +
 Documentation/filesystems/nfs/nfs-rdma.txt    | 274 -----------------
 11 files changed, 475 insertions(+), 418 deletions(-)
 rename Documentation/{filesystems/nfs/fault_injection.txt => admin-guide/nfs/fault_injection.rst} (98%)
 create mode 100644 Documentation/admin-guide/nfs/index.rst
 rename Documentation/{filesystems/nfs/nfs.txt => admin-guide/nfs/nfs-client.rst} (72%)
 rename Documentation/{filesystems/nfs/idmapper.txt => admin-guide/nfs/nfs-idmapper.rst} (81%)
 create mode 100644 Documentation/admin-guide/nfs/nfs-rdma.rst
 rename Documentation/{filesystems/nfs/nfsd-admin-interfaces.txt => admin-guide/nfs/nfsd-admin-interfaces.rst} (70%)
 rename Documentation/{filesystems/nfs/nfsroot.txt => admin-guide/nfs/nfsroot.rst} (83%)
 rename Documentation/{filesystems/nfs/pnfs-block-server.txt => admin-guide/nfs/pnfs-block-server.rst} (80%)
 rename Documentation/{filesystems/nfs/pnfs-scsi-server.txt => admin-guide/nfs/pnfs-scsi-server.rst} (97%)
 delete mode 100644 Documentation/filesystems/nfs/nfs-rdma.txt

-- 
2.24.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
