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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 802ABC56202
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 26 Nov 2020 08:46:59 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C4E72208CA
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 26 Nov 2020 08:46:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="X1DlBEaR"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C4E72208CA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 3AD98871EA;
	Thu, 26 Nov 2020 08:46:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id uJH_l5q_MzJ9; Thu, 26 Nov 2020 08:46:53 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id A0030871E5;
	Thu, 26 Nov 2020 08:46:53 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 72C8FC163C;
	Thu, 26 Nov 2020 08:46:53 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id CBDC9C0052
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 26 Nov 2020 08:46:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id C76208763B
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 26 Nov 2020 08:46:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Lt54TbVu5C2N
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 26 Nov 2020 08:46:52 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pg1-f193.google.com (mail-pg1-f193.google.com
 [209.85.215.193])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 22D7787633
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 26 Nov 2020 08:46:52 +0000 (UTC)
Received: by mail-pg1-f193.google.com with SMTP id w16so1133341pga.9
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 26 Nov 2020 00:46:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=PWzSXzURBrTCAuFi2ULAXjbNlztUk23uhmIQxLwstA8=;
 b=X1DlBEaRK/h8XSg3W7UR8Me+C5pJU6VMT1yItcdV/RIzDVANmSMyw/QEeuEJPoIF2l
 xY8b3ZHn0dzsVjXwayv5gZ0qgeYNZqiuEOq8IWX/+Flps83NuxjpIPzuIC8Y9meOmhJ8
 jUdS+lqKKntTxmKX1/nsKDTo67u9Mveu0FchtfLp4CtZx9aD/e8/RkjteFbUluVfNr1c
 UypJGEaFiP6gm+pfO8fQpYfWB2NdMFOaTGcWy8Pn/nJIU8Vl0As2UiJXgkpXJvRgXwFe
 EWa7hgd8cRRRtLyF6CozQyGZMSvYCDsr1RnlBY+QAIACYciT6uKi1nFVXctLTqPL1t60
 jZlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=PWzSXzURBrTCAuFi2ULAXjbNlztUk23uhmIQxLwstA8=;
 b=mvlk3VEmDpEcbSmty3G+XbJ0bla+F4XJRade48dacY0ZzVoJRyDk9k9gTHLTTRxjhp
 /oVEK8fkY2w5PmPJ+mh63Du9rP3TVJVcrdgfc0VXbWFrmVq2+uDsk18JGKx6ebIBpp9u
 aIi90/EJxpxm9PprFTSs8Gsgxa1Zie6p0UxQhcKp42qmh8o2ZpI1EuDkFyPbSkpr4dSM
 bISdex3/Mo57imrFfELRdNrRhQ1FwldYTLPUmPGEgs1pHn4tQxTYHxK3bJZlKTdx2lRa
 uoBnbatmWo9PbPm+tzNoHG5KwVvsPjy4Um22P1ThENc/595VFduemJq45q/svpTt8JpB
 cAxw==
X-Gm-Message-State: AOAM531etO07HUQND/rdfEVkN5lluwQUGpR1ttLN0vW9xft5LlGJSAky
 G88YTTBkBy0kc8p6NGm8Ew4=
X-Google-Smtp-Source: ABdhPJx4UhOmlTuX0n0EMZr4EXVr6vb6UY0JR1UmL0QS8y8FGnPKJlWta/dyiJR7Y2u94IYsJq7q9g==
X-Received: by 2002:a17:90a:5d0d:: with SMTP id
 s13mr2543585pji.230.1606380411595; 
 Thu, 26 Nov 2020 00:46:51 -0800 (PST)
Received: from localhost.localdomain ([2405:201:9004:6052:6026:75db:5ad2:e7b3])
 by smtp.gmail.com with ESMTPSA id i2sm4095132pgj.41.2020.11.26.00.46.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Nov 2020 00:46:50 -0800 (PST)
From: Dwaipayan Ray <dwaipayanray1@gmail.com>
To: joe@perches.com
Date: Thu, 26 Nov 2020 14:16:23 +0530
Message-Id: <20201126084623.39178-1-dwaipayanray1@gmail.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Cc: dwaipayanray1@gmail.com, linux-kernel-mentees@lists.linuxfoundation.org,
 linux-kernel@vger.kernel.org
Subject: [Linux-kernel-mentees] [PATCH v2] checkpatch: add warning for
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
Changes in v2:
- Use $logFunctions instead of the manual list.
- Relocate the check to after logging continuations check.
- Remove perl_version_ok condition which is unneeded here.

 scripts/checkpatch.pl | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
index 7dc094445d83..d1ecb852f384 100755
--- a/scripts/checkpatch.pl
+++ b/scripts/checkpatch.pl
@@ -6027,6 +6027,18 @@ sub process {
 			     "Avoid logging continuation uses where feasible\n" . $herecurr);
 		}
 
+# check for unnecessary use of %h[xudi] and %hh[xudi] in logging functions
+		if (defined $stat &&
+		    $line =~ /\b$logFunctions\s*\(/) {
+			my $lc = $stat =~ tr@\n@@;
+			$lc = $lc + $linenr;
+			my $stat_real = get_stat_real($linenr, $lc);
+			if ($stat_real =~ /\"[^\"]*%[\d\.\*\-]*h+[idux].*\"/i) {
+				WARN("UNNECESSARY_MODIFIER",
+				     "Unnecessary use of modifiers %h[xudi] or %hh[xudi]\n" . "$here\n$stat_real\n");
+			}
+		}
+
 # check for mask then right shift without a parentheses
 		if ($perl_version_ok &&
 		    $line =~ /$LvalOrFunc\s*\&\s*($LvalOrFunc)\s*>>/ &&
-- 
2.27.0

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
