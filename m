Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org [80.241.56.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE67633F8D6
	for <linux-kernel-mentees@lists.linux.dev>; Mon,  8 Jun 2026 16:36:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780936573; cv=none; b=ENk39off4l3glBmpVJf6cnp39+e1qqGyKYgx8Lsx7mVe31pEtUIYl5zf4RfFxUx4uKCYVfJhSEHbec+j78MV98h9fv7ult0CxAgHd2Ym29q4Egte30hOj6Cb2NE1h2Z6DnEuZWxLekh7oLXNmy15rvAkijCdVaK5A8ajJlmeXeU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780936573; c=relaxed/simple;
	bh=a1oA4w8I2UH5MaL9GKCSqxxGVclRFKnXXx0se/ntGo8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FP9rHdUdaaT9aX8mqgzvcfCrHx+5AZysE+a7whOBqarvFhDPeu8Ac7n6fgGKB382KcSSzufdK7ujz5R9miiSBjP5joMGorCicOtdxrSUQX4iW89592u5oOMVCNbQRB3qplTDGdRVDRgAI/bxfrwWBm/649eCKajDFL2FQE76iWc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=b9oTaS89; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=Sil4TJjq; arc=none smtp.client-ip=80.241.56.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="b9oTaS89";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="Sil4TJjq"
Received: from smtp102.mailbox.org (smtp102.mailbox.org [IPv6:2001:67c:2050:b231:465::102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4gYyN86c0Jz9tks;
	Mon,  8 Jun 2026 18:36:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1780936569;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XXWrDEq97S5659bsSZRSxIaSohrb5koNBZr75To/5yQ=;
	b=b9oTaS89rFOKrvMDkWXRL2OG2vtjpqCk2l6gFKb2ekrEDl23k3oKGKcdRWSiAymCvNq1Vc
	9+cMrYj79wV7BEyZdOK7nSYFBprKGx5ZQtaoTKxUbmqhQK7+7fjqEbfnatDBXsjZBvS4bY
	5nrxafFb/lIoJ9nv9bRx2tsD/4q8iA6PiMuhAWGmpvCAELnuT21aEwcqVgpiLrwFGTA8BR
	A1d4Dgi6KdYI83JSttI1LzjO6qlJJBZzTUYPAlKEqiHUS9+YfoRU758L2hnXZs6R4R5BmO
	GRu/5RspF1bNn246JRLM0E2vCEYGWcF5n/6HMNU4XQdNcDgpdDAfgGV02ydPEw==
Authentication-Results: outgoing_mbo_mout;
	dkim=pass header.d=mailbox.org header.s=mail20150812 header.b=Sil4TJjq;
	spf=pass (outgoing_mbo_mout: domain of manuelebner@mailbox.org designates 2001:67c:2050:b231:465::102 as permitted sender) smtp.mailfrom=manuelebner@mailbox.org
From: Manuel Ebner <manuelebner@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1780936567;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XXWrDEq97S5659bsSZRSxIaSohrb5koNBZr75To/5yQ=;
	b=Sil4TJjqpfkZzMMpURTpONyuYjNf3rgkheM73sj3TYsbMeU9OigF4RiFbe8I/ItAd25ifE
	IheIj0ma+CBtSE+bdzHkSmZrMcRJqvMKkyrc3kaidg7Z43Ay7YIXd8wbHK/T4ht2/mCl0k
	56TABf/KJnWXCxqg27Q1ZXI3LvXlTNaocX9hIgi0ImJw2KbDG4djCzDQyVRDwB1WVodiS9
	dSijTlGrX3U2j6xmCAtnw0YETOlFq1V6wSIeofDiK85yHylaRNOPsR8FVzv8f7mnwYH/rQ
	k3j21wYXUrNpMD7G05fJh8poR/s4Utg32oryj+PjKq01nd/xpYnIvn7udWUQCQ==
To: joe@perches.com
Cc: kernelnewbies@kernelnewbies.org,
	linux-kernel-mentees@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	manuelebner@mailbox.org
Subject: [PATCH] get_maintainer: add recipients to output of script
Date: Mon,  8 Jun 2026 18:34:12 +0200
Message-ID: <20260608163411.70226-2-manuelebner@mailbox.org>
In-Reply-To: <14198ef7adde6d0e24535edf64266201b7036fed.camel@perches.com>
References: <14198ef7adde6d0e24535edf64266201b7036fed.camel@perches.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-ID: 9656f40ada26f46ed24
X-MBO-RS-META: sbdma8n95zkj7bok53mwdyagoa8j54w3
X-Rspamd-Queue-Id: 4gYyN86c0Jz9tks

Add all people tagged in all the mentioned commits to the output of this script.
This is done to give credit to people who inspired the current commit or to get
feedback from people who know the subject.

Signed-off-by: Manuel Ebner <manuelebner@mailbox.org>
---
 scripts/get_maintainer.pl | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/scripts/get_maintainer.pl b/scripts/get_maintainer.pl
index 16b80a700d4a..8c44b14391f9 100755
--- a/scripts/get_maintainer.pl
+++ b/scripts/get_maintainer.pl
@@ -30,6 +30,7 @@ my $email_usename = 1;
 my $email_maintainer = 1;
 my $email_reviewer = 1;
 my $email_fixes = 1;
+my $email_mentioned = 0;
 my $email_list = 1;
 my $email_moderated_list = 1;
 my $email_subscriber_list = 0;
@@ -78,6 +79,7 @@ my $exit = 0;
 
 my @files = ();
 my @fixes = ();			# If a patch description includes Fixes: lines
+my @mentioned = ();		# If a patch description mentiones a patch
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

