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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19E81C433E4
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 14 Jul 2020 01:29:40 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D583821548
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 14 Jul 2020 01:29:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="py84OM+5"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D583821548
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id A43ED88D3E;
	Tue, 14 Jul 2020 01:29:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5nt9dWYiVLON; Tue, 14 Jul 2020 01:29:38 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 9AD8288D31;
	Tue, 14 Jul 2020 01:29:38 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 814EDC0888;
	Tue, 14 Jul 2020 01:29:38 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id EE3E1C0733
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 14 Jul 2020 01:29:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 63ED087DAE
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 14 Jul 2020 01:29:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cdLd2w0r7XbW
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 14 Jul 2020 01:29:30 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-qk1-f193.google.com (mail-qk1-f193.google.com
 [209.85.222.193])
 by whitealder.osuosl.org (Postfix) with ESMTPS id A6D7D87D57
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 14 Jul 2020 01:29:30 +0000 (UTC)
Received: by mail-qk1-f193.google.com with SMTP id j80so14241467qke.0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 13 Jul 2020 18:29:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=R5IIzVMOgCGftVB47FAaShDA0o6roHJ+qQ1SXjjeBPw=;
 b=py84OM+5bG/8beCPdSOmQckjN7FoZchWH/ZlMsgqV0kEXJzeMI3pkaCzwYjHe8FN7q
 7lkkAI/fQ4Bu8cS6E5f0PFiFL0D6+fhbm9SLHkASWNLELrUBTnIBwoEECSb+fHP52QMX
 svXQQgU+Sm9cq4s1ikEcdzccc5mS4h87wkIcsPIpApZRk5/yyyfSrZb67FBOxqWKVt95
 lsAMYIkTgw/TZ+Hd4srf3NaLYg0Wp3lo2J2vWXGeKmhvr72JlJCzW1U9xftaXYJ06UCX
 6e2yRiMobflrXWYyMLPittWrzTkFblzDCn/ay5piTeaLgkIxbVK3+xWqYGwammud6K4v
 D3Rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=R5IIzVMOgCGftVB47FAaShDA0o6roHJ+qQ1SXjjeBPw=;
 b=N8X6BRvd5QESCPTspgp9Y/eVz2RkzEDZTQJWa/9xr7yV3RW9y9X6g1Ix/V0U84VCKv
 9x5fDi3Rgsi9byslXyN2rDbvOpcf0wksYhbCmPMfoxJYWuXNgbo7IiDmcjeCW6aZgEwo
 1B5XPE3sgx9+Q+Va2tvKukx+K7PA748P1Z6iKgauZtkmYwNgVytjbeaU5OWh0ySVvpZ8
 DqQoYlYkAwNhkvSCJIkPyP7Xd9HMweGB0uuFIEXZsbqQgwcjVwpaqxHIEnaZMkE16Twn
 +nzJ4PIzdIqOyFazoOJYQAJceGxorAbdyQQdVOEafslKA9VH1SqtFR9J8SzxpLg3Us76
 VdLQ==
X-Gm-Message-State: AOAM530ZEJcmIdxsOM9qA0ELZrLBf6epdXbDCNCIe2WTUu3gzruFYozc
 jc3sS4rdvkfi4g2+fCNThw==
X-Google-Smtp-Source: ABdhPJwiHJEuFip+53k+1C0OC/E9TC3f8o1MxGFmfFAYhf0A8tB6Hb8t/KlSZbhCmgIH8HWpRiLTYw==
X-Received: by 2002:ae9:ea13:: with SMTP id f19mr2317534qkg.331.1594690169776; 
 Mon, 13 Jul 2020 18:29:29 -0700 (PDT)
Received: from localhost.localdomain ([209.94.141.207])
 by smtp.gmail.com with ESMTPSA id w28sm19125827qkw.92.2020.07.13.18.29.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Jul 2020 18:29:29 -0700 (PDT)
From: Peilin Ye <yepeilin.cs@gmail.com>
To: Andrii Nakryiko <andriin@fb.com>
Date: Mon, 13 Jul 2020 21:27:32 -0400
Message-Id: <20200714012732.195466-1-yepeilin.cs@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <CAEf4BzZRGOsTiW3uFWd1aY6K5Yi+QBrTeC5FNOo6uVXviXuX4g@mail.gmail.com>
References: <CAEf4BzZRGOsTiW3uFWd1aY6K5Yi+QBrTeC5FNOo6uVXviXuX4g@mail.gmail.com>
MIME-Version: 1.0
Cc: Song Liu <songliubraving@fb.com>, Daniel Borkmann <daniel@iogearbox.net>,
 John Fastabend <john.fastabend@gmail.com>, Alexei Starovoitov <ast@kernel.org>,
 Peilin Ye <yepeilin.cs@gmail.com>, syzkaller-bugs@googlegroups.com,
 clang-built-linux@googlegroups.com, netdev@vger.kernel.org,
 KP Singh <kpsingh@chromium.org>, Yonghong Song <yhs@fb.com>,
 bpf@vger.kernel.org, linux-kernel-mentees@lists.linuxfoundation.org,
 Martin KaFai Lau <kafai@fb.com>, linux-kernel@vger.kernel.org
Subject: [Linux-kernel-mentees] [PATCH v2] bpf: Fix NULL pointer dereference
	in __btf_resolve_helper_id()
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
Thank you for reviewing my patch! I am new to Linux kernel development; would
the log message and errno be appropriate for this case?

Change in v2:
    - Split NULL and IS_ERR cases.

 kernel/bpf/btf.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/kernel/bpf/btf.c b/kernel/bpf/btf.c
index 30721f2c2d10..092116a311f4 100644
--- a/kernel/bpf/btf.c
+++ b/kernel/bpf/btf.c
@@ -4088,6 +4088,11 @@ static int __btf_resolve_helper_id(struct bpf_verifier_log *log, void *fn,
 	const char *tname, *sym;
 	u32 btf_id, i;
 
+	if (!btf_vmlinux) {
+		bpf_log(log, "btf_vmlinux doesn't exist\n");
+		return -EINVAL;
+	}
+
 	if (IS_ERR(btf_vmlinux)) {
 		bpf_log(log, "btf_vmlinux is malformed\n");
 		return -EINVAL;
-- 
2.25.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
