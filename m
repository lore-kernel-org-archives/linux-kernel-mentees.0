Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B864C0502E
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 29 Aug 2022 12:40:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 693E5416C1;
	Mon, 29 Aug 2022 12:40:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 693E5416C1
Authentication-Results: smtp4.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=mUW9a9Wu
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vS0_txFyOmiK; Mon, 29 Aug 2022 12:40:15 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 2FB19416AB;
	Mon, 29 Aug 2022 12:40:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2FB19416AB
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 1330CC0032;
	Mon, 29 Aug 2022 12:40:15 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 76512C002D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 29 Aug 2022 12:40:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 438CE81420
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 29 Aug 2022 12:40:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 438CE81420
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=mUW9a9Wu
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id AKn8D1PMdDiM
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 29 Aug 2022 12:40:12 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CF4578141A
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com
 [IPv6:2607:f8b0:4864:20::1033])
 by smtp1.osuosl.org (Postfix) with ESMTPS id CF4578141A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 29 Aug 2022 12:40:12 +0000 (UTC)
Received: by mail-pj1-x1033.google.com with SMTP id
 u9-20020a17090a1f0900b001fde6477464so1412873pja.4
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 29 Aug 2022 05:40:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:subject:cc:to:from:from:to:cc;
 bh=U4wTB7v20lr8R8vN/DK0R+bOA2Ehyif+zGIk0zOHfx0=;
 b=mUW9a9WuxFwjzWd9ArvC0UAnAXe8WIK4jnMELe11pyHPPKuXyL1J0BD4HdYYhFfiiv
 60ocE3VLbMEQ5FINK30pxWHac4NP/zeNzrHDJw+mfOPH+YXlD66fleA56iFTNEOZqATS
 qQ78Ft48VWLOxBlkd3f+mwir9VNJ6cT1JDDYS6xu54ixjpHprwimnF52vKMrliY0tc/j
 1bQQmr8oVWVhPff4l9wbmNsyeDZnbQzygjFW0rY10pZ4eZrJyVSa+ws/WgqbijQWe4jp
 qZiz7NpZu1b9oB8OAmV7amCMReVX+DXuGTbNZUNMTs3RCEHsC9dxgv+t96hrec1V9+WB
 jgTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=U4wTB7v20lr8R8vN/DK0R+bOA2Ehyif+zGIk0zOHfx0=;
 b=28WgKhveojsvDiLmbhK5DTvci/pDi+kLxDebmkE+RKmS7gteFX5eZfJDQByBJ1fmwZ
 OzhCwMm+ziHQAZV7TIZu/28Wf88Istn2+YoGJyvm9EWjEUOEj+cpUeLHw19+yXwdZCdw
 ZcbkdWDbK+wG8+7higtGYrxbDVZtonfI1lciAouR76298BleVltgSmp86m3n2QBXQxr2
 MRdUvFP9UzyEYj+v8m/AzGMu4iRgW/u+Dmq6YdRa09TafzLoeoOSB1IkOh+kl9F2ARKg
 pHynKnKLzhPNaWz+RNa7eExYRR1SwRK5wEWswpjXa6OdJnfTiJ134ozU2Vw6o6viUlrm
 zoMw==
X-Gm-Message-State: ACgBeo0ywZId2IBO/TfPXiWmYb15rGbPQrPRvHkuKeqgHjUr+zwoAlyJ
 Cj8qEoaE8JKmcmnR7haiyjkUkryKELkCzg==
X-Google-Smtp-Source: AA6agR62s5v7zx7N35JeijeC8JxoIsW/kNiBDiOhLdy9ERmBr/+5HYU7BCqEN6UQidMuu50r9Uu9mA==
X-Received: by 2002:a17:902:9a41:b0:171:389a:554f with SMTP id
 x1-20020a1709029a4100b00171389a554fmr16202440plv.122.1661776812126; 
 Mon, 29 Aug 2022 05:40:12 -0700 (PDT)
Received: from Negi ([207.151.52.7]) by smtp.gmail.com with ESMTPSA id
 n2-20020a170902e54200b0016d1bee1519sm7491501plf.102.2022.08.29.05.40.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Aug 2022 05:40:11 -0700 (PDT)
From: Soumya Negi <soumya.negi97@gmail.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Shuah Khan <skhan@linuxfoundation.org>
Subject: [PATCH] Input: Check sanity of endpoint in pegasus_open()
Date: Mon, 29 Aug 2022 05:39:59 -0700
Message-Id: <20220829123959.21298-1-soumya.negi97@gmail.com>
X-Mailer: git-send-email 2.17.1
Cc: linux-kernel-mentees@lists.linuxfoundation.org,
 linux-kernel@vger.kernel.org, linux-input@vger.kernel.org
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

Fix WARNING in pegasus_open/usb_submit_urb
Syzbot bug: https://syzkaller.appspot.com/bug?id=bbc107584dcf3262253ce93183e51f3612aaeb13

Add sanity check of endpoint for Pegasus URB in pegasus_open() so that
transfer requests for bogus URBs are not submitted. If the URB is bogus
pegasus_open() will fail.

Reported-by: syzbot+04ee0cb4caccaed12d78@syzkaller.appspotmail.com
Signed-off-by: Soumya Negi <soumya.negi97@gmail.com>
---
 drivers/input/tablet/pegasus_notetaker.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/input/tablet/pegasus_notetaker.c b/drivers/input/tablet/pegasus_notetaker.c
index c608ac505d1b..5e47882ee4c0 100644
--- a/drivers/input/tablet/pegasus_notetaker.c
+++ b/drivers/input/tablet/pegasus_notetaker.c
@@ -225,6 +225,15 @@ static int pegasus_open(struct input_dev *dev)
 
 	mutex_lock(&pegasus->pm_mutex);
 	pegasus->irq->dev = pegasus->usbdev;
+
+	/* Sanity check of endpoint in Pegasus URB */
+	error = usb_urb_ep_type_check(pegasus->irq);
+	if (error) {
+		dev_err(&pegasus->usbdev->dev,
+			"URB failed endpoint sanity check: %d\n", error);
+		goto err_autopm_put;
+	}
+
 	if (usb_submit_urb(pegasus->irq, GFP_KERNEL)) {
 		error = -EIO;
 		goto err_autopm_put;
-- 
2.17.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
