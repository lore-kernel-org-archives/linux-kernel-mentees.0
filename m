Return-Path: <SRS0=R4Bt=FA=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 668AEC56202
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 26 Nov 2020 07:29:13 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A7AC12173E
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 26 Nov 2020 07:29:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DzLNjMcJ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A7AC12173E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 35B7686A3D;
	Thu, 26 Nov 2020 07:29:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id s-KRfxh_c5l7; Thu, 26 Nov 2020 07:29:11 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 82773869EB;
	Thu, 26 Nov 2020 07:29:11 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 6AE0DC0891;
	Thu, 26 Nov 2020 07:29:11 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 50103C0052
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 26 Nov 2020 07:29:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 3BF2B86061
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 26 Nov 2020 07:29:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pH3Qk7XfytvN
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 26 Nov 2020 07:29:09 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pf1-f193.google.com (mail-pf1-f193.google.com
 [209.85.210.193])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 6B63D875A0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 26 Nov 2020 07:29:09 +0000 (UTC)
Received: by mail-pf1-f193.google.com with SMTP id s21so835659pfu.13
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 25 Nov 2020 23:29:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=1pi9O3cyuNu1mNgsP919qLPV/NgB9Q3iHB4i+uum6yk=;
 b=DzLNjMcJmlfr82HmrsJXykti2GEhPMrG0SEg7zKdoGbGUVRum4GMN5MIJsTypxi/ao
 YNlUaUkr+ygnUlpsmUAxWN8I0yhtJb0msg7nVNQUaRz1XSSwrCIzhcRibOSkk08BFuZ3
 IThSmYUZSNx3Lgg43FTfYi4zx4mHQp7W4dvgOlWE5oqjSMLE05uiXU88mcVBOig2/0Fd
 FFuZkDjSIiwHVtRA3J4tusKHawtaDG4D1tdvrQMKJayh6FZAYMeLbMKld6QqPPnAkFbY
 +ASb8Fd6Fp3HE1+NZX9/uJLUsQAGfpZW0k+PzjBtQpUadh624p48I1b58uv3PbGDexuC
 Ylpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=1pi9O3cyuNu1mNgsP919qLPV/NgB9Q3iHB4i+uum6yk=;
 b=gHbj+wMuD0Fu/LeBRVhRMpoLPbDaN11oWnbd/mY4t+toJ9PrMNXmZaIwd7+qkHQXCX
 66Zzzta6hlqqtllH0ZGBNhrxS8AA7WAzPngj/4vRCQtJJaaveljKOGRdLiCHFclJI7Rr
 KI4jLDG9ATZWAajl1TxPV1A/5OkqwI8Q74Bub1MfhykbLiJQzpXN8gpyzHEODEj1o1MD
 7L89ARqTaMILe6eU6gzlzJoJymwKOFjJkPpGsY7aJrNl7I+9zzrLWgLzg3P2HiUg01S3
 qdSTJJ5GxMmq30U8CZSRHEwcYTswR/4yCVeribqvWIr/5s15CYiHhIIm5Qw9kuzihqZp
 AMzw==
X-Gm-Message-State: AOAM532cbB18R3klbStdNsfHV9U2fMx9ejXvjSchLLzIJMrfS4mrPxKg
 7fQx8tNWqVdMsFGvnUjUuPI=
X-Google-Smtp-Source: ABdhPJz4KICB0kuuy0BPKk/Hr7oanZ67ULP4kWWRn8saCecz2h3+3CZOjPt7Dh/PgMFCOokoAWNJOQ==
X-Received: by 2002:a05:6a00:228a:b029:18b:212a:1af7 with SMTP id
 f10-20020a056a00228ab029018b212a1af7mr1697062pfe.55.1606375748924; 
 Wed, 25 Nov 2020 23:29:08 -0800 (PST)
Received: from localhost.localdomain ([2405:201:9004:6052:6026:75db:5ad2:e7b3])
 by smtp.gmail.com with ESMTPSA id j74sm3805528pfd.43.2020.11.25.23.29.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Nov 2020 23:29:07 -0800 (PST)
From: Dwaipayan Ray <dwaipayanray1@gmail.com>
To: joe@perches.com
Date: Thu, 26 Nov 2020 12:58:40 +0530
Message-Id: <20201126072840.32681-1-dwaipayanray1@gmail.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Cc: dwaipayanray1@gmail.com, linux-kernel-mentees@lists.linuxfoundation.org,
 linux-kernel@vger.kernel.org
Subject: [Linux-kernel-mentees] [PATCH RFC] checkpatch: add warning for
	unnecessary use of %h[xudi] and %hh[xudi]
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

Modifiers %h and %hh should never be used.

Commit cbacb5ab0aa0 ("docs: printk-formats: Stop encouraging use
of unnecessary %h[xudi] and %hh[xudi]") specifies that:

"Standard integer promotion is already done and %hx and %hhx is useless
so do not encourage the use of %hh[xudi] or %h[xudi]."

"The "h" and "hh" things should never be used. The only reason for them
being used if you have an "int", but you want to print it out as a
"char" (and honestly, that is a really bad reason, you'd be better off
just using a proper cast to make the code more obvious)."

Add a new check to emit a warning on finding an unneeded use of %h or
%hh modifier.

Link: https://lore.kernel.org/lkml/4910042649a4f3ab22fac93191b8c1fa0a2e17c3.camel@perches.com/

Suggested-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Signed-off-by: Dwaipayan Ray <dwaipayanray1@gmail.com>
---
 scripts/checkpatch.pl | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
index 7dc094445d83..47c1017a9973 100755
--- a/scripts/checkpatch.pl
+++ b/scripts/checkpatch.pl
@@ -6570,6 +6570,19 @@ sub process {
 			}
 		}
 
+# check for unnecessary use of %h[xudi] and %hh[xudi]
+		if ($perl_version_ok &&
+		    defined $stat &&
+		    $line =~ /(?:[sd]?print[kfd]|(?:pr_|drm_)(?:info|debug|warn|error))/i) {
+			my $lc = $stat =~ tr@\n@@;
+			$lc = $lc + $linenr;
+			my $stat_real = get_stat_real($linenr, $lc);
+			if ($stat_real =~ /\"[^\"]*%[\d\.\*\-]*h+[idux].*\"/i) {
+				WARN("UNNECESSARY_MODIFIER",
+				     "Unnecessary use of length modifiers %h[xudi] or %hh[xudi]\n" . "$here\n$stat_real\n");
+			}
+		}
+
 # check for naked sscanf
 		if ($perl_version_ok &&
 		    defined $stat &&
-- 
2.27.0

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
