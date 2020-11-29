Return-Path: <SRS0=lIAf=FD=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.6 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2932C3E8C5
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 29 Nov 2020 08:15:03 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 390992076C
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 29 Nov 2020 08:15:02 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="I5VPjspj"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 390992076C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id BC00F20528;
	Sun, 29 Nov 2020 08:15:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id RKizBmHWV2VH; Sun, 29 Nov 2020 08:14:59 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 9CF5D2047C;
	Sun, 29 Nov 2020 08:14:59 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 839F7C0859;
	Sun, 29 Nov 2020 08:14:59 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 9701DC0052
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 29 Nov 2020 08:14:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 7E81D8784F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 29 Nov 2020 08:14:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bXYzPS1bxOzA
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 29 Nov 2020 08:14:57 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pg1-f193.google.com (mail-pg1-f193.google.com
 [209.85.215.193])
 by whitealder.osuosl.org (Postfix) with ESMTPS id A63B987848
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 29 Nov 2020 08:14:57 +0000 (UTC)
Received: by mail-pg1-f193.google.com with SMTP id o4so5590836pgj.0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 29 Nov 2020 00:14:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=TS+3fVneoUuH+hm5MHZo0zkzlD0j2tcaZ5mc/Sr81ns=;
 b=I5VPjspjdq94IwTXqL1kc/43cvtQddsx6/+MdHqoSeR+xbnUBVPKMe31XBs7NkTZ9g
 XKbnZJY+8qib7TqL8zgqVFu3zg5ds2Xr2IIEPnLUegXdHyyDlIxnKIgde48L9lIbMKwz
 UHnxqrD2QhxD0r4/7s3R+PuP7uRMLEkle4rcayybgo7ThTavq7BdgwPb32OutQodXCu3
 lumScaJMk0ac30rq6zIBPmMzdosXsN2mLrgxO1BcANgcQ3ZbwC6wzN+JmtGU8VkWTUw8
 Wmd3PoPd5fGCy/Lgc2KziDqUZMiH1QgJzNAAN0LFE0ga3TYWivqhivhZ0zW/AxFII1jm
 P2Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=TS+3fVneoUuH+hm5MHZo0zkzlD0j2tcaZ5mc/Sr81ns=;
 b=V2fihYVVqau0FTZN2iignMHK8RGKhpGobRl22gV7D594GXOiooJ2KvNiYO0fQ/UF2H
 pSvd4xmJOSF/TTlPzlPJ22UUQHSlRKX8YyEoc+P6TqOp/toD0eGn7AeStvVK66Xrp3n1
 /M/5D/rbWSrfUlDQPkaOiwzcOnSbK4Rww8gRdODNxjKmUMVn17fs4qnmHRQKHoPtxQo+
 0H9XCxBoRdExfy/2rDC0env3bqRhJdDMQzBoAuH8oHVaJU0xIkgoTKbj35hrhGVX8JkR
 pTovqXJur67VQotEVKecCpM3SMZC9YMtbHWlG+8HgEjL5ZxvtF9e7If851jDYgBRr34l
 NVrQ==
X-Gm-Message-State: AOAM532fUVxckeDBN3lk9tgDLzI4iNtnRXgN4b8e3laZLAGl7O+0VGC8
 dC7mZpMVKcufwlhw9Pbcndo=
X-Google-Smtp-Source: ABdhPJzhOSzVf531kxc8242RKSmkISfDEVC71MJCTf1dkVHyW1WsuO34e8SVq/cH5+URWDyvc+lj3w==
X-Received: by 2002:a17:90a:4dc3:: with SMTP id
 r3mr20198780pjl.155.1606637696982; 
 Sun, 29 Nov 2020 00:14:56 -0800 (PST)
Received: from localhost.localdomain ([2402:3a80:43d:11a0:15a2:ad13:ec3b:4e56])
 by smtp.googlemail.com with ESMTPSA id
 w11sm14002978pfi.162.2020.11.29.00.14.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 29 Nov 2020 00:14:56 -0800 (PST)
From: Aditya Srivastava <yashsri421@gmail.com>
To: lukas.bulwahn@gmail.com
Date: Sun, 29 Nov 2020 13:44:47 +0530
Message-Id: <20201129081447.15041-1-yashsri421@gmail.com>
X-Mailer: git-send-email 2.17.1
Cc: linux-kernel-mentees@lists.linuxfoundation.org, yashsri421@gmail.com
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
