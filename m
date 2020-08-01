Return-Path: <SRS0=CeKo=BL=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 488E9C433E0
	for <linux-kernel-mentees@archiver.kernel.org>; Sat,  1 Aug 2020 02:11:15 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 11EB620838
	for <linux-kernel-mentees@archiver.kernel.org>; Sat,  1 Aug 2020 02:11:14 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mXMcgP3D"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 11EB620838
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id CBE178886A;
	Sat,  1 Aug 2020 02:11:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DsIK8P4DQF05; Sat,  1 Aug 2020 02:11:14 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 3B05088869;
	Sat,  1 Aug 2020 02:11:14 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 328ABC004F;
	Sat,  1 Aug 2020 02:11:14 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 84286C004D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat,  1 Aug 2020 02:11:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 6A66486E28
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat,  1 Aug 2020 02:11:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id UtZJQ7V5s4OQ
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat,  1 Aug 2020 02:11:11 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-qt1-f196.google.com (mail-qt1-f196.google.com
 [209.85.160.196])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 90F448502B
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat,  1 Aug 2020 02:11:11 +0000 (UTC)
Received: by mail-qt1-f196.google.com with SMTP id v22so18580194qtq.8
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 31 Jul 2020 19:11:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=IIe2V6KflGKZOn7QS908wW8BYLPFtbcpWHZAEz1hDgk=;
 b=mXMcgP3DvievUcucf9BrqQ22yf8OdRUoL1AQd4ThWeT+18r9T0fzV+eqSJtsgLgCBB
 Ni77ATuwQ2LnJZSdptYkPj79QukVZzQZn3+B6xuWUj8ko/cBtJMkKYV/FDf0EZ0qrpBf
 wiajaeLLGDf9egGDsjA+qx1bd+Gl/D3w78ylBNma2xH+XRarnNCdezW/VqNJhWJhyksx
 E83K84l4gyWp5ps0Lgmkjz6hSVxDeDHpK06O00ZYwcep4zgeKCrOwaZMdr65l4RKxfqc
 gC/ADU4V0/2ZQQGNk+0VD1VoQ2NsMeTP+voulYaYnZZHTjUIUzU8AWF9OEE46KFHowHu
 LHeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=IIe2V6KflGKZOn7QS908wW8BYLPFtbcpWHZAEz1hDgk=;
 b=LsJGIGSz2MsbSm4mbZ24KdUIMoB0pBAEEFaNdfhoh23YK4Rv6D7pNP42AOUOqhiH2Q
 ZA1MGs5hMDkQUMOOW1gHbQwS1LHriYdj4xyasifZ5XDjVtMa9FY9pZ7XEbycJlImNm4t
 58BvH3apoX5GDS35uSYC9fnZuf50J8Yq/lKZY5pM0R6B+2ffXwKCPevvtOxknAAY9e6a
 uvqh6eVPsujDUZekI2Bn4ay7WAbEfu/8Q8gUu7t/Km4BeSiBJy8NKWsFyjy2Zy+RF+Bv
 v/zL+wnK5e0kXHceGkejDbmyYtTGdW2ljQp+WKagkluols2TV3BKWFi7yKu5eBMWrtqq
 wn1w==
X-Gm-Message-State: AOAM531QcP2jeCH+EBo8NDDLyk0SkR4GnruohTQthkx2S6YnmixhLJKP
 oEuxwIKvo9MrVpD65r49GA==
X-Google-Smtp-Source: ABdhPJydwIv8QJlCp4ZKsqgnbMvVuKUYEfD9Rdd//kTJdWgOkb13Fj6frDPsYMF7imm96R5yvQFUKg==
X-Received: by 2002:ac8:4652:: with SMTP id f18mr6468424qto.142.1596247870562; 
 Fri, 31 Jul 2020 19:11:10 -0700 (PDT)
Received: from localhost.localdomain
 (146-115-88-66.s3894.c3-0.sbo-ubr1.sbo.ma.cable.rcncustomer.com.
 [146.115.88.66])
 by smtp.gmail.com with ESMTPSA id u37sm12278160qtj.47.2020.07.31.19.11.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 31 Jul 2020 19:11:10 -0700 (PDT)
From: Peilin Ye <yepeilin.cs@gmail.com>
To: Oleg Nesterov <oleg@redhat.com>
Date: Fri, 31 Jul 2020 22:08:41 -0400
Message-Id: <20200801020841.227522-1-yepeilin.cs@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200727213644.328662-1-yepeilin.cs@gmail.com>
References: <20200727213644.328662-1-yepeilin.cs@gmail.com>
MIME-Version: 1.0
Cc: Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org,
 "Dmitry V. Levin" <ldv@altlinux.org>,
 Elvira Khabirova <lineprinter@altlinux.org>,
 linux-kernel-mentees@lists.linuxfoundation.org,
 Peilin Ye <yepeilin.cs@gmail.com>, Dan Carpenter <dan.carpenter@oracle.com>
Subject: [Linux-kernel-mentees] [PATCH v2] ptrace: Prevent kernel-infoleak
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

	/* size: 88, cachelines: 2, members: 6 */
	/* forced alignments: 1 */
	/* last cacheline: 24 bytes */
} __attribute__((__aligned__(8)));
$ _

 include/uapi/linux/ptrace.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/uapi/linux/ptrace.h b/include/uapi/linux/ptrace.h
index a71b6e3b03eb..a518ba514bac 100644
--- a/include/uapi/linux/ptrace.h
+++ b/include/uapi/linux/ptrace.h
@@ -81,6 +81,7 @@ struct seccomp_metadata {
 
 struct ptrace_syscall_info {
 	__u8 op;	/* PTRACE_SYSCALL_INFO_* */
+	__u8 pad[3];
 	__u32 arch __attribute__((__aligned__(sizeof(__u32))));
 	__u64 instruction_pointer;
 	__u64 stack_pointer;
-- 
2.25.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
