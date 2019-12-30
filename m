Return-Path: <SRS0=vtN2=2U=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.4 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1BCDFC2D0C3
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 30 Dec 2019 05:04:59 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D78FA20663
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 30 Dec 2019 05:04:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SsJhNicN"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D78FA20663
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 5EE7985A70;
	Mon, 30 Dec 2019 05:04:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id r5KEOYtzAUoJ; Mon, 30 Dec 2019 05:04:57 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 0575085DE0;
	Mon, 30 Dec 2019 05:04:56 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id DC732C18DC;
	Mon, 30 Dec 2019 05:04:56 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 4BBEFC077D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 30 Dec 2019 05:04:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 441BD203E1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 30 Dec 2019 05:04:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KUJRnDRFn244
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 30 Dec 2019 05:04:54 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com
 [209.85.214.182])
 by silver.osuosl.org (Postfix) with ESMTPS id AF4D220005
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 30 Dec 2019 05:04:54 +0000 (UTC)
Received: by mail-pl1-f182.google.com with SMTP id az3so14168631plb.11
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 29 Dec 2019 21:04:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=5wS2IrMaQZTiI9oJtmOwRkQukdb+P4omdMqN1yhWXY0=;
 b=SsJhNicNBuR0+0m1WCqa3TOIKJdbehKSJ+OcgZ+UNMdRswGsKau5fPieyPoN6otn7e
 UvbNom9oZ4ijzIIB+lO3Iu1XcVnAJ1BoIUWFzC6Xo9gBG3/iWplqvMoAvFeJFZRj+9yB
 T5t1Df4TFiA2tja6hiSjO6KIQbIBFGwxa2AvWh/wCYkqKEnzAOX/ONzKbGwoyhlN2kiW
 pYHC3dtJ0EesYBVsKI4Glwq/zOos/H2zBpJhp+UN3QDypFCXfJBdulUEXvh4Rb8AtVEy
 Jmk5oYAYDspe+P43S+OJszBAx2HAiY3afziP65UWMpPclQ+TRIack/CCcEcoD8rEZFPS
 KVyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=5wS2IrMaQZTiI9oJtmOwRkQukdb+P4omdMqN1yhWXY0=;
 b=Mw58qzsDPkjeH6sMnxRRm/ViSL43VFFrD1fgUGomqP04+/jnIrCLXhC5nWxtuyo/MF
 ZTND1jqZN2iyBJ1J6uCyyjO5HqbAq7EgXqNWOD+aqYqA3Y5NUA6hn3HHYvNO9U8+B0Bq
 BIl88thy7MlrFLeJMuiYOPN+9qWzdNQ23m5w/sjb0+48/1KySlZ4ykzBhnDsEwUJUJMk
 AXTrPGGbSXsSEt5ugkon1i01AZnBsvWt6smckAUb/73D8J1M0EaB/+jj5rzFlu3bmx7L
 JK68jAkREk6KEcBjw9nlF/I8Lbc0oo3ljg4qBdSLXefGQKhAzYcQCUDRMzHxJrLPz7rw
 S5WA==
X-Gm-Message-State: APjAAAW0m/SmIGpmKj6MovUr4WuyXPDjfGgg3Zsgx8u83sBV6Qn5c/W0
 +YA+9c1kskJeFG1kdr6SZB8=
X-Google-Smtp-Source: APXvYqwCNL+eGFhE9EXNh11lwrXcCRKTQPaNUiZYwK7Fwvolj1nrhVaq5BkIHlAckfQuu8AHr5p1xQ==
X-Received: by 2002:a17:902:407:: with SMTP id
 7mr11012274ple.226.1577682294245; 
 Sun, 29 Dec 2019 21:04:54 -0800 (PST)
Received: from localhost.localdomain ([2804:14d:72b1:8920:da15:c0bd:33c1:e2ad])
 by smtp.gmail.com with ESMTPSA id r2sm45054727pgv.16.2019.12.29.21.04.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 29 Dec 2019 21:04:53 -0800 (PST)
From: "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>
X-Google-Original-From: Daniel W. S. Almeida
To: corbet@lwn.net,
	mchehab+samsung@kernel.org
Date: Mon, 30 Dec 2019 02:04:42 -0300
Message-Id: <cover.1577681894.git.dwlsalmeida@gmail.com>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
Cc: linux-kernel@vger.kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org,
 "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>, linux-doc@vger.kernel.org
Subject: [Linux-kernel-mentees] [PATCH 0/5] Documentation: nfs: convert
	remaining files to ReST.
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

This series completes the conversion of Documentation/filesystems/nfs to ReST.

Note that I chose csv-table over list-table because csv files are easier
to export from other software. 

I did not think these rst files were supposed to be
in admin-guide, so I left them where they are.

Daniel W. S. Almeida (5):
  Documentation: nfs: convert pnfs.txt to ReST
  Documentation: nfs: rpc-cache: convert to ReST
  Documentation: nfs: rpc-server-gss: convert to ReST
  Documentation: nfs: nfs41-server: convert to ReST
  Documentation: nfs: knfsd-stats: convert to ReST

 Documentation/filesystems/index.rst           |   1 +
 Documentation/filesystems/nfs/index.rst       |  13 ++
 .../nfs/{knfsd-stats.txt => knfsd-stats.rst}  |  17 +-
 .../filesystems/nfs/nfs41-server.rst          | 181 ++++++++++++++++++
 .../filesystems/nfs/nfs41-server.txt          | 173 -----------------
 .../filesystems/nfs/{pnfs.txt => pnfs.rst}    |  25 ++-
 .../nfs/{rpc-cache.txt => rpc-cache.rst}      | 136 +++++++------
 ...{rpc-server-gss.txt => rpc-server-gss.rst} |  19 +-
 8 files changed, 306 insertions(+), 259 deletions(-)
 create mode 100644 Documentation/filesystems/nfs/index.rst
 rename Documentation/filesystems/nfs/{knfsd-stats.txt => knfsd-stats.rst} (95%)
 create mode 100644 Documentation/filesystems/nfs/nfs41-server.rst
 delete mode 100644 Documentation/filesystems/nfs/nfs41-server.txt
 rename Documentation/filesystems/nfs/{pnfs.txt => pnfs.rst} (87%)
 rename Documentation/filesystems/nfs/{rpc-cache.txt => rpc-cache.rst} (66%)
 rename Documentation/filesystems/nfs/{rpc-server-gss.txt => rpc-server-gss.rst} (92%)

-- 
2.24.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
