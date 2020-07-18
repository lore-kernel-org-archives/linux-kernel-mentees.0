Return-Path: <SRS0=awrY=A5=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 410A7C433E1
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 18 Jul 2020 23:13:55 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 07E4E2076D
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 18 Jul 2020 23:13:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="G/CMfwOQ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 07E4E2076D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id B7F22875D9;
	Sat, 18 Jul 2020 23:13:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id e92NBkXWGfd2; Sat, 18 Jul 2020 23:13:54 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 22CAA86DAB;
	Sat, 18 Jul 2020 23:13:54 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 083D7C0865;
	Sat, 18 Jul 2020 23:13:54 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 9EAA8C0733
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 18 Jul 2020 23:13:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 659E120360
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 18 Jul 2020 23:13:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id uXN0rR9CuGcb
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 18 Jul 2020 23:13:51 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-qk1-f194.google.com (mail-qk1-f194.google.com
 [209.85.222.194])
 by silver.osuosl.org (Postfix) with ESMTPS id 44D6D2010D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 18 Jul 2020 23:13:51 +0000 (UTC)
Received: by mail-qk1-f194.google.com with SMTP id z15so5306265qki.10
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 18 Jul 2020 16:13:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=JR52wllqEcVbigAnzPQp6schXz+q2ggaNIrnkwe/pus=;
 b=G/CMfwOQ1tJWt20onssCm1mlA/3Watsw6BWBn2KcUuOsAkGQ/SEcj0R+9nbQIoBOnP
 TRcf86OV6YVbtqdgNRJQ1YDAtks6iXYjhQ8HhTBvo9Dh81uBzDD+Tt4uAjmwPpnKpN1I
 IbzPvzrpcW/FIjArvecktUXHiJjweNAbW3VBNfH9k9NM+0w7rFNpPkH9qS9J90ab7wPv
 j9691qrmFh4FGsSmxkRX+oCNMuFv8QBZG4/rmKH9ixSkqhcFI4ItI4ew4whnKfBv1e9g
 EsqZv3QCdd4kt+8mmChTzkCbSANlBvn7kpQ/jhTrWUD+9FrNilr1+CF7ILcuYbn1d92Q
 ClJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=JR52wllqEcVbigAnzPQp6schXz+q2ggaNIrnkwe/pus=;
 b=JK1zJRo3RvGrHL9Y3eHuz9E5zo5dXJ0WsDyeSWlqTj6uWW5ykPVCTVUO+F7IHblIDz
 th/MiQ1+WmWXbtdST687j6a2IQ1B/YLI++4y49t+1VBOXElyb8hKUIPCXwCZEQZpOi/m
 gZNmfsh27NEYAr96/ci+xSvSV3CUvecx987t/lq5MKe1DnUcgmIF5Fhh9YyaHF+oRB7N
 PUhVKR0xe84CRVQqwmbbQ5UqK9zBg72dIPpQ9D365DCSd/+iRR0mQHKQ5ZzS1W2v0i+l
 qeQfbnIAPwSSxq7h39g9JHELx4PXavMEJJs0zLUuXRWxxH7vw+dHIZDuW0MBRY9k1hPp
 1++g==
X-Gm-Message-State: AOAM532LzLec6S8xNakCAsCyoC0QtEmLWP2t3E2MEhkBvGPXzgGiQkYp
 gnLDWD/VxOWR6uOYZB5dpw==
X-Google-Smtp-Source: ABdhPJxr+mxv1zNImr7SJejb20D1SraPf6Y3xVHqBzITtkhVUKed/JmubAzYGZcbI+wxuYp7mSBfdw==
X-Received: by 2002:a37:b56:: with SMTP id 83mr14515911qkl.362.1595114030225; 
 Sat, 18 Jul 2020 16:13:50 -0700 (PDT)
Received: from localhost.localdomain (c-76-119-149-155.hsd1.ma.comcast.net.
 [76.119.149.155])
 by smtp.gmail.com with ESMTPSA id w44sm15998462qtj.86.2020.07.18.16.13.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 18 Jul 2020 16:13:49 -0700 (PDT)
From: Peilin Ye <yepeilin.cs@gmail.com>
To: Jiri Kosina <jikos@kernel.org>,
 Benjamin Tissoires <benjamin.tissoires@redhat.com>
Date: Sat, 18 Jul 2020 19:12:18 -0400
Message-Id: <20200718231218.170730-1-yepeilin.cs@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Cc: linux-usb@vger.kernel.org, syzkaller-bugs@googlegroups.com,
 linux-kernel@vger.kernel.org, linux-input@vger.kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org,
 Peilin Ye <yepeilin.cs@gmail.com>
Subject: [Linux-kernel-mentees] [PATCH v1] usbhid: Fix slab-out-of-bounds
	write in hiddev_ioctl_usage()
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

`uref->usage_index` is not always being properly checked, causing
hiddev_ioctl_usage() to go out of bounds under some cases. Fix it.

This patch fixes the following syzbot bug:

    https://syzkaller.appspot.com/bug?id=f2aebe90b8c56806b050a20b36f51ed6acabe802

Reported-by: syzbot+34ee1b45d88571c2fa8b@syzkaller.appspotmail.com
Signed-off-by: Peilin Ye <yepeilin.cs@gmail.com>
---
This patch fixes the bug, but in an ugly way. Checks on `uref` are already
being done in this code:

			if (cmd == HIDIOCGCOLLECTIONINDEX) {
				if (uref->usage_index >= field->maxusage)
					goto inval;
				uref->usage_index =
					array_index_nospec(uref->usage_index,
							   field->maxusage);
			} else if (uref->usage_index >= field->report_count)
				goto inval;

However it did not catch this bug since it's in an `else` bracket. Should
we move the above code out of the bracket? Would like to hear your opinion.
Thank you!

 drivers/hid/usbhid/hiddev.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/hid/usbhid/hiddev.c b/drivers/hid/usbhid/hiddev.c
index 4140dea693e9..c63d07caacef 100644
--- a/drivers/hid/usbhid/hiddev.c
+++ b/drivers/hid/usbhid/hiddev.c
@@ -525,6 +525,8 @@ static noinline int hiddev_ioctl_usage(struct hiddev *hiddev, unsigned int cmd,
 			goto goodreturn;
 
 		case HIDIOCSUSAGE:
+			if (uref->usage_index >= field->report_count)
+				goto inval;
 			field->value[uref->usage_index] = uref->value;
 			goto goodreturn;
 
-- 
2.25.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
