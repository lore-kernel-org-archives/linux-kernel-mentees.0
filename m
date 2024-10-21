Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDB5C1E2829
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 21 Oct 2024 21:17:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729545450; cv=none; b=pB2t14SAll7qbuw59lFEG00Ghe8RFZM4ve8ugT8ZUcLifQX4aqAGanru207nru2R/OhW/r24GWPC8hLyV1o/XfpUcFRFhh/BtZrs9FGUO4pl5JkEW+a/aS81saQsyUzTVk421xrjZBoKrHGeQXO8ImPtcD2K2ttgti5AeVB/jUw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729545450; c=relaxed/simple;
	bh=pv3jKh6fN2c1jXFgbQJcvaSmIksdraQtfExZKZJ0xQg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=IioJyCybiZGdRpOlZLsVZc51fs5v78/V/MflDv/LAD50rnTvrAqJq3rlNNCMXiE89GefYA3PR906qNDPLFAhUXqSKtf+PliwQWflGR8nwwkhppNAX2bnpt1WClTOxoIi/dJPMdLhfB+tMbRWYIFzNOfJwDcs+NvETkaNEXVmdTA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=lichtman.org header.i=@lichtman.org header.b=DqQPc+5i; arc=none smtp.client-ip=140.211.166.133
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lichtman.org header.i=@lichtman.org header.b="DqQPc+5i"
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6C3C040533
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 21 Oct 2024 21:17:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -5.793
X-Spam-Level:
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id avV7mYexvlA9 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 21 Oct 2024 21:17:25 +0000 (UTC)
X-Greylist: delayed 302 seconds by postgrey-1.37 at util1.osuosl.org; Mon, 21 Oct 2024 21:17:25 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 3888840472
Authentication-Results: smtp2.osuosl.org; dmarc=pass (p=none dis=none) header.from=lichtman.org
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3888840472
Authentication-Results: smtp2.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=lichtman.org header.i=@lichtman.org header.a=rsa-sha256 header.s=mail header.b=DqQPc+5i
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=149.28.33.109; helo=lichtman.org; envelope-from=nir@lichtman.org; receiver=<UNKNOWN> 
Received: from lichtman.org (lichtman.org [149.28.33.109])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 3888840472
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 21 Oct 2024 21:17:25 +0000 (UTC)
Received: by lichtman.org (Postfix, from userid 1000)
	id 0A5D417710F; Mon, 21 Oct 2024 21:17:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=lichtman.org; s=mail;
	t=1729545444; bh=pv3jKh6fN2c1jXFgbQJcvaSmIksdraQtfExZKZJ0xQg=;
	h=Date:From:To:Cc:Subject:From;
	b=DqQPc+5iwL76k7nifgNBW/2C7LN3NSs/j6dz8GLd/XOA7Il8N4L4PAIXl0BgC8FRt
	 E6ThUou2WHr2qg1dPEMmJc64DCdwDKemhuVZdO1u1IYChppbArGhqf38OqMyTfKa4S
	 BtRl5hVXjd7brJr6qWDnS0xVZyrpQq2dpSDAn2yqIIZ48wZk3TPVZhE2G/lhBz/YU+
	 19gYj34z8OMzG8Rb7AABQXgIczFGVtHFAgG7WL12w4Ss28s+YtPLOdGH4uRcfByJ4u
	 JMOprs0koHPZOmrc+yULjEuBc0SBXeBKoJ5l+GtyLwf0x5x4PUhVDq9wTpTa6jsC0x
	 al8BV/sTyPfSw==
Date: Mon, 21 Oct 2024 21:17:24 +0000
From: Nir Lichtman <nir@lichtman.org>
To: kgdb-bugreport@lists.sourceforge.net,
	linux-trace-kernel@vger.kernel.org
Cc: yuran.pereira@hotmail.com, jason.wessel@windriver.com,
	daniel.thompson@linaro.org, dianders@chromium.org,
	rostedt@goodmis.org, mhiramat@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linuxfoundation.org
Subject: [PATCH v2 2/2] trace: kdb: Replace simple_strtoul with kstrtoul in
 kdb_ftdump
Message-ID: <20241021211724.GC835676@lichtman.org>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

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
Signed-off-by: Nir Lichtman <nir@lichtman.org>
---
 kernel/trace/trace_kdb.c | 15 ++++++---------
 1 file changed, 6 insertions(+), 9 deletions(-)

diff --git a/kernel/trace/trace_kdb.c b/kernel/trace/trace_kdb.c
index 59857a1ee44c..eadda6e05526 100644
--- a/kernel/trace/trace_kdb.c
+++ b/kernel/trace/trace_kdb.c
@@ -96,23 +96,20 @@ static int kdb_ftdump(int argc, const char **argv)
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
-		    !cpu_online(cpu_file))
+		err = kstrtol(argv[2], 0, &cpu_file);
+		if (err || cpu_file >= NR_CPUS || cpu_file < 0 ||
+			!cpu_online(cpu_file))
 			return KDB_BADINT;
 	} else {
 		cpu_file = RING_BUFFER_ALL_CPUS;
-- 
2.39.2
