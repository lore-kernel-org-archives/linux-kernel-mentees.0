Return-Path: <SRS0=vwAy=DL=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 21E04C46466
	for <linux-kernel-mentees@archiver.kernel.org>; Sun,  4 Oct 2020 20:56:03 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 78BE4206DD
	for <linux-kernel-mentees@archiver.kernel.org>; Sun,  4 Oct 2020 20:56:02 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RXs+HjiF"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 78BE4206DD
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id EBCBF85C04;
	Sun,  4 Oct 2020 20:56:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PQiec+C8D2cZ; Sun,  4 Oct 2020 20:56:01 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 58F6685AB3;
	Sun,  4 Oct 2020 20:56:01 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 49F14C07FF;
	Sun,  4 Oct 2020 20:56:01 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 7154FC0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun,  4 Oct 2020 20:56:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 5A55386F87
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun,  4 Oct 2020 20:56:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id R3DrSuqjfkXc
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun,  4 Oct 2020 20:55:59 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pf1-f196.google.com (mail-pf1-f196.google.com
 [209.85.210.196])
 by hemlock.osuosl.org (Postfix) with ESMTPS id D2FEB86F82
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun,  4 Oct 2020 20:55:59 +0000 (UTC)
Received: by mail-pf1-f196.google.com with SMTP id q123so5217498pfb.0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 04 Oct 2020 13:55:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=pdvIIyxIuMTWPTkysqTwPpBrn7TuPnPJbCEXdGhmjXA=;
 b=RXs+HjiFGShmJ1wccK4uLdFWOSKbcxMcxA8COMUvEfPHgcT97pzYi9/nO6rI1bFdIL
 hsNx3tyJbH2aofisNie/6oQSUoozVNJLaYAu6KlF7NSsjrKxUXQugtL64Ee3NOKCcGmp
 qfKroWi2W7fOgKSY6fpZlOQqccdC0kHZjW88fyhr4BULhpWTkg3etdlysXu0YW9bKl2b
 7j5Uy+FRiDQDfm9wOqF0X6O1FvVwNi7iOy2LVIBx/96MoVMYg0Nj71fy77t+L76eoX4h
 w+WU/yLoDq42JxwSKV+TJf9a8wtslAeXCns/ZHDf2h+XXL3EnBo266soKVAa5JJCYxcK
 KAaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=pdvIIyxIuMTWPTkysqTwPpBrn7TuPnPJbCEXdGhmjXA=;
 b=jc2HWhp2OG+GmxzZ+LphQ56/W/GQrlXjAMw8cZMlWaal6so8ybItHHdv+KzO+ufsTV
 bvBFbjfwbhX09mus42xfUCinIyV/AEn97xCat9K03vT0C5i6UT2eT7CHsd9h68Qej588
 QOolRyWRK1f11cZQhgGjpQbrj4CvEALcC6h4HM8yS4I9cjjREq5jPnMbkO/3YE7E7NGZ
 3Dko/kFA44xQpijV8tJuW7z5OAy22ArMCpl7SDnRNjQ3WM9t0vScIz2zXYMov1SH4JVc
 GyoQqXM3Dvf/r3e37X8Ah77PCxyUpx3TEgdGvjLQrA/8soNs56rdHS/MGeNLenPShEjB
 j/cA==
X-Gm-Message-State: AOAM530an144PTwD/6iLc50wRVHj6JoQ0Ipcgn3c08mqGd1kCm9+wWn6
 0lpqstCAQr6KG275zZZv/EW/VaWKYRYMpG7p1Gw=
X-Google-Smtp-Source: ABdhPJwkVdTzeLRWaTwuE8jAGC/0IdkS4W0EMUIfqLH2ZZNDgkobsQUe+R2RbfrfafluMXAuq2ly8g==
X-Received: by 2002:a62:1844:0:b029:152:80d3:8647 with SMTP id
 65-20020a6218440000b029015280d38647mr1751507pfy.18.1601844958883; 
 Sun, 04 Oct 2020 13:55:58 -0700 (PDT)
Received: from localhost.localdomain ([49.207.217.69])
 by smtp.gmail.com with ESMTPSA id c3sm9772626pfn.23.2020.10.04.13.55.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 04 Oct 2020 13:55:57 -0700 (PDT)
From: Anant Thazhemadam <anant.thazhemadam@gmail.com>
To: 
Date: Mon,  5 Oct 2020 02:25:36 +0530
Message-Id: <20201004205536.4734-1-anant.thazhemadam@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Cc: Anant Thazhemadam <anant.thazhemadam@gmail.com>,
 Jiri Pirko <jiri@resnulli.us>,
 syzbot+69b804437cfec30deac3@syzkaller.appspotmail.com, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, Jakub Kicinski <kuba@kernel.org>,
 linux-kernel-mentees@lists.linuxfoundation.org,
 "David S. Miller" <davem@davemloft.net>
Subject: [Linux-kernel-mentees] [PATCH] net: team: fix memory leak in
	__team_options_register
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

The variable "i" isn't initialized back correctly after the first loop
under the label inst_rollback gets executed.

The value of "i" is assigned to be option_count - 1, and the ensuing 
loop (under alloc_rollback) begins by initializing i--. 
Thus, the value of i when the loop begins execution will now become 
i = option_count - 2.

Thus, when kfree(dst_opts[i]) is called in the second loop in this 
order, (i.e., inst_rollback followed by alloc_rollback), 
dst_optsp[option_count - 2] is the first element freed, and 
dst_opts[option_count - 1] does not get freed, and thus, a memory 
leak is caused.

This memory leak can be fixed, by assigning i = option_count (instead of
option_count - 1).

Fixes: 80f7c6683fe0 ("team: add support for per-port options")
Reported-by: syzbot+69b804437cfec30deac3@syzkaller.appspotmail.com
Tested-by: syzbot+69b804437cfec30deac3@syzkaller.appspotmail.com
Signed-off-by: Anant Thazhemadam <anant.thazhemadam@gmail.com>
---
 drivers/net/team/team.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/team/team.c b/drivers/net/team/team.c
index 8c1e02752ff6..8986f3ffffe4 100644
--- a/drivers/net/team/team.c
+++ b/drivers/net/team/team.c
@@ -287,7 +287,7 @@ static int __team_options_register(struct team *team,
 	for (i--; i >= 0; i--)
 		__team_option_inst_del_option(team, dst_opts[i]);
 
-	i = option_count - 1;
+	i = option_count;
 alloc_rollback:
 	for (i--; i >= 0; i--)
 		kfree(dst_opts[i]);
-- 
2.25.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
