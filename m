Return-Path: <SRS0=0ztn=2W=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.3 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DDAC1C2D0DE
	for <linux-kernel-mentees@archiver.kernel.org>; Wed,  1 Jan 2020 22:26:29 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9DE9F206E6
	for <linux-kernel-mentees@archiver.kernel.org>; Wed,  1 Jan 2020 22:26:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DmpT6AyI"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9DE9F206E6
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 585901FF59;
	Wed,  1 Jan 2020 22:26:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Dfq8vamAOXgs; Wed,  1 Jan 2020 22:26:28 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 4E06D2047A;
	Wed,  1 Jan 2020 22:26:28 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 3D5DCC18DC;
	Wed,  1 Jan 2020 22:26:28 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id DE643C077D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  1 Jan 2020 22:26:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id CDCC38532B
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  1 Jan 2020 22:26:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DFFvAKuXfMzO
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  1 Jan 2020 22:26:26 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com
 [209.85.216.54])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 5369585321
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  1 Jan 2020 22:26:26 +0000 (UTC)
Received: by mail-pj1-f54.google.com with SMTP id m13so2574164pjb.2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 01 Jan 2020 14:26:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=92F7+S3s3pR7N4YVpQd8gHKmnOtBDwBFFUoukwS5nac=;
 b=DmpT6AyIcRlv+x1yemQ28K/aJXTl2aAANuto0jK1UpyvJoc09GZjP8Dl1RJ1kb7eGm
 fA4z8/nnsB+yEYgfEaw3PYsVXKP/jKvK2IJkGtwG2j27n/9Zmt3MZAXxoxsn/44BT0Yk
 Xs9H93a3iAHjN9Z37/wZgPM6GA8/AEYeFOU2mFvFRIgYEBr7Zz+G3UG6uG2Q5m6zBSOR
 HZKwnwqC8gl4qiKm4qnSuG2frkRXnbFSB3xg1B16V0n3PkZ7JlEdmoZJebEPRJY7h/kK
 QSO5ZZpRI5AEGleWDbk7esA1mO/5zASwmkM0BXzMj95U1kUxNVT3uY50ihc1wKSblzG/
 BdrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=92F7+S3s3pR7N4YVpQd8gHKmnOtBDwBFFUoukwS5nac=;
 b=LG/eRf2jlt3IWArh+N4e5h70pXbaYA30yNmR64e1LH22wsy8zHiGaEfeLTDkxdN+Z6
 A/bXpoDBV8+TmHomIhn14FkP6+9HHgpHYrq5rkZglB9At0tX1EIPzS2WZkV9l1NFOlvM
 aJ9cChqZnfNEzdj6zcDtkLeD9EClokl/godH+2SMQ6N8u5xAXLIcBb8bBmZiGsfaAD51
 RgEFKHjjc8k69KS/RrJ2C0+Ko/XzXqQWOCarU79Ik+EahYXuCJFukYkYftG7pEYH5rM9
 oETrQRP7ScM+nwvEDq9wvwQuAt0Cqn5brnUmLF08i7g3FRw3q91V8KrzeOk4E5S4O+IG
 Zb7g==
X-Gm-Message-State: APjAAAURQIpseaTxDKFuhovB25kdyN34SuiM0n0R1sqfe0zkQUY2/AFk
 8XgBWzzJyiYp8jXriU2wTJA=
X-Google-Smtp-Source: APXvYqxIPUaYFN9DbDKtRjfRf6fE0HHW8N52j5B0Nj+9uIoRy2JnnKS1Bzhje87/5z4wxdqB+iid7g==
X-Received: by 2002:a17:902:6b42:: with SMTP id
 g2mr82869751plt.195.1577917585676; 
 Wed, 01 Jan 2020 14:26:25 -0800 (PST)
Received: from localhost.localdomain ([2804:14d:72b1:8920:da15:c0bd:33c1:e2ad])
 by smtp.gmail.com with ESMTPSA id o2sm8601008pjo.26.2020.01.01.14.26.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Jan 2020 14:26:24 -0800 (PST)
From: "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>
X-Google-Original-From: Daniel W. S. Almeida
To: mchehab+samsung@kernel.org,
	corbet@lwn.net
Date: Wed,  1 Jan 2020 19:26:07 -0300
Message-Id: <cover.1577917076.git.dwlsalmeida@gmail.com>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
Cc: linux-kernel@vger.kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org,
 "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>, linux-doc@vger.kernel.org
Subject: [Linux-kernel-mentees] [PATCH v3 0/8] Documentation: nfs: Convert a
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

Changes in v3
-------------
Documentation: convert nfs.txt to ReST
	- Remove "#." syntax

Documentation: nfsroot.txt: convert to ReST
	- Remove stray backtick
	- Remove standalone "::"
	- Remove "#." syntax
	- Refill paragraph in a new commit to remove long lines

Documentation: nfs-rdma: convert to ReST
	- Add warning for obsolete content
	- CC nfs-rdma-devel@lists.sourceforge.net

Documentation: convert nfsd-admin-interfaces to ReST
	- Remove "#." syntax

Changes in v2
-------------
Also convert pnfs-block-server.txt, pnfs-scsi-server.txt and fault_injection.txt

Daniel W. S. Almeida (8):
  Documentation: nfsroot.txt: convert to ReST
  Documentation: nfsroot.rst: COSMETIC: refill a paragraph
  Documentation: nfs-rdma: convert to ReST
  Documentation: convert nfsd-admin-interfaces to ReST
  Documentation: nfs: idmapper: convert to ReST
  Documentation: nfs: convert pnfs-block-server to ReST
  Documentation: nfs: pnfs-scsi-server: convert to ReST
  Documentation: nfs: fault_injection: convert to ReST

 .../nfs/fault_injection.rst}                  |   5 +-
 Documentation/admin-guide/nfs/index.rst       |   7 +
 .../nfs/nfs-idmapper.rst}                     |  31 +-
 Documentation/admin-guide/nfs/nfs-rdma.rst    | 292 ++++++++++++++++++
 .../nfs/nfsd-admin-interfaces.rst}            |  19 +-
 .../nfs/nfsroot.rst}                          | 151 ++++-----
 .../nfs/pnfs-block-server.rst}                |  25 +-
 .../nfs/pnfs-scsi-server.rst}                 |   1 +
 Documentation/filesystems/nfs/nfs-rdma.txt    | 274 ----------------
 9 files changed, 424 insertions(+), 381 deletions(-)
 rename Documentation/{filesystems/nfs/fault_injection.txt => admin-guide/nfs/fault_injection.rst} (98%)
 rename Documentation/{filesystems/nfs/idmapper.txt => admin-guide/nfs/nfs-idmapper.rst} (81%)
 create mode 100644 Documentation/admin-guide/nfs/nfs-rdma.rst
 rename Documentation/{filesystems/nfs/nfsd-admin-interfaces.txt => admin-guide/nfs/nfsd-admin-interfaces.rst} (70%)
 rename Documentation/{filesystems/nfs/nfsroot.txt => admin-guide/nfs/nfsroot.rst} (80%)
 rename Documentation/{filesystems/nfs/pnfs-block-server.txt => admin-guide/nfs/pnfs-block-server.rst} (80%)
 rename Documentation/{filesystems/nfs/pnfs-scsi-server.txt => admin-guide/nfs/pnfs-scsi-server.rst} (97%)
 delete mode 100644 Documentation/filesystems/nfs/nfs-rdma.txt

-- 
2.24.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
