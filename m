Return-Path: <SRS0=j5Lk=GI=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59E42C433E0
	for <linux-kernel-mentees@archiver.kernel.org>; Tue,  5 Jan 2021 09:35:31 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D8A862222A
	for <linux-kernel-mentees@archiver.kernel.org>; Tue,  5 Jan 2021 09:35:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D8A862222A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 73AEA87087;
	Tue,  5 Jan 2021 09:35:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0GD6xXmlv9D3; Tue,  5 Jan 2021 09:35:25 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id C56C187078;
	Tue,  5 Jan 2021 09:35:25 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id A1A49C0891;
	Tue,  5 Jan 2021 09:35:25 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 2A629C013A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  5 Jan 2021 09:35:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 1402687087
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  5 Jan 2021 09:35:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KmOWfMaGiI9Z
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  5 Jan 2021 09:35:19 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com
 [209.85.215.176])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 9433F87078
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  5 Jan 2021 09:35:19 +0000 (UTC)
Received: by mail-pg1-f176.google.com with SMTP id 15so20927114pgx.7
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 05 Jan 2021 01:35:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=FHnsJ2/xITTt6sic8bwwoBbm+GiOwrvEjflQ9FMtb1o=;
 b=EW4JZxJgPFDnrNPi7lPMc1a5+COO33auZZIJF/qQWFyGvY0oEwqgymUDSnuq0mlBd0
 hdEi7zVUH525KSSid8Jb5L7a3Gu+3oIQirKXGCYTEXMIftfT6WoX+i8uFK/yKCHh2rol
 pgjiWNOlWkjoDSiPOHc96Lp/unl30X5GdvyqJzWZCOSgzixxWbVNnc1gKpHrFJkJ9hai
 gBsZcLu7lvh9oYm+jQEjcWkCDOFUAtv72TRRRYVPCcxdqQtjZ4xoPwh087k7jVB57ZlZ
 1EiHDAg222W/OEvz8LGVN9nKT9PcvLoscFNW9yL9Lrgzw71ecw+6Nb5YrwPwvjM1KT+8
 3Smw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=FHnsJ2/xITTt6sic8bwwoBbm+GiOwrvEjflQ9FMtb1o=;
 b=CnbR6LlMe80SMEwgzaQJyPtDCeoovWiONZ43sqMac8vzKFKXYasoMSz11lBgYtJCq+
 YEUXbSfA/UDQddymCyc1Gbm0DV0yGnEE4gIzB1CDTVNefK4OuYqbdqRgYtx+pwMi5NHh
 +TpWuuw1vPDozg0NrlmI99eLdAEfmRStDoMeX+xo59Tqb7ZEBDneCMxxzr5hPp7i+2Ts
 9NBLbYXDpm6xHUFoB4xxobpv+B93ygsUcEN61kKEazRJx57H+OB+qLcSJp3ciVD+nz5I
 uBZYo1LDbdCU4GHDzzbY78F6u9TlTWQ8ikVquHwANDDHOPkJvb0jELxcq5yeX3cW+3hi
 sCGw==
X-Gm-Message-State: AOAM532p3wCjyh/rTdU9IF+i2VazyHnwUbOyJJp0oGCZOb4iP/mAsZ2+
 Gf5c8OJN+hupVR6WW6LSXCw=
X-Google-Smtp-Source: ABdhPJyCFI3V9aXREpRbFkFctRoQnd+xPdrHiBPJ1EBZy6DNAVljDbmNMXgd1+GuQ7hC7tkxNBBUTw==
X-Received: by 2002:a05:6a00:44:b029:19d:e250:1355 with SMTP id
 i4-20020a056a000044b029019de2501355mr68344811pfk.36.1609839318975; 
 Tue, 05 Jan 2021 01:35:18 -0800 (PST)
Received: from localhost.localdomain ([2405:201:9004:6064:97d:44da:5ae4:7c76])
 by smtp.gmail.com with ESMTPSA id
 s13sm59347761pfd.99.2021.01.05.01.35.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Jan 2021 01:35:18 -0800 (PST)
From: Dwaipayan Ray <dwaipayanray1@gmail.com>
To: joe@perches.com
Date: Tue,  5 Jan 2021 15:05:07 +0530
Message-Id: <20210105093507.29297-1-dwaipayanray1@gmail.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Cc: dwaipayanray1@gmail.com, linux-kernel-mentees@lists.linuxfoundation.org,
 linux-kernel@vger.kernel.org
Subject: [Linux-kernel-mentees] [PATCH] checkpatch: fix unescaped left braces
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

Perl 5.22 onwards require that "A literal "{" should now be
escaped in a pattern".

checkpatch contains several literal "{". Fix such instances
by preceding them with a backslash.

Signed-off-by: Dwaipayan Ray <dwaipayanray1@gmail.com>
---
 scripts/checkpatch.pl | 28 ++++++++++++++--------------
 1 file changed, 14 insertions(+), 14 deletions(-)

diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
index 00085308ed9d..8e80a158bf5a 100755
--- a/scripts/checkpatch.pl
+++ b/scripts/checkpatch.pl
@@ -1652,7 +1652,7 @@ sub statement_block_size {
 	my ($stmt) = @_;
 
 	$stmt =~ s/(^|\n)./$1/g;
-	$stmt =~ s/^\s*{//;
+	$stmt =~ s/^\s*\{//;
 	$stmt =~ s/}\s*$//;
 	$stmt =~ s/^\s*//;
 	$stmt =~ s/\s*$//;
@@ -2036,7 +2036,7 @@ sub annotate_values {
 			print "ASSIGN($1)\n" if ($dbg_values > 1);
 			$type = 'N';
 
-		} elsif ($cur =~/^(;|{|})/) {
+		} elsif ($cur =~ /^(;|\{|\})/) {
 			print "END($1)\n" if ($dbg_values > 1);
 			$type = 'E';
 			$av_pend_colon = 'O';
@@ -3913,7 +3913,7 @@ sub process {
 			# it there is no point in retrying a statement scan
 			# until we hit end of it.
 			my $frag = $stat; $frag =~ s/;+\s*$//;
-			if ($frag !~ /(?:{|;)/) {
+			if ($frag !~ /(?:\{|;)/) {
 #print "skip<$line_nr_next>\n";
 				$suppress_statement = $line_nr_next;
 			}
@@ -4029,7 +4029,7 @@ sub process {
 			#print "realcnt<$realcnt> ctx_cnt<$ctx_cnt>\n";
 			#print "pre<$pre_ctx>\nline<$line>\nctx<$ctx>\nnext<$lines[$ctx_ln - 1]>\n";
 
-			if ($ctx !~ /{\s*/ && defined($lines[$ctx_ln - 1]) && $lines[$ctx_ln - 1] =~ /^\+\s*{/) {
+			if ($ctx !~ /\{\s*/ && defined($lines[$ctx_ln - 1]) && $lines[$ctx_ln - 1] =~ /^\+\s*\{/) {
 				ERROR("OPEN_BRACE",
 				      "that open brace { should be on the previous line\n" .
 					"$here\n$ctx\n$rawlines[$ctx_ln - 1]\n");
@@ -4080,7 +4080,7 @@ sub process {
 			my $continuation = 0;
 			my $check = 0;
 			$s =~ s/^.*\bdo\b//;
-			$s =~ s/^\s*{//;
+			$s =~ s/^\s*\{//;
 			if ($s =~ s/^\s*\\//) {
 				$continuation = 1;
 			}
@@ -4235,7 +4235,7 @@ sub process {
 		}
 
 # check for initialisation to aggregates open brace on the next line
-		if ($line =~ /^.\s*{/ &&
+		if ($line =~ /^.\s*\{/ &&
 		    $prevline =~ /(?:^|[^=])=\s*$/) {
 			if (ERROR("OPEN_BRACE",
 				  "that open brace { should be on the previous line\n" . $hereprev) &&
@@ -4243,7 +4243,7 @@ sub process {
 				fix_delete_line($fixlinenr - 1, $prevrawline);
 				fix_delete_line($fixlinenr, $rawline);
 				my $fixedline = $prevrawline;
-				$fixedline =~ s/\s*=\s*$/ = {/;
+				$fixedline =~ s/\s*=\s*$/ = \{/;
 				fix_insert_line($fixlinenr, $fixedline);
 				$fixedline = $line;
 				$fixedline =~ s/^(.\s*)\{\s*/$1/;
@@ -4617,7 +4617,7 @@ sub process {
 		}
 
 # open braces for enum, union and struct go on the same line.
-		if ($line =~ /^.\s*{/ &&
+		if ($line =~ /^.\s*\{/ &&
 		    $prevline =~ /^.\s*(?:typedef\s+)?(enum|union|struct)(?:\s+$Ident)?\s*$/) {
 			if (ERROR("OPEN_BRACE",
 				  "open brace '{' following $1 go on the same line\n" . $hereprev) &&
@@ -5345,7 +5345,7 @@ sub process {
 
 # Check for illegal assignment in if conditional -- and check for trailing
 # statements after the conditional.
-		if ($line =~ /do\s*(?!{)/) {
+		if ($line =~ /do\s*(?!\{)/) {
 			($stat, $cond, $line_nr_next, $remain_next, $off_next) =
 				ctx_statement_block($linenr, $realcnt, 0)
 					if (!defined $stat);
@@ -5403,7 +5403,7 @@ sub process {
 			substr($s, 0, length($c), '');
 			$s =~ s/\n.*//g;
 			$s =~ s/$;//g;	# Remove any comments
-			if (length($c) && $s !~ /^\s*{?\s*\\*\s*$/ &&
+			if (length($c) && $s !~ /^\s*\{?\s*\\*\s*$/ &&
 			    $c !~ /}\s*while\s*/)
 			{
 				# Find out how long the conditional actually is.
@@ -5442,7 +5442,7 @@ sub process {
 		if ($line =~ /^.\s*(?:}\s*)?else\b(.*)/) {
 			my $s = $1;
 			$s =~ s/$;//g;	# Remove any comments
-			if ($s !~ /^\s*(?:\sif|(?:{|)\s*\\?\s*$)/) {
+			if ($s !~ /^\s*(?:\sif|(?:\{|)\s*\\?\s*$)/) {
 				ERROR("TRAILING_STATEMENTS",
 				      "trailing statements should be on next line\n" . $herecurr);
 			}
@@ -5659,7 +5659,7 @@ sub process {
 			    $dstat !~ /^while\s*$Constant\s*$Constant\s*$/ &&		# while (...) {...}
 			    $dstat !~ /^for\s*$Constant$/ &&				# for (...)
 			    $dstat !~ /^for\s*$Constant\s+(?:$Ident|-?$Constant)$/ &&	# for (...) bar()
-			    $dstat !~ /^do\s*{/ &&					# do {...
+			    $dstat !~ /^do\s*\{/ &&					# do {...
 			    $dstat !~ /^\(\{/ &&						# ({...
 			    $ctx !~ /^.\s*#\s*define\s+TRACE_(?:SYSTEM|INCLUDE_FILE|INCLUDE_PATH)\b/)
 			{
@@ -5811,7 +5811,7 @@ sub process {
 
 					substr($block, 0, length($cond), '');
 
-					$seen++ if ($block =~ /^\s*{/);
+					$seen++ if ($block =~ /^\s*\{/);
 
 					#print "cond<$cond> block<$block> allowed<$allowed[$allow]>\n";
 					if (statement_lines($cond) > 1) {
@@ -5909,7 +5909,7 @@ sub process {
 				fix_delete_line($fixlinenr - 1, $prevrawline);
 			}
 		}
-		if (($rawline =~ /^.\s*$/ && $prevline =~ /^..*{\s*$/)) {
+		if (($rawline =~ /^.\s*$/ && $prevline =~ /^..*\{\s*$/)) {
 			if (CHK("BRACES",
 				"Blank lines aren't necessary after an open brace '{'\n" . $hereprev) &&
 			    $fix) {
-- 
2.27.0

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
