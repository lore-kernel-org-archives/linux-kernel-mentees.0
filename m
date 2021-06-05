Return-Path: <SRS0=ph3B=K7=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 370ABC47082
	for <linux-kernel-mentees@archiver.kernel.org>; Sat,  5 Jun 2021 15:02:16 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C0AA861287
	for <linux-kernel-mentees@archiver.kernel.org>; Sat,  5 Jun 2021 15:02:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C0AA861287
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8013383AFF;
	Sat,  5 Jun 2021 15:02:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id N0tuSb7AiSqp; Sat,  5 Jun 2021 15:02:11 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3FDFE83A96;
	Sat,  5 Jun 2021 15:02:11 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 13665C000D;
	Sat,  5 Jun 2021 15:02:11 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id D1C57C0001
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat,  5 Jun 2021 15:02:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B196940551
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat,  5 Jun 2021 15:02:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Vo6Gy2Tcr_qp
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat,  5 Jun 2021 15:02:05 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 1F5B040553
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat,  5 Jun 2021 15:02:04 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id
 u5-20020a7bc0450000b02901480e40338bso5412872wmc.1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 05 Jun 2021 08:02:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=kfu2ptD2ITo1yADGY8rjCJADPHQPd4t7J8UfxydCp7M=;
 b=ry54s2oAYBkXBGGXQ70Mn4BmDExiJmHZ35MkCXDypFXAPrTs/9WZYvg+W/RCPz7ufz
 Zqkhl79sGc13ylXy7fUD9ZX4cU3dMunz3sUvTU8tA+2Uqy+2DwUvuJwJBZ+A46fzVXYm
 MNxgwYSa90MuGM5TN/838Z5CpYKvDdb1G/oIX/wqtfKFSyAluLMj6IGUx2njS1GHyEeu
 7Kmh8O+3tsq766GvnKh+SHgjzqs7gmBBnIDmByYrDkwzNh59XwBmtml74QGe8r6KOQs6
 z8MSCgQ8AEb6UEjXM+OnSkadhBrLazZ2+ffK6HMAGyQIqi4M7QVI1eO6tEEZoYd/7Fa6
 3AUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=kfu2ptD2ITo1yADGY8rjCJADPHQPd4t7J8UfxydCp7M=;
 b=UH06rEkc5fQql7Nj0GzD0csxc6KggF0hfGgR4YUscpPoG6MyXp8f6dF1w/RewTiifd
 q/9JUVxszg9dzqDvzC5AUQSPQGK6wPTnWlqBo5RYljItH1UG6MkXd8zSZdPBeAPAoNfg
 acA1W5Pb9MRJpTnMudllXW5ew5Cih9PRyD74RrZTWZAunr6tm15bYh+yxU/0nuS0N2yL
 8JTgPSqqwNOWKtvwKrZWkYlytZQcFSy1jJfZFuoeP0HSU9IWaBYNeLiketYEdxbpJ16U
 jTwT6dNpjTf6081/bi+/37AC8dzLAt1svchkkSpbPXgYr/OA0qRRzbqN1xqAEp3ioXSc
 iYmw==
X-Gm-Message-State: AOAM530F6L5iFDVn+24x63hXBLOMW2TfTr9113qbMVFYKrpQy0j3lUGO
 bEsnv4ZcddUC9JWyDGMLrgY=
X-Google-Smtp-Source: ABdhPJwAAAyC+wSe2y/n4iQCBYMSmsvtjkPPMvSlSCLxfHAg3UHa1eZY2av8EQlMhd/N99YUdarnHg==
X-Received: by 2002:a7b:c417:: with SMTP id k23mr8301705wmi.71.1622905323250; 
 Sat, 05 Jun 2021 08:02:03 -0700 (PDT)
Received: from localhost.localdomain ([185.199.80.151])
 by smtp.gmail.com with ESMTPSA id n13sm11202523wrg.75.2021.06.05.08.02.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 05 Jun 2021 08:02:02 -0700 (PDT)
From: Kurt Manucredo <fuzzybritches0@gmail.com>
To: syzbot+bed360704c521841c85d@syzkaller.appspotmail.com
Subject: [PATCH v4] bpf: core: fix shift-out-of-bounds in ___bpf_prog_run
Date: Sat,  5 Jun 2021 15:01:57 +0000
Message-Id: <87609-531187-curtm@phaethon>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <YLhd8BL3HGItbXmx@kroah.com>
References: <000000000000c2987605be907e41@google.com>
 <20210602212726.7-1-fuzzybritches0@gmail.com> <YLhd8BL3HGItbXmx@kroah.com>
MIME-Version: 1.0
Cc: songliubraving@fb.com, ast@kernel.org, daniel@iogearbox.net,
 john.fastabend@gmail.com, andrii@kernel.org,
 clang-built-linux@googlegroups.com, yhs@fb.com,
 linux-kernel-mentees@lists.linuxfoundation.org, hawk@kernel.org,
 syzkaller-bugs@googlegroups.com, kpsingh@kernel.org, nathan@kernel.org,
 kuba@kernel.org, ndesaulniers@google.com, linux-kernel@vger.kernel.org,
 davem@davemloft.net, netdev@vger.kernel.org, bpf@vger.kernel.org, kafai@fb.com
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

Syzbot detects a shift-out-of-bounds in ___bpf_prog_run()
kernel/bpf/core.c:1414:2.

I propose: In adjust_scalar_min_max_vals() move boundary check up to avoid
missing them and return with error when detected.

Reported-and-tested-by: syzbot+bed360704c521841c85d@syzkaller.appspotmail.com
Signed-off-by: Kurt Manucredo <fuzzybritches0@gmail.com>
---

https://syzkaller.appspot.com/bug?id=edb51be4c9a320186328893287bb30d5eed09231

Changelog:
----------
v4 - Fix shift-out-of-bounds in adjust_scalar_min_max_vals.
     Fix commit message.
v3 - Make it clearer what the fix is for.
v2 - Fix shift-out-of-bounds in ___bpf_prog_run() by adding boundary
     check in check_alu_op() in verifier.c.
v1 - Fix shift-out-of-bounds in ___bpf_prog_run() by adding boundary
     check in ___bpf_prog_run().

thanks

kind regards

Kurt

 kernel/bpf/verifier.c | 30 +++++++++---------------------
 1 file changed, 9 insertions(+), 21 deletions(-)

diff --git a/kernel/bpf/verifier.c b/kernel/bpf/verifier.c
index 94ba5163d4c5..ed0eecf20de5 100644
--- a/kernel/bpf/verifier.c
+++ b/kernel/bpf/verifier.c
@@ -7510,6 +7510,15 @@ static int adjust_scalar_min_max_vals(struct bpf_verifier_env *env,
 	u32_min_val = src_reg.u32_min_value;
 	u32_max_val = src_reg.u32_max_value;
 
+	if ((opcode == BPF_LSH || opcode == BPF_RSH || opcode == BPF_ARSH) &&
+			umax_val >= insn_bitness) {
+		/* Shifts greater than 31 or 63 are undefined.
+		 * This includes shifts by a negative number.
+		 */
+		verbose(env, "invalid shift %lld\n", umax_val);
+		return -EINVAL;
+	}
+
 	if (alu32) {
 		src_known = tnum_subreg_is_const(src_reg.var_off);
 		if ((src_known &&
@@ -7592,39 +7601,18 @@ static int adjust_scalar_min_max_vals(struct bpf_verifier_env *env,
 		scalar_min_max_xor(dst_reg, &src_reg);
 		break;
 	case BPF_LSH:
-		if (umax_val >= insn_bitness) {
-			/* Shifts greater than 31 or 63 are undefined.
-			 * This includes shifts by a negative number.
-			 */
-			mark_reg_unknown(env, regs, insn->dst_reg);
-			break;
-		}
 		if (alu32)
 			scalar32_min_max_lsh(dst_reg, &src_reg);
 		else
 			scalar_min_max_lsh(dst_reg, &src_reg);
 		break;
 	case BPF_RSH:
-		if (umax_val >= insn_bitness) {
-			/* Shifts greater than 31 or 63 are undefined.
-			 * This includes shifts by a negative number.
-			 */
-			mark_reg_unknown(env, regs, insn->dst_reg);
-			break;
-		}
 		if (alu32)
 			scalar32_min_max_rsh(dst_reg, &src_reg);
 		else
 			scalar_min_max_rsh(dst_reg, &src_reg);
 		break;
 	case BPF_ARSH:
-		if (umax_val >= insn_bitness) {
-			/* Shifts greater than 31 or 63 are undefined.
-			 * This includes shifts by a negative number.
-			 */
-			mark_reg_unknown(env, regs, insn->dst_reg);
-			break;
-		}
 		if (alu32)
 			scalar32_min_max_arsh(dst_reg, &src_reg);
 		else
-- 
2.30.2

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
