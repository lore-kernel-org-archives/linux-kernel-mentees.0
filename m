Return-Path: <SRS0=42xI=DH=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6678AC4363D
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 30 Sep 2020 21:03:58 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0F67420759
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 30 Sep 2020 21:03:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FsKlF/xa"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0F67420759
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 9484D871C7;
	Wed, 30 Sep 2020 21:03:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id sffVyT33CSfY; Wed, 30 Sep 2020 21:03:57 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 1C7B086DE2;
	Wed, 30 Sep 2020 21:03:57 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 0F0D3C016F;
	Wed, 30 Sep 2020 21:03:57 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 079D9C0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 30 Sep 2020 21:03:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id ABBD2871C7
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 30 Sep 2020 21:03:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id EIEpi10+f97W
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 30 Sep 2020 21:03:54 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pf1-f193.google.com (mail-pf1-f193.google.com
 [209.85.210.193])
 by hemlock.osuosl.org (Postfix) with ESMTPS id A2FE786DE2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 30 Sep 2020 21:03:54 +0000 (UTC)
Received: by mail-pf1-f193.google.com with SMTP id o20so2113225pfp.11
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 30 Sep 2020 14:03:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=HFYH5Aq6FpXXdyVElCxeVZsekhQ6UAYIOaAu/0uA5sc=;
 b=FsKlF/xaBUeBMn3StAQVtEsw4EOaFA/osVIuGhOrTFaEBrCqhjgy+vvUrL6Q3hViKx
 ReOlxODfEUQIv9rHmRuPD7viWRdO/dh2HY01nqKeAmoh3LNJeqR41AwRSXUNEKEHIRbA
 R5WZZWTx8m6U6evjOWi/JCdt3BKfrpFeF9LmNCkruIKOCskYtEwnvjxO2hyM3+WaKHt/
 w36N6YYBMrVocEg0lOZ1bz+U+fIjoVEhAoQJVSPEroPaIQ7KZIhhc4tKypubEXZPH3Qx
 EYXQkgJiFrDR89iFZpiuPo+8GLbz0Q4hX/dXvn7qDStMps6nBRYbeLbgDRzdYoxZvI7u
 AEiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=HFYH5Aq6FpXXdyVElCxeVZsekhQ6UAYIOaAu/0uA5sc=;
 b=pHy4QSmi9iFY3TJ0dtBf/D+OFpoExYZ/yEeUdpxdOApHONLrCKgtq/LpLoCxwVykbo
 cXz5377CzmpGffGLOleRfnP0iDMr71kAdEwbceQnM54MVMW89nTZ2yEagN3UZ1HzCkP3
 4oXntZGjnnHu8C0YpEyqN+hZV+hdARG/Csh6OkAknDrY1jEN25ZXNZyXD9HKcxEr4fQf
 bdn3zjVincEHoQt1P1ElscJ2d6cyjGxeVp2ab/8Z1IX/+m2vS6JSUdEvsXr7+TAN2sPi
 BHQpqZRhFd06NBHZ29TTJ8V1QGUrnziUN9jC5LosATo4pWL2WA3oJkChCD1E99wDGcP9
 ZMoA==
X-Gm-Message-State: AOAM5324W0QKqxZwvz9V4SV9HfCk1VylWLXnnnzWk5NWZem3rw3FuRT/
 qZt40c0ZEnhKLQO88BScSTDQBBFjylgGfQ==
X-Google-Smtp-Source: ABdhPJwKMZChoj5K2IdFKPuJeQDk5fOounY70DDQusDy6C0GmQY5UZVvGuD71PMwkKwaoBdO5MbNsg==
X-Received: by 2002:a62:1b15:0:b029:13c:e701:5113 with SMTP id
 b21-20020a621b150000b029013ce7015113mr4283846pfb.3.1601499833922; 
 Wed, 30 Sep 2020 14:03:53 -0700 (PDT)
Received: from localhost.localdomain ([2405:201:9004:6825:89f0:a659:1148:a80f])
 by smtp.gmail.com with ESMTPSA id y4sm3038922pgl.67.2020.09.30.14.03.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Sep 2020 14:03:53 -0700 (PDT)
From: Dwaipayan Ray <dwaipayanray1@gmail.com>
To: lukas.bulwahn@gmail.com
Date: Thu,  1 Oct 2020 02:33:33 +0530
Message-Id: <20200930210333.166006-2-dwaipayanray1@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200930210333.166006-1-dwaipayanray1@gmail.com>
References: <20200930210333.166006-1-dwaipayanray1@gmail.com>
MIME-Version: 1.0
Cc: dwaipayanray1@gmail.com, linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [PATCH RFC 2/2] checkpatch: fix
	multi-statement macro checks
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

The error is misleading for this case. Enclosing it in a paranthesis
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
+			    $dstat !~ /^while\s*$Constant\s*$Constant\s*$/ &&			# while (...) {...}
 			    $dstat !~ /^for\s*$Constant$/ &&				# for (...)
 			    $dstat !~ /^for\s*$Constant\s+(?:$Ident|-?$Constant)$/ &&	# for (...) bar()
 			    $dstat !~ /^do\s*{/ &&					# do {...
-- 
2.27.0

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
