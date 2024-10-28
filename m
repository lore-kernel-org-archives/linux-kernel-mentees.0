Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A8AB18D65D
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 28 Oct 2024 19:19:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730143160; cv=none; b=DLYgm1Cbeg3vgTQQLg5pVozd86u8okpfYJydqIneZo/MnxYNGFN+Xwh3xuhbciV/WnC7C463q2qBzzao48FgJjK4iZXIWbTNP583sAzBS1FHgvtrAZB/B3CtVJtvSxNtJFxFSLeMZUe3VAnw6yzkaTbmQMt0AV0+Xu7BjxXOI2E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730143160; c=relaxed/simple;
	bh=sbgrO/yBULG2+7IsMeomLRSzsqua8q10+wJvS4i1xf0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=E+BnhLJQ1LK4NAYXkrVjPfMpnofbLwBrZVsgsWpbBqQzBniWIA5N9ovGad8TYtOLhkcrTEtJoNAkNjemoz3cLy1/xSF/JkIuOTpui/DZlyLzqBSTeeDCd3qOiWhVFmKgbKoK4j+wPDiLDa5Cq8gEkW0X2qQaApKVxWxtsiuXnlk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=lichtman.org header.i=@lichtman.org header.b=ANzo7qWS; arc=none smtp.client-ip=140.211.166.136
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lichtman.org header.i=@lichtman.org header.b="ANzo7qWS"
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B600D607D0
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 28 Oct 2024 19:19:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -5.793
X-Spam-Level:
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dToyJYUAJQxv for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 28 Oct 2024 19:19:17 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=149.28.33.109; helo=lichtman.org; envelope-from=nir@lichtman.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 9996B6081F
Authentication-Results: smtp3.osuosl.org; dmarc=pass (p=none dis=none) header.from=lichtman.org
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9996B6081F
Authentication-Results: smtp3.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=lichtman.org header.i=@lichtman.org header.a=rsa-sha256 header.s=mail header.b=ANzo7qWS
Received: from lichtman.org (lichtman.org [149.28.33.109])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 9996B6081F
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 28 Oct 2024 19:19:17 +0000 (UTC)
Received: by lichtman.org (Postfix, from userid 1000)
	id A1F51177105; Mon, 28 Oct 2024 19:19:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=lichtman.org; s=mail;
	t=1730143156; bh=sbgrO/yBULG2+7IsMeomLRSzsqua8q10+wJvS4i1xf0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ANzo7qWSKjNcfjWeS/On7Q8LOFvZW1NQYrrwlUqgz4lT08STwBlQYCyokQlk9frM5
	 D29GdRUxfCbNNLNDheT5aKyNDSKdiIb2vUbThEBa34lxW5DKM+8Oz5XpMOPPmvYPq2
	 9ciWjZcsZfloirhmaTr93CNe3KkkFrjUlpN5t9e4UXMpjiT3OZCilK7HoFav9RXFaF
	 a5hwzqbqyJuxgkNuAPDOgWpiuUGjexCV2dZHqVkROVwj0nevgXcr4KcOWrm+cWfgxs
	 FMQu/Q2QGz2xPwPNFIWFg0MOoAjKhju5c29AvTzyFR1fugHaG/1QV0pTz73HBmVyXK
	 MTngLGPkTgU0g==
Date: Mon, 28 Oct 2024 19:19:16 +0000
From: Nir Lichtman <nir@lichtman.org>
To: kgdb-bugreport@lists.sourceforge.net,
	linux-trace-kernel@vger.kernel.org
Cc: yuran.pereira@hotmail.com, jason.wessel@windriver.com,
	daniel.thompson@linaro.org, dianders@chromium.org,
	rostedt@goodmis.org, mhiramat@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linuxfoundation.org
Subject: [PATCH v4 1/3] kdb: Replace the use of simple_strto with safer
 kstrto in kdb_main
Message-ID: <20241028191916.GA918454@lichtman.org>
References: <20241028191700.GA918263@lichtman.org>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241028191700.GA918263@lichtman.org>

From: Yuran Pereira <yuran.pereira@hotmail.com>

The simple_str* family of functions perform no error checking in
scenarios where the input value overflows the intended output variable.
This results in these functions successfully returning even when the
output does not match the input string.

Or as it was mentioned [1], "...simple_strtol(), simple_strtoll(),
simple_strtoul(), and simple_strtoull() functions explicitly ignore
overflows, which may lead to unexpected results in callers."
Hence, the use of those functions is discouraged.

This patch replaces all uses of the simple_strto* series of functions
with their safer kstrto* alternatives.

Side effects of this patch:
- Every string to long or long long conversion using kstrto* is now
  checked for failure.
- kstrto* errors are handled with appropriate `KDB_BADINT` wherever
  applicable.
- A good side effect is that we end up saving a few lines of code
  since unlike in simple_strto* functions, kstrto functions do not
  need an additional "end pointer" variable, and the return values
  of the latter can be directly checked in an "if" statement without
  the need to define additional `ret` or `err` variables.
  This, of course, results in cleaner, yet still easy to understand
  code.

[1] https://www.kernel.org/doc/html/latest/process/deprecated.html#simple-strtol-simple-strtoll-simple-strtoul-simple-strtoull

Signed-off-by: Yuran Pereira <yuran.pereira@hotmail.com>
[nir: addressed review comments by fixing styling, invalid conversion and a missing error return]
Signed-off-by: Nir Lichtman <nir@lichtman.org>
---
 kernel/debug/kdb/kdb_main.c | 69 +++++++++++--------------------------
 1 file changed, 21 insertions(+), 48 deletions(-)

diff --git a/kernel/debug/kdb/kdb_main.c b/kernel/debug/kdb/kdb_main.c
index f5f7d7fb5936..f8703ab760d9 100644
--- a/kernel/debug/kdb/kdb_main.c
+++ b/kernel/debug/kdb/kdb_main.c
@@ -306,8 +306,8 @@ static int kdbgetulenv(const char *match, unsigned long *value)
 		return KDB_NOTENV;
 	if (strlen(ep) == 0)
 		return KDB_NOENVVALUE;
-
-	*value = simple_strtoul(ep, NULL, 0);
+	if (kstrtoul(ep, 0, value))
+		return KDB_BADINT;
 
 	return 0;
 }
@@ -402,42 +402,23 @@ static void kdb_printenv(void)
  */
 int kdbgetularg(const char *arg, unsigned long *value)
 {
-	char *endp;
-	unsigned long val;
-
-	val = simple_strtoul(arg, &endp, 0);
-
-	if (endp == arg) {
-		/*
-		 * Also try base 16, for us folks too lazy to type the
-		 * leading 0x...
-		 */
-		val = simple_strtoul(arg, &endp, 16);
-		if (endp == arg)
+	/*
+	 * If the first fails, also try base 16, for us
+	 * folks too lazy to type the leading 0x...
+	 */
+	if (kstrtoul(arg, 0, value)) {
+		if (kstrtoul(arg, 16, value))
 			return KDB_BADINT;
 	}
-
-	*value = val;
-
 	return 0;
 }
 
 int kdbgetu64arg(const char *arg, u64 *value)
 {
-	char *endp;
-	u64 val;
-
-	val = simple_strtoull(arg, &endp, 0);
-
-	if (endp == arg) {
-
-		val = simple_strtoull(arg, &endp, 16);
-		if (endp == arg)
+	if (kstrtou64(arg, 0, value)) {
+		if (kstrtou64(arg, 16, value))
 			return KDB_BADINT;
 	}
-
-	*value = val;
-
 	return 0;
 }
 
@@ -473,10 +454,10 @@ int kdb_set(int argc, const char **argv)
 	 */
 	if (strcmp(argv[1], "KDBDEBUG") == 0) {
 		unsigned int debugflags;
-		char *cp;
+		int ret;
 
-		debugflags = simple_strtoul(argv[2], &cp, 0);
-		if (cp == argv[2] || debugflags & ~KDB_DEBUG_FLAG_MASK) {
+		ret = kstrtouint(argv[2], 0, &debugflags);
+		if (ret || debugflags & ~KDB_DEBUG_FLAG_MASK) {
 			kdb_printf("kdb: illegal debug flags '%s'\n",
 				    argv[2]);
 			return 0;
@@ -1619,10 +1600,10 @@ static int kdb_md(int argc, const char **argv)
 		if (!argv[0][3])
 			valid = 1;
 		else if (argv[0][3] == 'c' && argv[0][4]) {
-			char *p;
-			repeat = simple_strtoul(argv[0] + 4, &p, 10);
+			if (kstrtouint(argv[0] + 4, 10, &repeat))
+				return KDB_BADINT;
 			mdcount = ((repeat * bytesperword) + 15) / 16;
-			valid = !*p;
+			valid = 1;
 		}
 		last_repeat = repeat;
 	} else if (strcmp(argv[0], "md") == 0)
@@ -2083,15 +2064,10 @@ static int kdb_dmesg(int argc, const char **argv)
 	if (argc > 2)
 		return KDB_ARGCOUNT;
 	if (argc) {
-		char *cp;
-		lines = simple_strtol(argv[1], &cp, 0);
-		if (*cp)
+		if (kstrtoint(argv[1], 0, &lines))
 			lines = 0;
-		if (argc > 1) {
-			adjust = simple_strtoul(argv[2], &cp, 0);
-			if (*cp || adjust < 0)
-				adjust = 0;
-		}
+		if (argc > 1 && (kstrtoint(argv[2], 0, &adjust) || adjust < 0))
+			adjust = 0;
 	}
 
 	/* disable LOGGING if set */
@@ -2428,14 +2404,12 @@ static int kdb_help(int argc, const char **argv)
 static int kdb_kill(int argc, const char **argv)
 {
 	long sig, pid;
-	char *endp;
 	struct task_struct *p;
 
 	if (argc != 2)
 		return KDB_ARGCOUNT;
 
-	sig = simple_strtol(argv[1], &endp, 0);
-	if (*endp)
+	if (kstrtol(argv[1], 0, &sig))
 		return KDB_BADINT;
 	if ((sig >= 0) || !valid_signal(-sig)) {
 		kdb_printf("Invalid signal parameter.<-signal>\n");
@@ -2443,8 +2417,7 @@ static int kdb_kill(int argc, const char **argv)
 	}
 	sig = -sig;
 
-	pid = simple_strtol(argv[2], &endp, 0);
-	if (*endp)
+	if (kstrtol(argv[2], 0, &pid))
 		return KDB_BADINT;
 	if (pid <= 0) {
 		kdb_printf("Process ID must be large than 0.\n");
-- 
2.39.2

