Return-Path: <SRS0=/ghF=DT=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97EDEC43457
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 12 Oct 2020 05:49:58 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1285E2078E
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 12 Oct 2020 05:49:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UxO+H5vx"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1285E2078E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 635F9204DE;
	Mon, 12 Oct 2020 05:49:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FgXVJqRoRLIm; Mon, 12 Oct 2020 05:49:56 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 7A611204A9;
	Mon, 12 Oct 2020 05:49:56 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 5E705C07FF;
	Mon, 12 Oct 2020 05:49:56 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 476A9C0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 12 Oct 2020 05:49:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 355CA87371
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 12 Oct 2020 05:49:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6FzFhKIoeI7b
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 12 Oct 2020 05:49:54 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pf1-f194.google.com (mail-pf1-f194.google.com
 [209.85.210.194])
 by hemlock.osuosl.org (Postfix) with ESMTPS id B6B1587369
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 12 Oct 2020 05:49:54 +0000 (UTC)
Received: by mail-pf1-f194.google.com with SMTP id d1so4116306pfc.0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 11 Oct 2020 22:49:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=YNSSFlxS0Jw+cQsOnsPziRX11XM/7DkrUT0mheiLgeg=;
 b=UxO+H5vxXv1UTXIGMrvzkl02w0Yb9KAHirjKDjdQknMbKG6FU+5YpsIBI1L8mr53yV
 M/U0pBQSB6qQeSLE+GndEwyb96NpSd4soS+upP7eNqZ6A3xpaTVDlZC0DxOzNsfSZENT
 p5C4iTZYMqyXbswhyx0bDo2Xw7adm5takwZkveJZjs9cpAqiD01UHaoyQQeBRQfhn1NJ
 BxPy5WDymd0oovB4QiVNYQ7M0yk2Q1caxt9FkulD1VcDGwNpLp75uGSk8udkeK8xY5C8
 aLtHt23bkwjcINHazDK/tjoJEs/RVQR+Feymy2NMTEgnHWy3CVcp9TIwlBM1p8qdOJ/T
 5rIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=YNSSFlxS0Jw+cQsOnsPziRX11XM/7DkrUT0mheiLgeg=;
 b=BT7TiAceuWQJtie3i+43GxgTU//IcM4qMffi9oLw8MYHF17ivWheBcOUXE6YRXul06
 FDCneoIKBjZ4+Kv60g8LBGon2gscI+hZlY6afMlXvCrrRVwlulHDpJmhwr+No5LHaEqs
 qS+edCDSyNi2wwGgVKTeqpM2Y7AKb0rYIG4xZIOuKBcw7KpJBtXJvts/KNhcSeCFxiB5
 OUaseyhoWCnmyb1Wx8pw7OBelq0RTYsgTpp1bhSUEkM+52tfNanDRvvHauuh1ZRT2iov
 vHpmnLWEc/o9Xa3aD9DFdp7FZRb3GNZequMatttR6BRNtRfy+eJY753D8vtq6tLv/55U
 l5ww==
X-Gm-Message-State: AOAM530wAP2tYPBJy+XJagBJLPByxWoYy6Qvowq9sKe2ku2ia/ZROmoR
 R6cwo1iHaxBX3DIZk/JbhYU=
X-Google-Smtp-Source: ABdhPJxVNBvAUs35rhIwBsJ1BkwyFph/YswmvpDEQ2quvwdYDVU55XDcPtHih9eoLL/wxaU2HtPudw==
X-Received: by 2002:a17:90b:3103:: with SMTP id
 gc3mr18423521pjb.158.1602481794088; 
 Sun, 11 Oct 2020 22:49:54 -0700 (PDT)
Received: from localhost.localdomain ([2405:201:a404:280a:90bd:7a49:dcda:1fb1])
 by smtp.gmail.com with ESMTPSA id ck21sm21759040pjb.56.2020.10.11.22.49.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 11 Oct 2020 22:49:52 -0700 (PDT)
From: Ujjwal Kumar <ujjwalkumar0501@gmail.com>
To: Lukas Bulwahn <lukas.bulwahn@gmail.com>,
	Joe Perches <joe@perches.com>
Date: Mon, 12 Oct 2020 11:19:43 +0530
Message-Id: <20201012054943.1196031-1-ujjwalkumar0501@gmail.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Cc: linux-kernel-mentees@lists.linuxfoundation.org,
 linux-kernel@vger.kernel.org, Ujjwal Kumar <ujjwalkumar0501@gmail.com>
Subject: [Linux-kernel-mentees] [RFC PATCH] checkpatch: add shebang check to
	EXECUTE_PERMISSIONS
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
which is a false-positive.

Adding a shebang check along with current conditions will make
the check more generalised and improve checkpatch reports.
To do so, without breaking the core design decision of checkpatch,
we can fetch the first line from the patch itself and match it for
a shebang pattern.

There can be cases where the first line is not part of the patch.
In that case there may be a false-positive report but in the end we
will have less false-positives as we will be handling some of the
unhandled cases.

Signed-off-by: Ujjwal Kumar <ujjwalkumar0501@gmail.com>
---
Apologies, I forgot to include linux-kernel@vger.kernel.org so I'm
now resending.

 scripts/checkpatch.pl | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
index fab38b493cef..e596d30794bf 100755
--- a/scripts/checkpatch.pl
+++ b/scripts/checkpatch.pl
@@ -1795,6 +1795,23 @@ sub get_stat_here {
 	return $herectx;
 }

+sub get_shebang {
+	my ($linenr, $realfile) = @_;
+	my $rawline = "";
+	my $shebang = "";
+
+	$rawline = raw_line($linenr, 3);
+	if (defined $rawline &&
+		$rawline =~ /^\@\@ -\d+(?:,\d+)? \+(\d+)(,(\d+))? \@\@/) {
+		if (defined $1 && $1 == 1) {
+			$shebang = raw_line($linenr, 4);
+			$shebang = substr $shebang, 1;
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
+			my $shebang = get_shebang($linenr, $realfile);
 			if ($realfile !~ m@scripts/@ &&
+			    $shebang !~ /^#!\s*(\/\w)+.*/ &&
 			    $realfile !~ /\.(py|pl|awk|sh)$/) {
 				ERROR("EXECUTE_PERMISSIONS",
 				      "do not set execute permissions for source files\n" . $permhere);

base-commit: d67bc7812221606e1886620a357b13f906814af7
--
2.26.2

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
