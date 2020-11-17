Return-Path: <SRS0=gqjg=EX=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E545C2D0E4
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 17 Nov 2020 04:05:21 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D399F2468E
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 17 Nov 2020 04:05:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NbmxhkUK"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D399F2468E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 54FB1870EA;
	Tue, 17 Nov 2020 04:05:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1e+5ikKApPMu; Tue, 17 Nov 2020 04:05:19 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 76F4B870D3;
	Tue, 17 Nov 2020 04:05:19 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 6B3ECC0891;
	Tue, 17 Nov 2020 04:05:19 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 28E86C07FF
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 17 Nov 2020 04:05:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 134CB8673E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 17 Nov 2020 04:05:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0kCpobfF4PFP
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 17 Nov 2020 04:05:17 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pf1-f196.google.com (mail-pf1-f196.google.com
 [209.85.210.196])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 01BB886739
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 17 Nov 2020 04:05:16 +0000 (UTC)
Received: by mail-pf1-f196.google.com with SMTP id q10so16279815pfn.0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 16 Nov 2020 20:05:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=I688tyMrUECz3Frpf8w9gFQ0EdIWy0ytmS8RkPZw0Mg=;
 b=NbmxhkUKRzMT8hScAfRQUTJW9Sn8/avBZ7d8k1Gw+54QqE/5NnjsWTdDllCt0v1jCv
 7JTbf8CzTp3HnOmW6nOgcUWfuek+utuanzoBIegeolaGzlh+eAGk3qD3TeNdPMjHyOnh
 5D3DA/0qjVaJRjYSTMAR9zkZOHl6xLoB/VgViy8xSr4MlQgaL/QZApGgMEO4NEheEwOR
 CoI9h7ZBDiIy+5GXHzEGqq3siG1kVr/uqLU4Tw/DLmR3YSK2WI/mFGYXT5RZyZpolLrG
 0ontYtf0Cb7SdjwRZYn/TyJMnqkom4TeEx2aYIm0mU3h1bopwXgkaIZ7hyPJ4UrUSMET
 la9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=I688tyMrUECz3Frpf8w9gFQ0EdIWy0ytmS8RkPZw0Mg=;
 b=TDTCXRkDtF0QBAima4iYR6GVKVdCNmNSG2/VN7/SPuZcsmDE79v3xX+garqb1L8i1t
 61PALfHLhd3xE+0bP7ZJ0Upfch9VhhiwKVKAEoClQoJy1duN1jfxJQJaDgvRb4sz/MOH
 SqGMkXbL4B84kHaCYyxKzy0M3Hkd8vbdjYJ/Ij46x5M6zR6wlLERI9Mk4MOinTXGFVTA
 xQ9y9cATIDPqlPAZ+WzXs0oPSTJVdUNeHH68y1C1EyeoF0/HSKCsjwkco62znLoG/YZL
 QLG4y80uptTJsT7TwAUUIoxEsOY4imV/9K+/aaPhJV9HU5GJlMzkoscSu2EXMZi8nqQU
 uJiA==
X-Gm-Message-State: AOAM5313umipDnlQfmBrXU91tOre4te1hT93yQE99RGxGqwVVmiN6aB5
 a0k+RRZTkoINFrv0OyVA3Uw=
X-Google-Smtp-Source: ABdhPJyrScfLB+qADQXCSJhpKsCuHaCyfLTn1C/KAfW7yV4X7H0X8yzrY+O8+w7TZ2rFl+0F8RazDg==
X-Received: by 2002:a17:90a:f00a:: with SMTP id
 bt10mr2364426pjb.91.1605585916285; 
 Mon, 16 Nov 2020 20:05:16 -0800 (PST)
Received: from localhost.localdomain ([2402:3a80:43e:59af:bc1b:1de0:7718:e8a1])
 by smtp.googlemail.com with ESMTPSA id b7sm1068019pjp.13.2020.11.16.20.05.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Nov 2020 20:05:15 -0800 (PST)
From: Aditya Srivastava <yashsri421@gmail.com>
To: joe@perches.com
Date: Tue, 17 Nov 2020 09:35:01 +0530
Message-Id: <20201117040501.21914-1-yashsri421@gmail.com>
X-Mailer: git-send-email 2.17.1
Cc: linux-kernel-mentees@lists.linuxfoundation.org,
 linux-kernel@vger.kernel.org, yashsri421@gmail.com
Subject: [Linux-kernel-mentees] [PATCH v3] checkpatch: add fix option for
	MAINTAINERS_STYLE
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

Checkpatch expects entries in MAINTAINERS file in a specific order and
warns if the changes made do not follow the specified order.

E.g., running checkpatch on commit b33bc2b878e0 ("nexthop: Add entry to
MAINTAINERS") reports this warning:

WARNING: Misordered MAINTAINERS entry - list file patterns in
alphabetic order
+F:	include/uapi/linux/nexthop.h
+F:	include/net/netns/nexthop.h

Provide a simple fix by swapping the unordered lines, if both the lines
are additions (start with '+')

Signed-off-by: Aditya Srivastava <yashsri421@gmail.com>
---
Changes in v2:
modified commit message

Changes in v3:
add check if both the lines are additions(ie start with '+')

 scripts/checkpatch.pl | 17 +++++++++++++----
 1 file changed, 13 insertions(+), 4 deletions(-)

diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
index 2749f32dffe9..7ee3f05c354d 100755
--- a/scripts/checkpatch.pl
+++ b/scripts/checkpatch.pl
@@ -3299,13 +3299,22 @@ sub process {
 					     "Unknown MAINTAINERS entry type: '$cur'\n" . $herecurr);
 				} else {
 					if ($previndex >= 0 && $curindex < $previndex) {
-						WARN("MAINTAINERS_STYLE",
-						     "Misordered MAINTAINERS entry - list '$cur:' before '$prev:'\n" . $hereprev);
+						if (WARN("MAINTAINERS_STYLE",
+							 "Misordered MAINTAINERS entry - list '$cur:' before '$prev:'\n" . $hereprev) &&
+						    $fix && $prevrawline =~ /^\+[A-Z]:/) {
+							# swap these lines
+							$fixed[$fixlinenr - 1] = $rawline;
+							$fixed[$fixlinenr] = $prevrawline;
+						}
 					} elsif ((($prev eq 'F' && $cur eq 'F') ||
 						  ($prev eq 'X' && $cur eq 'X')) &&
 						 ($prevval cmp $curval) > 0) {
-						WARN("MAINTAINERS_STYLE",
-						     "Misordered MAINTAINERS entry - list file patterns in alphabetic order\n" . $hereprev);
+						if (WARN("MAINTAINERS_STYLE",
+							 "Misordered MAINTAINERS entry - list file patterns in alphabetic order\n" . $hereprev) &&
+						    $fix && $prevrawline =~ /^\+[A-Z]:/) {
+							$fixed[$fixlinenr - 1] = $rawline;
+							$fixed[$fixlinenr] = $prevrawline;
+						}
 					}
 				}
 			}
-- 
2.17.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
