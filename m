Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 011D413D88F
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri, 12 Jul 2024 12:31:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720787503; cv=none; b=gz0IsKMVTJVmRipwOTFyu+PCZ/T0EIHwSmfjDtSwdLqmK4cq01ZdxJWabhOItHHQQM6CN4c7zqOAtoM5YKPhOEeGkjYu3e7zA571CUwHxYQFsyWWZ9vKj8vQF+XG0VP0Y1F3BGreKQCzEbgVlP/JkAeU4sxlH4GSAZ6CL9nkczw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720787503; c=relaxed/simple;
	bh=OANoTuoGoQiFC+RYRuUgcp535q0ufRXffhtDGr4YecU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FF9qBsRxejvP8ouh/mh82D1jkMDlKvF6NucIExkhHisrjUj0hNXYhO4RUn4wBcwN17ZMgtPGM7uz22Ka5DU1lN/xzydstIXa3op/AwWrh3X6TAdQIzXiV5RFD4QALKo976goHSHyYZSX3sR/0KrEyatgPLdhpGW0JYLwmfCWf3I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=web.de header.i=spasswolf@web.de header.b=Yw2jytgA; arc=none smtp.client-ip=140.211.166.133
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=spasswolf@web.de header.b="Yw2jytgA"
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 93A9940240
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri, 12 Jul 2024 12:31:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.8
X-Spam-Level:
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tNXL7LMnIQJx for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 12 Jul 2024 12:31:40 +0000 (UTC)
X-Greylist: delayed 476 seconds by postgrey-1.37 at util1.osuosl.org; Fri, 12 Jul 2024 12:31:39 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org F0452400F2
Authentication-Results: smtp2.osuosl.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F0452400F2
Authentication-Results: smtp2.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=web.de header.i=spasswolf@web.de header.a=rsa-sha256 header.s=s29768273 header.b=Yw2jytgA
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.72.192.78; helo=mout.web.de; envelope-from=spasswolf@web.de; receiver=<UNKNOWN> 
Received: from mout.web.de (mout.web.de [217.72.192.78])
	by smtp2.osuosl.org (Postfix) with ESMTPS id F0452400F2
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri, 12 Jul 2024 12:31:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1720787495; x=1721392295; i=spasswolf@web.de;
	bh=OANoTuoGoQiFC+RYRuUgcp535q0ufRXffhtDGr4YecU=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:In-Reply-To:
	 References:MIME-Version:cc:content-transfer-encoding:content-type:
	 date:from:message-id:mime-version:reply-to:subject:to;
	b=Yw2jytgAh+nLS+/cKQtvON9vKMq9/5EUua2dMBMqirZIipZUA+qWpLNGahc1DgyE
	 8S8s+mzhcQei1LJMLEJjvpU6DzXlCfI4kTuXoAhwI5vOxaCMNjhc54rNyb3VvkfoR
	 7Dddq4etGPp3/BCVsqPsGniuQv7lLf1nCvCN/sKiske71cR0RHfmT6N2t3UeF9JNe
	 wj4a+57Mm56GFvoD7LtvxoPIy6KVdJ43NjAIvNcE51YhaINH15IRrV9wmnqCvGQUi
	 HEGeLaaiBO7wu6fmo8GlHpGdsrxmZGuZ37s5tVNbnivbDs/9qglLdPeFxR9mjN0A5
	 ANpyChYR0jyX+6sUyA==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from localhost.localdomain ([84.119.92.193]) by smtp.web.de
 (mrweb106 [213.165.67.124]) with ESMTPSA (Nemesis) id
 1MMpCg-1sl0Wt1AXc-00KNPW; Fri, 12 Jul 2024 14:18:03 +0200
From: Bert Karwatzki <spasswolf@web.de>
To: Pei Li <peili.dev@gmail.com>
Cc: Bert Karwatzki <spasswolf@web.de>,
	Andrew Morton <akpm@linux-foundation.org>,
	Shuah Khan <skhan@linuxfoundation.org>,
	David Hildenbrand <david@redhat.com>,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	linux-next@vger.kernel.org,
	syzbot+35a4414f6e247f515443@syzkaller.appspotmail.com,
	syzkaller-bugs@googlegroups.com,
	linux-kernel-mentees@lists.linuxfoundation.org,
	senozhatsky@chromium.org
Subject: Re: [PATCH] mm: Fix mmap_assert_locked() in follow_pte()
Date: Fri, 12 Jul 2024 14:17:58 +0200
Message-ID: <20240712121800.3049-1-spasswolf@web.de>
X-Mailer: git-send-email 2.45.2
In-Reply-To: 20240712080414.GA47643@google.com
References: 
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Provags-ID: V03:K1:jj4yqdkE527pyY3SjpXZ7w5xCsDUyzuyDN2llM21dpyeUfVkaEj
 8c8QcgL5R2B7xVPQuMOwBlnlD45KD+8EP0bPK8HWlLhBF3i76Pb/VjX2RMb5hR9ctwNIj8M
 ds9WV0M5FPACEa5zyP2mK3r1hG/76rqX6f0yUD+wujQyHnPIEd553x9RNSmP3SYD/gYL8k2
 1ojcQkGhf1FsfK8MGNa0w==
UI-OutboundReport: notjunk:1;M01:P0:1MBlHXyu56Y=;aSlLV0K8eCzyFKA3YHUJDN2/RDh
 hqFumxic/j0WLBgJYXMpTt/A8ofLqDtC//hDwxsnvfCPduZKa98J/DRt0AHPDiDRVPWva7iO3
 wCeEnamlq0bRZ6jnrNngn3fJ9q5yTC9+Fkbo2Q6QAuauTsldoMXXWW9VUiuL8LLGuPfsQpqyB
 +ePAqQLo4OakW3/c3YwNGdGROjiV5VlovBiZqaoIlB69iW/2lXoJkISK/3H2gTUtOa9gp0bpQ
 xMKcLDY3QOJt8b2Ns5A3gGFC8H7lpBNip61Hr6Tg1EQ546/ngmfAWsQLgMGtuL5TzewavxLxU
 YQ7tXA/EpLqsO9wYwEqfSq4TjWbDiIfHfPYAKbInLz5Yaj5rQno+yvVuv+nFN0a/HEZUPe7db
 0D/thIC1kvSy6G5ifOC6i/e+xPCn70fYYZzzBEifaxH6tbff/ijgj+SfGAQb2Yd+3VtqE8bj4
 9jie7fQkjFo8uO1Qit8p2UKXnCy3g4RUlWuXyu8iZnrk71lnxZvHdjjCbeSIW9KHYMKBroFFU
 wy/YVygj8bS1bGFcvfGzaDLcWlLoxYMhH1LiuAry5YHkqPuhMOXQ6BbpT4HDHCCuSOgwoua8C
 HM9ye/5LmzByhAzsxpHG1JHBZmPEDGli1rP5Xou6FKJhaMXqzYGHzcu1T5b0sL6hgouI03Mnv
 9CHn/DW/aKKGZlxFOsw4Lu+dWXFi7PwIRfoRWbOKnCSEMvOAp5NWc9O/A9eSnrCfvdATGRUVX
 km7lqNa7n8DCt+XxyqviyQs8yXb3wWMvZJloepPHq0UugCDj8qItB8he77SXAWts12uwdHsz1
 8raoXIEyf4YKMa2MQkoOmjzA==

This is causing a deadlock for me, too. Since linux-next-20240712 I observe
a hang when starting the gui. I bisected this to commit a13252049629 and
reverting this commit in linux-next-20240712 fixes the issue for me.
I do not have any log messages to prove the dead lock, though, as I compiled
everything without CONFIG_LOCKDEP.

Bert Karwatzki
