Return-Path: <SRS0=Swos=DS=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0411BC433DF
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 11 Oct 2020 16:23:27 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5A6B421655
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 11 Oct 2020 16:23:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hWYuf4ib"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5A6B421655
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 16E53861C5;
	Sun, 11 Oct 2020 16:23:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Ne01NDv435wt; Sun, 11 Oct 2020 16:23:26 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 5CBAE85F57;
	Sun, 11 Oct 2020 16:23:26 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 44122C0052;
	Sun, 11 Oct 2020 16:23:26 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 77276C0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 11 Oct 2020 16:23:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 6BB3687633
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 11 Oct 2020 16:23:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hOuE5OqGo5RV
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 11 Oct 2020 16:23:24 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pf1-f195.google.com (mail-pf1-f195.google.com
 [209.85.210.195])
 by hemlock.osuosl.org (Postfix) with ESMTPS id C83B287565
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 11 Oct 2020 16:23:24 +0000 (UTC)
Received: by mail-pf1-f195.google.com with SMTP id e10so11194656pfj.1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 11 Oct 2020 09:23:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=hYE4ehUKZjXMDekgb4eAM48AV7kkjiDdfxLTJqssxB0=;
 b=hWYuf4ibs/qOWB8VNI5vC+pQ0L+B0mOhgZRvDWtVBF3rjZ+XObro91wffCkMtG+sMR
 as+BPN0iqwjGR3nguD+MZwpYeMdPQLUGPKBWN1TlQKA0+KrEj+WSJbT5GEamuE1RcLql
 EL5mJi3a7Bwle6hwqXZhmDnmKzGXwh1gXRp/lIDwPG4usKSrGjAHY9iQToF8yldATTZX
 ZT91bhWaEgu08Px9uoLS63U8La5gxL4sBqoKSxa8b1AuFpCjNbkn9Pm3TjFaahP8ByXm
 KPam6QrpYkdadtxwx2WI7G0bpSif+aQo/aWtuF/xadGMoNgjfYRh/Wu5J4S3ypXK0ke4
 LE9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=hYE4ehUKZjXMDekgb4eAM48AV7kkjiDdfxLTJqssxB0=;
 b=JZ2p/hhe8ac/uZRWZl7DLMgwY0EAqTQSP9zRTd3+KJEhqmIrrFB98kHPn9sbLQiDev
 QSd954c+49cY45jGQUC8cCHwy/LgwPz8x9ElSutlye1FYjmr/uVyXLy+fe1Vml/6+gS6
 cx3Bhik25P2xmDxxUYrl2oTR2PoSdh7HwG1mi5ucmDWYtGlWi/Q+XqAioTH76hfGiqvP
 Dj8/9ZLLJp7txSWkwIvnw2JychaF528tuvz6Xh2XALeAju9KC76uzrFARV8dn11yiS6e
 2CgLHnPDSUxwQgtnz+/QGNful+qVH77q914mV6jqvblZ/8xyOjQUnmleZimzIii2Htko
 N6tA==
X-Gm-Message-State: AOAM531c75rgrQ6+rRvLFvi18gZ4qkRaVWdHU67XBxeJ94hkGkPrAx/0
 rOR6FUlq9nQ0ThoAZr2ZUp0=
X-Google-Smtp-Source: ABdhPJzPApn0nVTPfpb9jTqndANnWUSpp2xvA+HE4DHbKvM5yMib43oKxHNdpW6JAGSywNKTyqXFhQ==
X-Received: by 2002:a17:90b:e15:: with SMTP id
 ge21mr14715086pjb.188.1602433404146; 
 Sun, 11 Oct 2020 09:23:24 -0700 (PDT)
Received: from localhost.localdomain ([2405:201:a404:280a:90bd:7a49:dcda:1fb1])
 by smtp.gmail.com with ESMTPSA id x9sm16393559pgr.22.2020.10.11.09.23.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 11 Oct 2020 09:23:23 -0700 (PDT)
From: Ujjwal Kumar <ujjwalkumar0501@gmail.com>
To: lukas.bulwahn@gmail.com
Date: Sun, 11 Oct 2020 21:51:25 +0530
Message-Id: <20201011162123.1151215-1-ujjwalkumar0501@gmail.com>
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

checkpatch script checks for invalid EXECUTE_PERMISSIONS on source
files. The script leverages filename extensions and its path in
the repository to decide whether to allow execute permissions on
the file or not.

Based on current check conditions, a perl script file without
'.pl' extension in its filename and not belonging to 'scripts/'
directory is reported as ERROR which is a false-positive.

The script can correctly handle patches with mode changes and
shebang line if shebang is taken into account. So, along with
the current check conditions, adding the shebang check in the
check conditions can improve the reports of the script.

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
