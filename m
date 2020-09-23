Return-Path: <SRS0=Dbq6=DA=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32FD1C2D0A8
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 23 Sep 2020 10:02:34 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AE7692076E
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 23 Sep 2020 10:02:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iLxCNmbN"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AE7692076E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 5DBBF872F5;
	Wed, 23 Sep 2020 10:02:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GJeRXlhzE4gb; Wed, 23 Sep 2020 10:02:32 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id BE3A28703E;
	Wed, 23 Sep 2020 10:02:32 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 9A931C0889;
	Wed, 23 Sep 2020 10:02:32 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 79E6EC0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 23 Sep 2020 10:02:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 6F2E5865C1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 23 Sep 2020 10:02:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id EE4HpqwS3k7c
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 23 Sep 2020 10:02:30 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pl1-f194.google.com (mail-pl1-f194.google.com
 [209.85.214.194])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 8695285EF5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 23 Sep 2020 10:02:30 +0000 (UTC)
Received: by mail-pl1-f194.google.com with SMTP id bd2so6568807plb.7
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 23 Sep 2020 03:02:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=yjiUUAL+vaa7q/kXcFIldTG3r7KouSIag1um/KWY+Lo=;
 b=iLxCNmbNnZiHEd3LoJGzmpQErBJnd0Mk7w1ZiNAoSNI3Mdl1EIYiPagJv8EqvH44q1
 WcmGm6mjq1TTlZrBJHpelx2Sp37IA3xR9Hlrhtupy1y2JhwZeEinPrOeLvrrxEGKQpz4
 ovGW4bn6Hh6RTt/imiTIeBiy0GT4hQsByhkUnqtEtoskns3eLZ9szg2RL4S8WeYljoGh
 QMdWSHm1UJGpUefCBZY7mge2tOC2WuUyh+9CHqbIwEsVE9wlLjFPqFTJwmcy24uDeIqv
 6SdNWKdQlJ7++jbT2qYFFDKoOSLpBIiXmfQYC1H08DKmkTabaXt4k1f0b53dXsDe+WsU
 WP5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=yjiUUAL+vaa7q/kXcFIldTG3r7KouSIag1um/KWY+Lo=;
 b=eGtkNAeemd7EGuFZW1yJsP+w7pnMLqouc6jxqdqziknLk72OViOTMeM+HEkj24DN/6
 8LH6CfQwT4qRkheIXHnPWqssRlEXXREaFJmVY3z+KRnbK9CNjOiUPI5Q8HLM80Be3K7S
 BFNni5QTqJSkh7mzMT8tqI0Gp1JpV3gs1jrVGg3qWTMoNS1rYGUxmabEFP2wT4p2Cp/c
 NGoON7AwqAIYW88Gp2vDBh1RZ32E35CMIrqEjmCoBoNAVpqjB+idvoFIRc/HEGpfroM/
 QT80oy2zcQdz0tToDemwCoHLf9QlTOM9VKSLF+cP1VZdaqfT6Fz/dnjqjq1khzUsyVzc
 npEw==
X-Gm-Message-State: AOAM532024lULVhmdofLWmXCRBKHS8RxSt9JLlvrf8XXp3FxXI8VQ7Px
 StNxHc5BRBUwohX0BOccwYU=
X-Google-Smtp-Source: ABdhPJxgervWu/6TFeSvN/CKqWoVvmATkm09KBXoW/Uw9CjY3jnCYI8PlgMO2BGeO3X07HtWiE+YPQ==
X-Received: by 2002:a17:90b:350b:: with SMTP id
 ls11mr2747601pjb.201.1600855349930; 
 Wed, 23 Sep 2020 03:02:29 -0700 (PDT)
Received: from localhost.localdomain ([2405:201:9004:608f:a38:ea2:c4a3:8a70])
 by smtp.gmail.com with ESMTPSA id
 gk14sm4901267pjb.41.2020.09.23.03.02.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Sep 2020 03:02:29 -0700 (PDT)
From: Dwaipayan Ray <dwaipayanray1@gmail.com>
To: joe@perches.com
Date: Wed, 23 Sep 2020 15:32:13 +0530
Message-Id: <20200923100213.83901-1-dwaipayanray1@gmail.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Cc: dwaipayanray1@gmail.com, linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [PATCH RFC] checkpatch: extend
	same_email_address check to load mailmap entries
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

Checkpatch throws a NO_AUTHOR_SIGN_OFF warning whenever either the
name or email address of author doesn't match any signed-off-by
entry. But it has no mechanism to check whether different email
addresses belong to the same author.

As a result, there have been multiple commits where the author has
signed off with a different email address which caused checkpatch
to product that warning.

An example is commit dc5bdb68b5b3 ("drm/fb-helper: Fix vt restore"),
where the author uses two different mail addresses, and checkpatch
generates a NO_AUTHOR_SIGN_OFF warning.

This was fixed by adding support for loading .mailmap entries.
If a mismatch in name or email address then occurs, the
entries in mailmap can be looked up to deterime the actual author
name and email address.

Signed-off-by: Dwaipayan Ray <dwaipayanray1@gmail.com>
---
 scripts/checkpatch.pl | 113 +++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 111 insertions(+), 2 deletions(-)

diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
index 9e65d21456f1..bfa06c9b9625 100755
--- a/scripts/checkpatch.pl
+++ b/scripts/checkpatch.pl
@@ -1128,6 +1128,78 @@ sub top_of_kernel_tree {
 	return 1;
 }
 
+my $mailmap;
+
+sub read_mailmap {
+    $mailmap = {
+	names => {},
+	addresses => {}
+    };
+
+    return if (!defined($root) || !(-f "${root}/.mailmap"));
+
+    open(my $mailmap_file, '<', "${root}/.mailmap")
+	or warn "$P: Can't open .mailmap: $!\n";
+
+    while (<$mailmap_file>) {
+	s/#.*$//; #strip comments
+	s/^\s+|\s+$//g; #trim
+
+	next if (/^\s*$/); #skip empty lines
+	#entries have one of the following formats:
+	# name1 <mail1>
+	# <mail1> <mail2>
+	# name1 <mail1> <mail2>
+	# name1 <mail1> name2 <mail2>
+	# (see man git-shortlog)
+
+	if (/^([^<]+)<([^>]+)>$/) {
+	    my $real_name = $1;
+	    my $address = $2;
+
+	    $real_name =~ s/\s+$//;
+	    ($real_name, $address) = parse_email("$real_name <$address>");
+	    $mailmap->{names}->{$address} = $real_name;
+
+	} elsif (/^<([^>]+)>\s*<([^>]+)>$/) {
+	    my $real_address = $1;
+	    my $wrong_address = $2;
+
+	    $mailmap->{addresses}->{$wrong_address} = $real_address;
+
+	} elsif (/^(.+)<([^>]+)>\s*<([^>]+)>$/) {
+	    my $real_name = $1;
+	    my $real_address = $2;
+	    my $wrong_address = $3;
+
+	    $real_name =~ s/\s+$//;
+	    ($real_name, $real_address) =
+		parse_email("$real_name <$real_address>");
+	    $mailmap->{names}->{$wrong_address} = $real_name;
+	    $mailmap->{addresses}->{$wrong_address} = $real_address;
+
+	} elsif (/^(.+)<([^>]+)>\s*(.+)\s*<([^>]+)>$/) {
+	    my $real_name = $1;
+	    my $real_address = $2;
+	    my $wrong_name = $3;
+	    my $wrong_address = $4;
+
+	    $real_name =~ s/\s+$//;
+	    ($real_name, $real_address) =
+		parse_email("$real_name <$real_address>");
+
+	    $wrong_name =~ s/\s+$//;
+	    ($wrong_name, $wrong_address) =
+		parse_email("$wrong_name <$wrong_address>");
+
+	    my $wrong_email = format_email($wrong_name, $wrong_address);
+	    $mailmap->{names}->{$wrong_email} = $real_name;
+	    $mailmap->{addresses}->{$wrong_email} = $real_address;
+	}
+    }
+    close($mailmap_file);
+}
+
 sub parse_email {
 	my ($formatted_email) = @_;
 
@@ -1210,14 +1282,50 @@ sub reformat_email {
 	return format_email($email_name, $email_address);
 }
 
+sub mailmap_email {
+    my ($name, $address) = @_;
+
+    my $email = format_email($name, $address);
+    my $real_name = $name;
+    my $real_address = $address;
+
+    if (exists $mailmap->{names}->{$email} ||
+	exists $mailmap->{addresses}->{$email}) {
+	if (exists $mailmap->{names}->{$email}) {
+	    $real_name = $mailmap->{names}->{$email};
+	}
+	if (exists $mailmap->{addresses}->{$email}) {
+	    $real_address = $mailmap->{addresses}->{$email};
+	}
+    } else {
+	if (exists $mailmap->{names}->{$address}) {
+	    $real_name = $mailmap->{names}->{$address};
+	}
+	if (exists $mailmap->{addresses}->{$address}) {
+	    $real_address = $mailmap->{addresses}->{$address};
+	}
+    }
+    return ($real_name, $real_address);
+}
+
 sub same_email_addresses {
 	my ($email1, $email2) = @_;
 
 	my ($email1_name, $name1_comment, $email1_address, $comment1) = parse_email($email1);
 	my ($email2_name, $name2_comment, $email2_address, $comment2) = parse_email($email2);
 
-	return $email1_name eq $email2_name &&
-	       $email1_address eq $email2_address;
+	my $name_match = $email1_name eq $email2_name;
+	my $address_match = $email1_address eq $email2_address;
+
+	if(!$name_match || !$address_match) {
+		my ($real_name1, $real_address1) = mailmap_email($email1_name, $email1_address);
+		my ($real_name2, $real_address2) = mailmap_email($email2_name, $email2_address);
+
+		$name_match |= ($real_name1 eq $real_name2);
+		$address_match |= ($real_address1 eq $real_address2);
+	}
+
+	return $name_match && $address_match;
 }
 
 sub which {
@@ -2400,6 +2508,7 @@ sub process {
 
 	my $checklicenseline = 1;
 
+	read_mailmap();
 	sanitise_line_reset();
 	my $line;
 	foreach my $rawline (@rawlines) {
-- 
2.27.0

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
