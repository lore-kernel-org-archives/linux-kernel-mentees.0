Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B55E1C433EF
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 13 Jul 2022 06:32:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 47A148176E;
	Wed, 13 Jul 2022 06:32:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 47A148176E
Authentication-Results: smtp1.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=UKC+J8G8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1HyCy6wDtqut; Wed, 13 Jul 2022 06:32:36 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 3F587817A5;
	Wed, 13 Jul 2022 06:32:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3F587817A5
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 1A5F3C0035;
	Wed, 13 Jul 2022 06:32:36 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 9FD38C002D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 13 Jul 2022 06:32:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 68549416FD
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 13 Jul 2022 06:32:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 68549416FD
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=UKC+J8G8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7j51sWJKOUc2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 13 Jul 2022 06:32:33 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 97BCB408D5
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com
 [IPv6:2607:f8b0:4864:20::102e])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 97BCB408D5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 13 Jul 2022 06:32:33 +0000 (UTC)
Received: by mail-pj1-x102e.google.com with SMTP id
 i8-20020a17090a4b8800b001ef8a65bfbdso2010834pjh.1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 12 Jul 2022 23:32:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=+zkUBfNycAFx70zEJPDO/9NKNPncrE72YacmrSo4Jgw=;
 b=UKC+J8G8yu9r8W+qpsU7hNAjsxUbVX8NxJSSzgMt4U8KgEqizdczylZQxv/kaGZV2p
 /yreHf1a9sZ/UrlCQc/7X+l6Td8w3NqJDVajiSw17Tg30PQ/c4WxTXIe2kVBILRW4YQ8
 MBKD5N9hBqLzwzqPnhywx/u5qAQWxYU9ZT1k1RaGrj6f1EC6JxeMQr7+GU/hrhkNg89T
 vvZxlBXoWREW/deZzKSYeOd7vxc26tEVv1LhNLZehT1LigKK8ui10FuPFyexl9r68Ngr
 ZS2vyS1sLIT+GXcbXITn9ZNYrd0J2kQW04RAum/S0wXLYARElTu7eLmYL49B75mO6Dag
 XEGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=+zkUBfNycAFx70zEJPDO/9NKNPncrE72YacmrSo4Jgw=;
 b=Foq4IdSjh9PMwuN7fQ3fG0dYokzR6dE77SDB8mCLYJl2s9bSJQp0xzaUl08N0gRGHx
 zf8rxiDI+nNoj0rQg5DYi4mFxRVmFtxWDJUx7XSYUU2qiopbsvyLcw7qL2IvdmYcVAv+
 ZVboSctkKyMrOyE80ya/vlNzedwZLSqhDmjZoN0rR/9RMKfc3kCO3QYY9cpeyVvCeqHh
 VF45nk9HAjNufokfnTtVzBkHz7EIlPkgSp5O/xg0vO61XAVgprIvFL8clUCNjiBPHP+e
 aGO28mtn0Nt9HRVB0PGTR63QLs+BXTGAQNpUq1anSk9df3CSzIhNbA8dTzVySACfDz6L
 fBfg==
X-Gm-Message-State: AJIora+JalvPykG9z2xsxldEoay64Sv/LU5/k0ZlLugSX/yfebx1zZ2k
 5Pmo6XduNFUlUSRo9BNsHK9PGqmtDVFJFQjl
X-Google-Smtp-Source: AGRyM1v4G+Y7besLuV09AjVRXjFIYJB36foqvmWuinIu+oCK/z5yvqSmN38tj8e75Sq7n7e3cHgMDg==
X-Received: by 2002:a17:90b:3502:b0:1f0:986:e36b with SMTP id
 ls2-20020a17090b350200b001f00986e36bmr8693841pjb.154.1657693952861; 
 Tue, 12 Jul 2022 23:32:32 -0700 (PDT)
Received: from fedora.. ([103.159.189.141]) by smtp.gmail.com with ESMTPSA id
 z16-20020aa79590000000b005289cade5b0sm7901023pfj.124.2022.07.12.23.32.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Jul 2022 23:32:32 -0700 (PDT)
From: Khalid Masum <khalid.masum.92@gmail.com>
To: linux-kernel-mentees@lists.linuxfoundation.org, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, "David S . Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>
Subject: [RFC PATCH 1/1] net: kcm: Use sk_psock size for kcm_psock_cache
Date: Wed, 13 Jul 2022 12:32:04 +0600
Message-Id: <20220713063204.6294-2-khalid.masum.92@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220713063204.6294-1-khalid.masum.92@gmail.com>
References: <20220713063204.6294-1-khalid.masum.92@gmail.com>
MIME-Version: 1.0
Cc: Florian Fainelli <f.fainelli@gmail.com>,
 Pavel Skripkin <paskripkin@gmail.com>, Alexei Starovoitov <ast@kernel.org>,
 syzbot+1fa91bcd05206ff8cbb5@syzkaller.appspotmail.com,
 Marc Kleine-Budde <mkl@pengutronix.de>,
 Nikolay Aleksandrov <nikolay@nvidia.com>,
 Stefano Garzarella <sgarzare@redhat.com>
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

`struct sock` has a member `sk_user_data`, which got its memory allocated
in `kcm_attach` by `kcm_psock_cache` with the size of `kcm_psock`. Which
is not enough when the member is used as `sk_psock` causing out of bound
read.

Use `sk_psock` size to allocate memory instead for `sk_user_data`.

Reported-by: syzbot+1fa91bcd05206ff8cbb5@syzkaller.appspotmail.com
Signed-off-by: Khalid Masum <khalid.masum.92@gmail.com>
---
 net/kcm/kcmsock.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/net/kcm/kcmsock.c b/net/kcm/kcmsock.c
index 71899e5a5a11..688bee56f90c 100644
--- a/net/kcm/kcmsock.c
+++ b/net/kcm/kcmsock.c
@@ -23,6 +23,7 @@
 #include <linux/workqueue.h>
 #include <linux/syscalls.h>
 #include <linux/sched/signal.h>
+#include <linux/skmsg.h>
 
 #include <net/kcm.h>
 #include <net/netns/generic.h>
@@ -2041,7 +2042,7 @@ static int __init kcm_init(void)
 		goto fail;
 
 	kcm_psockp = kmem_cache_create("kcm_psock_cache",
-				       sizeof(struct kcm_psock), 0,
+				       sizeof(struct sk_psock), 0,
 					SLAB_HWCACHE_ALIGN, NULL);
 	if (!kcm_psockp)
 		goto fail;
-- 
2.36.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
