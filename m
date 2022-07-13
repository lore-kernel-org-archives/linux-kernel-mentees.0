Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A159BC43334
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 13 Jul 2022 18:15:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 286B7613C7;
	Wed, 13 Jul 2022 18:15:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 286B7613C7
Authentication-Results: smtp3.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=ntCKgZRA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9vJJlGoDOyLU; Wed, 13 Jul 2022 18:15:51 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp3.osuosl.org (Postfix) with ESMTPS id E0FB6613A7;
	Wed, 13 Jul 2022 18:15:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E0FB6613A7
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id BB732C0071;
	Wed, 13 Jul 2022 18:15:50 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 24983C002D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 13 Jul 2022 18:15:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C7A1B84639
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 13 Jul 2022 18:14:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C7A1B84639
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=ntCKgZRA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DL1fCJO5RV2B
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 13 Jul 2022 18:14:56 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E51218467B
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com
 [IPv6:2607:f8b0:4864:20::1036])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E51218467B
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 13 Jul 2022 18:14:55 +0000 (UTC)
Received: by mail-pj1-x1036.google.com with SMTP id s21so13197279pjq.4
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 13 Jul 2022 11:14:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=UtHJ3Qg/19HcUm4MJm1fPiRsTok3DEs2h2LHQfacgzU=;
 b=ntCKgZRAm+eSzp/faQAyDd8Dl+7yFpy6fF8pMd3h08/YpaXT5B0B1GyX7a1R0CPpgO
 +Cs0OwzUQ4iMwGx6nyDPFcBD+VIIcDJoFSbur2vZ0B2PH5oGRcu+6fx7WqOSQviHItiW
 XDrXGD36GpCamSxqDgNeNZGnhsOvoSJBgFo6EHv+hA7MWNZBeOSur9eAKtE6uY9G/prW
 Y/01c9cURM256XlV93x10AFeriiURULVgfMTG6k9aT2NU9vy2/5tM21yuUvKB8SJA05S
 n6L8UE8mO/0namLte4roiMqoClJG6mJ0hR/8aDh+GZsUFZAb3kP8YdW4qC9y6pvciFFg
 h0cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=UtHJ3Qg/19HcUm4MJm1fPiRsTok3DEs2h2LHQfacgzU=;
 b=JFVFMBm5xyz9EpW6Mi2MwN+GoTy3tkiuvmL7WvJxX5d5dQdWxHPj2kyrebHDw66Fzn
 rllvndfITn3uD+C1fLHAZkV61PTblFpIrBDWY7gFsNIaQ98VkHr7EcVQlJwzvYZueaya
 1U5fruUQ1sTeyfE3sliFdWsOsU+sXBhHXnxG5v4xugzETh+3H9qyJnZ1KI75BAyeYI7F
 p3C6trmPKU8sSMVAmC8ZqXOdIGxV4eMbnG6r09vNlp974FNlWZrHluje1OTulVuAHJ1q
 iyhmwxbGwORMUmO+I4Xr/LCrWd1OPmPXpw8dqIta5mb1qvSPRt6c1fTFBiN6rFbrB2qe
 x9XA==
X-Gm-Message-State: AJIora/3Kz/g/+AvPupEvXOCdvlBoH84ZzAk0lp2InNLNFwtX070R9mY
 pObnPl7Jgzk0OnU6b3hBoRd1lelKY2vgp22i
X-Google-Smtp-Source: AGRyM1vU7NzF7lHvZ02XnNN53qGMTI64cfjlKr5EM3jBfvohilp/9pIBrt5KJamOYL5JmmeDP1Bg8Q==
X-Received: by 2002:a17:90b:3e89:b0:1f0:4233:b20e with SMTP id
 rj9-20020a17090b3e8900b001f04233b20emr5191803pjb.0.1657736095153; 
 Wed, 13 Jul 2022 11:14:55 -0700 (PDT)
Received: from fedora.. ([103.159.189.141]) by smtp.gmail.com with ESMTPSA id
 p6-20020a625b06000000b0052abc2438f1sm8874960pfb.55.2022.07.13.11.14.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Jul 2022 11:14:54 -0700 (PDT)
From: Khalid Masum <khalid.masum.92@gmail.com>
To: linux-kernel-mentees@lists.linuxfoundation.org,
 linux-kernel@vger.kernel.org, "David S . Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, netdev@vger.kernel.org
Subject: [RFC PATCH 1/1] net: kcm: Use sk_psock size for kcm_psock_cache
Date: Thu, 14 Jul 2022 00:13:24 +0600
Message-Id: <20220713181324.14228-2-khalid.masum.92@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220713181324.14228-1-khalid.masum.92@gmail.com>
References: <20220713181324.14228-1-khalid.masum.92@gmail.com>
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
Link: https://syzkaller.appspot.com/bug?extid=1fa91bcd05206ff8cbb5
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
