Received: from mout-p-103.mailbox.org (mout-p-103.mailbox.org [80.241.56.161])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3D653FADFC
	for <linux-kernel-mentees@lists.linux.dev>; Mon,  8 Jun 2026 15:23:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.161
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780932237; cv=none; b=bKQpLjdfhxosoAKYLAUI83A9h68/SzTTRzszOoDPWtiKR0X/r4dM+QxOfBN6WYPFZrkpFfFj9rvNdnXnqAM50ok2E7GBySwZ59YmHy7iLnDBMp1JgUwVOrRlAOrh8zrGTPoC07pAs38HzlmpN3Lyk7caWE2yru5FhhmGpf1hS4A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780932237; c=relaxed/simple;
	bh=iXU+GUJvQOiOiVPnyj5XeVp32R5LwXJUv1i9v46okcA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=S4K3Xs/Q1XGMVK3YvAfmtTlM6kkkliZzZnClEMJZipX98GNAjVpKsQblm3LQcGCfbIJJUcTePn15GLh0V194tLw6GDVXURaxXaglsX7GkKiLRqexXFSEaWZBDHM0ze2js8iB++EWyx18YU9JHRBmQbrN/7DjXqvy9qBCMdEJ7Vg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=wqo0avYU; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=pq9pOGDJ; arc=none smtp.client-ip=80.241.56.161
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="wqo0avYU";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="pq9pOGDJ"
Received: from smtp2.mailbox.org (smtp2.mailbox.org [IPv6:2001:67c:2050:b231:465::2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-103.mailbox.org (Postfix) with ESMTPS id 4gYwmn6dj4z9trD;
	Mon,  8 Jun 2026 17:23:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1780932234;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=YkTVu1IQ2XPqplEjJ5c/eg56TuXb8YL2yuTzrx/dawY=;
	b=wqo0avYUhzOeva/5WvP/ntkywPJf1O5tA5tf47M8oi8YQw8bQG0+Dk3pPd0Zz41zXO4qr/
	FvCLpiSbkD0IryI2ISNJStrJEmI2wpmX6i3dXD76aO5qVg3iHIrqzfMHbwK7GnWlAzZknl
	sjekj34gE00x2K3gI/5X6hnk605IYtd+xUeN9W3w/EZUXazGpjhumHNNLe0oc4p+loJI1I
	49GBwcdp1ksmgjIUCwBDnPjkWeUljZbB9wC1/UeJC7Pw4faCKZ8loTQyCB9pxprKdZQ4+A
	7rvZh1o0O+kMs0Y+tdp0aXE3sZYQ13ISNm5iM3MbMviKPEsUPhWXNY/HiVOu9w==
Authentication-Results: outgoing_mbo_mout;
	dkim=pass header.d=mailbox.org header.s=mail20150812 header.b=pq9pOGDJ;
	spf=pass (outgoing_mbo_mout: domain of manuelebner@mailbox.org designates 2001:67c:2050:b231:465::2 as permitted sender) smtp.mailfrom=manuelebner@mailbox.org
From: Manuel Ebner <manuelebner@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1780932232;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=YkTVu1IQ2XPqplEjJ5c/eg56TuXb8YL2yuTzrx/dawY=;
	b=pq9pOGDJLC/FNvcJbKJcwoYePd3MCBlnxR06YADzu8WZ2rlZn7lnELLjj9M1oH0tlz43JM
	deIz2SJXn2x56Ao+KKMC4DdvD7TRTWd3jT8RuPsFl9MeiMXNAKX1M7vfdUVXk2a2xFc5Xz
	X0DbnNL8rt9LTIXhlojHRilegnfA4N5iwe/3H8WQ258mOF9djYlTMLvfsiaNkpjIqrKhIt
	EEh9aidAR/0Y4gdAvJOHbgBPof0UNJPDtPg0wE6q0R41RCp/rsZEui4H7t8Q3J5166VQD0
	LsbhkTub0YB6Um1vZ0ZpNrVAArsiS03xf251+x4k8xFx4JPP9DuIp9DoSowVjQ==
To: Joe Perches <joe@perches.com>,
	linux-kernel@vger.kernel.org (open list),
	kernelnewbies <kernelnewbies@kernelnewbies.org>,
	mentees <linux-kernel-mentees@lists.linux.dev>
Cc: Manuel Ebner <manuelebner@mailbox.org>
Subject: [PATCH] get_maintainer: add recipients to output of script
Date: Mon,  8 Jun 2026 17:22:43 +0200
Message-ID: <20260608152242.61223-2-manuelebner@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-META: daa9z7miqm8wsx8fitaagrbqj96zuu84
X-MBO-RS-ID: bc4662be3a5585d9656
X-Rspamd-Queue-Id: 4gYwmn6dj4z9trD

Add all people tagged in all the mentioned commits to the output of this script.

Signed-off-by: Manuel Ebner <manuelebner@mailbox.org>
---
 scripts/get_maintainer.pl | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/scripts/get_maintainer.pl b/scripts/get_maintainer.pl
index 16b80a700d4a..4bcf910f2830 100755
--- a/scripts/get_maintainer.pl
+++ b/scripts/get_maintainer.pl
@@ -30,6 +30,7 @@ my $email_usename = 1;
 my $email_maintainer = 1;
 my $email_reviewer = 1;
 my $email_fixes = 1;
+my $email_mentioned = 1;
 my $email_list = 1;
 my $email_moderated_list = 1;
 my $email_subscriber_list = 0;
@@ -78,6 +79,7 @@ my $exit = 0;
 
 my @files = ();
 my @fixes = ();			# If a patch description includes Fixes: lines
+my @mentioned = ();			# If a patch description mentiones a patch
 my @range = ();
 my @keyword_tvi = ();
 my @file_emails = ();
@@ -264,6 +266,7 @@ if (!GetOptions(
 		'n!' => \$email_usename,
 		'l!' => \$email_list,
 		'fixes!' => \$email_fixes,
+		'mentioned!' => \$email_mentioned,
 		'moderated!' => \$email_moderated_list,
 		's!' => \$email_subscriber_list,
 		'multiline!' => \$output_multiline,
@@ -606,6 +609,8 @@ foreach my $file (@ARGV) {
 		push(@files, $filename2);
 	    } elsif (m/^Fixes:\s+([0-9a-fA-F]{6,40})/) {
 		push(@fixes, $1) if ($email_fixes);
+	    } elsif (m/\s+([0-9a-fA-F]{6,40})/) {
+		push(@mentioned, $1) if ($email_mentioned);
 	    } elsif (m/^\+\+\+\s+(\S+)/ or m/^---\s+(\S+)/) {
 		my $filename = $1;
 		$filename =~ s@^[^/]*/@@;
@@ -637,6 +642,7 @@ foreach my $file (@ARGV) {
 
 @file_emails = uniq(@file_emails);
 @fixes = uniq(@fixes);
+@mentioned = uniq(@mentioned);
 
 my %email_hash_name;
 my %email_hash_address;
@@ -1038,6 +1044,10 @@ sub get_maintainers {
 	vcs_add_commit_signers($fix, "blamed_fixes");
     }
 
+   foreach my $mention (@mentioned) {
+	vcs_add_commit_signers($mention, "in mentioned Patch");
+    }
+
     my @to = ();
     if ($email || $email_list) {
 	if ($email) {
@@ -1106,6 +1116,7 @@ MAINTAINER field selection options:
     --substatus => show subsystem status if not Maintained (default: match --roles when output is tty)"
     --file-emails => add email addresses found in -f file (default: 0 (off))
     --fixes => for patches, add signatures of commits with 'Fixes: <commit>' (default: 1 (on))
+    --mentioned => for patches, add signatures in mentioned commits with hashes between 6 and 40 chars long (default: 1 (on))
   --scm => print SCM tree(s) if any
   --status => print status if any
   --subsystem => print subsystem name if any
-- 
2.54.0

