Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33705EEAA7F
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 15 Sep 2023 01:20:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 93601822E5;
	Fri, 15 Sep 2023 01:20:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 93601822E5
Authentication-Results: smtp1.osuosl.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=marliere.net header.i=ricardo@marliere.net header.a=rsa-sha256 header.s=zmail header.b=Hj9uXIGu
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3_YkG6Nz7J9F; Fri, 15 Sep 2023 01:20:35 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 74BF6822E0;
	Fri, 15 Sep 2023 01:20:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 74BF6822E0
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 4C821C0039;
	Fri, 15 Sep 2023 01:20:35 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 83B8CC0032
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 15 Sep 2023 01:20:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4FB9341FA5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 15 Sep 2023 01:20:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4FB9341FA5
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key) header.d=marliere.net header.i=ricardo@marliere.net
 header.a=rsa-sha256 header.s=zmail header.b=Hj9uXIGu
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Yw_XEGRm0doi
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 15 Sep 2023 01:20:33 +0000 (UTC)
Received: from sender4-op-o15.zoho.com (sender4-op-o15.zoho.com
 [136.143.188.15])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 148A141FA4
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 15 Sep 2023 01:20:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 148A141FA4
ARC-Seal: i=1; a=rsa-sha256; t=1694740829; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=jA0Sq0opSGJvZd+9luShErAjJQ5fjm5TkSX70fVA5GS4AGeTv1HczqRd9zZdTDFi9tJVP02CoF65SXYN2UKoK9v6KbYeQCZdLdAO/qUdvMuY6cO8UQvF94ZMtiUZIoRyYf8eOCxrz2L7B2P4l91P/zKFnfIiDBFgCMiq97Q3iOM=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1694740829;
 h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=p1SqzlgSCCq5OZSRwUqzzfIWSl8knM90zHHYq6t0dQA=; 
 b=dG+uo+Ph+uvnlYeq39JqAy9B/upHAfxLlo86CMeZNgwGDR3hv7VudqMXS+Oj2dK03UeLBmbHm6mEtxuA33ulDPXgz14r+o5Bexq+qPXLpwIM8v405uMsIuDK5KEPdcRnMCX+1vjy2xLwSkD59j/ngQl7LGC+WG1cMUcN6WTfadY=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=marliere.net;
 spf=pass  smtp.mailfrom=ricardo@marliere.net;
 dmarc=pass header.from=<ricardo@marliere.net>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1694740829; 
 s=zmail; d=marliere.net; i=ricardo@marliere.net;
 h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-Id:Message-Id:MIME-Version:Content-Transfer-Encoding:Reply-To;
 bh=p1SqzlgSCCq5OZSRwUqzzfIWSl8knM90zHHYq6t0dQA=;
 b=Hj9uXIGuyLmH4GDgEDokEcq9FNpS69lk0r5Y9xxl1HKb5a/QmfHm7lRYKrl/KTCm
 zLinG89HxLRjWyRSTwJat882e5+t7VSx2NNYR7wjQqNh9yeG/zJV1jm4VJA84XpefYW
 06KCNDn5Shz4nFDCdx3tntiMxeUmlp0d71bJHjCw=
Received: from localhost (177.104.93.54 [177.104.93.54]) by mx.zohomail.com
 with SMTPS id 1694740828476435.6978803185117;
 Thu, 14 Sep 2023 18:20:28 -0700 (PDT)
From: "Ricardo B. Marliere" <ricardo@marliere.net>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>
Subject: [PATCH] drivers: core: ensure device has a name
Date: Thu, 14 Sep 2023 22:19:31 -0300
Message-Id: <20230915011930.199009-1-ricardo@marliere.net>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-ZohoMailClient: External
Cc: syzbot+bbc59256015533127d80@syzkaller.appspotmail.com,
 linux-kernel-mentees@lists.linuxfoundation.org, linux-kernel@vger.kernel.org
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

device_add() relies on dev_name() and dev_set_name() to set the device
name. This patch adds the fallback case where both the call to
dev_name() and (dev->bus && dev->bus->dev_name) fails.

Reported-by: syzbot+bbc59256015533127d80@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=bbc59256015533127d80
Fixes: d21fdd07cea4 ("driver core: Return proper error code when dev_set_name() fails")
Signed-off-by: Ricardo B. Marliere <ricardo@marliere.net>
---
 drivers/base/core.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/base/core.c b/drivers/base/core.c
index b7d7f410c256..4d8b315c48a1 100644
--- a/drivers/base/core.c
+++ b/drivers/base/core.c
@@ -3537,6 +3537,8 @@ int device_add(struct device *dev)
 	/* subsystems can specify simple device enumeration */
 	else if (dev->bus && dev->bus->dev_name)
 		error = dev_set_name(dev, "%s%u", dev->bus->dev_name, dev->id);
+	else
+		error = -EINVAL;
 	if (error)
 		goto name_error;
 
-- 
2.40.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
