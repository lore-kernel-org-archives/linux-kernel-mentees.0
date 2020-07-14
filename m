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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92A69C433E1
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 14 Jul 2020 18:10:30 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 59C49224D1
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 14 Jul 2020 18:10:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WsiJGXVq"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 59C49224D1
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 368F9878EF;
	Tue, 14 Jul 2020 18:10:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mcphP1weFql8; Tue, 14 Jul 2020 18:10:29 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id CE3698789F;
	Tue, 14 Jul 2020 18:10:29 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id B4F20C0888;
	Tue, 14 Jul 2020 18:10:29 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id AF51DC0733
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 14 Jul 2020 18:10:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 9DDFF878D2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 14 Jul 2020 18:10:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qPb_OZ0f7Emy
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 14 Jul 2020 18:10:28 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-qt1-f195.google.com (mail-qt1-f195.google.com
 [209.85.160.195])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id F36528789F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 14 Jul 2020 18:10:27 +0000 (UTC)
Received: by mail-qt1-f195.google.com with SMTP id j10so13522079qtq.11
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 14 Jul 2020 11:10:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ZX4l9y/mb02MIUOaKSz1lj12ECx0wlEAm51QAfF6o/8=;
 b=WsiJGXVqDNs9WargJT52mvIz/gaCVCuxb52bFJeFukAYzSUEIh2fdlkQeVqeuWbB0D
 Bzbqn0r0doaRe/L6ZZIb3zStjHYGZ8RF2beyf9yjYgP8agdHAl0PAiSbAO4euheDv12l
 8btObml9Y9hX6nYx8w01Xl2cH7DSo25hPOO4FJFsbXHDRP0OEfMtN0dqr2T/CmkEn3QC
 pOonLTv9BirBHzAunpzAGUXm4OHH4ctLfxxq13swaSMV/LTuMoEKHkYbwWJA0nb4jEM7
 7Ke2VPeIG86ZGrJ4GX1h39LqB8Ud3pcWPrGhbq8RY+MWZ+rPqXoJNibnsLvzBSqf90bk
 QeSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ZX4l9y/mb02MIUOaKSz1lj12ECx0wlEAm51QAfF6o/8=;
 b=MkfogPnDLkFPmRs5y/RkCtM2L3k5jQScVMBTI+J+CZ6igdfuZIuLkMcrx+O6DRHvEe
 69Jx3nDHW+6g0J4ZmmrtsJIKjPhsxwNQP4uJKYjYlFymCMmeN+QPKNmCEvZiPzzfaLPW
 Gim8nHTpniFFUppdBjmwMqHVQA2cIWy+ca/KCE4W50FC5r6RUl0fw89LvZf8gLM6iZpW
 gk/0i1Gtq1w7Bwxo7MsryIo3NjssmBT4Vr2sc52EBwcu9ViUr7Fz2vwCljixvSc/2W2+
 gdwZYaXklAso7+uXusOXOKIcqoVusWfo+jcyIqO9H6rVvOxJc7MWhIt7aF3A3djZ2r16
 FP9w==
X-Gm-Message-State: AOAM5304kS/d7cNRgLuYVBmBIhFUslXrPDJ8KzSaGJO9xJsH/MvoSCUv
 HjREnOgxUdTct3/3808AnQ==
X-Google-Smtp-Source: ABdhPJzIfX8uNaGelEtus3hlnEHUAzJCj9p6MTHvuiHUjgC4AFO0/AIzEJVEUS+Rr3I8EFtZYkxMRQ==
X-Received: by 2002:ac8:3028:: with SMTP id f37mr5775930qte.351.1594750226967; 
 Tue, 14 Jul 2020 11:10:26 -0700 (PDT)
Received: from localhost.localdomain ([209.94.141.207])
 by smtp.gmail.com with ESMTPSA id n64sm22663726qke.77.2020.07.14.11.10.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Jul 2020 11:10:26 -0700 (PDT)
From: Peilin Ye <yepeilin.cs@gmail.com>
To: Andrii Nakryiko <andriin@fb.com>,
	Alexei Starovoitov <ast@kernel.org>
Date: Tue, 14 Jul 2020 14:09:04 -0400
Message-Id: <20200714180904.277512-1-yepeilin.cs@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <CAADnVQ+jUPGJapkvKW=AfXESD6Vz2iuONvJm8eJm5Yd+u9mJ+w@mail.gmail.com>
References: <CAADnVQ+jUPGJapkvKW=AfXESD6Vz2iuONvJm8eJm5Yd+u9mJ+w@mail.gmail.com>
MIME-Version: 1.0
Cc: Song Liu <songliubraving@fb.com>, Daniel Borkmann <daniel@iogearbox.net>,
 John Fastabend <john.fastabend@gmail.com>, linux-kernel@vger.kernel.org,
 Martin KaFai Lau <kafai@fb.com>, syzkaller-bugs@googlegroups.com,
 clang-built-linux@googlegroups.com, netdev@vger.kernel.org,
 KP Singh <kpsingh@chromium.org>, Yonghong Song <yhs@fb.com>,
 bpf@vger.kernel.org, linux-kernel-mentees@lists.linuxfoundation.org,
 Peilin Ye <yepeilin.cs@gmail.com>
Subject: [Linux-kernel-mentees] [PATCH v3] bpf: Fix NULL pointer dereference
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

    https://syzkaller.appspot.com/bug?id=f823224ada908fa5c207902a5a62065e53ca0fcc

Reported-by: syzbot+ee09bda7017345f1fbe6@syzkaller.appspotmail.com
Signed-off-by: Peilin Ye <yepeilin.cs@gmail.com>
---
Sorry, I got the link wrong. Thank you for pointing that out.

Change in v3:
    - Fix incorrect syzbot dashboard link.

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
