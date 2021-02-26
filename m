Return-Path: <SRS0=B4mk=H4=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3D11C433DB
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 26 Feb 2021 09:38:45 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3ABE564EF0
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 26 Feb 2021 09:38:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3ABE564EF0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 99FD88417C;
	Fri, 26 Feb 2021 09:38:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PobWvP45O4b8; Fri, 26 Feb 2021 09:38:43 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7240884165;
	Fri, 26 Feb 2021 09:38:43 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 4FF27C000B;
	Fri, 26 Feb 2021 09:38:43 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 3F544C0001
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 26 Feb 2021 09:38:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3C2886F6CA
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 26 Feb 2021 09:38:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yWVXBzvyby3u
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 26 Feb 2021 09:38:41 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com
 [209.85.214.178])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 6E4D16F679
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 26 Feb 2021 09:38:41 +0000 (UTC)
Received: by mail-pl1-f178.google.com with SMTP id 17so5001798pli.10
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 26 Feb 2021 01:38:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=V8EEUIDrN8UWVFTUfP1Df0MDXCQYR+fu8HKWkSjVtwI=;
 b=EmkfzG5JEWgo/nd6OLBPnotWprmzJpnt+wwskPKmJ1nsg72IRgfJmrDDv1dhs0kqaY
 JwP3UrhIEN5ucsLKrysRZMyj/KhYRzPbrcTv/rqV3NLaJENZYQnTMIzd9jxnbpKANwWQ
 jGsRjBq3J7gM7lirDCmEK7SPpUA9tCaM2zFBZcAusF++Cf2Dq/P2cVIj+ut7hNoSNkOJ
 H87iBqzxvsLXAsOvnEzlaQ48BQphG+9ZeDUZS7VRaiKyWV/DNnICxuJXWhU1osFDNhnb
 tnWZuEVAJnt8U6D5r6NAEeciv/K2FyRyEFDhp+gmtGFUciCav107AIxese3WJj1njKBu
 LA0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=V8EEUIDrN8UWVFTUfP1Df0MDXCQYR+fu8HKWkSjVtwI=;
 b=o687ql56sWdXTfneMVjiMu+6NOmfS57zxky5xm2V1AEHZL2EXOzAAA+fELks778lR8
 rR+gEbFPOiBMi11ZMI7zHDGonxRpDKmxj5e3dSjJQichN6akfyh4RFTic2wsq+L8U85r
 3PS1vcHAg/cHmNxfpK+R8vcFAIvN2JSOuMQO9/jO+kga+wZSDsO61bGHkI1fH3SyniiL
 TQUwOVNdHh3u13XmdczTXBo7Jbs5sDq9RwBxFFVIZXmcIVMzJAB4Xc+1rJpS+E56VZ0b
 3NTH7oxHnCokf9uvjBkmj/2pOYe9uNFIB+uP1iSktemQVheDZPtoEzpsY6+qbjoxe7S7
 WQpA==
X-Gm-Message-State: AOAM530v35ABQcqHFDCvbtCFKeMejCIA9m2nF2ZNJYrDk2RVUZm7PPEd
 EFhCyWmi3OrGU4VWt55j9Ts=
X-Google-Smtp-Source: ABdhPJy+KpCuRTYdUpEL1Cd8ESfOydS5uHaJE8dnG3yJBTtJ9XCz6lancMXNhzMPfV/69ZiWTxlZFg==
X-Received: by 2002:a17:902:7787:b029:e4:571f:4485 with SMTP id
 o7-20020a1709027787b02900e4571f4485mr2346789pll.30.1614332320661; 
 Fri, 26 Feb 2021 01:38:40 -0800 (PST)
Received: from localhost.localdomain ([2405:201:9004:6adb:2468:cd7e:b0b6:7857])
 by smtp.gmail.com with ESMTPSA id n1sm8548833pgi.78.2021.02.26.01.38.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Feb 2021 01:38:40 -0800 (PST)
From: Dwaipayan Ray <dwaipayanray1@gmail.com>
To: joe@perches.com,
	corbet@lwn.net,
	mchehab@kernel.org
Subject: [PATCH v8 2/3] checkpatch: add verbose mode
Date: Fri, 26 Feb 2021 15:08:26 +0530
Message-Id: <20210226093827.12700-3-dwaipayanray1@gmail.com>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210226093827.12700-1-dwaipayanray1@gmail.com>
References: <20210226093827.12700-1-dwaipayanray1@gmail.com>
MIME-Version: 1.0
Cc: Dwaipayan Ray <dwaipayanray1@gmail.com>,
 linux-kernel-mentees@lists.linuxfoundation.org, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org
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
descriptions in the docs are kept in a fixed format grouped by
usage. Some examples of this format are:

  **LINE_SPACING**
    Vertical space is wasted given the limited number of lines an
    editor window can display when multiple blank lines are used.

  **MISSING_SIGN_OFF**
    The patch is missing a Signed-off-by line.  A signed-off-by
    line should be added according to Developer's certificate of
    Origin.

To avoid lengthy output, the verbose description is printed only
for the first instance of a particular message type.

The --verbose option cannot be used along with the --terse option.

Verbose mode can be used with the --list-types option.
The --list-types output also supports color coding now.

Signed-off-by: Dwaipayan Ray <dwaipayanray1@gmail.com>
---
 scripts/checkpatch.pl | 133 +++++++++++++++++++++++++++++++++++-------
 1 file changed, 113 insertions(+), 20 deletions(-)

diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
index df8b23dc1eb0..f42e5ba16d9b 100755
--- a/scripts/checkpatch.pl
+++ b/scripts/checkpatch.pl
@@ -23,6 +23,9 @@ my $V = '0.32';
 use Getopt::Long qw(:config no_auto_abbrev);
 
 my $quiet = 0;
+my $verbose = 0;
+my %verbose_messages = ();
+my %verbose_emitted = ();
 my $tree = 1;
 my $chk_signoff = 1;
 my $chk_patch = 1;
@@ -61,6 +64,7 @@ my $spelling_file = "$D/spelling.txt";
 my $codespell = 0;
 my $codespellfile = "/usr/share/codespell/dictionary.txt";
 my $conststructsfile = "$D/const_structs.checkpatch";
+my $docsfile = "$D/../Documentation/dev-tools/checkpatch.rst";
 my $typedefsfile;
 my $color = "auto";
 my $allow_c99_comments = 1; # Can be overridden by --ignore C99_COMMENT_TOLERANCE
@@ -78,6 +82,7 @@ Version: $V
 
 Options:
   -q, --quiet                quiet
+  -v, --verbose              verbose mode
   --no-tree                  run without a kernel tree
   --no-signoff               do not check for 'Signed-off-by' line
   --patch                    treat FILE as patchfile (default)
@@ -158,15 +163,51 @@ sub list_types {
 	my $text = <$script>;
 	close($script);
 
-	my @types = ();
+	my %types = ();
 	# Also catch when type or level is passed through a variable
-	for ($text =~ /(?:(?:\bCHK|\bWARN|\bERROR|&\{\$msg_level})\s*\(|\$msg_type\s*=)\s*"([^"]+)"/g) {
-		push (@types, $_);
+	while ($text =~ /(?:(\bCHK|\bWARN|\bERROR|&\{\$msg_level})\s*\(|\$msg_type\s*=)\s*"([^"]+)"/g) {
+		if (defined($1)) {
+			if (exists($types{$2})) {
+				$types{$2} .= ",$1" if ($types{$2} ne $1);
+			} else {
+				$types{$2} = $1;
+			}
+		} else {
+			$types{$2} = "UNDETERMINED";
+		}
 	}
-	@types = sort(uniq(@types));
+
 	print("#\tMessage type\n\n");
-	foreach my $type (@types) {
+	if ($color) {
+		print(" ( Color coding: ");
+		print(RED . "ERROR" . RESET);
+		print(" | ");
+		print(YELLOW . "WARNING" . RESET);
+		print(" | ");
+		print(GREEN . "CHECK" . RESET);
+		print(" | ");
+		print("Multiple levels / Undetermined");
+		print(" )\n\n");
+	}
+
+	foreach my $type (sort keys %types) {
+		my $orig_type = $type;
+		if ($color) {
+			my $level = $types{$type};
+			if ($level eq "ERROR") {
+				$type = RED . $type . RESET;
+			} elsif ($level eq "WARN") {
+				$type = YELLOW . $type . RESET;
+			} elsif ($level eq "CHK") {
+				$type = GREEN . $type . RESET;
+			}
+		}
 		print(++$count . "\t" . $type . "\n");
+		if ($verbose && exists($verbose_messages{$orig_type})) {
+			my $message = $verbose_messages{$orig_type};
+			$message =~ s/\n/\n\t/g;
+			print("\t" . $message . "\n\n");
+		}
 	}
 
 	exit($exitcode);
@@ -198,6 +239,46 @@ if (-f $conf) {
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
+		if ($line =~ /^\s*\*\*(.+)\*\*$/) {
+			if ($desc ne '') {
+				$verbose_messages{$type} = trim($desc);
+			}
+			$type = $1;
+			$desc = '';
+			$in_desc = 1;
+		} elsif ($in_desc) {
+			if ($line =~ /^(?:\s{4,}|$)/) {
+				$line =~ s/^\s{4}//;
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
@@ -208,6 +289,7 @@ foreach (@ARGV) {
 
 GetOptions(
 	'q|quiet+'	=> \$quiet,
+	'v|verbose!'	=> \$verbose,
 	'tree!'		=> \$tree,
 	'signoff!'	=> \$chk_signoff,
 	'patch!'	=> \$chk_patch,
@@ -247,13 +329,27 @@ GetOptions(
 
 help(0) if ($help);
 
+die "$P: --git cannot be used with --file or --fix\n" if ($git && ($file || $fix));
+die "$P: --verbose cannot be used with --terse\n" if ($verbose && $terse);
+
+if ($color =~ /^[01]$/) {
+	$color = !$color;
+} elsif ($color =~ /^always$/i) {
+	$color = 1;
+} elsif ($color =~ /^never$/i) {
+	$color = 0;
+} elsif ($color =~ /^auto$/i) {
+	$color = (-t STDOUT);
+} else {
+	die "$P: Invalid color mode: $color\n";
+}
+
+load_docs() if ($verbose);
 list_types(0) if ($list_types);
 
 $fix = 1 if ($fix_inplace);
 $check_orig = $check;
 
-die "$P: --git cannot be used with --file or --fix\n" if ($git && ($file || $fix));
-
 my $exit = 0;
 
 my $perl_version_ok = 1;
@@ -268,18 +364,6 @@ if ($#ARGV < 0) {
 	push(@ARGV, '-');
 }
 
-if ($color =~ /^[01]$/) {
-	$color = !$color;
-} elsif ($color =~ /^always$/i) {
-	$color = 1;
-} elsif ($color =~ /^never$/i) {
-	$color = 0;
-} elsif ($color =~ /^auto$/i) {
-	$color = (-t STDOUT);
-} else {
-	die "$P: Invalid color mode: $color\n";
-}
-
 # skip TAB size 1 to avoid additional checks on $tabsize - 1
 die "$P: Invalid TAB size: $tabsize\n" if ($tabsize < 2);
 
@@ -2209,7 +2293,16 @@ sub report {
 		splice(@lines, 1, 1);
 		$output = join("\n", @lines);
 	}
-	$output = (split('\n', $output))[0] . "\n" if ($terse);
+
+	if ($terse) {
+		$output = (split('\n', $output))[0] . "\n";
+	}
+
+	if ($verbose && exists($verbose_messages{$type}) &&
+	    !exists($verbose_emitted{$type})) {
+		$output .= $verbose_messages{$type} . "\n\n";
+		$verbose_emitted{$type} = 1;
+	}
 
 	push(our @report, $output);
 
-- 
2.30.0

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
