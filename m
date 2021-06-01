Return-Path: <SRS0=N8k6=K3=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNWANTED_LANGUAGE_BODY
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EEA9BC4708F
	for <linux-kernel-mentees@archiver.kernel.org>; Tue,  1 Jun 2021 14:33:57 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8BBCB6136E
	for <linux-kernel-mentees@archiver.kernel.org>; Tue,  1 Jun 2021 14:33:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8BBCB6136E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 471E683CB7;
	Tue,  1 Jun 2021 14:33:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GgylU4rkuJcg; Tue,  1 Jun 2021 14:33:56 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5517783CAF;
	Tue,  1 Jun 2021 14:33:56 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 30E1EC000D;
	Tue,  1 Jun 2021 14:33:56 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 03C89C0001
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  1 Jun 2021 14:33:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id CF19F40249
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  1 Jun 2021 14:33:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Kr4bESQG5DCG
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  1 Jun 2021 14:33:53 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 8D2904023D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  1 Jun 2021 14:33:53 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id
 l18-20020a1ced120000b029014c1adff1edso1732373wmh.4
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 01 Jun 2021 07:33:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=cc:to:from:message-id:in-reply-to:references:date:subject;
 bh=fVa4/HKqixlEvwC+3q8izPizn386ZWs0EmkzmxyxlBc=;
 b=FhF68xPj8wNHo3djuXMmzPp+QMxdBem6YRaf99xXN+G+nYwc22v95QJMI5A+WuvQlg
 xa4S1hggJVsjEyVqnLuDtgdBkwGVzUJG0pzJIkmB/9rKCXK06A2QsH9GshNlBRq9NJeE
 96lJ1HMFPjY2Zw2pN6f0VQGtA5VzNn3cMlv7GpkSInZGqQx9slTRUTY7cj4WZvlqy8yT
 gk4wTv0MXhms8toGAWJ5RnRoFoca4DjgV89OU204l5wXCrDLpx0g7ODo8Al7KKPkUIp7
 pxyr1QY/0M2mSW2A14cuBPIfvolhBBdR1PNEhbgRDUjHn6rPiR9RQLH/q+DsQswX8aJf
 jRjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:cc:to:from:message-id:in-reply-to:references
 :date:subject;
 bh=fVa4/HKqixlEvwC+3q8izPizn386ZWs0EmkzmxyxlBc=;
 b=Zbs1gj0VHGVo54Zq8jVtVNcjDmI8OT2j2b/9wlyaq8pm7o/2k3EGG+GuV92KQMEg8h
 A+AW0TAirLbdttNvxZQrZgM7dYFq2U3c0/xBvilLEUDXFFjAwLaace1Il7uUxxvKrHfm
 22XqSo8ja33ucOh5CyUXRRXv5BqxKC0DoSBobHv7pdtj0roysPta3qbYyBOhaDwx3+B0
 gwsDKrLhu6sWcY9WV+83GglB+iHOH3n5G7Z0us8FwDTR1qGBhlbnLgVvAqh2yxGMf2q7
 FNnkJV0AEF4t9qg9AX/QYHSuvuwN31FuhR+PiDbrEwLAehSrdVUkS+C3qzpbr/8tCJ/f
 sNeA==
X-Gm-Message-State: AOAM533J1+e20ZgToSnv8Tf2ebNca3C3TCkd2tRdXFwJ8lQwLf7+fuDd
 X517OJ6ONukiCGNEoFA0xRqqiH9+BZQ=
X-Google-Smtp-Source: ABdhPJyNFkpaHbGYX7q2/YCkvy+0PcgUntIrteFTSKE8xOFHzJ8+ut4Ep2cX+BmAfc+pjc9PkmjbBQ==
X-Received: by 2002:a05:600c:358f:: with SMTP id
 p15mr259524wmq.14.1622558031882; 
 Tue, 01 Jun 2021 07:33:51 -0700 (PDT)
Received: from localhost ([185.199.80.151])
 by smtp.gmail.com with ESMTPSA id f7sm18086259wmq.30.2021.06.01.07.33.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Jun 2021 07:33:51 -0700 (PDT)
To: gregkh@linuxfoundation.org
From: "Kurt Manucredo" <fuzzybritches0@gmail.com>
Message-ID: <12537-32529-curtm@phaethon>
In-Reply-To: <YK8gM6LoV8q8AkhE@kroah.com>
References: <60aec085.1c69fb81.972cc.0bfb@mx.google.com>
 <YK8gM6LoV8q8AkhE@kroah.com>
Date: Tue, 1 Jun 2021 16:33:09 +0200
Subject: [PATCH v2] bpf: core: fix shift-out-of-bounds in ___bpf_prog_run
Cc: linux-kernel-mentees@lists.linuxfoundation.org
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

Fix shift-out-of-bounds in ___bpf_prog_run().

UBSAN: shift-out-of-bounds in kernel/bpf/core.c:1414:2
shift exponent 248 is too large for 32-bit type 'unsigned int'

Reported-by: syzbot+bed360704c521841c85d@syzkaller.appspotmail.com
Signed-off-by: Kurt Manucredo <fuzzybritches0@gmail.com>
---

Changes since last version:
 - fix shift-out-of-bounds in verifier.c check_alu_op()

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
