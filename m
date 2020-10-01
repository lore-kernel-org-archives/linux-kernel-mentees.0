Return-Path: <SRS0=PXb8=DI=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 36CD9C4727C
	for <linux-kernel-mentees@archiver.kernel.org>; Thu,  1 Oct 2020 10:33:47 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CD4B92085B
	for <linux-kernel-mentees@archiver.kernel.org>; Thu,  1 Oct 2020 10:33:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PQSa3su6"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CD4B92085B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 78C6C849A6;
	Thu,  1 Oct 2020 10:33:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id AwX+YCHWyzXM; Thu,  1 Oct 2020 10:33:44 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id E338A8475D;
	Thu,  1 Oct 2020 10:33:44 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id CC3FCC0889;
	Thu,  1 Oct 2020 10:33:44 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 5AC32C0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  1 Oct 2020 10:33:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 513E022FC6
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  1 Oct 2020 10:33:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Xl5zK8wVj5kj
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  1 Oct 2020 10:33:43 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pg1-f195.google.com (mail-pg1-f195.google.com
 [209.85.215.195])
 by silver.osuosl.org (Postfix) with ESMTPS id 8A8DB22DDB
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  1 Oct 2020 10:33:43 +0000 (UTC)
Received: by mail-pg1-f195.google.com with SMTP id d13so3711017pgl.6
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 01 Oct 2020 03:33:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=fQTw1sCQWT6GYrgDpI3EitnTCGAU23/niMRjTpsTEn4=;
 b=PQSa3su63uNtIjlg9q35vYgWy61NXgVmNIoZglHykMU0smYylecz7wgQHRBOtXO74H
 V5JzxrlzocXIY7niAMtmZvggSGDQyIKmhihr2b0iDsZew2RnZiY7J5x9y5DfWa/ZVvjI
 2/suiC/V6yYc3CGEo8aSfS9xltkPBQCamsoAYe+DZ/2xQmiFcHAeqb6M7emezENMnlxW
 b2mS+F+SKRCl+5m1w3cdOi9ZpLwnZjTmDL5fX9NH4pyvZQ2qlVv2P4h6Myi1RDjuofhl
 9TkpPCP7PdcoKmL5dTMSPgbBYxiq7CrOEUMyc8u/DF1RtN0gpMj2/jDhrhekXwVk+g5V
 XZNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=fQTw1sCQWT6GYrgDpI3EitnTCGAU23/niMRjTpsTEn4=;
 b=j+1KluESE/mO6mW/9WxuMlK8vr00hMHOueudo5pVIhD0M3M96MoVCwrIO6hTD/bM+G
 zNWOGEBVl30/aZRV2dF3sL1q3pRn9ng4xcld5qTZdqVD0ar2P6eSQov/tJC7Mjxb7miC
 9WX6rbPdMNaMV648otXpIS7GCy1reL0qfUXol5Pemcpei6SRZvi3X52CZGIkT9e7s8vG
 zqz4sdJfEPKZs1HB6CPYFZtRMwZg6gIyk+qTp31E7FMV/6ZhvChWA/gKNzxXOj7G+rtv
 suVZU3iaDhd3zhXpfE2ulOfB/6r90RbQWQjTZs+c6LZk8kRGKDBRDng/h5vJS5BNQdZx
 +wxQ==
X-Gm-Message-State: AOAM533O+yLAc9y4fj5d/8bRaW5zZ3XSWNg05KKhRL1X/XiQpMQC1gSf
 UsjKAYgiCuZ2RX23M7T5xTw=
X-Google-Smtp-Source: ABdhPJx/yV/zBeBpAEW1BN1LxMFduT0jhl9l1ixStjCEezC3xVB/TlAd7E5L7HzhUdDr0IIdF1Rzmw==
X-Received: by 2002:a63:d852:: with SMTP id k18mr5599858pgj.49.1601548423007; 
 Thu, 01 Oct 2020 03:33:43 -0700 (PDT)
Received: from localhost.localdomain ([2405:201:9004:6895:98fa:b2ef:d209:c1d4])
 by smtp.gmail.com with ESMTPSA id f18sm6198124pfe.153.2020.10.01.03.33.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Oct 2020 03:33:42 -0700 (PDT)
From: Dwaipayan Ray <dwaipayanray1@gmail.com>
To: joe@perches.com
Date: Thu,  1 Oct 2020 16:03:14 +0530
Message-Id: <20201001103314.136645-1-dwaipayanray1@gmail.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Cc: dwaipayanray1@gmail.com, linux-kernel-mentees@lists.linuxfoundation.org,
 linux-kernel@vger.kernel.org
Subject: [Linux-kernel-mentees] [PATCH RFC] checkpatch: fix multi-statement
	macro checks
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

Checkpatch.pl doesn't have a check for excluding while (...) {...}
blocks from MULTISTATEMENT_MACRO_USE_DO_WHILE error.

For example, running checkpatch.pl on the file mm/access.c in the
kernel generates the following error:

ERROR: Macros with complex values should be enclosed in parentheses
+#define copy_from_kernel_nofault_loop(dst, src, len, type, err_label)	\
+	while (len >= sizeof(type)) {					\
+		__get_kernel_nofault(dst, src, type, err_label);	\
+		dst += sizeof(type);					\
+		src += sizeof(type);					\
+		len -= sizeof(type);					\
+	}

The error is misleading for this case. Enclosing it in parantheses
doesn't make any sense.

Checkpatch already has an exception list for such common macro types.
Added a new exception for while (...) {...} style blocks to the same.
This effectively fixed the wrong error message.

Signed-off-by: Dwaipayan Ray <dwaipayanray1@gmail.com>
---
 scripts/checkpatch.pl | 1 +
 1 file changed, 1 insertion(+)

diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
index 72c4072307ea..c2c211374662 100755
--- a/scripts/checkpatch.pl
+++ b/scripts/checkpatch.pl
@@ -5342,6 +5342,7 @@ sub process {
 			    $dstat !~ /^\.$Ident\s*=/ &&				# .foo =
 			    $dstat !~ /^(?:\#\s*$Ident|\#\s*$Constant)\s*$/ &&		# stringification #foo
 			    $dstat !~ /^do\s*$Constant\s*while\s*$Constant;?$/ &&	# do {...} while (...); // do {...} while (...)
+			    $dstat !~ /^while\s*$Constant\s*$Constant\s*$/ &&		# while (...) {...}
 			    $dstat !~ /^for\s*$Constant$/ &&				# for (...)
 			    $dstat !~ /^for\s*$Constant\s+(?:$Ident|-?$Constant)$/ &&	# for (...) bar()
 			    $dstat !~ /^do\s*{/ &&					# do {...
-- 
2.27.0

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
