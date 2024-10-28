Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E0C11DED54
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 28 Oct 2024 19:21:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730143264; cv=none; b=eKcwAPOT57+4N4keSQ1IYQYxZ89GQuKBnlqFURiaV5NqfM/VHMJ3dVmDyiojUg+HAlX1U7knQGaKvuPsAYFhNFIAuLCT505qdVxLnZHqwZgLgbywW9gK4gxkTVzfwc98U3D+bf68k2wbw7towhiNXF/mLUax9YXySFjvjdYyaIg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730143264; c=relaxed/simple;
	bh=aR+7Rb7rc6q3gGzSjOyg5o99zroVCJk79Aj9JqT1/88=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XhZwiDl6mnyO9FZq2Mr96+oiRZQCWfD0UTwmDJ1Y4HXghPj3LyU0mNnqb9DMCLc8IcqXjnheQgNGMiaUdxJNpP5DAA8/vc51s1jliEW0hlC1EBDPNgI+h+Za0kcJjisIh6n4j6idw0RdyBOJsv6M0p+RFQEnO984utVYOn4JxhU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=lichtman.org header.i=@lichtman.org header.b=orSQodXM; arc=none smtp.client-ip=140.211.166.136
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lichtman.org header.i=@lichtman.org header.b="orSQodXM"
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A73E5608A6
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 28 Oct 2024 19:21:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -5.793
X-Spam-Level:
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0pIwTqN5Nm2W for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 28 Oct 2024 19:21:01 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=149.28.33.109; helo=lichtman.org; envelope-from=nir@lichtman.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org C1128607D0
Authentication-Results: smtp3.osuosl.org; dmarc=pass (p=none dis=none) header.from=lichtman.org
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C1128607D0
Authentication-Results: smtp3.osuosl.org;
	dkim=pass (2048-bit key) header.d=lichtman.org header.i=@lichtman.org header.a=rsa-sha256 header.s=mail header.b=orSQodXM
Received: from lichtman.org (lichtman.org [149.28.33.109])
	by smtp3.osuosl.org (Postfix) with ESMTPS id C1128607D0
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 28 Oct 2024 19:21:01 +0000 (UTC)
Received: by lichtman.org (Postfix, from userid 1000)
	id CFFF2177105; Mon, 28 Oct 2024 19:21:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=lichtman.org; s=mail;
	t=1730143260; bh=aR+7Rb7rc6q3gGzSjOyg5o99zroVCJk79Aj9JqT1/88=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=orSQodXMtUmlKyB73JDULeBid9AJ6rPnRD68MID81NBTYVV30oh7jJeAoseL51L75
	 81+B5UByPJmHIL0yHhZFXXLLK7Mtg/HsLR3yHIxDZokKQI8BeOs4vk3ceDTtZa7KnR
	 CLEI/VnDcSfAlOeaVp2Szg7afTIqZpKmcdP0TJjXM+GhnMupl++C6RhaanaxwF6Jih
	 TKnHK+eq0SWfd4gsd2+GFfZNoTkh/bSisHAhiwQGUrE+9JlSgr/8E2OcKXV09CJ7Ob
	 rjZAldP/XbT26cLThzzujTlXR3zP5BGrydlbcp3h1bj72Lcm4I5+oQdsLjj5dcTMP8
	 g861LPRay+H2g==
Date: Mon, 28 Oct 2024 19:21:00 +0000
From: Nir Lichtman <nir@lichtman.org>
To: kgdb-bugreport@lists.sourceforge.net,
	linux-trace-kernel@vger.kernel.org
Cc: yuran.pereira@hotmail.com, jason.wessel@windriver.com,
	daniel.thompson@linaro.org, dianders@chromium.org,
	rostedt@goodmis.org, mhiramat@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linuxfoundation.org
Subject: [PATCH v4 2/3] trace: kdb: Replace simple_strtoul with kstrtoul in
 kdb_ftdump
Message-ID: <20241028192100.GB918454@lichtman.org>
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

The function simple_strtoul performs no error checking in scenarios
where the input value overflows the intended output variable.
This results in this function successfully returning, even when the
output does not match the input string (aka the function returns
successfully even when the result is wrong).

Or as it was mentioned [1], "...simple_strtol(), simple_strtoll(),
simple_strtoul(), and simple_strtoull() functions explicitly ignore
overflows, which may lead to unexpected results in callers."
Hence, the use of those functions is discouraged.

This patch replaces all uses of the simple_strtoul with the safer
alternatives kstrtoint and kstrtol.

[1] https://www.kernel.org/doc/html/latest/process/deprecated.html#simple-strtol-simple-strtoll-simple-strtoul-simple-strtoull

Signed-off-by: Yuran Pereira <yuran.pereira@hotmail.com>
Reviewed-by: Douglas Anderson <dianders@chromium.org>
Acked-by: Masami Hiramatsu (Google) <mhiramat@kernel.org>
[nir: style fixes]
Signed-off-by: Nir Lichtman <nir@lichtman.org>
---
 kernel/trace/trace_kdb.c | 13 +++++--------
 1 file changed, 5 insertions(+), 8 deletions(-)

diff --git a/kernel/trace/trace_kdb.c b/kernel/trace/trace_kdb.c
index 59857a1ee44c..1e72d20b3c2f 100644
--- a/kernel/trace/trace_kdb.c
+++ b/kernel/trace/trace_kdb.c
@@ -96,22 +96,19 @@ static int kdb_ftdump(int argc, const char **argv)
 {
 	int skip_entries = 0;
 	long cpu_file;
-	char *cp;
+	int err;
 	int cnt;
 	int cpu;
 
 	if (argc > 2)
 		return KDB_ARGCOUNT;
 
-	if (argc) {
-		skip_entries = simple_strtol(argv[1], &cp, 0);
-		if (*cp)
-			skip_entries = 0;
-	}
+	if (argc && kstrtoint(argv[1], 0, &skip_entries))
+		return KDB_BADINT;
 
 	if (argc == 2) {
-		cpu_file = simple_strtol(argv[2], &cp, 0);
-		if (*cp || cpu_file >= NR_CPUS || cpu_file < 0 ||
+		err = kstrtol(argv[2], 0, &cpu_file);
+		if (err || cpu_file >= NR_CPUS || cpu_file < 0 ||
 		    !cpu_online(cpu_file))
 			return KDB_BADINT;
 	} else {
-- 
2.39.2
