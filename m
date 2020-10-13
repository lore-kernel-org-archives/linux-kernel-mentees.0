Return-Path: <SRS0=MU2n=DU=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0FA2C433E7
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 13 Oct 2020 12:03:00 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 551792080A
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 13 Oct 2020 12:03:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZYyl5we4"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 551792080A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id D1CC887A38;
	Tue, 13 Oct 2020 12:02:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id O2wUFwyL3yJv; Tue, 13 Oct 2020 12:02:59 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 1DE2087A0A;
	Tue, 13 Oct 2020 12:02:59 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 11504C0052;
	Tue, 13 Oct 2020 12:02:59 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 46FD2C0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 13 Oct 2020 12:02:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 286BB2E10C
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 13 Oct 2020 12:02:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0b9JQpnjfMWR
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 13 Oct 2020 12:02:57 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com
 [209.85.216.42])
 by silver.osuosl.org (Postfix) with ESMTPS id 277792E102
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 13 Oct 2020 12:02:57 +0000 (UTC)
Received: by mail-pj1-f42.google.com with SMTP id a17so2033245pju.1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 13 Oct 2020 05:02:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=8EojIG9gMRrD09GYxDSxcMWENzlGRCeBng0hCNmqUT0=;
 b=ZYyl5we4afO+NSu2i1cSmMcG2RkdqSys1eDO1I3BTbzJue7bBgVvyj/CCWgR1U2uWq
 lxYYf/Qfw5F1qENOeuyPq1yG9rfXs6GWECXcDp5DbIjKVAlJCztu6ngdBEF6WX7b3DUc
 ALWDYP6sVAQ6b61grY1danDR5OEiNJeoqFa8elJcHS9iBVeItPmFZZO7oHxwE8feuUlE
 NpVEGZqXnuQifbJvcwAshQAnY6NIvrsGAIZMzbeFZeNWmeo0+dEHaKElpyrlECGNPuTX
 gtAGO75bpqZReL+v5CMBTL3CWNdPiImBk2g/5PI4ziWjSkpU6IBrSXEKKlRXaEKwgSL2
 k/Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=8EojIG9gMRrD09GYxDSxcMWENzlGRCeBng0hCNmqUT0=;
 b=NCstpqehp2xltgTb4cWk5zfLzkJ2kKBrvL7S22R+2jNLu9G0BDOF7ChV9hoC+KLgew
 9sxurJsydhgTDiUPpWB4ZB8j4/a+576KuI3yJlGEdyg0XDG4gJ/fTtNiWdtSvCO2z2J8
 LSRQFlh5mluuNupqvTDyvlvZGQiNKcj+7A9cFBfiU49MpRnPyidFyK5k8bIryDcEI4ZV
 fg/q/I9Lc6XKoFSxjVqUyUXmvGPa7YLN6YKf8RCYqXeRQfXvStvcxJ574TO5BqBY48ou
 zf2dE/rQ40evrhWajLFmGHMAt6/Jpx93a/oiQ1tXHeuIJ3xbuIHleZ1ETCwLDebQezPM
 r8aQ==
X-Gm-Message-State: AOAM530IkSMpITeLGiNdkekpSyUUjAkVbWzQw3uT1CZmMPGi0hivkCGO
 l1yJs4L1orsshN/MZ7Os1JnIk2OcRuhTbRQfv28=
X-Google-Smtp-Source: ABdhPJz3XuxodNTHuko3fm97FIbgyRnO0U0lueAT9LunyZLDwi5sNv7q0svOGJavAWwTX5GUPZ+7fg==
X-Received: by 2002:a17:90a:73cb:: with SMTP id
 n11mr12200354pjk.213.1602590576411; 
 Tue, 13 Oct 2020 05:02:56 -0700 (PDT)
Received: from localhost.localdomain ([2405:201:a404:280a:90bd:7a49:dcda:1fb1])
 by smtp.gmail.com with ESMTPSA id y4sm7176074pgs.0.2020.10.13.05.02.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Oct 2020 05:02:55 -0700 (PDT)
From: Ujjwal Kumar <ujjwalkumar0501@gmail.com>
To: Joe Perches <joe@perches.com>,
	Lukas Bulwahn <lukas.bulwahn@gmail.com>
Date: Tue, 13 Oct 2020 17:31:30 +0530
Message-Id: <20201013120129.1304101-1-ujjwalkumar0501@gmail.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Cc: linux-kernel-mentees@lists.linuxfoundation.org,
 linux-kernel@vger.kernel.org, Ujjwal Kumar <ujjwalkumar0501@gmail.com>
Subject: [Linux-kernel-mentees] [RFC PATCH v2] checkpatch: add shebang check
	to EXECUTE_PERMISSIONS
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

checkpatch.pl checks for invalid EXECUTE_PERMISSIONS on source
files. The script leverages filename extensions and its path in
the repository to decide whether to allow execute permissions on
the file or not.

Based on current check conditions, a perl script file having
execute permissions, without '.pl' extension in its filename
and not belonging to 'scripts/' directory is reported as ERROR
which is a false positive.

Adding a shebang check along with current conditions will make
the check more generalised and improve checkpatch reports.
To do so, without breaking the core design decision of checkpatch,
we can fetch the first line from the patch itself and match it for
a shebang pattern.

There can be cases where the first line is not part of the patch.
For instance: a patch that only changes permissions without
changing any of the file content.
In that case there may be a false positive report but in the end we
will have less false positives as we will be handling some of the
unhandled cases.

Signed-off-by: Ujjwal Kumar <ujjwalkumar0501@gmail.com>
---
Changes in v2:
  - Spelling correction and add example to commit
    message
  - Code style changes
  - Remove unncessary function argument
  - Use non-capturing group in regexp

 scripts/checkpatch.pl | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
index fab38b493cef..7ebbee9c3672 100755
--- a/scripts/checkpatch.pl
+++ b/scripts/checkpatch.pl
@@ -1795,6 +1795,23 @@ sub get_stat_here {
 	return $herectx;
 }

+sub get_shebang {
+	my ($linenr) = @_;
+	my $rawline = "";
+	my $shebang = "";
+
+	$rawline = raw_line($linenr, 3);
+	if (defined($rawline) &&
+	    $rawline =~ /^\@\@ -\d+(?:,\d+)? \+(\d+)(,(\d+))? \@\@/) {
+		if (defined($1) && $1 == 1) {
+			$shebang = raw_line($linenr, 4);
+			$shebang = substr($shebang, 1);
+		}
+	}
+
+	return $shebang;
+}
+
 sub cat_vet {
 	my ($vet) = @_;
 	my ($res, $coded);
@@ -2680,7 +2697,9 @@ sub process {
 # Check for incorrect file permissions
 		if ($line =~ /^new (file )?mode.*[7531]\d{0,2}$/) {
 			my $permhere = $here . "FILE: $realfile\n";
+			my $shebang = get_shebang($linenr);
 			if ($realfile !~ m@scripts/@ &&
+			    $shebang !~ /^#!\s*(?:\/\w)+.*/ &&
 			    $realfile !~ /\.(py|pl|awk|sh)$/) {
 				ERROR("EXECUTE_PERMISSIONS",
 				      "do not set execute permissions for source files\n" . $permhere);

base-commit: 148fdf990dee4efd23c1114811b205de9c966680
--
2.26.2

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
