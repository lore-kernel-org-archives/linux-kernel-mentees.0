Return-Path: <SRS0=fOLH=Y5=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB222C5DF60
	for <linux-kernel-mentees@archiver.kernel.org>; Tue,  5 Nov 2019 23:37:04 +0000 (UTC)
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8B75320663
	for <linux-kernel-mentees@archiver.kernel.org>; Tue,  5 Nov 2019 23:37:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="T7otIGjN"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8B75320663
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 88D08DF2;
	Tue,  5 Nov 2019 23:37:04 +0000 (UTC)
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id ABBF8DDF
	for <linux-kernel-mentees@lists.linuxfoundation.org>;
	Tue,  5 Nov 2019 23:37:03 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.7.6
Received: from mail-pf1-f195.google.com (mail-pf1-f195.google.com
	[209.85.210.195])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 5A71427B
	for <linux-kernel-mentees@lists.linuxfoundation.org>;
	Tue,  5 Nov 2019 23:37:03 +0000 (UTC)
Received: by mail-pf1-f195.google.com with SMTP id p26so17289627pfq.8
	for <linux-kernel-mentees@lists.linuxfoundation.org>;
	Tue, 05 Nov 2019 15:37:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=jbOa8JF4MBQR2lZ6+xvcROFm9Impr2oKxSGxSOq96pg=;
	b=T7otIGjNM+rxJdQzdyBGLkV3wlSlK0ERKVBdMp3P/gK3s8k6YB+I9PX7WzR8GXVgPY
	FsORAyvugQ6ORE7htS3hSbnu6mVPwgJ5be3ZCjHR7OYWjOlp9F1CX23SX7pjXwoluPMh
	WEctsoRPF2XL7IV3Dnt249ls5LKiykIvFKx8LsdSwsfwXg4Hwi6AuBTpWNSWoGHBTwl6
	sbLonNw5C5GbYtxU8DGyl93/qHK/zUp+qP3cr6lpPzXNHR51cXMHYniT0Tt0AuBcnuoC
	vDTD3T5tfU4Ryc5DIDSAfRwjVavmYUq1TFL7QbVKwuu7WujskeUg5vOzIjOQNpTmzs5p
	gsBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=jbOa8JF4MBQR2lZ6+xvcROFm9Impr2oKxSGxSOq96pg=;
	b=Ca/g+lk+MVyVZduNy/uLfc32bK4rvmltVCUXz136tBhRuy6OznMTcnMVzfzIJ/nhMy
	gvsKHs1f9q2gQfCDaZZ+6ZjSbF5iLbdpUQPMeD/IP9h6kyCjW7ace6cmSrWCvDN0BLzZ
	s/8a4Wxbrdzd18I9CGqs8hwQpTzi41Ab13oqqKL5wF1JeoNVn3LEUOhsTCOg2VUrqhAL
	hsJOfHEwOQe8PoKYTqbjdP3jWpDnCxrlFUTzdb+rI7NpsAdAUaO1kSW8KN0GFyGDHwhx
	eUXiEs02HqDCLetVnCpwa6ynKGWxJBwL34oCbwxgziDoOeY+RZGV1s7WLr4pac6XSitC
	gW+A==
X-Gm-Message-State: APjAAAUbetc1IucdMtNEJqE4IqzQd9sCK683lwwBnNM2S4EjauCUqz5j
	mbJBr3ZyssLSY1GVpUjTFl0=
X-Google-Smtp-Source: APXvYqy6TnDZoAcLevkCQceDlWjiDNaPRoDljt1Fyg09m4mm28L5Wnv+mQ2DQxrQ9qKmM8wKNTktYg==
X-Received: by 2002:a17:90a:25e1:: with SMTP id
	k88mr2298501pje.14.1572997022758; 
	Tue, 05 Nov 2019 15:37:02 -0800 (PST)
Received: from debian.net.fpt ([2405:4800:58f7:3f8f:27cb:abb4:d0bd:49cb])
	by smtp.gmail.com with ESMTPSA id
	y22sm13641688pfn.6.2019.11.05.15.36.59
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 05 Nov 2019 15:37:01 -0800 (PST)
From: Phong Tran <tranmanphong@gmail.com>
To: syzbot+495dab1f175edc9c2f13@syzkaller.appspotmail.com
Date: Wed,  6 Nov 2019 06:36:52 +0700
Message-Id: <20191105233652.21033-1-tranmanphong@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <00000000000042d60805933945b5@google.com>
References: <00000000000042d60805933945b5@google.com>
MIME-Version: 1.0
Cc: alex.theissen@me.com, andreyknvl@google.com, linux-usb@vger.kernel.org,
	2pi@mok.nu, linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com,
	linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [PATCH] usb: appledisplay: fix
	use-after-free in bl_get_brightness
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

In context of USB disconnect, the delaywork trigger and calling
appledisplay_bl_get_brightness() and the msgdata was freed.

add the checking return value of usb_control_msg() and only update the
data while the retval is valid.

Reported-by: syzbot+495dab1f175edc9c2f13@syzkaller.appspotmail.com
Reported-and-tested-by:
syzbot+495dab1f175edc9c2f13@syzkaller.appspotmail.com

https://groups.google.com/d/msg/syzkaller-bugs/dRmkh2UYusY/l2a6Mg3FAQAJ

Signed-off-by: Phong Tran <tranmanphong@gmail.com>
---
 drivers/usb/misc/appledisplay.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/misc/appledisplay.c b/drivers/usb/misc/appledisplay.c
index ac92725458b5..3e3dfa5a3954 100644
--- a/drivers/usb/misc/appledisplay.c
+++ b/drivers/usb/misc/appledisplay.c
@@ -164,7 +164,8 @@ static int appledisplay_bl_get_brightness(struct backlight_device *bd)
 		0,
 		pdata->msgdata, 2,
 		ACD_USB_TIMEOUT);
-	brightness = pdata->msgdata[1];
+	if (retval >= 0)
+		brightness = pdata->msgdata[1];
 	mutex_unlock(&pdata->sysfslock);
 
 	if (retval < 0)
-- 
2.20.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
