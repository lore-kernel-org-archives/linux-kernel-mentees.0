Return-Path: <SRS0=TF4G=HP=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_RED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D50E6C433E0
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 13 Feb 2021 13:15:23 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 706B36023B
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 13 Feb 2021 13:15:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 706B36023B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 3CEB986A2B;
	Sat, 13 Feb 2021 13:15:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ntEraY9nPPXz; Sat, 13 Feb 2021 13:15:22 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 2359986A15;
	Sat, 13 Feb 2021 13:15:22 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 0F2BCC0891;
	Sat, 13 Feb 2021 13:15:22 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 5B93BC013A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 13 Feb 2021 13:15:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3B1A46F5B3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 13 Feb 2021 13:15:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id M1tksvXZStIW
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 13 Feb 2021 13:15:20 +0000 (UTC)
Received: by smtp3.osuosl.org (Postfix, from userid 1001)
 id 3BA9C6F5D5; Sat, 13 Feb 2021 13:15:20 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com
 [209.85.210.173])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C36FF6F5DA
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 13 Feb 2021 13:15:18 +0000 (UTC)
Received: by mail-pf1-f173.google.com with SMTP id c11so1320008pfp.10
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 13 Feb 2021 05:15:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=c2aORxbnf+DGbq/G4gpJwPMJHXkfAOgGQl6kIcx8lWY=;
 b=Zw/8jv3uoTx0FwSukqrtymCPtwkwVuUt9kifaufVBs4ohaotDmFlY9Fpdo5eDiBlHO
 yMqKr4RxzpeUuTRo6jtYsxq7dNlu8shBS/u1RJnKCIlCSBCcIfj21Qsro6eYYAQeCqBy
 6kWik8aIRrzZNk2C8sfLfs83Rh4ySVH9joCrqY1nyC2OI4n0MTpePMOchMMngCXQGGnv
 wNB/T3fgzK7QDSHMpn8ES6EtkpBeVZQaCaRuSud5cEGBid6KYLatik132wDpdlSMwL6B
 1GlBQv9xZVGqvWq8mUHWmpbN3Q0KMMacuRL4SfdkKXXm2EtY1JUWJdGTdAufXiuVW7ot
 RUVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=c2aORxbnf+DGbq/G4gpJwPMJHXkfAOgGQl6kIcx8lWY=;
 b=beCjro4FOLp7Q7P51KxCUBIWpSmywuySvIL3TCQ5FdwXZ9hZORsvv6Uf9JKjBUIU42
 /bjGsikRSlazKnAvoDt5L8R0vI2P45PqDer4s5Exv9lq/+qdBcVyJxMgFgErr/oox8Tx
 xzs+O9dhHL7qbupxfxz06TK5x9OrYDmpntsGPbd38YBUXVZmmeb+gCBF6Svpzmw1G7rf
 K2yIuG7qogDPGMEcwspBFPmoMlObC0Q9ph9ceCz28znlWgHhrUlo7TJGJWJgxQv3Cyc0
 5C1p4fO5pDccGZ00DYByIyM0URA1vdPApQHVMRI+rMQtACvalKunw9+AGT+/p8ISJUoz
 X+lw==
X-Gm-Message-State: AOAM530nFZr73nWMi8JXvS6a281Hlp7iL+vMmTfXyoWDbMWkdiQ/CfA0
 MCWpbebliGbVngK1jNxv7n8=
X-Google-Smtp-Source: ABdhPJwe6R5ksjqCQM0kCEASY2V32ehEVTfcap1G8r918bgM/0AxuvhdmBz1pDddbTlFrWqpUiWnUQ==
X-Received: by 2002:a63:ed58:: with SMTP id m24mr7496367pgk.45.1613222118080; 
 Sat, 13 Feb 2021 05:15:18 -0800 (PST)
Received: from localhost.localdomain ([2405:201:9004:6ab4:5c97:80e6:be35:2e49])
 by smtp.gmail.com with ESMTPSA id p11sm833533pjb.3.2021.02.13.05.15.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 13 Feb 2021 05:15:17 -0800 (PST)
From: Dwaipayan Ray <dwaipayanray1@gmail.com>
To: joe@perches.com
Date: Sat, 13 Feb 2021 18:45:11 +0530
Message-Id: <20210213131513.51386-2-dwaipayanray1@gmail.com>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210213131513.51386-1-dwaipayanray1@gmail.com>
References: <20210213131513.51386-1-dwaipayanray1@gmail.com>
MIME-Version: 1.0
Cc: Dwaipayan Ray <dwaipayanray1@gmail.com>,
 linux-kernel-mentees@lists.linuxfoundation.org, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org
Subject: [Linux-kernel-mentees] [PATCH RFC v3 1/3] checkpatch: add verbose
	mode
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
test descriptions. The verbose mode is optional and can be enabled
by the flag -v or --verbose.

The test descriptions are parsed from the checkpatch documentation
file at `Documentation/dev-tools/checkpatch.rst`. The test
descriptions in the docs are kept in a fixed format using rst field
lists, an example of which is as follows:

:LINE_SPACING:
  Vertical space is wasted given the limited number of lines an
  editor window can display when multiple blank lines are used.

:MISSING_SIGN_OFF:
  The patch is missing a Signed-off-by line.  A signed-off-by
  line should be added according to Developer's certificate of
  Origin.
  ref: `Documentation/process/submitting-patches.rst`

The verbose descriptions are not shown when the --terse option
is enabled.

Signed-off-by: Dwaipayan Ray <dwaipayanray1@gmail.com>
---
 scripts/checkpatch.pl | 55 ++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 54 insertions(+), 1 deletion(-)

diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
index 9a549b009d2f..062545e68405 100755
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
@@ -198,6 +202,46 @@ if (-f $conf) {
 	unshift(@ARGV, @conf_args) if @conf_args;
 }
 
+sub load_docs {
+	open(my $docs, '<', "$docsfile")
+	    or warn "$P: Can't read the documentation file $docsfile $!\n";
+
+	my $type = '';
+	my $desc = '';
+	my $in_desc = 0;
+
+	while (<$docs>) {
+		chomp;
+		my $line = $_;
+		$line =~ s/\s+$//;
+
+		if ($line =~ /^\:(.+)\:$/) {
+			if ($desc ne '') {
+				$verbose_messages{$type} = trim($desc);
+			}
+			$type = $1;
+			$desc = '';
+			$in_desc = 1;
+		} elsif ($in_desc) {
+			if ($line =~ /^(?:\s{2,}|$)/) {
+				$line =~ s/^\s{2}//;
+				$desc .= $line;
+				$desc .= "\n";
+			} else {
+				$verbose_messages{$type} = trim($desc);
+				$type = '';
+				$desc = '';
+				$in_desc = 0;
+			}
+		}
+	}
+
+	if ($desc ne '') {
+		$verbose_messages{$type} = trim($desc);
+	}
+	close($docs);
+}
+
 # Perl's Getopt::Long allows options to take optional arguments after a space.
 # Prevent --color by itself from consuming other arguments
 foreach (@ARGV) {
@@ -208,6 +252,7 @@ foreach (@ARGV) {
 
 GetOptions(
 	'q|quiet+'	=> \$quiet,
+	'v|verbose!'	=> \$verbose,
 	'tree!'		=> \$tree,
 	'signoff!'	=> \$chk_signoff,
 	'patch!'	=> \$chk_patch,
@@ -249,6 +294,8 @@ help(0) if ($help);
 
 list_types(0) if ($list_types);
 
+load_docs() if ($verbose && !$terse);
+
 $fix = 1 if ($fix_inplace);
 $check_orig = $check;
 
@@ -2209,7 +2256,13 @@ sub report {
 		splice(@lines, 1, 1);
 		$output = join("\n", @lines);
 	}
-	$output = (split('\n', $output))[0] . "\n" if ($terse);
+
+	if ($terse) {
+		$output = (split('\n', $output))[0] . "\n";
+	} elsif ($verbose &&
+		 exists $verbose_messages{$type}) {
+		$output .= $verbose_messages{$type} . "\n\n";
+	}
 
 	push(our @report, $output);
 
-- 
2.30.0

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
