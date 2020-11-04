Return-Path: <SRS0=I1jd=EK=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BD678C55178
	for <linux-kernel-mentees@archiver.kernel.org>; Wed,  4 Nov 2020 06:48:14 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3A8CB2222B
	for <linux-kernel-mentees@archiver.kernel.org>; Wed,  4 Nov 2020 06:48:14 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gQFg7+IE"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3A8CB2222B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id CC4E32285E;
	Wed,  4 Nov 2020 06:48:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Xgqidm2mGdnJ; Wed,  4 Nov 2020 06:48:13 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id F035D220C1;
	Wed,  4 Nov 2020 06:48:12 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id EC8F8C088B;
	Wed,  4 Nov 2020 06:48:12 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id A65B0C0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  4 Nov 2020 06:48:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 95FE486BAB
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  4 Nov 2020 06:48:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id aC2kIBYk0HO8
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  4 Nov 2020 06:48:11 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pg1-f195.google.com (mail-pg1-f195.google.com
 [209.85.215.195])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 2956886B9E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  4 Nov 2020 06:48:11 +0000 (UTC)
Received: by mail-pg1-f195.google.com with SMTP id w4so5521896pgg.13
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 03 Nov 2020 22:48:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=vfvrxPrBJGjeJqjA+QKlO7xKcbqowzvBic2gE6WrBIc=;
 b=gQFg7+IEGHm8KUsDcV9DwYXkLpSQcQqwrfaZqR4PhGzF1/B4B8fDXv0ZR/yGwbCcR9
 F7m64I/YV8+35M/mAPTTnVtYE8dh3Xm5YesJCv1yXxLHl8iW/6AwSzcXqVWZMUSfavda
 tH4nGCnqQOJ0f76yCxY7G2nV++UMFtI4AovOrpWDhfKalQOhZmDHxRJvvV958135e9MT
 3e+EhL+9cokTGCxSj00YFCscNPj0vIY38kbqzU+BHVnMmmHakdfSPvLyPhGp/ZWTqJDg
 0FCHvE3wYXJyTIypz/6jlclGlTti3+uzOa8//eLBjLWbjPIyD9BP9PwH9/KuF5phLP3J
 ghFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=vfvrxPrBJGjeJqjA+QKlO7xKcbqowzvBic2gE6WrBIc=;
 b=K+fr/oYxWDwVXo9vXO8vAaI6ZxdQ5AXW4K7naK+dB8hucLi5rZOtIgIFRFIDhlJDP/
 PhoPq7hrxWtGh9WtAGrRnGGmhe8rbkBajjYDtki9WVJm5Y1Pr5OLPXYgFmm+/lDAsjVc
 3kRJhImXSJ7c7Nr0PISgfreTURW+fmXHQUzF1fmsVyP+8g56sunPsd/QXxY/WGNElbDv
 HcliWJwj21Gad6d3fJlFFwLTfxUa2wGtBkMLByUOM/tGWDu6JsLQ3c8wNoTpLSJEXzNB
 cH1Ed5MIVlyrkYUCBmVhr/jcV3KifeQqgGOWFSlGqEMWS6sKj6Y4N/INJAlUSOHO2sV2
 tOSw==
X-Gm-Message-State: AOAM532wIzpo2IN6QHjvGBB7X+lIHpthQzgC4W98nEDXWZWYQkvLx/op
 pEacMfJF3CIJBVSSneKa/Zo=
X-Google-Smtp-Source: ABdhPJwlvOvRv2wJs5gb4nk7XbX/MNXQuf3Ps9uRJ5YdGrj5SrKXcXdqV8qanXEDbiLy5h9bT+bpgA==
X-Received: by 2002:a65:4bc8:: with SMTP id p8mr16243150pgr.335.1604472490875; 
 Tue, 03 Nov 2020 22:48:10 -0800 (PST)
Received: from localhost.localdomain
 ([2402:3a80:16e6:8166:e462:9fba:da9c:beed])
 by smtp.gmail.com with ESMTPSA id s18sm1036873pgh.60.2020.11.03.22.48.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Nov 2020 22:48:10 -0800 (PST)
From: Himadri Pandya <himadrispandya@gmail.com>
To: johan@kernel.org, gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org
Date: Wed,  4 Nov 2020 12:16:59 +0530
Message-Id: <20201104064703.15123-12-himadrispandya@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201104064703.15123-1-himadrispandya@gmail.com>
References: <20201104064703.15123-1-himadrispandya@gmail.com>
Cc: linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [PATCH 11/15] usb: serial: ipaq: use
	usb_control_msg_send()
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

The new usb_control_msg_send() nicely wraps usb_control_msg() with proper
error check. Hence use the wrapper instead of calling usb_control_msg()
directly.

Signed-off-by: Himadri Pandya <himadrispandya@gmail.com>
---
 drivers/usb/serial/ipaq.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/usb/serial/ipaq.c b/drivers/usb/serial/ipaq.c
index f81746c3c26c..99505a76035d 100644
--- a/drivers/usb/serial/ipaq.c
+++ b/drivers/usb/serial/ipaq.c
@@ -530,15 +530,14 @@ static int ipaq_open(struct tty_struct *tty,
 	 */
 	while (retries) {
 		retries--;
-		result = usb_control_msg(serial->dev,
-				usb_sndctrlpipe(serial->dev, 0), 0x22, 0x21,
-				0x1, 0, NULL, 0, 100);
-		if (!result)
+		result = usb_control_msg_send(serial->dev, 0, 0x22, 0x21, 0x1,
+					      0, NULL, 0, 100, GFP_KERNEL);
+		if (result == 0)
 			break;
 
 		msleep(1000);
 	}
-	if (!retries && result) {
+	if (result) {
 		dev_err(&port->dev, "%s - failed doing control urb, error %d\n",
 							__func__, result);
 		return result;
-- 
2.17.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
