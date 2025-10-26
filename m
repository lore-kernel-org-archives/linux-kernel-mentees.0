Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A26522AE45
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sun, 26 Oct 2025 00:25:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761438330; cv=none; b=u7tE4PF4caQKx96tBR2j10kGZlIcaGkTh7w948Md63IFh8RfzHBdsu5687XXOSHFfU9ojH9MJ6NcBPYdPuFi7nbMWMD96fwdA1LCjet6D33kwx5cztrUZB2WSM2Uljof6uyFPzCQCLDpy62b7LsSiQhpl/zxWPbz9zZ2HMhFkwU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761438330; c=relaxed/simple;
	bh=NngNYQPp33+uptER8AxTWZ5xI0sq3aqpnbiX6AXmjhg=;
	h=From:To:Cc:Subject:In-Reply-To:Date:Message-ID:MIME-Version:
	 Content-Type; b=K5tvq46ZKAQgGA8fe2TF+vKpK2YcXjNuML6FoOXWiVIsB6XviQGkpReH3rbgKclnQ8pWthqrZyuv6y85EcrHfMP54bqrB+klsIdMfxNI8vKZS6Vb8iq8oaC9Oswq0hN8JF2kV6e44X7Y310Qk3pK387P7+QS7PTojRtBCViM2zI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.138
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D0F1C8136D
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sun, 26 Oct 2025 00:25:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -6.291
X-Spam-Level:
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SqICdS5pZavh for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 26 Oct 2025 00:25:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.183; helo=smtp.gentoo.org; envelope-from=sam@gentoo.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 54D408136B
Received: from smtp.gentoo.org (woodpecker.gentoo.org [140.211.166.183])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 54D408136B
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sun, 26 Oct 2025 00:25:28 +0000 (UTC)
Received: from mop.sam.mop (2.8.3.0.0.0.0.0.0.0.0.0.0.0.0.0.a.5.c.d.c.d.9.1.0.b.8.0.1.0.0.2.ip6.arpa [IPv6:2001:8b0:19dc:dc5a::382])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sam)
	by smtp.gentoo.org (Postfix) with ESMTPSA id 8C392340DC6;
	Sun, 26 Oct 2025 00:25:23 +0000 (UTC)
From: Sam James <sam@gentoo.org>
To: olsajiri@gmail.com
Cc: bpf@vger.kernel.org,david.hunter.linux@gmail.com,kees@kernel.org,khalid@kernel.org,linux-kernel-mentees@lists.linuxfoundation.org,linux-kernel@vger.kernel.org,linux-kselftest@vger.kernel.org,luto@amacapital.net,nirbhay.lkd@gmail.com,shuah@kernel.org,wad@chromium.org
Subject: Re: [PATCH] selftests/seccomp: fix pointer type mismatch in UPROBE
 test
In-Reply-To: <aP0-k3vlEEWNUtF8@krava>
Organization: Gentoo
User-Agent: mu4e 1.12.13; emacs 31.0.50
Date: Sun, 26 Oct 2025 01:25:20 +0100
Message-ID: <87qzuqik5r.fsf@gentoo.org>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

I tried to reproduce it with a small testcase and I could reproduce the
error with -fcf-protection and not without (where I get a warning that
the nocf_check attribute is ignored b/c of no flag).
