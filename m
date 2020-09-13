Return-Path: <SRS0=DUpp=CW=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 65AE3C433E2
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 13 Sep 2020 05:57:08 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A1D4F2098B
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 13 Sep 2020 05:57:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FyayF2U2"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A1D4F2098B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 466CD20411;
	Sun, 13 Sep 2020 05:57:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jZ-yy58ydpMV; Sun, 13 Sep 2020 05:57:06 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 48FE0203E2;
	Sun, 13 Sep 2020 05:57:06 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 2824CC0052;
	Sun, 13 Sep 2020 05:57:06 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id AEEFEC0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 13 Sep 2020 05:57:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 580E320411
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 13 Sep 2020 05:57:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XJ1buiSGH1CU
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 13 Sep 2020 05:57:04 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pg1-f193.google.com (mail-pg1-f193.google.com
 [209.85.215.193])
 by silver.osuosl.org (Postfix) with ESMTPS id 36544203E2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 13 Sep 2020 05:57:04 +0000 (UTC)
Received: by mail-pg1-f193.google.com with SMTP id 67so9072047pgd.12
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 12 Sep 2020 22:57:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=L2601ptSXb6354ZGKXlq6HrTN3axEbz58J2HKuGGYWU=;
 b=FyayF2U2stxus5nipHGS9LqyIsgvxkZaCmO1YlyP+DMbSM9PkigzoMoAlBfUDlmEVe
 tWv0Bp8ZUA/KbaOMqZ0AeJY+VU9+iSmKbSd5WRrXXVIldnvYE8B4efGwdzV+ONlYTjj0
 kaGiQuey9eFdf/YxL47QFJpHwdfAEfGUfXn3VAfihSGiq+QQ+D4PHBb9l445MlnN48hQ
 zG9GxaL4wcQ97i8PnmU7HD5hU6uVFalP41lQ+I5mQIjjk9sZLROUBlu1rQMkDNnw6GYP
 FRbgOk7oO19H8Xbc1juAf1yKbcQyeZ1CYf8lG5+zULK5idwK12X/5PSQOlXpZKSIgofg
 /16g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=L2601ptSXb6354ZGKXlq6HrTN3axEbz58J2HKuGGYWU=;
 b=AV2ARe9ir9nluvwdu7GfY8aiHUgZwB2uz4vNQ8ukYC4SM+zrRL0BQ+slghsA0oRiTI
 XBuxbxgLV1CQWwEt1llCsaYnC+MHnbP9c2YEHBh09zz3dNC+EJk0JxXGayUesoDNs9/r
 BHrLyRlLDlTE5ruBvsOEqk4wOIGKShvWNItw+6S+m1NUCTqWDp7OfYS0snUrmvMB4BSZ
 XhcBzchT6/Zh/SOF2CAf5bkI3bFt7KnXAHSe69kxDR7YYFk0uDY+aMjh4cDZo1HIJuyI
 6z0H3Bk3S3zZauU2YH04ZRgpLANkz28ug4BRgc8LsAMBDIo4YqzlR5sm7sf9uzvHMD7K
 uPmA==
X-Gm-Message-State: AOAM532xDY+ImuuVMpX+ZREMlN2clVCQ105ySzwz+ObJU9sa/3ZIUGKg
 ce4hBKZ+HcB/lL/TmtVfDQLMsbYrJIXBmzh+FEg=
X-Google-Smtp-Source: ABdhPJyQXnmDPXtE8b2CDhsuc1byOo1IygDKy+BpsxbAFNqfRqABlMjslC5YR8F85j/csblMLJzAsA==
X-Received: by 2002:a63:2209:: with SMTP id i9mr2077924pgi.130.1599976623233; 
 Sat, 12 Sep 2020 22:57:03 -0700 (PDT)
Received: from localhost.localdomain ([49.207.209.61])
 by smtp.gmail.com with ESMTPSA id o20sm5722171pgh.63.2020.09.12.22.56.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 12 Sep 2020 22:57:02 -0700 (PDT)
From: Anant Thazhemadam <anant.thazhemadam@gmail.com>
To: 
Date: Sun, 13 Sep 2020 11:26:39 +0530
Message-Id: <20200913055639.15639-1-anant.thazhemadam@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Cc: Anant Thazhemadam <anant.thazhemadam@gmail.com>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, Jakub Kicinski <kuba@kernel.org>,
 syzbot+09a5d591c1f98cf5efcb@syzkaller.appspotmail.com,
 "David S. Miller" <davem@davemloft.net>,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [PATCH] net: fix uninit value error in
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

The crash report showed that there was a local variable;

----iovstack.i@__sys_sendmmsg created at:
 ___sys_sendmsg net/socket.c:2388 [inline]
 __sys_sendmmsg+0x6db/0xc90 net/socket.c:2480
 
 that was left uninitialized.

The contents of iovstack are of interest, since the respective pointer
is passed down as an argument to sendmsg_copy_msghdr as well.
Initializing this contents of this stack prevents this bug from happening.

Since the memory that was initialized is freed at the end of the function
call, memory leaks are not likely to be an issue.

syzbot seems to have triggered this error by passing an array of 0's as
a parameter while making the initial system call.

Reported-by: syzbot+09a5d591c1f98cf5efcb@syzkaller.appspotmail.com
Tested-by: syzbot+09a5d591c1f98cf5efcb@syzkaller.appspotmail.com
Signed-off-by: Anant Thazhemadam <anant.thazhemadam@gmail.com>
---
 net/socket.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/net/socket.c b/net/socket.c
index 0c0144604f81..d74443dfd73b 100644
--- a/net/socket.c
+++ b/net/socket.c
@@ -2396,6 +2396,7 @@ static int ___sys_sendmsg(struct socket *sock, struct user_msghdr __user *msg,
 {
 	struct sockaddr_storage address;
 	struct iovec iovstack[UIO_FASTIOV], *iov = iovstack;
+	memset(iov, 0, UIO_FASTIOV);
 	ssize_t err;
 
 	msg_sys->msg_name = &address;
-- 
2.25.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
