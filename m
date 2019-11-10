Return-Path: <SRS0=RoqR=ZC=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0272C43331
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 10 Nov 2019 14:07:30 +0000 (UTC)
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9D22D20842
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 10 Nov 2019 14:07:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iCV/dOMt"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9D22D20842
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 5B3A0B3E;
	Sun, 10 Nov 2019 14:07:30 +0000 (UTC)
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 6597FAD8
	for <linux-kernel-mentees@lists.linuxfoundation.org>;
	Sun, 10 Nov 2019 14:07:29 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.7.6
Received: from mail-pf1-f194.google.com (mail-pf1-f194.google.com
	[209.85.210.194])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 0047812E
	for <linux-kernel-mentees@lists.linuxfoundation.org>;
	Sun, 10 Nov 2019 14:07:28 +0000 (UTC)
Received: by mail-pf1-f194.google.com with SMTP id 3so8530528pfb.10
	for <linux-kernel-mentees@lists.linuxfoundation.org>;
	Sun, 10 Nov 2019 06:07:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=eU8YcK7QmEzgV0st1+64+ecJ2UFrzFdTVmX7+bTQHP0=;
	b=iCV/dOMt1Gxk9wD35Bds5vRMgfgQvWjuluHI8tie+4FFYwR0998MKuplvLQFnBJp/B
	A8nzAtnI+sxOgpdl9SzBuXyOO34cvuveEM+KwgNqV3ESwmN+ni/03WGaH1dNgdXipUEL
	xqWsXtQev+WX9Nwdfmt+oritax4VtSLT8dzmEkCKdFhgCiWbtHStR9aqBjxqEtJQcHDz
	JSlKI3itKlTQXrQh24BjQrbYDZeaxrvDIEifZPLazbM5baQ93GI0FYgxIN2N+iGExYL2
	AcZp3GycHovPo6RxWCYkRxL7uxwEv8+PVrEqekLpf1AybBrOvdNMVjR8d0++mGIrS5ri
	ObhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=eU8YcK7QmEzgV0st1+64+ecJ2UFrzFdTVmX7+bTQHP0=;
	b=P/uOtaVtslad/D1zz7++8k6Ar8zSCPVuZKdkSfAbxnD9PuROCn8G7DJ/7m34as5IUM
	Q4u28N1gAGfmSdJxlsBEC1CYk7MaFqoj34xwjy55ZKGvhtDQlbH3EECmmo5qVwB2yA+W
	ehLAlnF1z0verB2qNIslSC4Jd6AQrSKLDcF3YZCHWd7mP3cyHjZJjVP6xpEUOiFtzkcn
	RUAQ08do1GBnM6u6X6blW1OHvkQAFtCeBpQ6xDewsGgoBa7XpAAuwrtWdeilM0vlgfns
	mitn43Fx5hPeWAtcsLLgNU8VBD6tGbqkqO/Z8HjhyUrO9RYe+V+Ia0eLd6jTdjBTNztw
	GSUg==
X-Gm-Message-State: APjAAAWZXpd3qXbCzHctehAxtD5A5DIXsKaEsZdIjsNsvpSllw9wSHEo
	T6mB43foIfmDVVPB0MG6kFs=
X-Google-Smtp-Source: APXvYqwemy1rr3PRyYeBoTH00pTVQ3zewYcQ0DbOrpCd/MlP5CKPo5HW2QO+pfqB/dc5HnjOuqoU3Q==
X-Received: by 2002:a63:e801:: with SMTP id s1mr16008814pgh.213.1573394848386; 
	Sun, 10 Nov 2019 06:07:28 -0800 (PST)
Received: from debian.net.fpt ([2405:4800:58f7:3f8f:27cb:abb4:d0bd:49cb])
	by smtp.gmail.com with ESMTPSA id
	c12sm12520388pfp.178.2019.11.10.06.07.24
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sun, 10 Nov 2019 06:07:27 -0800 (PST)
From: Phong Tran <tranmanphong@gmail.com>
To: davem@davemloft.net
Date: Sun, 10 Nov 2019 21:07:16 +0700
Message-Id: <20191110140716.11996-1-tranmanphong@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191107.152118.922830217121663373.davem@davemloft.net>
References: <20191107.152118.922830217121663373.davem@davemloft.net>
MIME-Version: 1.0
Cc: kstewart@linuxfoundation.org, linux-usb@vger.kernel.org,
	hslester96@gmail.com, linux-kernel@vger.kernel.org,
	syzbot+7dc7c28d4577bbe55b10@syzkaller.appspotmail.com,
	syzkaller-bugs@googlegroups.com, glider@google.com,
	netdev@vger.kernel.org, tglx@linutronix.de,
	linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [[Patch V2]] usb: asix: cleanup the buffer
	in asix_read_cmd
X-BeenThere: linux-kernel-mentees@lists.linuxfoundation.org
X-Mailman-Version: 2.1.12
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
Sender: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org

This is for fixing KMSAN: uninit-value in asix_mdio_write
comes from syzbot.

Reported-by: syzbot+7dc7c28d4577bbe55b10@syzkaller.appspotmail.com

Tested by:

https://groups.google.com/d/msg/syzkaller-bugs/3H_n05x_sPU/07UIX_TUEgAJ

Signed-off-by: Phong Tran <tranmanphong@gmail.com>
---
 drivers/net/usb/asix_common.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/net/usb/asix_common.c b/drivers/net/usb/asix_common.c
index e39f41efda3e..f3eeb7875a4d 100644
--- a/drivers/net/usb/asix_common.c
+++ b/drivers/net/usb/asix_common.c
@@ -22,6 +22,8 @@ int asix_read_cmd(struct usbnet *dev, u8 cmd, u16 value, u16 index,
 	else
 		fn = usbnet_read_cmd_nopm;
 
+	memset(data, 0, size);
+
 	ret = fn(dev, cmd, USB_DIR_IN | USB_TYPE_VENDOR | USB_RECIP_DEVICE,
 		 value, index, data, size);
 
-- 
2.20.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
