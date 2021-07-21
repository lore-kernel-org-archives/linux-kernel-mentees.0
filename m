Return-Path: <SRS0=/QuR=MN=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7305FC12002
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 21 Jul 2021 19:01:13 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 196CE60FE7
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 21 Jul 2021 19:01:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 196CE60FE7
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=anirudhrb.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CF0C460602;
	Wed, 21 Jul 2021 19:01:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id sDXF8zBhNurd; Wed, 21 Jul 2021 19:01:11 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp3.osuosl.org (Postfix) with ESMTPS id D9E63605F5;
	Wed, 21 Jul 2021 19:01:11 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id AFCC9C0010;
	Wed, 21 Jul 2021 19:01:11 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 426F1C000E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 21 Jul 2021 19:01:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 33D3840320
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 21 Jul 2021 19:01:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=anirudhrb.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LwXmZGrDgvYI
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 21 Jul 2021 19:01:09 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from sender4-of-o53.zoho.com (sender4-of-o53.zoho.com
 [136.143.188.53])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B6A7A402F0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 21 Jul 2021 19:01:09 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1626894065; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=IeqjzCH2fWb7xTMiUO+ltVw2DV+OGPgGEQw5OnjbvKgMdAMVqeegh0yKvtjNRvnOiU3f7BQ2P3N4h/CX2fM8yGXcPYW/jczQG0/V4YsW2hAiHX0p4IWJKgo10SydbWlVfdCArl6kzmfGNJ8AOkb87yHKfRcfSGu2Yzg5NtqvD0k=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1626894065;
 h=Content-Transfer-Encoding:Cc:Date:From:MIME-Version:Message-ID:Subject:To; 
 bh=YZ+0xBQiT2YqVqaTIOyvcIPlM9IVeqF2p2qLfS1wCRc=; 
 b=RzOWvM+soCylehXLbaGvdAZ4jTDhYXV/AgGBM4yfBiWSIdHTXJ4cLfk3JOvmiZ9g5YspR4KuHwkgkx4aJ1cy+iw2KdK61MCND79eacawY3P5Eb5E4ba8QtYjVsDjzxDF35wzdNre4drbXOVGHProZVxM4+aZYF/IEd9QwJR7jGE=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=anirudhrb.com;
 spf=pass  smtp.mailfrom=mail@anirudhrb.com;
 dmarc=pass header.from=<mail@anirudhrb.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1626894065; 
 s=zoho; d=anirudhrb.com; i=mail@anirudhrb.com;
 h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Transfer-Encoding;
 bh=YZ+0xBQiT2YqVqaTIOyvcIPlM9IVeqF2p2qLfS1wCRc=;
 b=XOXNjuwZQcrrxbd5T4ZMFLA2oQ/EvJRk7laWLHkKQqOmL3oe0NMQ8m1gIyZ5m+Lx
 4wE5iJKwJ54Xv69krLI9VsRC46wUsjvZ4jymC4JYfRAl2zQ5R3wwCqczmsSnANAbMar
 VHw8Ycdz6U0kSTgplpyJrLh3RJZDg18h+P+0pWOY=
Received: from localhost.localdomain (106.51.105.64 [106.51.105.64]) by
 mx.zohomail.com with SMTPS id 162689406018769.35784157705382;
 Wed, 21 Jul 2021 12:01:00 -0700 (PDT)
From: Anirudh Rayabharam <mail@anirudhrb.com>
To: mcgrof@kernel.org, gregkh@linuxfoundation.org, rafael@kernel.org,
 skhan@linuxfoundation.org
Subject: [PATCH v5 0/2] firmware_loader: fix uaf in firmware_fallback_sysfs 
Date: Thu, 22 Jul 2021 00:30:12 +0530
Message-Id: <20210721190014.2313-1-mail@anirudhrb.com>
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

The first patch does some cleanup of the error codes and documents
them properly. The second patch goes on to actually fix the bug.

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

 drivers/base/firmware_loader/fallback.c | 46 ++++++++++++++++++-------
 drivers/base/firmware_loader/firmware.h |  6 +++-
 drivers/base/firmware_loader/main.c     |  2 ++
 3 files changed, 40 insertions(+), 14 deletions(-)

-- 
2.26.2

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
