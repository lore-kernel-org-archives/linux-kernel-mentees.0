Return-Path: <SRS0=0ifB=HX=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04328C433DB
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 21 Feb 2021 18:06:53 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5436764E57
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 21 Feb 2021 18:06:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5436764E57
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=perches.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1A37B6F47A
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 21 Feb 2021 18:06:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9YpdJCWQ4TGz
	for <linux-kernel-mentees@archiver.kernel.org>;
	Sun, 21 Feb 2021 18:06:51 +0000 (UTC)
Received: by smtp3.osuosl.org (Postfix, from userid 1001)
	id 13C166F478; Sun, 21 Feb 2021 18:06:51 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1E565600CD;
	Sun, 21 Feb 2021 18:06:49 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id ED299C000B;
	Sun, 21 Feb 2021 18:06:48 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id B3FE5C0001
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 21 Feb 2021 18:06:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id A334D87032
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 21 Feb 2021 18:06:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id EDdT9AyoTSTR
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 21 Feb 2021 18:06:46 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from smtprelay.hostedemail.com (smtprelay0130.hostedemail.com
 [216.40.44.130])
 by hemlock.osuosl.org (Postfix) with ESMTPS id A04C986F95
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 21 Feb 2021 18:06:46 +0000 (UTC)
Received: from filter.hostedemail.com (clb03-v110.bra.tucows.net
 [216.40.38.60])
 by smtprelay01.hostedemail.com (Postfix) with ESMTP id 512F1100E7B44;
 Sun, 21 Feb 2021 18:06:45 +0000 (UTC)
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-HE-Tag: night24_5605ad127671
X-Filterd-Recvd-Size: 3858
Received: from [192.168.1.159] (unknown [47.151.137.21])
 (Authenticated sender: joe@perches.com)
 by omf05.hostedemail.com (Postfix) with ESMTPA;
 Sun, 21 Feb 2021 18:06:44 +0000 (UTC)
Message-ID: <46c3b16602f36858b194b22dfbdb2150e25f5d94.camel@perches.com>
From: Joe Perches <joe@perches.com>
To: Dwaipayan Ray <dwaipayanray1@gmail.com>
Date: Sun, 21 Feb 2021 10:06:43 -0800
In-Reply-To: <20210221115802.19788-2-dwaipayanray1@gmail.com>
References: <20210221115802.19788-1-dwaipayanray1@gmail.com>
 <20210221115802.19788-2-dwaipayanray1@gmail.com>
User-Agent: Evolution 3.38.1-1 
MIME-Version: 1.0
Cc: linux-kernel-mentees@lists.linuxfoundation.org,
 linux-kernel@vger.kernel.org
Subject: Re: [Linux-kernel-mentees] [PATCH v6 1/2] checkpatch: add verbose
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

On Sun, 2021-02-21 at 17:28 +0530, Dwaipayan Ray wrote:
> Add a new verbose mode to checkpatch.pl to emit additional verbose
> test descriptions. The verbose mode is optional and can be enabled
> by the flag -v or --verbose.

OK, maybe add color coding to the list_types output.
Something like:
---
 scripts/checkpatch.pl | 61 ++++++++++++++++++++++++++++++++++++---------------
 1 file changed, 43 insertions(+), 18 deletions(-)

diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
index bbff13e0ca7e..ccd4a1bd73cb 100755
--- a/scripts/checkpatch.pl
+++ b/scripts/checkpatch.pl
@@ -163,14 +163,39 @@ sub list_types {
 	my $text = <$script>;
 	close($script);
 
-	my @types = ();
+	my %types = ();
 	# Also catch when type or level is passed through a variable
-	for ($text =~ /(?:(?:\bCHK|\bWARN|\bERROR|&\{\$msg_level})\s*\(|\$msg_type\s*=)\s*"([^"]+)"/g) {
-		push (@types, $_);
+	while ($text =~ /\b(CHK|WARN|ERROR|&\{\$msg_level})\s*\(\s*"([^"]+)"/g) {
+		if (exists($types{$2})) {
+			$types{$2} .= ",$1" if ($types{$2} ne $1);
+		} else {
+			$types{$2} = $1;
+		}
+	}
+	print("#\tMessage type");
+	if ($color) {
+		print(" (color coding: ");
+		print(RED . "ERROR" . RESET);
+		print("|");
+	        print(YELLOW . "WARNING" . RESET);
+		print("|");
+		print(GREEN . "CHECK" . RESET);
+		print("|");
+		print("Multiple levels" . RESET);
+		print(")");
 	}
-	@types = sort(uniq(@types));
-	print("#\tMessage type\n\n");
-	foreach my $type (@types) {
+	print("\n\n");
+	foreach my $type (sort keys %types) {
+		if ($color) {
+			my $level = $types{$type};
+			if ($level eq 'ERROR') {
+				$type = RED . $type . RESET;
+			} elsif ($level eq 'WARN') {
+				$type = YELLOW . $type . RESET;
+			} elsif ($level eq 'CHK') {
+				$type = GREEN . $type . RESET;
+			}
+		}
 		print(++$count . "\t" . $type . "\n");
 		if ($verbose && exists($verbose_messages{$type})) {
 			my $message = $verbose_messages{$type};
@@ -301,6 +326,18 @@ help(0) if ($help);
 die "$P: --git cannot be used with --file or --fix\n" if ($git && ($file || $fix));
 die "$P: --verbose cannot be used with --terse\n" if ($verbose && $terse);
 
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
 load_docs() if ($verbose);
 list_types(0) if ($list_types);
 
@@ -321,18 +358,6 @@ if ($#ARGV < 0) {
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
 

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
