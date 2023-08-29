Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E637AC83F14
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 29 Aug 2023 12:35:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8606D81FF5;
	Tue, 29 Aug 2023 12:35:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8606D81FF5
Authentication-Results: smtp1.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=a9SwPyre
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GlYQOGR8cs_R; Tue, 29 Aug 2023 12:35:44 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 7353B81FF6;
	Tue, 29 Aug 2023 12:35:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7353B81FF6
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 4185CC0071;
	Tue, 29 Aug 2023 12:35:44 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 09018C0032
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 29 Aug 2023 12:35:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C5D8B81FF6
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 29 Aug 2023 12:35:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C5D8B81FF6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xITIupGEMZ05
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 29 Aug 2023 12:35:41 +0000 (UTC)
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com
 [IPv6:2a00:1450:4864:20::233])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5B4F481FF5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 29 Aug 2023 12:35:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5B4F481FF5
Received: by mail-lj1-x233.google.com with SMTP id
 38308e7fff4ca-2b962535808so66471761fa.0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 29 Aug 2023 05:35:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1693312539; x=1693917339;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Bp+WNcc+NUltg2NS15dJnRBG/GyHjPSWYbuJd4p6LYo=;
 b=a9SwPyreQZPj1VWKSW57uFiuFsYEeNGXdXg+yyDlhi6cc+coykTCtAg3IL37nnmEOl
 4k/Edq2fSlbP8nx5TN8cNXjGlAaslV4ZUCxrys6RDz3sMEIWsJjSZFnhG2TA76JC0yA2
 iIJ4lGh7vKH2DLpKNSJeAV82mJYvtA4VAk7O+n3ZGVQ8EjnH0+JkHatHlyzBk5QUJz4x
 bSdbnPEVtong5kYimjxMf/9Zb8rMclZRo/v6z8CVeuaJmmgHW3dWESZrkuKwYpyEZRfl
 v18bJyQ5CM6HUla+aAhtpa/dK3A4H+xw2n9XJxI9EA/O4Q4PrDE9vIlume0tv6KhUo1I
 eLYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693312539; x=1693917339;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Bp+WNcc+NUltg2NS15dJnRBG/GyHjPSWYbuJd4p6LYo=;
 b=hgdYSeQV3uSNTJM4llCp9/xHMqH/kuZkoKLLDm0gDJv3ED8HZHt317RoJAOzV9ay9X
 /OLScGX9y5xPGfyXsFb3F6iCN2/ajjvXYnuXQiAzh0tm5pPKByQWxbo0n8yAXOAF8p1I
 rUwXwQTNwMJZuNHZpP6RqLK5MUFkjYV+Myd1y+Djy4KIYgHhghat3VE9seXcm8bWUD63
 K4i1ISfPwuKBDcg49NbZCqPc/z/4/YCQrOUKcZ2I6w1WqrmEGByH14bIC9HEN8H0KYuV
 6AXpOpfygd0Rkqbwkh59r3fJ7WqL+MTag1tq/jp21shQHjBKnxg1d5JlJXJLI+XZq7wt
 ncFw==
X-Gm-Message-State: AOJu0Yz2VyjnxgT1xjxua49lG4RN95rv4ECzp7G3EkHbPXfeXYzj7uxd
 8w7AuYOC7li5nrH8eticIGk=
X-Google-Smtp-Source: AGHT+IEMTnEPqLIZvAyyiuDzdCnaIMwXYK12q2e95y3mbT0a89j1g8y2VRm4Rlx+/aCK4LBmw55VCw==
X-Received: by 2002:a2e:2a45:0:b0:2bd:1cd0:6041 with SMTP id
 q66-20020a2e2a45000000b002bd1cd06041mr953487ljq.0.1693312538904; 
 Tue, 29 Aug 2023 05:35:38 -0700 (PDT)
Received: from dev7.kernelcare.com ([2a01:4f8:201:23::2])
 by smtp.gmail.com with ESMTPSA id
 b10-20020a170906490a00b009a1fef32ce6sm5981770ejq.177.2023.08.29.05.35.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Aug 2023 05:35:38 -0700 (PDT)
From: Andrew Kanner <andrew.kanner@gmail.com>
To: apw@canonical.com, joe@perches.com, dwaipayanray1@gmail.com,
 lukas.bulwahn@gmail.com
Subject: [PATCH] checkpatch: stop complaining about tags suggested/tested by
 syzkaller
Date: Tue, 29 Aug 2023 14:34:47 +0200
Message-Id: <20230829123446.3455193-1-andrew.kanner@gmail.com>
X-Mailer: git-send-email 2.39.3
MIME-Version: 1.0
Cc: linux-kernel-mentees@lists.linuxfoundation.org,
 linux-kernel@vger.kernel.org
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

If you submit a testing request to syzkaller it may reply with:

 syzbot has tested the proposed patch and the reproducer did not \
 trigger any issue:

 Reported-and-tested-by: syzbot+f817490f5bd20541b90a@syzkaller.appspotmail.com

Checkpatch is ok with Reported-by tags, but complains about
Reported-and-tested-by tags:

 WARNING: Possible unwrapped commit description (prefer a maximum 75 \
 chars per line)
 #48:
 Reported-and-tested-by: syzbot+f817490f5bd20541b90a@syzkaller.appspotmail.com

Adding the new tag to signature_tags removes this warning.

Signed-off-by: Andrew Kanner <andrew.kanner@gmail.com>
---
 scripts/checkpatch.pl | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
index a9841148cde2..f85dcfb098e0 100755
--- a/scripts/checkpatch.pl
+++ b/scripts/checkpatch.pl
@@ -615,6 +615,7 @@ our $signature_tags = qr{(?xi:
 	Tested-by:|
 	Reviewed-by:|
 	Reported-by:|
+	Reported-and-tested-by:|
 	Suggested-by:|
 	To:|
 	Cc:
@@ -709,7 +710,7 @@ sub find_standard_signature {
 	my ($sign_off) = @_;
 	my @standard_signature_tags = (
 		'Signed-off-by:', 'Co-developed-by:', 'Acked-by:', 'Tested-by:',
-		'Reviewed-by:', 'Reported-by:', 'Suggested-by:'
+		'Reviewed-by:', 'Reported-by:', 'Reported-and-tested-by:', 'Suggested-by:'
 	);
 	foreach my $signature (@standard_signature_tags) {
 		return $signature if (get_edit_distance($sign_off, $signature) <= 2);
-- 
2.39.3

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
