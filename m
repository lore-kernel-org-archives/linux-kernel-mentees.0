Return-Path: <SRS0=CeKo=BL=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3CDCDC433E0
	for <linux-kernel-mentees@archiver.kernel.org>; Sat,  1 Aug 2020 15:23:00 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 061932076B
	for <linux-kernel-mentees@archiver.kernel.org>; Sat,  1 Aug 2020 15:22:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="a+CQ6tFX"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 061932076B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id C8D6F86B98;
	Sat,  1 Aug 2020 15:22:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id EwnGy7cdX2RD; Sat,  1 Aug 2020 15:22:58 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id A61E086B1D;
	Sat,  1 Aug 2020 15:22:58 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 828DAC004F;
	Sat,  1 Aug 2020 15:22:58 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 99B48C004D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat,  1 Aug 2020 15:22:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 86C7186B46
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat,  1 Aug 2020 15:22:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lyj9KG5AoCLn
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat,  1 Aug 2020 15:22:55 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-qk1-f196.google.com (mail-qk1-f196.google.com
 [209.85.222.196])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 50E9986B1D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat,  1 Aug 2020 15:22:55 +0000 (UTC)
Received: by mail-qk1-f196.google.com with SMTP id d14so31566717qke.13
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 01 Aug 2020 08:22:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=i9HjdunNdeDb6el2KFiKvzDJLets7DjcfYSJtReQ90A=;
 b=a+CQ6tFXEKoQnwBiEU7118Tp/SPyORFALhwIwQIB+HWrVUhhYoozvHpKP1TKZu5Sly
 GPgx/3KNprl7UzHNQGLceoVwFuTlAh5xcG/RhRunG5U15hStEkZaXnCjkdUlgeBLb3Go
 eUT6RnSA1UH9JvpHt5UXTFGHj8c3adU/YsRih//N8DIeUGJR+VN34Sayvu/rsHw/JL69
 MlMTaMsynn9HBHKDZgasVkzIKkRAe4HOAusD7hzeaWJIO9ewRNH8bp+YKGlgHhF3lLh8
 gateEnSLgsZM5K3Vrl6Volcs++mwpA2v8tIjMzN0aG2ZlhQRLBk3iiM2UE/Spizb8EHs
 Uf0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=i9HjdunNdeDb6el2KFiKvzDJLets7DjcfYSJtReQ90A=;
 b=S39mUUs1O0DnT6Ry6QW7we4GEqaSknexJCBJop6YC9aXOGEqtVIc3LF36IT2H0mARf
 uX4fnpL1kfE1DoqHAE5r3g1hV+av3PjrTrEvGl5f3z2oGthOOjFtYEH1lgIUSNpD80oe
 1QVvtoiKXwjZ1k9NSqf9CohappJYiZawZaF1DpMzdz8pYrTjDOQp6Mb0YYRcW9Q81iu2
 9ArHOKVbr4c7+LE/tbaAVtxutZ5FF8KeQI00ugyJus6M4TtqfOdqF8gSpm2GL7RddIBI
 vz6Y7rDtgFyxveHSoYwc4rmmgGaI9Z2D/9azZ11JgI8Ux0hq4upTY5ghUuSpUbhI24CS
 C/9w==
X-Gm-Message-State: AOAM530WdW8/cN+zqJxss79h9CAZqMHPlLsWpykao1hCu8bJzhk/6vKL
 65UDoEIJpWHJ0J6Unm0n6g==
X-Google-Smtp-Source: ABdhPJy0C9eilLWU1/8pYjkI3JKMpRagOOguZHCnkboWiW5HffgJkT/y75nzcg8XScViImkt3uhx0Q==
X-Received: by 2002:a05:620a:13c9:: with SMTP id
 g9mr1484449qkl.436.1596295374348; 
 Sat, 01 Aug 2020 08:22:54 -0700 (PDT)
Received: from localhost.localdomain
 (146-115-88-66.s3894.c3-0.sbo-ubr1.sbo.ma.cable.rcncustomer.com.
 [146.115.88.66])
 by smtp.gmail.com with ESMTPSA id n184sm12951144qkn.49.2020.08.01.08.22.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 01 Aug 2020 08:22:53 -0700 (PDT)
From: Peilin Ye <yepeilin.cs@gmail.com>
To: Oleg Nesterov <oleg@redhat.com>
Date: Sat,  1 Aug 2020 11:20:44 -0400
Message-Id: <20200801152044.230416-1-yepeilin.cs@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200801020841.227522-1-yepeilin.cs@gmail.com>
References: <20200801020841.227522-1-yepeilin.cs@gmail.com>
MIME-Version: 1.0
Cc: Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org,
 "Dmitry V. Levin" <ldv@altlinux.org>,
 Elvira Khabirova <lineprinter@altlinux.org>,
 linux-kernel-mentees@lists.linuxfoundation.org,
 Peilin Ye <yepeilin.cs@gmail.com>, Dan Carpenter <dan.carpenter@oracle.com>
Subject: [Linux-kernel-mentees] [PATCH v3] ptrace: Prevent kernel-infoleak
	in ptrace_get_syscall_info()
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

ptrace_get_syscall_info() is potentially copying uninitialized stack
memory to userspace, since the compiler may leave a 3-byte hole near the
beginning of `info`. Fix it by adding a padding field to `struct
ptrace_syscall_info`.

Cc: stable@vger.kernel.org
Fixes: 201766a20e30 ("ptrace: add PTRACE_GET_SYSCALL_INFO request")
Suggested-by: Dan Carpenter <dan.carpenter@oracle.com>
Signed-off-by: Peilin Ye <yepeilin.cs@gmail.com>
---
Change in v3:
    - Remove unnecessary `__aligned__` attribute. (Suggested by
      Dmitry V. Levin <ldv@altlinux.org>)

Change in v2:
    - Add a padding field to `struct ptrace_syscall_info`, instead of
      doing memset() on `info`. (Suggested by Dmitry V. Levin
      <ldv@altlinux.org>)

Reference: https://lwn.net/Articles/417989/

$ # before:
$ pahole -C "ptrace_syscall_info" kernel/ptrace.o
struct ptrace_syscall_info {
	__u8                       op;                   /*     0     1 */

	/* XXX 3 bytes hole, try to pack */

	__u32                      arch __attribute__((__aligned__(4))); /*     4     4 */
	__u64                      instruction_pointer;  /*     8     8 */
	__u64                      stack_pointer;        /*    16     8 */
	union {
		struct {
			__u64      nr;                   /*    24     8 */
			__u64      args[6];              /*    32    48 */
		} entry;                                 /*    24    56 */
		struct {
			__s64      rval;                 /*    24     8 */
			__u8       is_error;             /*    32     1 */
		} exit;                                  /*    24    16 */
		struct {
			__u64      nr;                   /*    24     8 */
			__u64      args[6];              /*    32    48 */
			/* --- cacheline 1 boundary (64 bytes) was 16 bytes ago --- */
			__u32      ret_data;             /*    80     4 */
		} seccomp;                               /*    24    64 */
	};                                               /*    24    64 */

	/* size: 88, cachelines: 2, members: 5 */
	/* sum members: 85, holes: 1, sum holes: 3 */
	/* forced alignments: 1, forced holes: 1, sum forced holes: 3 */
	/* last cacheline: 24 bytes */
} __attribute__((__aligned__(8)));
$
$ # after:
$ pahole -C "ptrace_syscall_info" kernel/ptrace.o
struct ptrace_syscall_info {
	__u8                       op;                   /*     0     1 */
	__u8                       pad[3];               /*     1     3 */
	__u32                      arch;                 /*     4     4 */
	__u64                      instruction_pointer;  /*     8     8 */
	__u64                      stack_pointer;        /*    16     8 */
	union {
		struct {
			__u64      nr;                   /*    24     8 */
			__u64      args[6];              /*    32    48 */
		} entry;                                 /*    24    56 */
		struct {
			__s64      rval;                 /*    24     8 */
			__u8       is_error;             /*    32     1 */
		} exit;                                  /*    24    16 */
		struct {
			__u64      nr;                   /*    24     8 */
			__u64      args[6];              /*    32    48 */
			/* --- cacheline 1 boundary (64 bytes) was 16 bytes ago --- */
			__u32      ret_data;             /*    80     4 */
		} seccomp;                               /*    24    64 */
	};                                               /*    24    64 */

	/* size: 88, cachelines: 2, members: 6 */
	/* last cacheline: 24 bytes */
};
$ _

 include/uapi/linux/ptrace.h | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/include/uapi/linux/ptrace.h b/include/uapi/linux/ptrace.h
index a71b6e3b03eb..83ee45fa634b 100644
--- a/include/uapi/linux/ptrace.h
+++ b/include/uapi/linux/ptrace.h
@@ -81,7 +81,8 @@ struct seccomp_metadata {
 
 struct ptrace_syscall_info {
 	__u8 op;	/* PTRACE_SYSCALL_INFO_* */
-	__u32 arch __attribute__((__aligned__(sizeof(__u32))));
+	__u8 pad[3];
+	__u32 arch;
 	__u64 instruction_pointer;
 	__u64 stack_pointer;
 	union {
-- 
2.25.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
