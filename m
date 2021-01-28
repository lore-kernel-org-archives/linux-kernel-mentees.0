Return-Path: <SRS0=VniB=G7=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49C5AC433E0
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 28 Jan 2021 14:38:16 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D383964DDC
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 28 Jan 2021 14:38:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D383964DDC
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 5EF2A20414;
	Thu, 28 Jan 2021 14:38:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id w2SRamlnGF2c; Thu, 28 Jan 2021 14:38:12 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id B5D4421503;
	Thu, 28 Jan 2021 14:38:12 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id A42BEC0FA8;
	Thu, 28 Jan 2021 14:38:12 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 4310AC08A1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 28 Jan 2021 14:38:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 2B5A92E0DF
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 28 Jan 2021 14:38:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jXBuPpds9rYF
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 28 Jan 2021 14:38:06 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com
 [209.85.216.50])
 by silver.osuosl.org (Postfix) with ESMTPS id 0FFB121503
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 28 Jan 2021 14:38:06 +0000 (UTC)
Received: by mail-pj1-f50.google.com with SMTP id kx7so3968289pjb.2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 28 Jan 2021 06:38:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=e+eyDPRdJhZxxJdOiumoXFsr/6qKDBUjP/60ZOGxnOc=;
 b=ii36kCLCHnt3TutN31jHxg/8gwjcze3fPnuGU41Ln+1G0N5aGVKlRoaKuSGiLP/FIr
 kegSEbtPASb0w7dxTY8+WmtQ7k1q3oUfbnx2qdZeu5AygjJ6ShHSwjaKV/S1aP9h+ccS
 y5Cm3cQWpIohCASeZhTi009mv4mRUOVpWqEJw/zu1jTiaNBXuhWjcYK6gWFt1dmNzkU0
 R7dZxuCZK6Urci4lQ9GxwTjJdV+iVye9KG2UG5avW8zOpVEktaOOUjVKmK1w1nLum26G
 M1ezQlmsyIzmj1IqQ7Q0MJgZ5YZ1diBxEnHlQ1ZEVx2EVo7BXxL/GicKyPwhaOc+R6cz
 QYLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=e+eyDPRdJhZxxJdOiumoXFsr/6qKDBUjP/60ZOGxnOc=;
 b=cLoGl5nWUjFWcRAoiDdYkhikuscTGvqpmLxIF0SKchKeCM9USMpvyVtz0SpGwRCEHa
 BAHHUHRFPfp4WCkfCCfmDNnqZ2wxR3ZyH2OCnFk91DHBP6eHC99uw3ZZhZNmDU9pSWcK
 wDZb6PKMaiZNNJh3DioguMxG3l/+Xq308d7lr4Guqi72IdfV16kow8Al8aO1n9q8W6xF
 gOEd9xeQTd3vy7TOPAZ0i1k/7ifqBeQUm5UeX/kU47Wr9TaK278JauOkq0DvRrTI7r0K
 MDNU7LaEoRDztuR13Pu54xWcxC/uMJebF1kvfoM8P2dFl5CtfeNeeDmcuFENVvoXmhzP
 tHIA==
X-Gm-Message-State: AOAM53030lYlOsnwOWk/33RWvszC3qDpHJxwL+mMs8SKtbaoGpFqE4m3
 1KkMDJSXs6cCY5xTJjywCS8=
X-Google-Smtp-Source: ABdhPJx9QBqHgCNIDl+wrmU8+QMyW9ZXDw+TyC23ZBXoAwZ1DqT8LU/YDsZd730DjT8jmGR3WM7Thw==
X-Received: by 2002:a17:90a:b398:: with SMTP id e24mr67344pjr.45.1611844685505; 
 Thu, 28 Jan 2021 06:38:05 -0800 (PST)
Received: from localhost.localdomain ([2405:201:9004:686d:e9f6:a78b:e60e:9585])
 by smtp.gmail.com with ESMTPSA id w14sm5358621pjl.38.2021.01.28.06.38.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Jan 2021 06:38:04 -0800 (PST)
From: Dwaipayan Ray <dwaipayanray1@gmail.com>
To: joe@perches.com
Date: Thu, 28 Jan 2021 20:08:00 +0530
Message-Id: <20210128143802.15888-2-dwaipayanray1@gmail.com>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210128143802.15888-1-dwaipayanray1@gmail.com>
References: <20210128143802.15888-1-dwaipayanray1@gmail.com>
MIME-Version: 1.0
Cc: linux-kernel-mentees@lists.linuxfoundation.org,
 linux-kernel@vger.kernel.org, Dwaipayan Ray <dwaipayanray1@gmail.com>
Subject: [Linux-kernel-mentees] [PATCH v2 1/3] checkpatch: add verbose mode
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
descriptions in the docs are kept in a fixed format, an example
of which is as follows:

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
 scripts/checkpatch.pl | 54 ++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 53 insertions(+), 1 deletion(-)

diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
index 05e908dcf0a0..2011d90c3e97 100755
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
@@ -198,6 +202,45 @@ if (-f $conf) {
 	unshift(@ARGV, @conf_args) if @conf_args;
 }
 
+sub load_docs {
+	open(my $docs, '<', "$docsfile")
+	    or warn "$P: Can't read the documentation file $docsfile $!\n";
+
+	my @lines = ();
+	while (<$docs>) {
+		my $line = $_;
+
+		$line =~ s/\s*\n?$//g;
+		push (@lines, $line);
+	}
+	close($docs);
+
+	my $linenr = 0;
+	my $cnt = scalar @lines;
+	while ($linenr < $cnt) {
+		while ($linenr < $cnt &&
+		       $lines[$linenr++] !~ /^\:(.+)\:$/)
+		{
+		}
+
+		last if ($linenr >= $cnt);
+
+		my $type = $lines[$linenr - 1];
+		$type =~ s/^\:(.+)\:$/$1/;
+		my $message = '';
+
+		while ($linenr < $cnt &&
+		       $lines[$linenr] =~ /^(?:\s+(.+)$|$)/) {
+			$message .= $1 if (defined $1);
+			$message .= "\n";
+			$linenr++;
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
@@ -208,6 +251,7 @@ foreach (@ARGV) {
 
 GetOptions(
 	'q|quiet+'	=> \$quiet,
+	'v|verbose!'	=> \$verbose,
 	'tree!'		=> \$tree,
 	'signoff!'	=> \$chk_signoff,
 	'patch!'	=> \$chk_patch,
@@ -249,6 +293,8 @@ help(0) if ($help);
 
 list_types(0) if ($list_types);
 
+load_docs() if ($verbose && !$terse);
+
 $fix = 1 if ($fix_inplace);
 $check_orig = $check;
 
@@ -2209,7 +2255,13 @@ sub report {
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
