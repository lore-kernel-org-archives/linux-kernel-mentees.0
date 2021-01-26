Return-Path: <SRS0=tq4P=G5=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A75D5C433E0
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 26 Jan 2021 18:35:28 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3E1322224C
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 26 Jan 2021 18:35:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3E1322224C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id DEAA120479;
	Tue, 26 Jan 2021 18:35:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hCIZqJQ+IIhL; Tue, 26 Jan 2021 18:35:26 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id C60C82044B;
	Tue, 26 Jan 2021 18:35:26 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id ADE02C0FA7;
	Tue, 26 Jan 2021 18:35:26 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 74C81C013A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 26 Jan 2021 18:35:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 63F4A84D11
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 26 Jan 2021 18:35:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cmKuNm36fpcN
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 26 Jan 2021 18:35:24 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com
 [209.85.216.45])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id D72C884CEB
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 26 Jan 2021 18:35:24 +0000 (UTC)
Received: by mail-pj1-f45.google.com with SMTP id kx7so2508895pjb.2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 26 Jan 2021 10:35:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=/Y7EVk9xYB/OdcSWrB6K91mdtgcHZiUbhRZDgI757no=;
 b=loJlDC4p9JweZZqCuFnQHXvp24/jhCq23uCDUxOfX866ObxCwzlgUnxiTWOj4x1Q6Y
 E0esAO/5WfYT9UHPYjUSaa3nSykMa0kdOuCpV0PttF2GwXDf2DQnWVvZTuDKZ6s7g8Bs
 ARbNqBxGOvVAu3+mv+mOwo3EE6KazgLWARJlCq+QA0zpgCPqF1nJ//VgRJ0zPMVOmwrt
 wCoJ0zF9nzIEa//znUUUPQlQk8yUZSB3RFMzgw0hMIiFyWK5Dr5cXrE7zBxWbobNw+VE
 GP/uBEZqmYuj75hv0sSdfVDtNzOSTPAZS7D40JupQ7X5RXtclA/RYloHcZX+DblAfNsr
 fw7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=/Y7EVk9xYB/OdcSWrB6K91mdtgcHZiUbhRZDgI757no=;
 b=jJwLqwZI14pUXXCIqRjcyKifRGggb5hNMvIU9HY5MiLcR+9T3bcDOCi6Q7+VsdR8na
 R8TjwstCtYkyuvzSAOHxF0Qi+hV8G/3LoTkgRoVZVQixLXb45l/DjLgysBJ6sNY2lzlI
 qnogM+hmi5r9WYjF8bAOOns4NbgvMuflNzoJggvisb9UhQkXhpVv4IxW9IgBv/ix2IZI
 MmuRRhebDBvTmErNw/MnMTYjPt+VOz2SkI+GKiQTbpffNQLNYLZ25yxDVy9f68mZvHHv
 Avck9ylb4Hjaykj+A4YAjTR3UxhxHMbEu9pzBIEHtdH/VVbMKl/mo40CXLcCkjtaAyWH
 j/iw==
X-Gm-Message-State: AOAM530dlljCNMJhuWgWlNBg1ZQENIahAj0RoimeWCvpMPv3t31mjfI7
 3YGR+A1qz0nWVyCRYm6S7io=
X-Google-Smtp-Source: ABdhPJw+QQd+ToaoRPeZQLXsE2/9vveXqjDQuQBEb1zUy5nJZF+o5ycl7pZ69Zm9KscNSZLE6q3d8g==
X-Received: by 2002:a17:902:f54e:b029:de:19f9:c45f with SMTP id
 h14-20020a170902f54eb02900de19f9c45fmr7448437plf.48.1611686124314; 
 Tue, 26 Jan 2021 10:35:24 -0800 (PST)
Received: from localhost.localdomain ([49.37.2.129])
 by smtp.gmail.com with ESMTPSA id a31sm19713654pgb.93.2021.01.26.10.35.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Jan 2021 10:35:23 -0800 (PST)
From: Dwaipayan Ray <dwaipayanray1@gmail.com>
To: joe@perches.com
Date: Wed, 27 Jan 2021 00:05:19 +0530
Message-Id: <20210126183521.26535-2-dwaipayanray1@gmail.com>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210126183521.26535-1-dwaipayanray1@gmail.com>
References: <20210126183521.26535-1-dwaipayanray1@gmail.com>
MIME-Version: 1.0
Cc: linux-kernel-mentees@lists.linuxfoundation.org,
 linux-kernel@vger.kernel.org, Dwaipayan Ray <dwaipayanray1@gmail.com>
Subject: [Linux-kernel-mentees] [PATCH RFC 1/3] checkpatch: add verbose mode
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

Add a new verbose mode to checkpatch.pl to emit additional verbose
test descriptions.

The verbose mode is optional and can be enabled by the flag
--verbose.

The test descriptions are itself loaded from the checkpatch
documentation file at Documentation/dev-tools/checkpatch.rst.
The descriptions in the documentation are in a specified format
enclosed within .. CHECKPATCH_START and .. CHECKPATCH_END labels.

This serves a dual purpose as an external documentation to checkpatch
as well as enables flawless integration of the verbose mode.

A subtle example of the format is as follows:

Documentation/dev-tools/checkpatch.rst:

.. CHECKPATCH_START
TYPE_1

  Description line 1
  Description line 2,
  ...

TYPE_2

  Description line 1,
  etc.

.. CHECKPATCH_END

This file is parsed by checkpatch once the --verbose option
is specified. Verbose descriptions are not output when
the --terse option is specified.

Signed-off-by: Dwaipayan Ray <dwaipayanray1@gmail.com>
---
 scripts/checkpatch.pl | 55 +++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 55 insertions(+)

diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
index 7a323ca8a177..48eeb01074d5 100755
--- a/scripts/checkpatch.pl
+++ b/scripts/checkpatch.pl
@@ -23,6 +23,8 @@ my $V = '0.32';
 use Getopt::Long qw(:config no_auto_abbrev);
 
 my $quiet = 0;
+my $verbose = 0;
+my %verbose_messages = ();
 my $tree = 1;
 my $chk_signoff = 1;
 my $chk_patch = 1;
@@ -61,6 +63,7 @@ my $spelling_file = "$D/spelling.txt";
 my $codespell = 0;
 my $codespellfile = "/usr/share/codespell/dictionary.txt";
 my $conststructsfile = "$D/const_structs.checkpatch";
+my $docsfile = "$D/../Documentation/dev-tools/checkpatch.rst";
 my $typedefsfile;
 my $color = "auto";
 my $allow_c99_comments = 1; # Can be overridden by --ignore C99_COMMENT_TOLERANCE
@@ -78,6 +81,7 @@ Version: $V
 
 Options:
   -q, --quiet                quiet
+  -v, --verbose              verbose mode
   --no-tree                  run without a kernel tree
   --no-signoff               do not check for 'Signed-off-by' line
   --patch                    treat FILE as patchfile (default)
@@ -198,6 +202,49 @@ if (-f $conf) {
 	unshift(@ARGV, @conf_args) if @conf_args;
 }
 
+sub load_docs {
+	open(my $docs, '<', "$docsfile")
+	    or warn "$P: Can't read the documentation file $docsfile $!\n";
+
+	my @lines = ();
+	my $incl = 0;
+	while (<$docs>) {
+		my $line = $_;
+
+		if ($line =~ /\Q.. CHECKPATCH_START\E/) {
+			$incl++;
+			next;
+		} elsif ($line =~ /\Q.. CHECKPATCH_END\E/) {
+			$incl--;
+			next;
+		}
+		next if ($incl < 1);
+
+		$line =~ s/\s*\n?$//g;
+		push (@lines, $line);
+	}
+	close($docs);
+
+	my $linenr = 0;
+	my $cnt = scalar @lines;
+	while ($linenr < $cnt) {
+		while ($linenr < $cnt && $lines[$linenr] !~ /^[^\s]+/) {
+			$linenr++;
+		}
+		last if ($linenr >= $cnt);
+
+		my $message = '';
+		my $type = $lines[$linenr++];
+
+		while ($linenr < $cnt && $lines[$linenr] !~ /^[^\s]+/) {
+			$message .= trim($lines[$linenr++]) . "\n";
+		}
+
+		$message = trim($message);
+		$verbose_messages{$type} = $message;
+	}
+}
+
 # Perl's Getopt::Long allows options to take optional arguments after a space.
 # Prevent --color by itself from consuming other arguments
 foreach (@ARGV) {
@@ -208,6 +255,7 @@ foreach (@ARGV) {
 
 GetOptions(
 	'q|quiet+'	=> \$quiet,
+	'v|verbose!'	=> \$verbose,
 	'tree!'		=> \$tree,
 	'signoff!'	=> \$chk_signoff,
 	'patch!'	=> \$chk_patch,
@@ -249,6 +297,8 @@ help(0) if ($help);
 
 list_types(0) if ($list_types);
 
+load_docs() if ($verbose && !$terse);
+
 $fix = 1 if ($fix_inplace);
 $check_orig = $check;
 
@@ -2185,6 +2235,11 @@ sub report {
 		splice(@lines, 1, 1);
 		$output = join("\n", @lines);
 	}
+
+	if ($verbose && !$terse &&
+	    exists $verbose_messages{$type}) {
+		$output .= $verbose_messages{$type} . "\n\n";
+	}
 	$output = (split('\n', $output))[0] . "\n" if ($terse);
 
 	push(our @report, $output);
-- 
2.30.0

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
