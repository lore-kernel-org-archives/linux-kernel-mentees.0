Return-Path: <SRS0=GItZ=E5=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ECAA9C2D0E4
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 23 Nov 2020 17:24:48 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1D0E520724
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 23 Nov 2020 17:24:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Q8oZ7t9U"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1D0E520724
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 8C58985D8F;
	Mon, 23 Nov 2020 17:24:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7dabnaqHcTJ5; Mon, 23 Nov 2020 17:24:46 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id BDAD285CFF;
	Mon, 23 Nov 2020 17:24:46 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 99729C0891;
	Mon, 23 Nov 2020 17:24:46 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 28552C0052
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 23 Nov 2020 17:24:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 191FC203DA
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 23 Nov 2020 17:24:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dQoHLIhRwtMc
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 23 Nov 2020 17:24:43 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com
 [209.85.210.182])
 by silver.osuosl.org (Postfix) with ESMTPS id 386A920010
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 23 Nov 2020 17:24:43 +0000 (UTC)
Received: by mail-pf1-f182.google.com with SMTP id w6so15551639pfu.1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 23 Nov 2020 09:24:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=2yYDqQPMJ4/Ej4t++O02JPknf9YKcT/ImIiC3QyYahY=;
 b=Q8oZ7t9UaATsyMNOrNM4q7QJEr3I2huxlsrI9hNkGVtjJAZXZEejZDvGVSAuRxrpNk
 wmKcUQK4E475/y682gdSEe6Xbw3HtCVWrXx5iK0yq5UKPgZwH/SpJbQRmwVAVjkw8Jzg
 Td+Q8T8mQ/V2wgNhrD5V4etq7VDIKWigNNrviwxceDLpZd2RQTtMiffGk7jC2Akq8Eui
 /tMRCX0wdgHbUBD2vppijn/JHN5pU7hjgSCUdAqp3niWs7AIS3cHtBnOGSgQr5dRM3C4
 40qqtFXN1SDq9a6Z1cdK3L8NAdoOwfmiDCbCk6xzlaaC6Fre3iMnTti+IcN6VRM8OugX
 ViFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=2yYDqQPMJ4/Ej4t++O02JPknf9YKcT/ImIiC3QyYahY=;
 b=UAE36VhHWkX3UT6OnF6jS5paGWje1rc23rmx+DouP+U5NlsYVj5UKG0FmwgMX5xZKA
 evqktlKKAHRE6LA5OeVEosOkn7z2FeRTQgUqHw5Te0dQpk3Miia/Yc2QQyaaJ8824GwS
 Rw40qr5DBt90suYvP3D5MLCjldeoUM7tg3XIpsZll3PcMxMtyHcKj5nlFHjyKdgufRcj
 S+DuBLz6MLoovYtQmg0ZB5v2fr0aEjyumKGFvQnEBYWL7+uCLhTTBDBeavfHK+kmP4zK
 N4/J1oXlw4aAWr1nFNwfGR/cHBWHSgcOUh7AmvRd4HkRVfecVK3s+HvTgUCc0ve6HB1j
 Mbng==
X-Gm-Message-State: AOAM533hdItiQaPbhJ8UEHDLxall4+W2arTpJ6ROJMHoCcgrcHQrWMnJ
 swoo7xTAZSBDGJL9kjBKab8=
X-Google-Smtp-Source: ABdhPJyLRaUG72exY64XFZgIq0Ilx+BI0OXlv6FFv+vtoQmPYJsw4Qp8g54W8E0XXyCZmTwITJ6IRQ==
X-Received: by 2002:aa7:953c:0:b029:18b:bfb:9fa1 with SMTP id
 c28-20020aa7953c0000b029018b0bfb9fa1mr499944pfp.14.1606152282437; 
 Mon, 23 Nov 2020 09:24:42 -0800 (PST)
Received: from localhost.localdomain ([2405:204:a68f:d31a:715e:8c1c:620e:4557])
 by smtp.googlemail.com with ESMTPSA id
 z12sm12722123pfg.123.2020.11.23.09.24.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Nov 2020 09:24:41 -0800 (PST)
From: Aditya Srivastava <yashsri421@gmail.com>
To: lukas.bulwahn@gmail.com
Date: Mon, 23 Nov 2020 22:54:30 +0530
Message-Id: <20201123172430.12854-1-yashsri421@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <CAKXUXMx8siSm67jkBP_r+OKyKALfT2EDcX_SfX7JGBy3YisXcQ@mail.gmail.com>
References: <CAKXUXMx8siSm67jkBP_r+OKyKALfT2EDcX_SfX7JGBy3YisXcQ@mail.gmail.com>
Cc: joe@perches.com, linux-kernel-mentees@lists.linuxfoundation.org,
 linux-kernel@vger.kernel.org, yashsri421@gmail.com
Subject: [Linux-kernel-mentees] [PATCH v4] checkpatch: add fix and improve
	warning msg for Non-standard signature
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

Currently, checkpatch.pl warns for BAD_SIGN_OFF on non-standard signature
styles.

This warning occurs because of incorrect use of signature tags,
e.g. an evaluation on v4.13..v5.8 showed the use of following incorrect
signature tags, which may seem correct, but are not standard:

1) Requested-by (count: 48) => Suggested-by
Rationale: In an open-source project, there are no 'requests', just
'suggestions' to convince a maintainer to accept your patch

2) Co-authored-by (count: 43) => Co-developed-by
Rationale: Co-developed-by and Co-authored-by are synonyms

3) Analyzed-by (count: 22) / Analysed-by (count: 5) => Co-developed-by
Rationale: Analyzing is a part of Software Development, so
'Co-developed-by' is perfectly fine, even if contributor did not create
code

4) Improvements-by (count: 19) => Co-developed-by

5) Noticed-by (count: 11) => Reported-by

6) Inspired-by (count: 11) => Suggested-by

7) Verified-by (count: 8) => Tested-by
Rationale: Used by a single user. On reading mailing list, it seems
Tested-by might be a suitable alternative

8) Okay-ished-by (count: 8) => Acked-by
Rationale: Used by a single user. On reading mailing list, it seems
Acked-by must be suitable alternative

9) Acked-for-MFD-by (count: 6) => Acked-by

10) Reviewed-off-by (count: 5) => Reviewed-by

11) Proposed-by (count: 5) => Suggested-by
Rationale: On observing the mailing list, this tag is always used for a
maintainer. It seems that the changes might have been suggested by them
and the tag is used as acknowledgment for the same

12) Fixed-by (count: 3) => Co-developed-by
Rationale: Fixing bug is a part of Software Development, so
'Co-developed-by' is perfectly fine, even if contributor did not create
code

13) Pointed-out-by (count: 3) / Pointed-at-by (count: 2) => Suggested-by
Rationale: The tags are used for maintainers. It seems that the changes
might have been suggested by them and the tag is used as acknowledgment
for the same
E.g., Pointed-at-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

14) Suggestions-by (count: 3) => Suggested-by

15) Generated-by (count: 17) => remove the tag
On observing the mailing list, this tag is always used for quoting the
tool or script, which might have been used to generate the patch.
E.g. Generated-by: scripts/coccinelle/api/alloc/kzalloc-simple.cocci

16) Celebrated-by (count: 3) => remove the tag
This tag was used for only one commit. On observing mailing list, it seem
like the celebration for a particular patch and changes.

Provide a fix by:
1) replacing the non-standard signature with its standard equivalent
2) removing the signature if it is not required

Also, improve warning messages correspondingly, providing users
suggestions to either replace or remove the signature. Also provide
suitable rationale to the user for the suggestion made.

Signed-off-by: Aditya Srivastava <yashsri421@gmail.com>
---
changes in v2: replace commit specific example with brief evaluation

changes in v3: provide rationale to users for every signature tag suggestion;
modify commit message describing arrival to conclusion in a structured way

changes in v4: modify rationale for certain suggestions

 scripts/checkpatch.pl | 101 +++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 99 insertions(+), 2 deletions(-)

diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
index fdfd5ec09be6..b018deecec1a 100755
--- a/scripts/checkpatch.pl
+++ b/scripts/checkpatch.pl
@@ -506,6 +506,81 @@ our $signature_tags = qr{(?xi:
 	Cc:
 )};
 
+our %standard_signature_fix = (
+	"Requested-by:" => {
+		suggestion => "Suggested-by:",
+		rationale => "In an open-source project, there are no 'requests', just 'suggestions' to convince a maintainer to accept your patch",
+	},
+	"Co-authored-by:" => {
+		suggestion => "Co-developed-by:",
+		rationale => "Co-developed-by is the standard signature tag to attribute multiple authors for a patch",
+	},
+	"Analyzed-by:" => {
+		suggestion => "Co-developed-by:",
+		rationale => "Analyzing is a part of Software Development, so 'Co-developed-by' is perfectly fine, even if contributor did not create code",
+	},
+	"Analysed-by:" => {
+		suggestion => "Co-developed-by:",
+		rationale => "Analysing is a part of Software Development, so 'Co-developed-by' is perfectly fine, even if contributor did not create code",
+	},
+	"Improvements-by:" => {
+		suggestion => "Co-developed-by:",
+		rationale => "Performing improvements are a part of Software Development, so 'Co-developed-by' is perfectly fine, even if contributor did not create code",
+	},
+	"Noticed-by:" => {
+		suggestion => "Reported-by:",
+		rationale => "Reported-by is the standard signature tag for acknowledging user who noticed or reported any bug(s)",
+	},
+	"Inspired-by:" => {
+		suggestion => "Suggested-by:",
+		rationale => "Suggested-by is the standard signature tag for acknowledging user for their suggestions",
+	},
+	"Verified-by:" => {
+		suggestion => "Tested-by:",
+		rationale => "Tested-by is the standard signature tag to attribute user for verifying/testing the patch",
+	},
+	"Okay-ished-by:" => {
+		suggestion => "Acked-by:",
+		rationale => "Acked-by is the standard signature tag for recording one's approval",
+	},
+	"Acked-for-MFD-by:" => {
+		suggestion => "Acked-by:",
+		rationale => "Acked-by is the standard signature tag for recording one's approval",
+	},
+	"Reviewed-off-by:" => {
+		suggestion => "Reviewed-by:",
+		rationale => "Reviewed-by is the standard signature tag to indicate that the patch has been reviewed",
+	},
+	"Proposed-by:" => {
+		suggestion => "Suggested-by:",
+		rationale => "Suggested-by is the standard signature tag for acknowledging user for their suggestions",
+	},
+	"Fixed-by:" => {
+		suggestion => "Co-developed-by:",
+		rationale => "Fixing bug is a part of Software Development, so 'Co-developed-by' is perfectly fine, even if contributor did not create code",
+	},
+	"Pointed-out-by:" => {
+		suggestion => "Suggested-by:",
+		rationale => "Pointing out certain changes is synonymous to suggesting changes, so Suggested-by seems perfectly fine",
+	},
+	"Pointed-at-by:" => {
+		suggestion => "Suggested-by:",
+		rationale => "Pointing at certain changes is synonymous to suggesting changes, so Suggested-by seems perfectly fine",
+	},
+	"Suggestions-by:" => {
+		suggestion => "Suggested-by:",
+		rationale => "Suggested-by is the standard signature tag for acknowledging user for their suggestions",
+	},
+	"Generated-by:" => {
+		suggestion => "remove",
+		rationale => "Signature tags are used to acknowledge users for their contributions. It is advised to describe about tools in commit description instead",
+	},
+	"Celebrated-by:" => {
+		suggestion => "remove",
+		rationale => "Signature tags are used to acknowledge users for their contributions. This tag may not be required at all",
+	},
+);
+
 our @typeListMisordered = (
 	qr{char\s+(?:un)?signed},
 	qr{int\s+(?:(?:un)?signed\s+)?short\s},
@@ -2773,8 +2848,30 @@ sub process {
 			my $ucfirst_sign_off = ucfirst(lc($sign_off));
 
 			if ($sign_off !~ /$signature_tags/) {
-				WARN("BAD_SIGN_OFF",
-				     "Non-standard signature: $sign_off\n" . $herecurr);
+				my $suggested_signature = "";
+				my $rationale = "";
+				if (exists($standard_signature_fix{$sign_off})) {
+					$suggested_signature = $standard_signature_fix{$sign_off}{'suggestion'};
+					$rationale = $standard_signature_fix{$sign_off}{'rationale'};
+				}
+				if ($suggested_signature eq "") {
+					WARN("BAD_SIGN_OFF",
+					     "Non-standard signature: $sign_off\n" . $herecurr);
+				}
+				elsif ($suggested_signature eq "remove") {
+					if (WARN("BAD_SIGN_OFF",
+						"Non-standard signature: $sign_off. Please consider removing this signature tag. $rationale\n" . $herecurr) &&
+					$fix) {
+						fix_delete_line($fixlinenr, $rawline);
+					}
+				}
+				else {
+					if (WARN("BAD_SIGN_OFF",
+						"Non-standard signature: $sign_off. Please use '$suggested_signature' instead. $rationale\n" . $herecurr) &&
+					$fix) {
+						$fixed[$fixlinenr] =~ s/$sign_off/$suggested_signature/;
+					}
+				}
 			}
 			if (defined $space_before && $space_before ne "") {
 				if (WARN("BAD_SIGN_OFF",
-- 
2.17.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
