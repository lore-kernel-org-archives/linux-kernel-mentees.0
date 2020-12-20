Return-Path: <SRS0=Q7nG=FY=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3C54AC4361B
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 20 Dec 2020 18:33:21 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AD8AE22D72
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 20 Dec 2020 18:33:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AD8AE22D72
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 517E987401;
	Sun, 20 Dec 2020 18:33:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FrrBCHrjovaP; Sun, 20 Dec 2020 18:33:19 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 768B5873DD;
	Sun, 20 Dec 2020 18:33:19 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 659B0C1825;
	Sun, 20 Dec 2020 18:33:19 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 922B5C0893
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 20 Dec 2020 18:33:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 86C8186D3A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 20 Dec 2020 18:33:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lc30RUgg8YIW
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 20 Dec 2020 18:33:18 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com
 [209.85.216.46])
 by whitealder.osuosl.org (Postfix) with ESMTPS id E59E186D25
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 20 Dec 2020 18:33:17 +0000 (UTC)
Received: by mail-pj1-f46.google.com with SMTP id lj6so4922209pjb.0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 20 Dec 2020 10:33:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=JnYFewSA1ImupWo7GCP19NuiMyNAo92XUMh2bqadNVs=;
 b=e5Ea67ha4r7IECAOa1WxONsEX/YUf/rmwBmpsXCjGJQ3SZ2eMxs1FGoOE//oSHruBe
 xXd85mZznAQnfg5mSS1IKvJxJgfb+3LeUGCQZvdQ+xGwFvkQPIRLpV8Bdf10jJgHx54I
 PhkJZi/ces0vuUoiXwMFaPuzyIpmJ7uzVQGxRg8QIO/9vEqJKEj6kkcTNJ+XIkMvDAPg
 d12XD3qnePgD0C4ToLNDaBa0W4O+a2WV641h/NL9H68e8dfS5EABGlHlFFv0LWYtenXK
 b77ofDrBA+zAriIh4uXjFZ0wV9D70peKjBww/CyR2AzOJOH1Ql2Ah65ahAuL+y4AtVpH
 62qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=JnYFewSA1ImupWo7GCP19NuiMyNAo92XUMh2bqadNVs=;
 b=tK1+InOW4tikLgSMabgysNqu1o01Wf9m1IQG2jcNJM1MBAqaNhC1R5tUbeBEmYcE0I
 dhkg41C0DSIwvI+vUtbH2DAkE9Nx0Is6EB/pssI7VT8m5t/7lGyiWAJ+u1KwcTt+crwd
 4hlbNBnis1jV4B/h0xzcUhCFrlUddZCo9/XDWsAEFhWCM/cxxnsFihmABxVgZ412C9GH
 xFOYOJJZdt2oMrtx9qvveyYIXCZE32Af+o6PFe1w0B9xStEA7mc+unOHO2UMrNiJt5VV
 qJZyYH87A1hN9qWvM2l64wZuYS4OPScwh9hGg8v5xuTLiIuXq02Jipwo6hzj4BGhWsHX
 Uy1Q==
X-Gm-Message-State: AOAM5313zywwKiCI3RwuoqG9lsxynRMrHTwI6I7Yi7ErtpjVD9TT6wAs
 x2FQmjsHvW5lSHBVem5SoXE=
X-Google-Smtp-Source: ABdhPJxm0x5Mg2OrWRAxW/uE1TH6TKlEU23wW2XrE3KorXN4xEHzHE1HVKLn0Ry981rOzphg5VQFkw==
X-Received: by 2002:a17:90a:4209:: with SMTP id
 o9mr14144121pjg.75.1608489197403; 
 Sun, 20 Dec 2020 10:33:17 -0800 (PST)
Received: from localhost.localdomain ([2402:3a80:420:966f:e4a8:3fba:bee:da49])
 by smtp.googlemail.com with ESMTPSA id
 w22sm13887037pfu.33.2020.12.20.10.33.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 20 Dec 2020 10:33:16 -0800 (PST)
From: Aditya Srivastava <yashsri421@gmail.com>
To: lukas.bulwahn@gmail.com
Date: Mon, 21 Dec 2020 00:03:07 +0530
Message-Id: <20201220183307.8744-1-yashsri421@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <CAKXUXMz6TuYZkZJbgDBPiH4MmecUUbLjPct9XnZZu12VP+w4mw@mail.gmail.com>
References: <CAKXUXMz6TuYZkZJbgDBPiH4MmecUUbLjPct9XnZZu12VP+w4mw@mail.gmail.com>
Cc: linux-kernel-mentees@lists.linuxfoundation.org, yashsri421@gmail.com
Subject: [Linux-kernel-mentees] [PATCH] checkpatch: ignore files not
	following NETWORKING_BLOCK_COMMENT_STYLE
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

Currently checkpatch.pl gives warning for NETWORKING_BLOCK_COMMENT_STYLE
for files in net/ and drivers/net which do not follow the networking
comment style.
But some of these files seem to follow the generic comment style instead
of networking style and some rather mixed style of comment.

For e.g., drivers/net/wireless/ralink/rt2x00 largely follows generic
kernel comment style in spite of being inside drivers/net.

Provide an ignore file(".networking_block_comment_styles.ignore"), where
users can add the files they want to ignore this warning.

Signed-off-by: Aditya Srivastava <yashsri421@gmail.com>
---
 .gitignore                              |  1 +
 .networking_block_comment_styles.ignore |  1 +
 scripts/checkpatch.pl                   | 25 ++++++++++++++++++++++++-
 3 files changed, 26 insertions(+), 1 deletion(-)
 create mode 100644 .networking_block_comment_styles.ignore

diff --git a/.gitignore b/.gitignore
index d01cda8e1177..3cd6074d1fb0 100644
--- a/.gitignore
+++ b/.gitignore
@@ -94,6 +94,7 @@ modules.order
 !.gitattributes
 !.gitignore
 !.mailmap
+!.networking_block_comment_styles.ignore
 
 #
 # Generated include files
diff --git a/.networking_block_comment_styles.ignore b/.networking_block_comment_styles.ignore
new file mode 100644
index 000000000000..2022dd619901
--- /dev/null
+++ b/.networking_block_comment_styles.ignore
@@ -0,0 +1 @@
+drivers/net/wireless/ralink/rt2x00
\ No newline at end of file
diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
index 00085308ed9d..875e572df5dc 100755
--- a/scripts/checkpatch.pl
+++ b/scripts/checkpatch.pl
@@ -832,6 +832,28 @@ sub read_words {
 	return 0;
 }
 
+my @files_ignoring_networking_comment;
+my $ignore_file = which_conf(".networking_block_comment_styles.ignore");
+if(-f $ignore_file) {
+	open(my $ignore, '<', "$ignore_file")
+	    or warn "$P: Can't find a readable .networking_block_comment_styles.ignore file $!\n";
+	while(<$ignore>) {
+		my $line = "$_";
+		$line = trim($line);
+		next if ($line =~ /^\s*$/);
+		push(@files_ignoring_networking_comment, $line);
+	}
+	close($ignore);
+}
+
+sub ignore_networking_comment_style {
+	my ($realfile) = "@_";
+	foreach my $file (@files_ignoring_networking_comment) {
+		return 1 if ($realfile =~ m@^$file@);
+	}
+	return 0;
+}
+
 my $const_structs;
 if (show_type("CONST_STRUCT")) {
 	read_words(\$const_structs, $conststructsfile)
@@ -3701,7 +3723,8 @@ sub process {
 		if ($realfile =~ m@^(drivers/net/|net/)@ &&
 		    $prevrawline =~ /^\+[ \t]*\/\*[ \t]*$/ &&
 		    $rawline =~ /^\+[ \t]*\*/ &&
-		    $realline > 3) { # Do not warn about the initial copyright comment block after SPDX-License-Identifier
+		    $realline > 3 &&  # Do not warn about the initial copyright comment block after SPDX-License-Identifier
+		    !ignore_networking_comment_style($realfile)) {
 			WARN("NETWORKING_BLOCK_COMMENT_STYLE",
 			     "networking block comments don't use an empty /* line, use /* Comment...\n" . $hereprev);
 		}
-- 
2.17.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
