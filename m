Return-Path: <SRS0=b7VJ=MU=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 77CF9C4338F
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 28 Jul 2021 08:51:40 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2E84260F91
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 28 Jul 2021 08:51:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 2E84260F91
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=anirudhrb.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E74CF82F9B;
	Wed, 28 Jul 2021 08:51:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id j1SeZBWGbnJf; Wed, 28 Jul 2021 08:51:39 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 205DD808A1;
	Wed, 28 Jul 2021 08:51:39 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id E4A9BC0010;
	Wed, 28 Jul 2021 08:51:38 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id E5DBEC000E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 28 Jul 2021 08:51:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D4B2C82BC4
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 28 Jul 2021 08:51:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9b0Bat7Zo5Z5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 28 Jul 2021 08:51:34 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from sender4-of-o53.zoho.com (sender4-of-o53.zoho.com
 [136.143.188.53])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A4C15808A1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 28 Jul 2021 08:51:34 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1627462290; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=Pi2KqZWuK18dhZOcGaixn0LZJgWdkezNxd8qBIbJZFG+iw/EEekkgrPsGIMi0tFbw118mPqRr4VXb0yH1Qsbu6ze5X1mC87FUG27jeSmmpnrr4AnUt4znClTTZdnmJXIEWR8oNcLrn4bN7XwuC/4LbWQAk0haZ4ZsZdCkmasFKs=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1627462290;
 h=Content-Transfer-Encoding:Cc:Date:From:MIME-Version:Message-ID:Subject:To; 
 bh=ZG502c7KtdGTgFEv3R+joxM5QstperDpibzCKlU+jAY=; 
 b=ae6WporXuPPrjLJ3wztVjYwIWkwgIpwEco1WI94e9D3HBHhihrZSGm/88ByLcgGHcpvNZ3D1NdOz2CCrJd/XGXljx6qF7ialsuDaQfuj1LgGd/QAdxHFYR6MUMJ0BjojpQOCpMHaovPcqMQalBB/KyURkk5NSC+nGVzXeKYFrBA=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=anirudhrb.com;
 spf=pass  smtp.mailfrom=mail@anirudhrb.com;
 dmarc=pass header.from=<mail@anirudhrb.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1627462290; 
 s=zoho; d=anirudhrb.com; i=mail@anirudhrb.com;
 h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Transfer-Encoding;
 bh=ZG502c7KtdGTgFEv3R+joxM5QstperDpibzCKlU+jAY=;
 b=lS1XvwX3gAzHA4g/eFF4n6MDPueGgBpRsnS8mRqx3BiACndXi4qhqd+42WsUPXzF
 L/hdQwThyriMXQxIUy0E4ONlxVGukUcamL9GSPM4d1EOpqrNbcw1+O30mUitMjU/N9Q
 jLD2NE0JIfA4EU7Jyoe5SNj/QBeY3WPAL3GJ4P9g=
Received: from localhost.localdomain (49.207.59.170 [49.207.59.170]) by
 mx.zohomail.com with SMTPS id 1627462286332340.6254694070768;
 Wed, 28 Jul 2021 01:51:26 -0700 (PDT)
From: Anirudh Rayabharam <mail@anirudhrb.com>
To: mcgrof@kernel.org, gregkh@linuxfoundation.org, rafael@kernel.org,
 skhan@linuxfoundation.org
Subject: [PATCH v8 0/2] firmware_loader: fix uaf in firmware_fallback_sysfs
Date: Wed, 28 Jul 2021 14:21:05 +0530
Message-Id: <20210728085107.4141-1-mail@anirudhrb.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
X-ZohoMailClient: External
Cc: linux-kernel-mentees@lists.linuxfoundation.org,
 linux-kernel@vger.kernel.org
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

This series fixes the use after free in firmware_fallback_sysfs reported by
syzbot at: 
https://syzkaller.appspot.com/bug?extid=de271708674e2093097b

The first patch gets rid of the -EAGAIN return since it doesn't make
sense (see patch description for more info). The second patch goes on to
actually fix the use after free issue.

Changes in v8:
1. Added/fixed some comments as suggested by Shuah

Changes in v7:
1. Don't move the error handling code from fw_load_sysfs_fallback
   to fw_sysfs_wait_timeout to simplify the patch. Also, the move
   is unnecessary.

2. Fix the commit log for patch 1 as per Luis' suggestions.

Changes in v6:
1. v5 didn't actually remove -EAGAIN. So, fixed that.

Changes in v5:
1. Split the patch into two patches as discussed here:
   https://lore.kernel.org/lkml/20210715232105.am4wsxfclj2ufjdw@garbanzo/

Changes in v4:
Documented the reasons behind the error codes returned from
fw_sysfs_wait_timeout() as suggested by Luis Chamberlain.

Changes in v3:
Modified the patch to incorporate suggestions by Luis Chamberlain in
order to fix the root cause instead of applying a "band-aid" kind of
fix.
https://lore.kernel.org/lkml/20210403013143.GV4332@42.do-not-panic.com/

Changes in v2:
1. Fixed 1 error and 1 warning (in the commit message) reported by
checkpatch.pl. The error was regarding the format for referring to
another commit "commit <sha> ("oneline")". The warning was for line
longer than 75 chars.


Anirudh Rayabharam (2):
  firmware_loader: use -ETIMEDOUT instead of -EAGAIN in
    fw_load_sysfs_fallback
  firmware_loader: fix use-after-free in firmware_fallback_sysfs

 drivers/base/firmware_loader/fallback.c | 14 ++++++++------
 drivers/base/firmware_loader/firmware.h | 10 +++++++++-
 drivers/base/firmware_loader/main.c     |  2 ++
 3 files changed, 19 insertions(+), 7 deletions(-)

-- 
2.26.2

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
