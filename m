Return-Path: <SRS0=j5Lk=GI=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1874C433DB
	for <linux-kernel-mentees@archiver.kernel.org>; Tue,  5 Jan 2021 13:10:37 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6356A22240
	for <linux-kernel-mentees@archiver.kernel.org>; Tue,  5 Jan 2021 13:10:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6356A22240
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 0C30F8686B;
	Tue,  5 Jan 2021 13:10:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id o4eB+PGs5bQa; Tue,  5 Jan 2021 13:10:35 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 0679D856B7;
	Tue,  5 Jan 2021 13:10:35 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 03937C0891;
	Tue,  5 Jan 2021 13:10:35 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id C6A2DC013A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  5 Jan 2021 13:10:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id C3A8D87113
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  5 Jan 2021 13:10:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NuAwqalA7IFy
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  5 Jan 2021 13:10:32 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com
 [209.85.160.170])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 4CBFA87103
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  5 Jan 2021 13:10:32 +0000 (UTC)
Received: by mail-qt1-f170.google.com with SMTP id u21so20691728qtw.11
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 05 Jan 2021 05:10:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=gsai1F6IdP1PCXh/00741NqnR+YHB17XXof5rNth6l4=;
 b=mEjaxdsEuXgJiHC90vpIutJPOaHxsn54lvEBYcX6VvRen+JuDbzB5o07/Qr1rciQz7
 eNpOENWuatmtjiwlqk0EtqAZdvqiH9IvOaOwvr+QJ/t96xvjOPQSyHaggRGRarFymGCh
 xr8qimAkxdhOxirJNPhDDdSMNgAg0PgT0OhLhZd2x2THqi+w/CiEvIW7IQlD9O1SscI5
 srYxF+CjaNS75dD8RmrrgAclmJdBbUyDfCmlY26zJQn7ZuR2sf8bR+ICSQW83XDINdYT
 CJIjqT9ElLOiG0jwEDHrU3cdQFdMgTCHZcm5oNb/84kF8krvyCx+HRs9uQcrHMZVAYvn
 yEeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=gsai1F6IdP1PCXh/00741NqnR+YHB17XXof5rNth6l4=;
 b=qsQu7O+Li3JnSg1cC7i50+ymXVBe8QYXlCw80LEbtzCiCy6QL+IJOHgGjbPnjasNz+
 5JBzq5InPmr4ylRqFfoFUDDWFMfj2Ty1bvDgL3hSJwsM6HynpRcroqt2OzcwWoEw9ren
 cUnK4PH/LJWfmMBC1IBTRZgrMJZ+58y165m8RQyVWwT00qlMda7LaP6BKzlJcew/nnIV
 Fu4phFC09aevxKN9TzEKqoTJhj9mM+kQUtuozR8I86QVlka6lSSH7t8IUyd/xavq3wNH
 k6ZhkOxIX6I6OFY9E+MAxwOhghhz+lADI+VguMz/igZeSrNPlpic8ZKZ4QpeUh0koGKf
 3EUw==
X-Gm-Message-State: AOAM531s5Ump5pfLbEl0YMCcGogMLWi8t9zim/OoFCw9BT8MbDzuR2yx
 HzghlbRhojDIEEkt+S8qQ3E=
X-Google-Smtp-Source: ABdhPJwKS++yItgecbLbucCl7XrSwIxepU1Q1ecyGKjS/G4KqPYMWkpIR6hSjuQdDdDJtjzqVkCFOA==
X-Received: by 2002:ac8:470d:: with SMTP id f13mr73693959qtp.281.1609852231305; 
 Tue, 05 Jan 2021 05:10:31 -0800 (PST)
Received: from localhost.localdomain ([2804:14d:72b1:8920:77d4:6fb0:85b3:b6f7])
 by smtp.gmail.com with ESMTPSA id s14sm19877804qke.45.2021.01.05.05.10.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Jan 2021 05:10:30 -0800 (PST)
From: "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>
X-Google-Original-From: Daniel W. S. Almeida
To: mchehab@kernel.org,
	hverkuil@xs4all.nl
Date: Tue,  5 Jan 2021 10:09:56 -0300
Message-Id: <20210105130956.1133222-5-dwlsalmeida@gmail.com>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210105130956.1133222-1-dwlsalmeida@gmail.com>
References: <20210105130956.1133222-1-dwlsalmeida@gmail.com>
MIME-Version: 1.0
Cc: linux-kernel@vger.kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org,
 "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>, linux-media@vger.kernel.org
Subject: [Linux-kernel-mentees] [PATCH 4/4] media: vidtv: print message when
	driver is removed
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

Print a message when the driver is removed so that we get some
visual confirmation when unbinding vidtv.

Signed-off-by: Daniel W. S. Almeida <dwlsalmeida@gmail.com>
---
 drivers/media/test-drivers/vidtv/vidtv_bridge.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/media/test-drivers/vidtv/vidtv_bridge.c b/drivers/media/test-drivers/vidtv/vidtv_bridge.c
index 11ee87399375..09cec77490c3 100644
--- a/drivers/media/test-drivers/vidtv/vidtv_bridge.c
+++ b/drivers/media/test-drivers/vidtv/vidtv_bridge.c
@@ -553,6 +553,7 @@ static int vidtv_bridge_remove(struct platform_device *pdev)
 	dvb_dmxdev_release(&dvb->dmx_dev);
 	dvb_dmx_release(&dvb->demux);
 	dvb_unregister_adapter(&dvb->adapter);
+	dev_info(&pdev->dev, "Successfully removed vidtv\n");
 
 	return 0;
 }
-- 
2.30.0

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
