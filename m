Return-Path: <SRS0=uvNB=AZ=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04246C433E4
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 14 Jul 2020 00:43:14 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CC4A021835
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 14 Jul 2020 00:43:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kXA12gfh"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CC4A021835
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 963A528F30;
	Tue, 14 Jul 2020 00:42:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pD2coDHq2o+s; Tue, 14 Jul 2020 00:42:32 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id E564728F1D;
	Tue, 14 Jul 2020 00:42:31 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id D070FC088E;
	Tue, 14 Jul 2020 00:42:31 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 7C7C6C0733
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 14 Jul 2020 00:42:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 6BFF08899E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 14 Jul 2020 00:42:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7usDphRW0OXo
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 14 Jul 2020 00:42:29 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-qv1-f66.google.com (mail-qv1-f66.google.com
 [209.85.219.66])
 by hemlock.osuosl.org (Postfix) with ESMTPS id CB0368838C
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 14 Jul 2020 00:42:29 +0000 (UTC)
Received: by mail-qv1-f66.google.com with SMTP id h17so6745774qvr.0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 13 Jul 2020 17:42:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=KdIW5He8ZiiCiJCefvMCxWAQ162LKqrQoM487o/uJO8=;
 b=kXA12gfh+GeMEU0kaSoQ15nqyvzVsppDR7KTdVpxyShQ4ztvA5r9mmzlEhnBgw6JM0
 M00ZaD5scYu/PTcWMxJ3kv0hZ/2XO78OrGxpYpb3jhWXgfQbUTnqRwqFOIsDr+j2pAqZ
 VG8Q0fRmq8eJULv43+qfCdY9Ktf/a/hY4BI5P71MaaS572T0+rvdfB0qNBtmNLuYm/Ps
 fuCIymU+DnYkvMCpTVRVPkiC8b+NoUSPslqs22xgK65g6NPfK6UT4PlPNzCmCNNIhJnr
 Dsdm00orgJnSJy5lAamHKdi/YTHjKQI2HhK+As546ROmFhNnfbcMSCixrsSHP5yttjHH
 ibmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=KdIW5He8ZiiCiJCefvMCxWAQ162LKqrQoM487o/uJO8=;
 b=Orf53qjX7iNtuWbGZAi1cFr6NYu5Bg2FKyBE3QgU8MpO3ipeEwN4PXc+9VAeyFShgO
 V0HUhl2tP00Q+KNN6U9o9o7hLD+ucQyuYq/gVZw1oGG7MCecJp62628gJ0hQPCddhPfT
 1s5XRV4a+D2PBkVerBLHE6sGu+CxAyivQqUeVYoh8naIWAMI8uovhmHYx/M9dUhGzDuf
 tDWQ3HfZEgWyRQlJWKyX7Asez1Diw+cO+bI2pnqY/tqoMmGvyJKY5mjobk/WNAAqPgB6
 BR5PAIgR86/iUh7ZI0PnLhOIybKGHidATQ4ZWfTkHK2qiBwcEcpB4E3XUWJ5zYAqUIKT
 +dWg==
X-Gm-Message-State: AOAM531VvK0j0F2dcluJM26y1G6bDVX6M0zGOsMAiQCzK9C/Q4kvY3y0
 e2JUnKbN6rokRgPi72bR9A==
X-Google-Smtp-Source: ABdhPJwVjnzLFeP+i8s/I6t5APn4aBiJ18PZlMr//czA/GeBiS5dylC/raDPG+E1JxJrEBSrZxyUCw==
X-Received: by 2002:a0c:8583:: with SMTP id o3mr2124679qva.108.1594687348930; 
 Mon, 13 Jul 2020 17:42:28 -0700 (PDT)
Received: from localhost.localdomain ([209.94.141.207])
 by smtp.gmail.com with ESMTPSA id p36sm2849287qte.90.2020.07.13.17.42.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Jul 2020 17:42:28 -0700 (PDT)
From: Peilin Ye <yepeilin.cs@gmail.com>
To: Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>
Date: Mon, 13 Jul 2020 20:38:56 -0400
Message-Id: <20200714003856.194768-1-yepeilin.cs@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Cc: Song Liu <songliubraving@fb.com>, John Fastabend <john.fastabend@gmail.com>,
 linux-kernel@vger.kernel.org, Martin KaFai Lau <kafai@fb.com>,
 syzkaller-bugs@googlegroups.com, clang-built-linux@googlegroups.com,
 netdev@vger.kernel.org, KP Singh <kpsingh@chromium.org>,
 Yonghong Song <yhs@fb.com>, bpf@vger.kernel.org,
 Andrii Nakryiko <andriin@fb.com>, Peilin Ye <yepeilin.cs@gmail.com>,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [PATCH] bpf: Fix NULL pointer dereference in
	__btf_resolve_helper_id()
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

Prevent __btf_resolve_helper_id() from dereferencing `btf_vmlinux`
as NULL. This patch fixes the following syzbot bug:

    https://syzkaller.appspot.com/bug?id=5edd146856fd513747c1992442732e5a0e9ba355

Reported-by: syzbot+ee09bda7017345f1fbe6@syzkaller.appspotmail.com
Signed-off-by: Peilin Ye <yepeilin.cs@gmail.com>
---
 kernel/bpf/btf.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/kernel/bpf/btf.c b/kernel/bpf/btf.c
index 30721f2c2d10..3e981b183fa4 100644
--- a/kernel/bpf/btf.c
+++ b/kernel/bpf/btf.c
@@ -4088,7 +4088,7 @@ static int __btf_resolve_helper_id(struct bpf_verifier_log *log, void *fn,
 	const char *tname, *sym;
 	u32 btf_id, i;
 
-	if (IS_ERR(btf_vmlinux)) {
+	if (IS_ERR_OR_NULL(btf_vmlinux)) {
 		bpf_log(log, "btf_vmlinux is malformed\n");
 		return -EINVAL;
 	}
-- 
2.25.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
