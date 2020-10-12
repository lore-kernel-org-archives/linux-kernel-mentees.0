Return-Path: <SRS0=/ghF=DT=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E358AC43457
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 12 Oct 2020 04:37:06 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 69B072073A
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 12 Oct 2020 04:37:06 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YswAP2QY"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 69B072073A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 22FA6872FA;
	Mon, 12 Oct 2020 04:37:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mTLg0mUaZrhW; Mon, 12 Oct 2020 04:37:05 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id A5F1A87048;
	Mon, 12 Oct 2020 04:37:05 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 89AB4C0052;
	Mon, 12 Oct 2020 04:37:05 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id E4FFCC0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 12 Oct 2020 04:37:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id C69E086FDF
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 12 Oct 2020 04:37:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6owCE-UX+ZXj
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 12 Oct 2020 04:37:03 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pl1-f194.google.com (mail-pl1-f194.google.com
 [209.85.214.194])
 by hemlock.osuosl.org (Postfix) with ESMTPS id AC72186F76
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 12 Oct 2020 04:37:03 +0000 (UTC)
Received: by mail-pl1-f194.google.com with SMTP id y1so4391670plp.6
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 11 Oct 2020 21:37:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=bsFYzq0lCYhhMLKMuuft1rzUmSy8vxy3rd9WcZxMfyU=;
 b=YswAP2QYvhkY79Qtj2/8HfOWF2vJON/KZRVDdsehjzEAdP87/geOIXXLRUTmuueJp0
 Tua4D0bka5xSuPGdvQC9/wxn4A8waS/pr/CYdV5/yAWKMP9s3R9Wbe7711OdDW5dVjgg
 mUI1hdsVEsOYkZ8ASf3seyqzlxrBPTch+f018szchFiLseoQq0wIonVJLVPLvJ0WrC7y
 XyWATaks7zPEb1kgvFlCWk4qv/7jvqsBThoxCLXQ183B+1vGP9qHq+mOK+uBh1/XFeLQ
 hZ2AL+wg6HrcbCxKGQEbOKR7P07mtC9PGzPb01Wfn7W9GI7DjMaxWyo4lmx9RJrjlOJP
 Rt6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=bsFYzq0lCYhhMLKMuuft1rzUmSy8vxy3rd9WcZxMfyU=;
 b=nrWyIVHN/5Gehvui+ZQGx5PbNfNrHuBaxCNbHq6xr2YYalDT1ehheTRva02ZKdiDeo
 aejKDsfIHLcm/ZYgtabJRjgLAHsOduQ9LMPwkCLtSw66J0wgp2/bMwoPmXr4tHEghO9x
 59nz1lsp9PMUoi0Ps2pLk6RmVkiCS6SUMy1s5mF8aDTgqlS0NrOF5j+v+bUoLdyb2qR1
 3bNLcXNtGiRVFlaj5Fmpb4wyMYZMxZXVWowM+Vmj6e8vmsL782bkDAW/wBQ5tHr3xUW8
 VqMoJK24KQ3HRX9dvr/VdZo5Xmp6tXmSQEmYnr+kL1WIiZB5b0nmqb/RPaftZxRAhpaa
 jBfA==
X-Gm-Message-State: AOAM5326NeTrz9nhEbsEZ6BoIkXql0Fix0Du++Ms1CNDX+iKf1h59+o9
 bGUXl8iMbZgDjmta2zHNyZw=
X-Google-Smtp-Source: ABdhPJzxnMoOs4nF4edtn84p0J+vgSuBVovlfiylgYtXLOKTbLJrIrVKcrYu6Zz4kNmCtGxFasX3Pg==
X-Received: by 2002:a17:902:b488:b029:d4:dbdf:c6a5 with SMTP id
 y8-20020a170902b488b02900d4dbdfc6a5mr3640654plr.42.1602477423038; 
 Sun, 11 Oct 2020 21:37:03 -0700 (PDT)
Received: from localhost.localdomain ([2405:201:a404:280a:90bd:7a49:dcda:1fb1])
 by smtp.gmail.com with ESMTPSA id hg15sm1268676pjb.39.2020.10.11.21.36.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 11 Oct 2020 21:37:02 -0700 (PDT)
From: Ujjwal Kumar <ujjwalkumar0501@gmail.com>
To: Lukas Bulwahn <lukas.bulwahn@gmail.com>,
	Joe Perches <joe@perches.com>
Date: Mon, 12 Oct 2020 10:06:12 +0530
Message-Id: <20201012043611.1189568-1-ujjwalkumar0501@gmail.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Cc: linux-kernel-mentees@lists.linuxfoundation.org,
 Ujjwal Kumar <ujjwalkumar0501@gmail.com>
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
