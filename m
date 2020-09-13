Return-Path: <SRS0=DUpp=CW=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66361C43461
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 13 Sep 2020 11:03:42 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D975420829
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 13 Sep 2020 11:03:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WwzVDfwf"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D975420829
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 6733D2042C;
	Sun, 13 Sep 2020 11:03:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8JgPxQdouo7f; Sun, 13 Sep 2020 11:03:40 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id AD58F20434;
	Sun, 13 Sep 2020 11:03:40 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 987B0C0864;
	Sun, 13 Sep 2020 11:03:40 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id ECA2FC0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 13 Sep 2020 11:03:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id B9B312043B
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 13 Sep 2020 11:03:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id TopVVvkwGFUF
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 13 Sep 2020 11:03:38 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pg1-f194.google.com (mail-pg1-f194.google.com
 [209.85.215.194])
 by silver.osuosl.org (Postfix) with ESMTPS id 37A5720426
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 13 Sep 2020 11:03:38 +0000 (UTC)
Received: by mail-pg1-f194.google.com with SMTP id y1so3010389pgk.8
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 13 Sep 2020 04:03:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=D5zxQJ9/bBNYxcKz8x5u3JOFZbRfXW/8iPbkH3tADRk=;
 b=WwzVDfwfq5k/cz21r4yOwQr0MPeyuymAI3rmT9bpZzWw94dlc5EpMg0KXVqTyTxVLS
 Zp1gNxVXWyE3tddvm1ErkTdno02A0+1vvoCCLt7y6bgd0sxJXXTp+WINElVkf2YdtRBM
 CMqJC/EeXszT7ySApINm94SZlyTTM0hFM9EIkJpQnUEPDxWzIuZhoxT/PRtqTOTRZdGu
 2NkWKAe1HGg/oSFOuA3MvUyrJGZEIu4hKWgs4NrJ5VbLxy0m6in5iVF5tQnT1wKL+mwR
 41/2M5a7llz7NvvEjXswhWW6nEDsUeRNnoekqukdL1jmI8KClj3jGvvclOHaz6n/0XSX
 DyAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=D5zxQJ9/bBNYxcKz8x5u3JOFZbRfXW/8iPbkH3tADRk=;
 b=INWPKtONTvZarUigiO40R3cl37FwyOJl+hITlZLAsfLPB8APrxkaEF4ECsdnk2d//G
 dGYzJ/cYSeyz6H8qIpA9JDRqhMfcxut0irYXnmXN/mSUykRENnXs3fmlUMvj0C5V/5Bp
 2dj9/F1hm8n06R6BgZOzkb2Bkbbfj2F1KtKk3Z4ZCa/HxRBaQMSlxMzaLpv0KTJwzrWs
 ilzcRtl4bu6XuTGX0wFJEkeGbhBJBoAwjSVET6/4TdasDKdfrPQYJ/kqSg/Xj9G5IemK
 Yi6vivgWpmfa0QR1XdNLuvO7bRJMD1at4i7tXAbHK+js4pTF8xc5oGNh0QhG5QpWXZJg
 ar8g==
X-Gm-Message-State: AOAM5311S6rtgc49OXAJfwQrCWP1Kd9uh9q9al6ECYAQoERoTPpjX9V1
 n9BTiEBLlH5wJ87ewS3+FDHrLKELAk9712PiJIU=
X-Google-Smtp-Source: ABdhPJzgyMnyi1zmfqskqELOP69Zjnz6hMotwDpxSOh/rRa4Mw/GuOyrcKpz38L52Hfnhptq4wvIfg==
X-Received: by 2002:a63:2063:: with SMTP id r35mr7627594pgm.320.1599995017178; 
 Sun, 13 Sep 2020 04:03:37 -0700 (PDT)
Received: from localhost.localdomain ([49.207.209.61])
 by smtp.gmail.com with ESMTPSA id i17sm7319199pfa.29.2020.09.13.04.03.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 13 Sep 2020 04:03:36 -0700 (PDT)
From: Anant Thazhemadam <anant.thazhemadam@gmail.com>
To: 
Date: Sun, 13 Sep 2020 16:33:13 +0530
Message-Id: <20200913110313.4239-1-anant.thazhemadam@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Cc: Anant Thazhemadam <anant.thazhemadam@gmail.com>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, Jakub Kicinski <kuba@kernel.org>,
 syzbot+09a5d591c1f98cf5efcb@syzkaller.appspotmail.com,
 "David S. Miller" <davem@davemloft.net>,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [PATCH v2] net: fix uninit value error in
	__sys_sendmmsg
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

The crash report indicated that there was a local variable;
----iovstack.i@__sys_sendmmsg created at:
 ___sys_sendmsg net/socket.c:2388 [inline]
 __sys_sendmmsg+0x6db/0xc90 net/socket.c:2480

 that was left uninitialized.

Initializing this stack to 0s prevents this bug from happening.
Since the memory pointed to by *iov is freed at the end of the function
call, memory leaks are not likely to be an issue.

syzbot seems to have triggered this error by passing an array of 0's as
a parameter while making the system call.

Reported-by: syzbot+09a5d591c1f98cf5efcb@syzkaller.appspotmail.com
Tested-by: syzbot+09a5d591c1f98cf5efcb@syzkaller.appspotmail.com
Signed-off-by: Anant Thazhemadam <anant.thazhemadam@gmail.com>
---
Changes from v1:
	* Fixed the build warning that v1 had introduced
 net/socket.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/net/socket.c b/net/socket.c
index 0c0144604f81..1e6f9b54982c 100644
--- a/net/socket.c
+++ b/net/socket.c
@@ -2398,6 +2398,7 @@ static int ___sys_sendmsg(struct socket *sock, struct user_msghdr __user *msg,
 	struct iovec iovstack[UIO_FASTIOV], *iov = iovstack;
 	ssize_t err;
 
+	memset(iov, 0, UIO_FASTIOV);
 	msg_sys->msg_name = &address;
 
 	err = sendmsg_copy_msghdr(msg_sys, msg, flags, &iov);
-- 
2.25.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
