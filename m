Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C3A21F951
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sat, 26 Oct 2024 14:56:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.137
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729954608; cv=none; b=QYEod8A0Lk4Riv9xmCeIm+la2+N0ObC7vKIZc+wS6/QTvabByush968J9HxEJIW/reH53ipd162Uzo1l7nzh5LI4ANl4x1Kcmyoa2BkjqSeUjUXW35epM+RIF9GfodfmSC20BAHd4bR0PCAULqNoufT8BAL7t1jcqq+f72s5h1M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729954608; c=relaxed/simple;
	bh=dm93p2HTGECj1+ovJm8bfabWgFNTsuuWOau2Y+LDgXk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=c45pK6zVFmkxNyV/jQiavHCwr8DUNSXtQf6finTexckP0dl6fDRya7ucg3dxkoi+alGnqtWov/0TmHNPDLEyE3N5zZI/hsN15sSA8MvjHs9m7iQy0zr/Wg7qRYs85+b8/OuY7cpUzjQra+RD1lZ2GyuEf+S7GvpQ/zpcKJRuCFk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=lichtman.org header.i=@lichtman.org header.b=R0zWWKbp; arc=none smtp.client-ip=140.211.166.137
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lichtman.org header.i=@lichtman.org header.b="R0zWWKbp"
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3A38F40570
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sat, 26 Oct 2024 14:56:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -5.793
X-Spam-Level:
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id N3sivfFoYWJ6 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 26 Oct 2024 14:56:45 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=149.28.33.109; helo=lichtman.org; envelope-from=nir@lichtman.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 17B8B4056B
Authentication-Results: smtp4.osuosl.org; dmarc=pass (p=none dis=none) header.from=lichtman.org
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 17B8B4056B
Authentication-Results: smtp4.osuosl.org;
	dkim=pass (2048-bit key) header.d=lichtman.org header.i=@lichtman.org header.a=rsa-sha256 header.s=mail header.b=R0zWWKbp
Received: from lichtman.org (lichtman.org [149.28.33.109])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 17B8B4056B
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sat, 26 Oct 2024 14:56:44 +0000 (UTC)
Received: by lichtman.org (Postfix, from userid 1000)
	id 25DC2177103; Sat, 26 Oct 2024 14:56:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=lichtman.org; s=mail;
	t=1729954604; bh=dm93p2HTGECj1+ovJm8bfabWgFNTsuuWOau2Y+LDgXk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=R0zWWKbpQy+LIbfgNXjAlEcfcilL2OV01zfjc46Pdeh/W1/ohNexyZtA7KH6mr8iP
	 i+imQmDCbRSe/W9kF1zfb2+pjLLopjQSrVSFCj1erKDvcbsUx7mBGkIYaVKU0vkzeH
	 SaMLYzxGn781k3a3TZ9Mi7NKRkAFu5Z6mL5Pw1skbyOdvfJse2hMclvhRN3sMoGGxQ
	 eF5b4ajVlOO+f9slBYaSZirB1wYt663VGQ8D9U1eS/IxwBJg17Sof46U0rOYoEB3o8
	 dPkLUWrHYF7rsdA/lFCIFpopnaTEtqjtf0GF6El3hKEHT8n2lyT/cEVqRg6dnnBc9j
	 5oNQ0yN608L3g==
Date: Sat, 26 Oct 2024 14:56:44 +0000
From: Nir Lichtman <nir@lichtman.org>
To: kgdb-bugreport@lists.sourceforge.net,
	linux-trace-kernel@vger.kernel.org
Cc: yuran.pereira@hotmail.com, jason.wessel@windriver.com,
	daniel.thompson@linaro.org, dianders@chromium.org,
	rostedt@goodmis.org, mhiramat@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linuxfoundation.org
Subject: [PATCH v3 2/3] trace: kdb: Replace simple_strtoul with kstrtoul in
 kdb_ftdump
Message-ID: <20241026145644.GB892629@lichtman.org>
References: <20241026144724.GA892311@lichtman.org>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241026144724.GA892311@lichtman.org>

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

