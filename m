Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5EB94E7D0A1
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 22 Sep 2023 00:52:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DDED060F40;
	Fri, 22 Sep 2023 00:52:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DDED060F40
Authentication-Results: smtp3.osuosl.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=marliere.net header.i=ricardo@marliere.net header.a=rsa-sha256 header.s=zmail header.b=CawUBV8S
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tNkMM0098091; Fri, 22 Sep 2023 00:52:49 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTPS id C3F7F60B3A;
	Fri, 22 Sep 2023 00:52:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C3F7F60B3A
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 91273C0071;
	Fri, 22 Sep 2023 00:52:48 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 4055BC0032
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 22 Sep 2023 00:52:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 22C9560EE0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 22 Sep 2023 00:52:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 22C9560EE0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id F56D9FEDgCFJ
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 22 Sep 2023 00:52:46 +0000 (UTC)
Received: from sender4-op-o14.zoho.com (sender4-op-o14.zoho.com
 [136.143.188.14])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 272A360B3A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 22 Sep 2023 00:52:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 272A360B3A
ARC-Seal: i=1; a=rsa-sha256; t=1695343962; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=gx/PDXOp9fJP1H3Mmco4a2vkqGUGk8O9bFLvii12wfX7tZ5NEDK/oLC0Y7i9rONR2eealv8miCn+pQckoYgLcbOGdcga9xdG2Nm051s6poqmJsHDBRflWMElH0e27xgwZUFxRrPG1xIm9dju3c1n2SYO86lfL3l9YmR6Q22POhk=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1695343962;
 h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=2zFhR/B8Wliu/U9DfZEw9AYH1z4/jqjAMIdokfhTfU0=; 
 b=Mjuq9ydmy8uNdJ5AtD1amYv6PkjQNMj7j+9uF2YhQOE5qYEoDsHWPQUD5JonEnlZ7YPbLg9RBUHgnZbicL/7si2Gum6XOodNYrWBJWX1xG8cw4do2zqoJ88TWumhZfarYBwVrnL3W3z6YiwQv7YKwxOTb2mHuERHDlBVFkPMD4A=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=marliere.net;
 spf=pass  smtp.mailfrom=ricardo@marliere.net;
 dmarc=pass header.from=<ricardo@marliere.net>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1695343962; 
 s=zmail; d=marliere.net; i=ricardo@marliere.net;
 h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-Id:Message-Id:MIME-Version:Content-Transfer-Encoding:Reply-To;
 bh=2zFhR/B8Wliu/U9DfZEw9AYH1z4/jqjAMIdokfhTfU0=;
 b=CawUBV8SyXJkq63xYRlDA+vjyMmegrcXA5LU+GUN75yX/z0PmOuxVIL+SbBNqK+l
 Q5hFrAnzvTBOykkEiHmVrPPWay/xtFtVJn5ojeyUZMUHzMuRX3O00Aa7pFpjVy3JWuH
 NLuul+L79+sEIdZxp0SRWpd49LQzh4DxnLj+Hygs=
Received: from localhost (177.104.93.54 [177.104.93.54]) by mx.zohomail.com
 with SMTPS id 1695343961324118.64966551399345;
 Thu, 21 Sep 2023 17:52:41 -0700 (PDT)
From: "Ricardo B. Marliere" <ricardo@marliere.net>
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Ruslan Bilovol <ruslan.bilovol@gmail.com>
Subject: [PATCH] sound: usb: increase snd_card alloc size
Date: Thu, 21 Sep 2023 21:51:53 -0300
Message-Id: <20230922005152.163640-1-ricardo@marliere.net>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-ZohoMailClient: External
Cc: alsa-devel@alsa-project.org, linux-kernel-mentees@lists.linuxfoundation.org,
 linux-kernel@vger.kernel.org,
 syzbot+59875ffef5cb9c9b29e9@syzkaller.appspotmail.com
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

Syzbot reports a slab-out-of-bounds read of a snd_card object. When
snd_usb_audio_create calls snd_card_new, it passes sizeof(*chip) as the
extra_size argument, which is not enough in this case.

Relevant logs below:

BUG: KASAN: slab-out-of-bounds in imon_probe+0x2983/0x3910
Read of size 1 at addr ffff8880436a2c71 by task kworker/1:2/777
(...)
The buggy address belongs to the object at ffff8880436a2000
 which belongs to the cache kmalloc-4k of size 4096
The buggy address is located 1 bytes to the right of
 allocated 3184-byte region [ffff8880436a2000, ffff8880436a2c70)

Reported-by: syzbot+59875ffef5cb9c9b29e9@syzkaller.appspotmail.com
Closes: https://lore.kernel.org/all/000000000000a838aa0603cc74d6@google.com/
Signed-off-by: Ricardo B. Marliere <ricardo@marliere.net>
---
 sound/usb/card.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/usb/card.c b/sound/usb/card.c
index 1b2edc0fd2e9..6578326d33e8 100644
--- a/sound/usb/card.c
+++ b/sound/usb/card.c
@@ -619,7 +619,7 @@ static int snd_usb_audio_create(struct usb_interface *intf,
 	}
 
 	err = snd_card_new(&intf->dev, index[idx], id[idx], THIS_MODULE,
-			   sizeof(*chip), &card);
+			   sizeof(*chip) + 2, &card);
 	if (err < 0) {
 		dev_err(&dev->dev, "cannot create card instance %d\n", idx);
 		return err;
-- 
2.40.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
