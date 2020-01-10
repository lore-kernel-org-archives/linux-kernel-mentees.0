Return-Path: <SRS0=OMk/=27=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.3 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB2F2C282DD
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 10 Jan 2020 23:24:51 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 95BCF20838
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 10 Jan 2020 23:24:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XL5cgHP0"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 95BCF20838
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 83E9D85516;
	Fri, 10 Jan 2020 23:24:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gqXeE-_evKVt; Fri, 10 Jan 2020 23:24:51 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 14B86854E7;
	Fri, 10 Jan 2020 23:24:51 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 0CC69C1D7D;
	Fri, 10 Jan 2020 23:24:51 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 8AF45C0881
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 10 Jan 2020 23:24:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 7A82285516
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 10 Jan 2020 23:24:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id USDEZsXt3yds
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 10 Jan 2020 23:24:48 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com
 [209.85.222.178])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 714D4854E7
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 10 Jan 2020 23:24:48 +0000 (UTC)
Received: by mail-qk1-f178.google.com with SMTP id w127so3552889qkb.11
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 10 Jan 2020 15:24:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=02RbzqkVXHjb1txPhIU2YZ7FpiY37PIXVOUBy3YGbxk=;
 b=XL5cgHP0F8ByiplBxRyH3+i9Uh1GQNaOh7AN1Y67iCTj6lEcDxDHDPHec8DRbANAcc
 zdR0YYDzknCO+HZgaoi1rbTkYIG8pMkAf7CWqrUzHd/u9n9O3EjuuwHtXKQw3mSE10WE
 K7fRqSxHQN2glWiHlktVnIgRgxaZxUjfJps5KY6FD/XHkzE1N83AJmNw4EHUkR7T/dSA
 o5scPnQy7OmCwVG71TAUGBFui5pLiEztuXxuvyOXpKfI9lpPsxqncDuQRtve5p6WTvlo
 CjJ9CuN81CIsM+Qgwc5vxjahyZn/NNz2+eCjtHCf+pSc3h4KMOwuP7ru/sE6BjgHsKB7
 DoEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=02RbzqkVXHjb1txPhIU2YZ7FpiY37PIXVOUBy3YGbxk=;
 b=RQghwOo8cIejE0W/oGWnW7m2VuQqg1HBd65lgNnfNUjp+vdFBJ71Bb/K8UFOsRj6j/
 TpptHS+xmb8ZhIe08qvNoR2pdTkZaTUV/pyqFNYKUEjRtGc+fYX4h1gZSId1tCd8ynIx
 0mIG2FQU5oKXzLD2gRUbSSdWjaVrE6X8zsZFlg4SzDIBqdOQLbu94HzxLnsigRwaruvH
 PjXpOw98vEdYVGb8rHfA4qKhF2WEw3H48hjqUwNW1Yu/Pb/C++bL4z25NmdPDUfRWwHp
 eyYGg/2/ojoNoo05Z01bM+OqiMaLAlCFf9QaXMFMC7hmDvZwzk6WHpPkytGcrTjKuVI5
 OTQg==
X-Gm-Message-State: APjAAAUvv+dzuaPykqiPpCRi3kjJ1uNcWxp+vY8ZPvHKaBtGhSISibLT
 h4gwMU/g8zJLz3J7wpfmcQ0=
X-Google-Smtp-Source: APXvYqzkIedBNPUQuLMTZkQXY4cNcOjFdebiss+j8cWhxlOWlyRCU7hMUU9SnvkC7XZ87BR1tQ4H5g==
X-Received: by 2002:a37:63c7:: with SMTP id x190mr5695672qkb.232.1578698687284; 
 Fri, 10 Jan 2020 15:24:47 -0800 (PST)
Received: from localhost.localdomain ([2804:14d:72b1:8920:a2ce:f815:f14d:bfac])
 by smtp.gmail.com with ESMTPSA id i2sm1774752qte.87.2020.01.10.15.24.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Jan 2020 15:24:46 -0800 (PST)
From: "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>
X-Google-Original-From: Daniel W. S. Almeida
To: mchehab+samsung@kernel.org,
	corbet@lwn.net
Date: Fri, 10 Jan 2020 20:24:22 -0300
Message-Id: <cover.1578697871.git.dwlsalmeida@gmail.com>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
Cc: linux-kernel@vger.kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org,
 "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>, linux-doc@vger.kernel.org
Subject: [Linux-kernel-mentees] [PATCH v4 0/9] Documentation: nfs: Convert a
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

Changes in v4
-------------
Add missing commit [Documentation: convert nfs.txt to ReST]
Fix the following errors:
	Applying: Documentation: convert nfs.txt to ReST
	.git/rebase-apply/patch:35: new blank line at EOF.
	+
	warning: 1 line adds whitespace errors.
	Applying: Documentation: nfsroot.txt: convert to ReST
	.git/rebase-apply/patch:163: space before tab in indent.
			If unspecified the netmask is derived from the client IP address
	.git/rebase-apply/patch:170: space before tab in indent.
			If a '.' character is present, anything
	.git/rebase-apply/patch:193: space before tab in indent.
			In the case of options
	warning: 3 lines add whitespace errors.
	

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

Daniel W. S. Almeida (9):
  Documentation: convert nfs.txt to ReST
  Documentation: nfsroot.txt: convert to ReST
  Documentation: nfsroot.rst: COSMETIC: refill a paragraph
  Documentation: nfs-rdma: convert to ReST
  Documentation: convert nfsd-admin-interfaces to ReST
  Documentation: nfs: idmapper: convert to ReST
  Documentation: nfs: convert pnfs-block-server to ReST
  Documentation: nfs: pnfs-scsi-server: convert to ReST
  Documentation: nfs: fault_injection: convert to ReST

 Documentation/admin-guide/index.rst           |   1 +
 .../nfs/fault_injection.rst}                  |   5 +-
 Documentation/admin-guide/nfs/index.rst       |  15 +
 .../nfs/nfs-client.rst}                       |  85 ++---
 .../nfs/nfs-idmapper.rst}                     |  31 +-
 Documentation/admin-guide/nfs/nfs-rdma.rst    | 292 ++++++++++++++++++
 .../nfs/nfsd-admin-interfaces.rst}            |  19 +-
 .../nfs/nfsroot.rst}                          | 151 ++++-----
 .../nfs/pnfs-block-server.rst}                |  25 +-
 .../nfs/pnfs-scsi-server.rst}                 |   1 +
 Documentation/filesystems/nfs/nfs-rdma.txt    | 274 ----------------
 11 files changed, 478 insertions(+), 421 deletions(-)
 rename Documentation/{filesystems/nfs/fault_injection.txt => admin-guide/nfs/fault_injection.rst} (98%)
 create mode 100644 Documentation/admin-guide/nfs/index.rst
 rename Documentation/{filesystems/nfs/nfs.txt => admin-guide/nfs/nfs-client.rst} (75%)
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
