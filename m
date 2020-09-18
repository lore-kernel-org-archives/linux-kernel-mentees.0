Return-Path: <SRS0=/XFi=C3=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 99FCCC43463
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 18 Sep 2020 12:30:23 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0499D21481
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 18 Sep 2020 12:30:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QyFWeaUD"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0499D21481
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id A0A87872F0;
	Fri, 18 Sep 2020 12:30:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lWrA-rynba4j; Fri, 18 Sep 2020 12:30:22 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 3AAF2872D0;
	Fri, 18 Sep 2020 12:30:22 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 24434C0888;
	Fri, 18 Sep 2020 12:30:22 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 7EC86C0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 18 Sep 2020 12:30:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 669392E1EB
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 18 Sep 2020 12:30:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id OZJ9x8qUyaHP
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 18 Sep 2020 12:30:18 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pl1-f195.google.com (mail-pl1-f195.google.com
 [209.85.214.195])
 by silver.osuosl.org (Postfix) with ESMTPS id 31A872E212
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 18 Sep 2020 12:30:12 +0000 (UTC)
Received: by mail-pl1-f195.google.com with SMTP id bd2so2906404plb.7
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 18 Sep 2020 05:30:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=wPbZwttH48SUWqlAXgRHPUgOYdJpk75n8PQiXTrz75o=;
 b=QyFWeaUDhpyRuPpywTFEXXrUncyr5eXfGxGHZczrvgrmXy0OyvLrZRLBerZljZPUZ+
 iDJnC4XkMYXsmfX5+go8aZjqZ8IvhBm70zESR0947M1Pplu4jJZpVPE+mrXKxvV1w0OL
 vJJpbw9BuL7T+y3PFRiEoVwv0f6Av5nq0G8wRTmt11yXtpE7dxb5arg938aNmmWeCu80
 elXEuG0qucZPkNhkrbOpLyoDGHNg/N91NranIf8iZ9k9yqsRA7ZdxFi/FHeXnArnoMxh
 5EGDucXvLh1/CJhs9xKV026XlOxi6yzsAJLB/tKRqgEg4LQ2J94o46t1IEi1fG7vthsf
 9Y8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=wPbZwttH48SUWqlAXgRHPUgOYdJpk75n8PQiXTrz75o=;
 b=on55bQcHb409sZMplGBtzOGc8yGPcnjPpojrbJ5v2P1JpC96Bk/B05qOY0+9OhJidD
 ga7nF+0HIlhD9AwzLniAgnySTvKqzPkYllaX7Q11C/RayYqF0MB7b5QyCESSNcZAMqM+
 yVnDnrLWHoWAryDALtlFVfxwC33iw6OqNFAbnY6NeVQ/ncal8vUv+Q831UXquMce219E
 PTyXTxuPEC+bVNR41sQ8rXB7wXYWy4GTWxyYG19qqVDNL9Bg8wwU7JVz1kl7LPAsOT5e
 9R5RpCTTsk9X9kccFFh2NxWzT0TpZkHs27bgbUz1P6aAO9SXde6/inxdcodZvqwbRM/2
 wPEg==
X-Gm-Message-State: AOAM5315NcTURlWifyD/HhzZqXwJlE9diyhC3ZVmjDWBMNeWmt+PxUSu
 Re501OcZo0EH/I7A7NVfnB0=
X-Google-Smtp-Source: ABdhPJwIwP38QgqcqIMIUU5yXX4zeq1IqbOKYoipaljTPbuB6xG3VvRhM47FkUW8Qq9ww4Qd5ojNQw==
X-Received: by 2002:a17:90a:e016:: with SMTP id
 u22mr13647930pjy.178.1600432211608; 
 Fri, 18 Sep 2020 05:30:11 -0700 (PDT)
Received: from localhost.localdomain ([2405:201:9004:68eb:25b5:1cdc:a95a:e6e])
 by smtp.gmail.com with ESMTPSA id
 w206sm3082168pfc.1.2020.09.18.05.30.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Sep 2020 05:30:11 -0700 (PDT)
From: Dwaipayan Ray <dwaipayanray1@gmail.com>
To: lukas.bulwahn@gmail.com
Date: Fri, 18 Sep 2020 17:59:50 +0530
Message-Id: <20200918122950.94098-1-dwaipayanray1@gmail.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Cc: dwaipayanray1@gmail.com, linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [PATCH] checkpatch: fix author Signed-off-by
	warning for split From: header
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

Checkpatch did not handle cases where the author From: header was
split into two lines. In those cases the author string went empty,
and checkpatch generated a false missing author signed-off-by
warning.

This patch adds support for split From: headers and resolves those
false warnings.

Signed-off-by: Dwaipayan Ray <dwaipayanray1@gmail.com>
---
 scripts/checkpatch.pl | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
index 504d2e431c60..8c4119ca7d17 100755
--- a/scripts/checkpatch.pl
+++ b/scripts/checkpatch.pl
@@ -2347,6 +2347,7 @@ sub process {
 	my $signoff = 0;
 	my $author = '';
 	my $authorsignoff = 0;
+	my $prevheader = 0;
 	my $is_patch = 0;
 	my $is_binding_patch = -1;
 	my $in_header_lines = $file ? 0 : 1;
@@ -2658,12 +2659,22 @@ sub process {
 			}
 		}
 
+# Check the patch for a split From:
+		if ($author eq '' && decode("MIME-Header", $prevheader) =~ /^From:\s*(.*)/) {
+			$author = $1.$line;
+			$author = encode("utf8", $author) if ($prevheader =~ /=\?utf-8\?/i);
+			$author =~ s/"//g;
+			$author = reformat_email($author);
+			$prevheader = '';
+		}
+
 # Check the patch for a From:
 		if (decode("MIME-Header", $line) =~ /^From:\s*(.*)/) {
 			$author = $1;
 			$author = encode("utf8", $author) if ($line =~ /=\?utf-8\?/i);
 			$author =~ s/"//g;
 			$author = reformat_email($author);
+			$prevheader = $line;
 		}
 
 # Check the patch for a signoff:
-- 
2.27.0

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
