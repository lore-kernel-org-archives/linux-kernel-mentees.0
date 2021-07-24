Return-Path: <SRS0=Q5UI=MQ=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7AF4AC4338F
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 24 Jul 2021 12:12:10 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 19A7D60EB5
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 24 Jul 2021 12:12:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 19A7D60EB5
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=anirudhrb.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CEED74067C;
	Sat, 24 Jul 2021 12:12:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3siSLdloVAVo; Sat, 24 Jul 2021 12:12:08 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTPS id AD857414CD;
	Sat, 24 Jul 2021 12:12:07 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 750D0C001A;
	Sat, 24 Jul 2021 12:12:07 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 9C521C000E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 24 Jul 2021 12:12:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 70C0683852
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 24 Jul 2021 12:12:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=anirudhrb.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fbYwfEaP7me5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 24 Jul 2021 12:12:04 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from sender4-of-o53.zoho.com (sender4-of-o53.zoho.com
 [136.143.188.53])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7268D83490
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 24 Jul 2021 12:12:04 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1627128719; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=kvLQRvEpQMElxZAbpLLTQwts/J8tNUM7zjxqSUnCWN3CB4NppZynu6IVjCzWovcZJ6h2liepY0ChUsZSFUm7/qEI9KCn2brCZyU9UieErewLyrHatbRm5Oztpnf1u8pyVpc5yd6BCcxlGjsDeZkE4QjVGJ4d9SMfviJB8ImwFnc=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1627128719;
 h=Content-Transfer-Encoding:Cc:Date:From:MIME-Version:Message-ID:Subject:To; 
 bh=Gwqi7qz2xySqwvKyeGIDtfL3RZb4Fe+2154Q1TOO/FU=; 
 b=AA7fbXmzdTjxAlvISZMl2kGyYlhjwHG5OOrxdoXwwJ5nUJ7qiwAna5FlFQC9/3BVJMobIJwlXFnLWPuCOHbnr70RBOo57AmypWIBeG6bF20JlJzfz/jglJK344GL9QhWfBiFlwnOgSZg8ycWE9vchPJ9Z3IsXz5eo3KkA1HogpM=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=anirudhrb.com;
 spf=pass  smtp.mailfrom=mail@anirudhrb.com;
 dmarc=pass header.from=<mail@anirudhrb.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1627128719; 
 s=zoho; d=anirudhrb.com; i=mail@anirudhrb.com;
 h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Transfer-Encoding;
 bh=Gwqi7qz2xySqwvKyeGIDtfL3RZb4Fe+2154Q1TOO/FU=;
 b=yg7ZueEKxKRe3SgPS7bLtiDP+tq+2PwQr62WBFrTlZOIlPrN+/wNkBgzd3QpyViX
 Z2r0Jh6gRqkVXTq7U29hQCCH03RsVUEFsFUxkUydJWrLFlOMt3bx/ccmk5oPCznANrS
 ypePK8Sy6xZrCHY6WiGdXaEIkc9grUtDSSUR1X0Y=
Received: from localhost.localdomain (106.51.107.3 [106.51.107.3]) by
 mx.zohomail.com with SMTPS id 1627128715051669.0032074506994;
 Sat, 24 Jul 2021 05:11:55 -0700 (PDT)
From: Anirudh Rayabharam <mail@anirudhrb.com>
To: mcgrof@kernel.org, gregkh@linuxfoundation.org, rafael@kernel.org,
 skhan@linuxfoundation.org
Subject: [PATCH v7 0/2] firmware_loader: fix uaf in firmware_fallback_sysfs
Date: Sat, 24 Jul 2021 17:41:32 +0530
Message-Id: <20210724121134.6364-1-mail@anirudhrb.com>
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

This series fixes the use after free in firmware_fallback_sysfs reported
by syzbot at:

https://syzkaller.appspot.com/bug?extid=de271708674e2093097b

The first patch gets rid of the -EAGAIN return since it doesn't make
sense (see patch description for more info). The second patch goes on to
actually fix the use after free issue.

Changes in v7:
1. Don't move the error handling code from fw_load_sysfs_fallback
   to fw_sysfs_wait_timeout to simplify the patch. Also, the move
   is unnecessary.

2. Fix the commit log for the patch 1 as per Luis' suggestions.

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

 drivers/base/firmware_loader/fallback.c | 12 +++++++-----
 drivers/base/firmware_loader/firmware.h |  6 +++++-
 drivers/base/firmware_loader/main.c     |  2 ++
 3 files changed, 14 insertions(+), 6 deletions(-)

-- 
2.26.2

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
