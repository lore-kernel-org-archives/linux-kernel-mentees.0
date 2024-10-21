Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47DA11E230B
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 21 Oct 2024 21:17:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.137
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729545461; cv=none; b=tL+w45uLC8eK25V/Nimtk3V+gqdtPxNWWvO4rsG6KtbOU2Ybr3y+xA+dH33lHxfVFtggKXxCgyhbMtr3KZKVxlgiwhyyepzVT1tuSfKew5AeguH5O4BXJ6Zf8Q26p8nhDaOuGBdnqgWJiInGxfPug21WSNyVDJa6RZ58x/a3rIQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729545461; c=relaxed/simple;
	bh=KuPztDv7ggupu/upOVkA2KT/eVBKur7UN2wM9Xt5FR8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=FDYiNFWlx6rIn6lbQYxV5eR89bTKMXKMus7qC9Mq3wJ//RXoY7ZPENNTBadEGdG4C84tormFR9ep0EW0z3KBYAJE0NLCrL88M4KtX6sjQpDTHoR4RmjvLk8XpvN6p9voQoHsD2GQhR+ON0lHVaAElJngA0Yl1xYucQ/r6D5qsL8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=lichtman.org header.i=@lichtman.org header.b=p7j9LCjx; arc=none smtp.client-ip=140.211.166.137
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lichtman.org header.i=@lichtman.org header.b="p7j9LCjx"
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id EFFB2404D8
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 21 Oct 2024 21:17:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -5.793
X-Spam-Level:
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Z0W1TSUeVIsa for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 21 Oct 2024 21:17:38 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=149.28.33.109; helo=lichtman.org; envelope-from=nir@lichtman.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 65ACC404DC
Authentication-Results: smtp4.osuosl.org; dmarc=pass (p=none dis=none) header.from=lichtman.org
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 65ACC404DC
Authentication-Results: smtp4.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=lichtman.org header.i=@lichtman.org header.a=rsa-sha256 header.s=mail header.b=p7j9LCjx
Received: from lichtman.org (lichtman.org [149.28.33.109])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 65ACC404DC
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 21 Oct 2024 21:17:38 +0000 (UTC)
Received: by lichtman.org (Postfix, from userid 1000)
	id 0518D177106; Mon, 21 Oct 2024 21:12:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=lichtman.org; s=mail;
	t=1729545142; bh=KuPztDv7ggupu/upOVkA2KT/eVBKur7UN2wM9Xt5FR8=;
	h=Date:From:To:Cc:Subject:From;
	b=p7j9LCjx19f77YziYjAACed145az7xKhhiwrXnMgilK8uXPRcZ6xIEbYiIDFZhlOk
	 k/FCgID6OwNtRdk25hKMFOgldU/UG84ouxXovrSrnLkyw0cmgnNMV5/u0qjOwAaUmb
	 LYkMPDbq765uDy8UOmEllL9RAalKB5+qGOjN2z2AqwlYQkpj3Z6K2bqVsH4CcSXbij
	 axHwYUb3UGOLr+WSZh0gP1OO/vMVIop2DWPC3Iy2l7Jl3zciiso3i182g0xbZlCprX
	 hPd8QjHuRyHfT9ghb+axWbA31oeKuqcdghKIJaouWGXTM/ceJcwcHTWvbQxFCJkTe2
	 OeCZWsgcN4QGA==
Date: Mon, 21 Oct 2024 21:12:21 +0000
From: Nir Lichtman <nir@lichtman.org>
To: kgdb-bugreport@lists.sourceforge.net,
	linux-trace-kernel@vger.kernel.org
Cc: yuran.pereira@hotmail.com, jason.wessel@windriver.com,
	daniel.thompson@linaro.org, dianders@chromium.org,
	rostedt@goodmis.org, mhiramat@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linuxfoundation.org
Subject: [PATCH v2 0/2] Replace the use of simple_strtol/ul functions with
 kstrto
Message-ID: <20241021211221.GA835676@lichtman.org>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

The simple_str* family of functions perform no error checking in
scenarios where the input value overflows the intended output variable.
This results in these function successfully returning even when the
output does not match the input string.

Or as it was mentioned [1], "...simple_strtol(), simple_strtoll(),
simple_strtoul(), and simple_strtoull() functions explicitly ignore
overflows, which may lead to unexpected results in callers."
Hence, the use of those functions is discouraged.

This patch series replaces uses of the simple_strto* series of function
with the safer  kstrto* alternatives.

  
[1] https://www.kernel.org/doc/html/latest/process/deprecated.html#simple-strtol-simple-strtoll-simple-strtoul-simple-strtoull

Yuran Pereira (2):
  kdb: Replace the use of simple_strto with safer kstrto in kdb_main
  trace: kdb: Replace simple_strtoul with kstrtoul in kdb_ftdump

v2: Nir Lichtman (2): Removed confusing support for hex number inputs with no preceding "0x", and other CR fixes

 kernel/debug/kdb/kdb_main.c | 69 +++++++++--------------------------
 kernel/trace/trace_kdb.c    | 15 +++-----                             2 files changed, 23 insertions(+), 61 deletions(-)
