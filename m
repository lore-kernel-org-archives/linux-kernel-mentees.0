Return-Path: <SRS0=4WB8=FF=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D03D3C64E7B
	for <linux-kernel-mentees@archiver.kernel.org>; Tue,  1 Dec 2020 11:29:45 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E7D8920705
	for <linux-kernel-mentees@archiver.kernel.org>; Tue,  1 Dec 2020 11:29:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="A/7VKq71"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E7D8920705
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 5D3DA86BB3;
	Tue,  1 Dec 2020 11:29:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wrGA-9XYbRBV; Tue,  1 Dec 2020 11:29:43 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 5366886BB2;
	Tue,  1 Dec 2020 11:29:43 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 45696C0859;
	Tue,  1 Dec 2020 11:29:43 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id DA403C0052
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  1 Dec 2020 11:29:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id C36F22E0E4
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  1 Dec 2020 11:29:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yHl3g-zEThVt
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  1 Dec 2020 11:29:40 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pj1-f66.google.com (mail-pj1-f66.google.com
 [209.85.216.66])
 by silver.osuosl.org (Postfix) with ESMTPS id 6AF5B2284F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  1 Dec 2020 11:29:40 +0000 (UTC)
Received: by mail-pj1-f66.google.com with SMTP id iq13so1045203pjb.3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 01 Dec 2020 03:29:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=TS+3fVneoUuH+hm5MHZo0zkzlD0j2tcaZ5mc/Sr81ns=;
 b=A/7VKq71IbL8AnJdZqn7IutK7oq9056ibkaBYXI6bf0zc0+3s08Tq+ntVU3qyBA4dy
 QKS7dzmTxIouokmQf0bdol+/fx8o68xri1SGB1kn/RYKsrZlVZTyRRmg9m3MzOj8hZcf
 OkBs+rzAdvDaksbSZQSJ3nmA+Fe3i8R9W616ObtKYC+w7IhTbxE1x9QIizQtlL8OwNqF
 OLXsR8jE1Z3f8byXaSXE5TnOw79UQaUJxBEiYL5Z9BFkuwFjPTX0C9HwpaG5aEpSIUqI
 0G+11fBdJqTjKIM4aH3EM2zf1SWozVyELtPFp+com7y0uwjQXGiolLgMN3vUCyVV64Zz
 6F2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=TS+3fVneoUuH+hm5MHZo0zkzlD0j2tcaZ5mc/Sr81ns=;
 b=eyABq7yk1DICzzSL9v4x0/OKppmoypXMH3K1pDP2GgH4x8lacaznpdu6EXB7u8eMVX
 SbI0D8iqBfLAt/jZ6irGUXpMSaa9rFhjcZaLON7hukivkdmGyEXYmPtleGstYRoIqm02
 c/RbRv8mDjomjrk28/NIK3RFzUiUo69GYfqNX+eDvz6xV+HDh4LP1sfqm3YfDZE3vlZf
 dhSls2ycCGUAFvKrp+cxdubf6GbnYLZcsbwckW79bV28KBtlefjd3B5hqQQm2R5tA7nq
 ky/MI5njugJzEnHSDR9Y0xEcvSoeSruYD/Sd6665ZgLF9PrnfKZVIgSC7BI+H8Yy3pTy
 3gDQ==
X-Gm-Message-State: AOAM530bQhwDfiGZZIOA1Lwr4xfSf36GYMsT/py7KPnPmrGDZ6I7qY6+
 bCZE4U58jwlnqa5GJ20G/ko=
X-Google-Smtp-Source: ABdhPJwu8PgSjiSaHq7fxAmAU+eLS9HntvSOFj080RHoM6l9yNHts496NggNitEakF8B8gJBrqPhxQ==
X-Received: by 2002:a17:90a:2e8c:: with SMTP id
 r12mr2237397pjd.101.1606822179802; 
 Tue, 01 Dec 2020 03:29:39 -0800 (PST)
Received: from localhost.localdomain ([2402:3a80:42a:f496:5078:6ca4:d183:62ef])
 by smtp.googlemail.com with ESMTPSA id a16sm2451584pfl.125.2020.12.01.03.29.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Dec 2020 03:29:39 -0800 (PST)
From: Aditya Srivastava <yashsri421@gmail.com>
To: joe@perches.com
Date: Tue,  1 Dec 2020 16:59:31 +0530
Message-Id: <20201201112931.11192-1-yashsri421@gmail.com>
X-Mailer: git-send-email 2.17.1
Cc: linux-kernel-mentees@lists.linuxfoundation.org,
 linux-kernel@vger.kernel.org, yashsri421@gmail.com
Subject: [Linux-kernel-mentees] [PATCH v5] checkpatch: add fix and improve
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

Provide a fix by replacing the non-standard signature with its standard
equivalent.

Also, improve warning messages correspondingly, providing suitable
rationale to the user for the suggestion made.

Signed-off-by: Aditya Srivastava <yashsri421@gmail.com>
---
applies on next-20201120 and my last patch at Link: https://lore.kernel.org/linux-kernel-mentees/db1195235752685fc85fb52ecb1b1af3f35b5394.camel@perches.com/T/#u

changes in v2: replace commit specific example with brief evaluation

changes in v3: provide rationale to users for every signature tag suggestion;
modify commit message describing arrival to conclusion in a structured way

changes in v4: modify rationale for certain suggestions

changes in v5: remove the tag deletion suggestions, ie "Generated-by" and "Celebrated-by"; rebase on last accepted changes; modify commit message

 scripts/checkpatch.pl | 73 ++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 72 insertions(+), 1 deletion(-)

diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
index 4a026926139f..d0c2f189272f 100755
--- a/scripts/checkpatch.pl
+++ b/scripts/checkpatch.pl
@@ -563,6 +563,72 @@ sub find_standard_signature {
 
 	return "";
 }
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
+);
 
 our @typeListMisordered = (
 	qr{char\s+(?:un)?signed},
@@ -2832,12 +2898,17 @@ sub process {
 
 			if ($sign_off !~ /$signature_tags/) {
 				my $suggested_signature = find_standard_signature($sign_off);
+				my $rationale = "";
+				if (exists($standard_signature_fix{$sign_off})) {
+					$suggested_signature = $standard_signature_fix{$sign_off}{'suggestion'};
+					$rationale = $standard_signature_fix{$sign_off}{'rationale'};
+				}
 				if ($suggested_signature eq "") {
 					WARN("BAD_SIGN_OFF",
 					     "Non-standard signature: $sign_off\n" . $herecurr);
 				} else {
 					if (WARN("BAD_SIGN_OFF",
-						 "Non-standard signature: '$sign_off' - perhaps '$suggested_signature'?\n" . $herecurr) &&
+						 "Non-standard signature: '$sign_off' - perhaps '$suggested_signature'? $rationale\n" . $herecurr) &&
 					    $fix) {
 						$fixed[$fixlinenr] =~ s/$sign_off/$suggested_signature/;
 					}
-- 
2.17.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
