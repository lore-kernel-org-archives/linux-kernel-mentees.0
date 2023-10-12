Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6268CDB474
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 12 Oct 2023 23:09:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1734D812B8;
	Thu, 12 Oct 2023 23:09:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1734D812B8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MbSbGa1j3jSV; Thu, 12 Oct 2023 23:09:56 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 9986481260;
	Thu, 12 Oct 2023 23:09:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9986481260
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 7C4ECC0039;
	Thu, 12 Oct 2023 23:09:55 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id B6114C0032
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 12 Oct 2023 23:09:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 74D56404C9
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 12 Oct 2023 23:09:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 74D56404C9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bBZtTYEGLhYG
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 12 Oct 2023 23:09:52 +0000 (UTC)
Received: from mail-pf1-x42e.google.com (mail-pf1-x42e.google.com
 [IPv6:2607:f8b0:4864:20::42e])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 75EBD400CE
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 12 Oct 2023 23:09:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 75EBD400CE
Received: by mail-pf1-x42e.google.com with SMTP id
 d2e1a72fcca58-690fa0eea3cso1302395b3a.0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 12 Oct 2023 16:09:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697152192; x=1697756992;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:dkim-signature:from:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8wklHuRjtu9eKbC21KJ0qhgZYz7A3pvh/X6lpMyLNrM=;
 b=xOUvGphclLgzvmZSoDp7FLzF/CLLnCEtx7tVYEfnvrVax8G3YVOF11k/6re3wKaPMp
 Y0aL1UZ3mB7Zb0nwVoZcK82JPYduqCo0Sf5vi+sdQaGP78odKHBklXc1u2TQFal88Ex0
 h+ClLZGMahfgXGRgF5v+j/+4LhUrk8wUKTiHCCQFTh1OeLHuJmfRMoEN/rNN3EfbQ4jY
 5+ehDa5JuR8Ykv0JjzB8xYOiKqnrRblKXGBLJHtlNSCsldSpDDGhtTyklNBTbfS0Dz6n
 S1FoJUt/UEc+9zHPR3B5xbfKRFAVwv1po7857S+4Uo+TytUNgFTPQrMn4K6iO8FZhd3b
 UTXg==
X-Gm-Message-State: AOJu0YwGK25aYRf+mkm2ImZINumvqzUpVpn1sTNCwpKaBlcfSf4Az4Ef
 bzjUQw697Q/EVLFiIEO92Rk=
X-Google-Smtp-Source: AGHT+IHvsCDN04Ikusz/wjPmqe2Bfs6yIv+y6wzyHh6AF+oowBYFNSfMXE3TPdFvoJQ/Y9nmBEzuMA==
X-Received: by 2002:a05:6a00:1255:b0:68a:5449:7436 with SMTP id
 u21-20020a056a00125500b0068a54497436mr27851303pfi.32.1697152191710; 
 Thu, 12 Oct 2023 16:09:51 -0700 (PDT)
Received: from mail.marliere.net ([24.199.118.162])
 by smtp.gmail.com with ESMTPSA id
 e13-20020a63370d000000b0059d34fb9ccasm2244765pga.2.2023.10.12.16.09.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Oct 2023 16:09:51 -0700 (PDT)
From: "Ricardo B. Marliere" <ricardo@marliere.net>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=marliere.net;
 s=2023; t=1697152189;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=8wklHuRjtu9eKbC21KJ0qhgZYz7A3pvh/X6lpMyLNrM=;
 b=jkUICrkHhzZYt0gxJJyhhDOcCLpoM+WvLDhOzH9js7npKWtH1hyBo+LGns3xP1WqjyQUOH
 SvR3l1WcH+kWpfmcf0jzRfVRFeyheehJnlaoNFiMQv++O/xqSf+eoYaM0eIe96haeAPV7l
 /vxbaTBBYb8iQv/z5Gpj+0FEcwn8NHCg7vr2etuFp065BpSgpSBaZmfF+TdK8XT8CIrb5b
 w1lsV7t083yEea0tBFEiKzOKG8VrvcsLF4kqI23ntaVVlMUMZ+g9AVqfOhX5c+RoeBCB1+
 Xwjd5ekArbsun+VV/vwGvG/183QCvFsyuE3mA4ZyqCxUbPT1x0S84fg3YQFsBw==
Authentication-Results: ORIGINATING;
 auth=pass smtp.auth=ricardo@marliere.net smtp.mailfrom=ricardo@marliere.net
To: Mike Isely <isely@pobox.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: [PATCH] media: pvrusb2: fix use after free on context disconnection
Date: Thu, 12 Oct 2023 20:09:12 -0300
Message-ID: <20231012230911.48113-2-ricardo@marliere.net>
MIME-Version: 1.0
Cc: syzbot+621409285c4156a009b3@syzkaller.appspotmail.com,
 linux-kernel-mentees@lists.linuxfoundation.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org
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

Upon module load, a kthread is created targeting the
pvr2_context_thread_func function, which may call pvr2_context_destroy
and thus call kfree() on the context object. However, that might happen
before the usb hub_event handler is able to notify the driver. This
patch adds a sanity check before the invalid read reported by syzbot,
within the context disconnection call stack.

Fixes: e5be15c63804 ("V4L/DVB (7711): pvrusb2: Fix race on module unload")
Reported-and-tested-by: syzbot+621409285c4156a009b3@syzkaller.appspotmail.com
Closes: https://lore.kernel.org/all/000000000000a02a4205fff8eb92@google.com/
Signed-off-by: Ricardo B. Marliere <ricardo@marliere.net>
---
 drivers/media/usb/pvrusb2/pvrusb2-context.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/media/usb/pvrusb2/pvrusb2-context.c b/drivers/media/usb/pvrusb2/pvrusb2-context.c
index 14170a5d72b3..1764674de98b 100644
--- a/drivers/media/usb/pvrusb2/pvrusb2-context.c
+++ b/drivers/media/usb/pvrusb2/pvrusb2-context.c
@@ -268,7 +268,8 @@ void pvr2_context_disconnect(struct pvr2_context *mp)
 {
 	pvr2_hdw_disconnect(mp->hdw);
 	mp->disconnect_flag = !0;
-	pvr2_context_notify(mp);
+	if (!pvr2_context_shutok())
+		pvr2_context_notify(mp);
 }
 
 
-- 
2.42.0

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
