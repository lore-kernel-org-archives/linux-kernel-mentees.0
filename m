Return-Path: <SRS0=gqjg=EX=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B194C56202
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 17 Nov 2020 17:19:12 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 99F1324248
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 17 Nov 2020 17:19:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="P38iJsld"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 99F1324248
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id CBD2021511;
	Tue, 17 Nov 2020 17:19:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4UzNIMh-xdEe; Tue, 17 Nov 2020 17:19:09 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 9CF452011B;
	Tue, 17 Nov 2020 17:19:09 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 86856C0800;
	Tue, 17 Nov 2020 17:19:09 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 172EFC0800
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 17 Nov 2020 17:19:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 66E3D80AD2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 17 Nov 2020 17:19:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id s3TnDG7EBsxE
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 17 Nov 2020 17:19:07 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pl1-f195.google.com (mail-pl1-f195.google.com
 [209.85.214.195])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id B1C278574B
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 17 Nov 2020 17:19:07 +0000 (UTC)
Received: by mail-pl1-f195.google.com with SMTP id 35so6419596ple.12
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 17 Nov 2020 09:19:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=BU2rF0RjJies6Ad9Guc7YENeR3dvB/h0+JgOyVEnQ9g=;
 b=P38iJsldVOd0e+NPtlq3jP15XMuAnV1znsiXCfKkhRmXew9U1uaSEGj6QFX38z31vQ
 MIGa2fmyFPXdJosUIXk4GR61uNnqpMwSELS+VWfJmhIMjWPAGfj+ZsQij++n9wOsTxvv
 gywwsGvTyPhruFer06R7zp2Ka3U7lTa6U82FKXjcK3lz06wcPwEkBwkN/fXrjCF3ZueG
 rNOAgMwGT+QUH2vF/gWInsBlqtIQa0ulpfxGgt67wU4sWrLsUn00IJ8zeg17aZpIwEph
 EsQTA9rS8PX0Fu4+HDyC16QSC3ct7KmoeSIHHlgpP5YrBjnpVv9jLMajUiTY0S5UZKxr
 eXyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=BU2rF0RjJies6Ad9Guc7YENeR3dvB/h0+JgOyVEnQ9g=;
 b=IElIr217oTSKHKqOUYqCqGi1dkT3ArFWTjXa+9UF723+cZYWPIOUoNsdgRaupJ+4zi
 7uF+QhyiYMZJQWPTbg1AzyPhPExbSm4nvMp0+5NuDqO/flff/CS8AzrF2D3FgsK/NLl9
 xx3SW8iZCxpls4rsfFtFSxowXadcj3agSlnx+a6Aqi71cO7q5KUTFQH/k+OiPBM+93qc
 2N5qTEgLA8PJFoghkX2OoN78fRZVgeD+N8Z/omZF+ElKwlOomQ7GJ3MQWcJoqo9NyDkd
 S2SYOCjrInguxSS+7csZqAcO/OufcBWjF3Kt8kX8WQ1E2ZHzY+onZ/Atl5rEVUDl1Lw0
 4G4g==
X-Gm-Message-State: AOAM531V+MUfLcErsDsaJNsNEwvbXH6hFc1iLlbijzPkqmXJJ9XInQO2
 MBaNZj8LAlKZf/uaA2aQ/08=
X-Google-Smtp-Source: ABdhPJzCxBg/rtq4ejDIfI2VIFNUdT4M0h79GKc8dpcq6loXBym2b8mx0waRp1IwhXUnCLELs5amKQ==
X-Received: by 2002:a17:902:7785:b029:d6:cf21:69ef with SMTP id
 o5-20020a1709027785b02900d6cf2169efmr584180pll.58.1605633547174; 
 Tue, 17 Nov 2020 09:19:07 -0800 (PST)
Received: from localhost.localdomain ([2402:3a80:425:6282:bc1b:1de0:7718:e8a1])
 by smtp.googlemail.com with ESMTPSA id
 y19sm21449337pfn.147.2020.11.17.09.19.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Nov 2020 09:19:06 -0800 (PST)
From: Aditya Srivastava <yashsri421@gmail.com>
To: joe@perches.com
Date: Tue, 17 Nov 2020 22:48:56 +0530
Message-Id: <20201117171856.13284-1-yashsri421@gmail.com>
X-Mailer: git-send-email 2.17.1
Cc: linux-kernel-mentees@lists.linuxfoundation.org,
 linux-kernel@vger.kernel.org, yashsri421@gmail.com
Subject: [Linux-kernel-mentees] [PATCH v3] checkpatch: add fix option for
	ASSIGNMENT_CONTINUATIONS
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

Currently, checkpatch warns us if an assignment operator is placed
at the start of a line and not at the end of previous line.

E.g., running checkpatch on commit 8195b1396ec8 ("hv_netvsc: fix
deadlock on hotplug") reports:

CHECK: Assignment operator '=' should be on the previous line
+	struct netvsc_device *nvdev
+		= container_of(w, struct netvsc_device, subchan_work);

Provide a simple fix by appending assignment operator to the previous
line and removing from the current line, if both the lines are additions
(ie start with '+')

Signed-off-by: Aditya Srivastava <yashsri421@gmail.com>
---
Changes in v2:
add check if both the lines are additions (ie start with '+')

Changes in v3:
quote $operator; test with division assignment operator ('/=')

 scripts/checkpatch.pl | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
index c9aaaa443265..d5bc4d8e4f6c 100755
--- a/scripts/checkpatch.pl
+++ b/scripts/checkpatch.pl
@@ -3542,8 +3542,14 @@ sub process {
 
 # check for assignments on the start of a line
 		if ($sline =~ /^\+\s+($Assignment)[^=]/) {
-			CHK("ASSIGNMENT_CONTINUATIONS",
-			    "Assignment operator '$1' should be on the previous line\n" . $hereprev);
+			my $operator = "$1";
+			if (CHK("ASSIGNMENT_CONTINUATIONS",
+				"Assignment operator '$1' should be on the previous line\n" . $hereprev) &&
+			    $fix && $prevrawline =~ /^\+/) {
+				# add assignment operator to the previous line, remove from current line
+				$fixed[$fixlinenr - 1] .= " $operator";
+				$fixed[$fixlinenr] =~ s/$operator\s*//;
+			}
 		}
 
 # check for && or || at the start of a line
-- 
2.17.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
