Return-Path: <SRS0=Gcau=G2=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 288F8C433DB
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 23 Jan 2021 15:14:23 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8588C22AAD
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 23 Jan 2021 15:14:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8588C22AAD
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id D5E7020336;
	Sat, 23 Jan 2021 15:14:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id T4DYyJeUZeKo; Sat, 23 Jan 2021 15:14:18 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id CE7C620354;
	Sat, 23 Jan 2021 15:14:18 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id C3FF3C088B;
	Sat, 23 Jan 2021 15:14:18 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 112FDC013A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 23 Jan 2021 15:14:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 0D8DB87360
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 23 Jan 2021 15:14:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id q72BB+5BgNgf
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 23 Jan 2021 15:14:17 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com
 [209.85.214.178])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 078688735E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 23 Jan 2021 15:14:17 +0000 (UTC)
Received: by mail-pl1-f178.google.com with SMTP id h15so2471450pli.8
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 23 Jan 2021 07:14:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=KTy8n+bNEd4gKJ9+t7A4mZcH7giU4TFs0RUo2PYg5Ec=;
 b=UxxNr3YpD9YBVQbYAyjJjJWFfl+beyLmtL53wnThX2tbCnVaexxDvLKMv6nX97vmJL
 dPrh7fERj0dUfCbxnppUwbQfCO6Kdh9kDvwP+OXKmSuJ55WDFAylPN/SHjrDemghyf0P
 kLgnLv5MfpVi+Mi6wQPkEzB4qjcWl0gxTR1ogA3cty2EWv/AwrijGuKHwQLs5YlAkr2m
 hcmKF1PNzz416Ws9iouT9MsRuMHeHoe4PqeywmqbhTpfTuk7/ilJcRPl3j2XHxNMZAI3
 CT6RmsAKG1oZ6xmPlnhZGPCbRoAiS2gtP3c1hncP5z3bhJzq3vIpQN2/SJZNB5lcECvV
 04QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=KTy8n+bNEd4gKJ9+t7A4mZcH7giU4TFs0RUo2PYg5Ec=;
 b=PABMYq0NOd6LCsQNBFvijM/b4HZJ6ZKxeklz5hT4v1Lrx8wsMPwUDIaml/isDxRbJI
 SK6T3dSp/lwfzkqiGFNjr9nEeJT20IuYsdISAbnm/7p1tYjSLyFNZCBrAE8isfnYyojb
 zshzhiAnMHyx0GlbUMVZoZnnqyv58WogpFMgPE/9REWo9TiBkRXqWntF/6zpFaUFKpXu
 Tdy4oUm6dA44oMBVhikXXbvKEws/XHw5ifiL4cTbyuVwll37nBWq4fSOYegVRduqfj2H
 rLtDDTzgXH08YkOo9Krhmc0lfmiU582o1XdSzEcE2VjK+PJgavTpYSyxRe+aXiiJUEMR
 gBHQ==
X-Gm-Message-State: AOAM533tkLDGejz48vIEuxIft1ltpdR7ruNw9AP51copIcohxGWumftM
 EFtsQmZyKNxeFWOhoAjv/bw=
X-Google-Smtp-Source: ABdhPJyawreUvgM30jreQ3mbYFF9icNJijFyxamoBHb0+gQwNeZEpJp5E9zZHs0h9YmWiQeItodIrg==
X-Received: by 2002:a17:902:7043:b029:df:cabc:cc97 with SMTP id
 h3-20020a1709027043b02900dfcabccc97mr1429590plt.4.1611414856478; 
 Sat, 23 Jan 2021 07:14:16 -0800 (PST)
Received: from localhost.localdomain ([2405:201:600d:a089:8c2b:8940:3286:eb08])
 by smtp.googlemail.com with ESMTPSA id 3sm12107301pfw.204.2021.01.23.07.14.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 23 Jan 2021 07:14:15 -0800 (PST)
From: Aditya Srivastava <yashsri421@gmail.com>
To: linux-kernel@vger.kernel.org
Date: Sat, 23 Jan 2021 20:44:05 +0530
Message-Id: <20210123151405.26267-1-yashsri421@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <bd560a8e-7949-933a-e4a9-508cb42c2570@gmail.com>
References: <bd560a8e-7949-933a-e4a9-508cb42c2570@gmail.com>
Cc: yashsri421@gmail.com, dwaipayanray1@gmail.com, ndesaulniers@google.com,
 clang-built-linux@googlegroups.com, broonie@kernel.org, jpoimboe@redhat.com,
 joe@perches.com, linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [PATCH v2] checkpatch: add warning for
	avoiding .L prefix symbols in assembly files
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

objtool requires that all code must be contained in an ELF symbol.
Symbol names that have a '.L' prefix do not emit symbol table entries, as
they have special meaning for the assembler.

'.L' prefixed symbols can be used within a code region, but should be
avoided for denoting a range of code via 'SYM_*_START/END' annotations.

Add a new check to emit a warning on finding the usage of '.L' symbols
for '.S' files in arch/x86/entry/* and arch/x86/lib/*, if it denotes
range of code via SYM_*_START/END annotation pair.

Suggested-by: Mark Brown <broonie@kernel.org>
Link: https://groups.google.com/g/clang-built-linux/c/-drkmLgu-cU/m/4staOlf-CgAJ
Signed-off-by: Aditya Srivastava <yashsri421@gmail.com>
---
* Applies perfectly on next-20210122

Changes in v2:
- Reduce the check to only SYM_*_START/END lines
- Reduce the check for only .S files in arch/x86/entry/* and arch/x86/lib/* as suggested by Josh and Nick
- Modify commit message

 scripts/checkpatch.pl | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
index 7030c4d6d126..e36cdf96dfe3 100755
--- a/scripts/checkpatch.pl
+++ b/scripts/checkpatch.pl
@@ -3590,6 +3590,13 @@ sub process {
 			}
 		}
 
+# check for .L prefix local symbols in .S files
+		if ($realfile =~ m@^arch/x86/(?:entry|lib)/.*\.S$@ &&
+		    $line =~ /^\+\s*SYM_[A-Z]+_(?:START|END)(?:_[A-Z_]+)?\s*\(\s*\.L/) {
+			WARN("AVOID_L_PREFIX",
+			     "Avoid using '.L' prefixed local symbol names for denoting a range of code via 'SYM_*_START/END' annotations; see Documentation/asm-annotations.rst\n" . $herecurr);
+		}
+
 # check we are in a valid source file C or perl if not then ignore this hunk
 		next if ($realfile !~ /\.(h|c|pl|dtsi|dts)$/);
 
-- 
2.17.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
