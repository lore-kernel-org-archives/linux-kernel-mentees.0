Return-Path: <SRS0=4M9n=K4=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	UNWANTED_LANGUAGE_BODY,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 44A74C4708F
	for <linux-kernel-mentees@archiver.kernel.org>; Wed,  2 Jun 2021 21:29:34 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CD7C2613D2
	for <linux-kernel-mentees@archiver.kernel.org>; Wed,  2 Jun 2021 21:29:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CD7C2613D2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9A53D606DB;
	Wed,  2 Jun 2021 21:29:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ilQmPw5C_O2G; Wed,  2 Jun 2021 21:29:32 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp3.osuosl.org (Postfix) with ESMTP id C3042606C4;
	Wed,  2 Jun 2021 21:29:32 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 9FCCBC000D;
	Wed,  2 Jun 2021 21:29:32 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id B2C6DC0001
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  2 Jun 2021 21:29:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 944DA606C7
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  2 Jun 2021 21:29:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Xvcybp2OujDw
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  2 Jun 2021 21:29:29 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 83954606C4
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  2 Jun 2021 21:29:29 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id n4so3696101wrw.3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 02 Jun 2021 14:29:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=4s+WtVD0z1zrvcjIi7mvIhu9JKhygKLIdbwXXCCDpJ8=;
 b=UOENaWmX3PzGWYoKPFhCQXlJ9/5W38ns2q5K3buxLEbFhE0ynImXXyXe0xjWaUw+2k
 3+HrtTIKZNHqHbPiOVtemxOy27y0wGopobb4amoi+NnmxXjOhatFWAoBLD/1dwECQvrb
 76+T7NF9tD5xlnQ7EFqs6SrBVxRihaibGjEqi2PuMRhbTmheHCdCIdRW3Qcfc8HBhss1
 0hugAJNGNvrWgLacfV+jzs0ATYO7VeUNzAMvq19O9/7PAU7y0ydzdJWkrAxXmbcUi4hO
 C+r0lGgqUNzttSv8I7Rj38rxxUZjbg9ss5eXjhx8UilqupeVKU1cm8j0SQ48/seiaoyL
 BepQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=4s+WtVD0z1zrvcjIi7mvIhu9JKhygKLIdbwXXCCDpJ8=;
 b=fCe7W29JN+LUa6Bk2frlIOv86CUoA3GS/q+zRKp5GrXwGAnPDv3jJjnxsmKffnULuL
 9+oNWt3gBxvTEqnEok+As6xJs+V0+o/wuMYsSxV81iPgH5jL/NAEFGrx+T+9q8P3+DdG
 T53PCWeSoAcaB3iQRoJIl057WpmP7JOvjaf9SK/yi9bDzsjn5Xog3Dw8NSgd7hNTyYg/
 97zZqH20d/KwMs6v2AM3YQHLaKKM8RE6SMOW78RhVEErQp4R1QZi8jDWpjhjp4JBQhcO
 Dg93MUkzw3hDzauOPy1T4byKeKPxBRYSYih8LKVg55P1xNtuRryk5S+4Fi2+B7T6oKNa
 aA9w==
X-Gm-Message-State: AOAM532gtugsT0tRDGzMOr916lPTzz2LYmc3Ws8F7RK+1Nq131rLykOb
 f7cqZQ9eXKqBzVniNz8Z6vc=
X-Google-Smtp-Source: ABdhPJzjiDdoclNUldyrUeLFcTnrcPHIcR9mw6VbQ4HURvNHqRXQdc6ch3lj36KtL5Jsp1ptwwIdxg==
X-Received: by 2002:adf:ef06:: with SMTP id e6mr24281131wro.393.1622669367880; 
 Wed, 02 Jun 2021 14:29:27 -0700 (PDT)
Received: from localhost.localdomain ([185.199.80.151])
 by smtp.gmail.com with ESMTPSA id 62sm1272616wrm.1.2021.06.02.14.29.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Jun 2021 14:29:27 -0700 (PDT)
From: Kurt Manucredo <fuzzybritches0@gmail.com>
To: syzbot+bed360704c521841c85d@syzkaller.appspotmail.com
Subject: [PATCH v3] bpf: core: fix shift-out-of-bounds in ___bpf_prog_run
Date: Wed,  2 Jun 2021 21:27:26 +0000
Message-Id: <20210602212726.7-1-fuzzybritches0@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <000000000000c2987605be907e41@google.com>
References: 
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

UBSAN: shift-out-of-bounds in kernel/bpf/core.c:1414:2
shift exponent 248 is too large for 32-bit type 'unsigned int'

Reported-and-tested-by: syzbot+bed360704c521841c85d@syzkaller.appspotmail.com
Signed-off-by: Kurt Manucredo <fuzzybritches0@gmail.com>
---

https://syzkaller.appspot.com/bug?id=edb51be4c9a320186328893287bb30d5eed09231

Changelog:
----------
v3 - Make it clearer what the fix is for.
v2 - Fix shift-out-of-bounds in ___bpf_prog_run() by adding boundary
check in check_alu_op() in verifier.c.
v1 - Fix shift-out-of-bounds in ___bpf_prog_run() by adding boundary
check in ___bpf_prog_run().

Hi everyone,

I hope this fixes it!

kind regards

 kernel/bpf/verifier.c | 22 +++++++++++++++++-----
 1 file changed, 17 insertions(+), 5 deletions(-)

diff --git a/kernel/bpf/verifier.c b/kernel/bpf/verifier.c
index 94ba5163d4c5..04e3bf344ecd 100644
--- a/kernel/bpf/verifier.c
+++ b/kernel/bpf/verifier.c
@@ -7880,13 +7880,25 @@ static int check_alu_op(struct bpf_verifier_env *env, struct bpf_insn *insn)
 			return -EINVAL;
 		}
 
-		if ((opcode == BPF_LSH || opcode == BPF_RSH ||
-		     opcode == BPF_ARSH) && BPF_SRC(insn->code) == BPF_K) {
+		if (opcode == BPF_LSH || opcode == BPF_RSH ||
+		     opcode == BPF_ARSH) {
 			int size = BPF_CLASS(insn->code) == BPF_ALU64 ? 64 : 32;
 
-			if (insn->imm < 0 || insn->imm >= size) {
-				verbose(env, "invalid shift %d\n", insn->imm);
-				return -EINVAL;
+			if (BPF_SRC(insn->code) == BPF_K) {
+				if (insn->imm < 0 || insn->imm >= size) {
+					verbose(env, "invalid shift %d\n", insn->imm);
+					return -EINVAL;
+				}
+			}
+			if (BPF_SRC(insn->code) == BPF_X) {
+				struct bpf_reg_state *src_reg;
+
+				src_reg = &regs[insn->src_reg];
+				if (src_reg->umax_value >= size) {
+					verbose(env, "invalid shift %lld\n",
+							src_reg->umax_value);
+					return -EINVAL;
+				}
 			}
 		}
 
-- 
2.30.2

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
