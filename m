Return-Path: <SRS0=39L3=CB=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B25DCC433DF
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 23 Aug 2020 08:21:27 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 783792067C
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 23 Aug 2020 08:21:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="D9m4vGhh"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 783792067C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 370EB87779;
	Sun, 23 Aug 2020 08:21:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gXVnnvWaemXI; Sun, 23 Aug 2020 08:21:25 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 2F02687770;
	Sun, 23 Aug 2020 08:21:25 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 12345C07FF;
	Sun, 23 Aug 2020 08:21:25 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 49130C0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 23 Aug 2020 08:21:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 2C86788007
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 23 Aug 2020 08:21:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Rw7TGZK2JUZ1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 23 Aug 2020 08:21:22 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pl1-f195.google.com (mail-pl1-f195.google.com
 [209.85.214.195])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 0B47E87FF7
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 23 Aug 2020 08:21:22 +0000 (UTC)
Received: by mail-pl1-f195.google.com with SMTP id bh1so2768846plb.12
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 23 Aug 2020 01:21:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=HorE3eSfXz4Gki6guH9XnAbsktXH9J/H5OfUk+fj9ww=;
 b=D9m4vGhhadKVAw7CoQBmjIajZLQNNltNmMM6DDOZqZzdNZoB0yI7WVyi0OXKbppRBo
 2U6LWFugxmTinh1FdA5xCI9UPTEb9d5izBpr47nrZeXk5PgTPWzD7GVYmrsS4okAgG4d
 /dGRUHaoNgNWVzGj0k+3JwnRb+sMi9+b78mT5Rh9y9GVFmnunZAOv928a2ikFBa88CF9
 QlxypZvyFajyAPumyDoidP5LkXzxA7T4cLZYDxKZAaIvvfqypORK8sQyKokiJl9OjmAK
 M677vY1Y6yT/u5grPENUNzXZzL3/Chz0JtqmqZT0FnemSOrSxRGGdqWar6C1MKnybOul
 cR2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=HorE3eSfXz4Gki6guH9XnAbsktXH9J/H5OfUk+fj9ww=;
 b=CuKQBns+3Pfpg3OCJSwTpQ3zDYE3ARFUGRDIN3RhfArKiwII1lfe+c2M1z6WHNhDy7
 TuKv7ekVNU2JwRRPhWKZ9bdtZTBjWwK5uxIlZsXY9hw22Y3kvOSGa3nPzRYMJHrpWi8o
 P+YthYPNcVJZG+Ui7CFKWftpFZ+Lwq2cse0EzNNQgkl5X9paEXRWDwleWXCpReesVlhd
 4omJvI13XCQP8Y/4Jl07yzCosdOwo4Tc2ZoTTjyQmx5JjHU2DVossOGMvcxA1O/feHMy
 PyJ9yyF8h7uHY7DZ5kXn8tZBIQx93fUiBe1+UG9g03GvN64yWsQkUAjFBSYbscRhhJ0G
 7DrQ==
X-Gm-Message-State: AOAM530DPKkeWZZAK2DRWH0yOyFr3RVPj51Je0P7YRCfM7VGGTizli+o
 XIf7bl78F50fiNsn/LpMRS8=
X-Google-Smtp-Source: ABdhPJxLf+kXTEY8tY4f4/a5bUzfIcFh3YpQnFiHe2KQmR1ZuODc+Zff+j2Fm43ZKu7SfHriVcLBSw==
X-Received: by 2002:a17:90a:a791:: with SMTP id
 f17mr412787pjq.136.1598170881504; 
 Sun, 23 Aug 2020 01:21:21 -0700 (PDT)
Received: from localhost.localdomain ([157.32.237.182])
 by smtp.gmail.com with ESMTPSA id q17sm7416783pfh.32.2020.08.23.01.21.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 23 Aug 2020 01:21:20 -0700 (PDT)
From: Himadri Pandya <himadrispandya@gmail.com>
To: davem@davemloft.net,
	kuba@kernel.org
Date: Sun, 23 Aug 2020 13:50:42 +0530
Message-Id: <20200823082042.20816-1-himadrispandya@gmail.com>
X-Mailer: git-send-email 2.17.1
Cc: linux-usb@vger.kernel.org, syzkaller-bugs@googlegroups.com,
 linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org,
 Himadri Pandya <himadrispandya@gmail.com>
Subject: [Linux-kernel-mentees] [PATCH] net: usb: Fix uninit-was-stored
	issue in asix_read_cmd()
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

Initialize the buffer before passing it to usb_read_cmd() function(s) to
fix the uninit-was-stored issue in asix_read_cmd().

Fixes: KMSAN: kernel-infoleak in raw_ioctl
Reported by: syzbot+a7e220df5a81d1ab400e@syzkaller.appspotmail.com

Signed-off-by: Himadri Pandya <himadrispandya@gmail.com>
---
 drivers/net/usb/asix_common.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/net/usb/asix_common.c b/drivers/net/usb/asix_common.c
index e39f41efda3e..a67ea1971b78 100644
--- a/drivers/net/usb/asix_common.c
+++ b/drivers/net/usb/asix_common.c
@@ -17,6 +17,8 @@ int asix_read_cmd(struct usbnet *dev, u8 cmd, u16 value, u16 index,
 
 	BUG_ON(!dev);
 
+	memset(data, 0, size);
+
 	if (!in_pm)
 		fn = usbnet_read_cmd;
 	else
-- 
2.17.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
