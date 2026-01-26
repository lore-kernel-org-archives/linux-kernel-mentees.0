Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96BB029D267
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 26 Jan 2026 13:24:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769433888; cv=none; b=t3xXKNREDd/IjNAY6ywUFtj0yWvh2t8dR4dNVRMm13g6hprSDMJP7uSr2F8j2UNgOk/7emoBn056iC64Q2NGhL3aQuaakWN5xzRGh61yedluzf6yULety0boK/97QV+K9TFHO7wkw/MBtY44xdsbhSfbBThAxXwdZ+C0fL809F8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769433888; c=relaxed/simple;
	bh=f53timH0np4bz+gztyV/dfAq6Ha3g4qBItMHfYuFoN4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=emgyAwfOGGxLapNEL3oVBcczZ/r1lbpkZevDHSvvrwv+tz2HFZCjnQ+/MPJv+OrFWvCJVm+8C6gvfxCOv9gRnam1BifW0MZ08L8UWIw4t8ZMyIryiyKFpcnfM7Tf//w3UJP3NtIXWsKWgrhrre0GZfqhc6C8mDT8htbkDbb3N4w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=A865mIK6; arc=none smtp.client-ip=140.211.166.136
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="A865mIK6"
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4352D60B8B
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 26 Jan 2026 13:24:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -1.849
X-Spam-Level:
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fMnRe3jOGjHx for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 26 Jan 2026 13:24:46 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::72e; helo=mail-qk1-x72e.google.com; envelope-from=sohammetha01@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 345B3608F5
Authentication-Results: smtp3.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 345B3608F5
Authentication-Results: smtp3.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=A865mIK6
Received: from mail-qk1-x72e.google.com (mail-qk1-x72e.google.com [IPv6:2607:f8b0:4864:20::72e])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 345B3608F5
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 26 Jan 2026 13:24:46 +0000 (UTC)
Received: by mail-qk1-x72e.google.com with SMTP id af79cd13be357-8c530866cf0so522276185a.1
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 26 Jan 2026 05:24:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769433885; x=1770038685; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iQxwi2pFUZR+UAlToTQBrAAHIAjqCBSvDHQE8e6QSYI=;
        b=A865mIK6UlXg9Efrh8wB4hAn5kDBzUBLXRgwfvcCRAsjALh39GOj7ckFrwTUv2hLHD
         v5IeoDfxK8iUHn/NKCWNYQYtkF9wSSUf36LgGEd6SXqDCF9CqYTndL0ggwajrXrc0hiC
         Koi8BWfbfxpxKpr+3NlEsQvLX2dia+3oGeAr7+vhVscNmxrIl2V4zWzwpoBiU/olC0Z0
         xjiMSh6VAifPpRaxRf2wF+Cb97Z8lZp7m/AAyT+9Os4flnVl+u7Ehun+45D25k6ck/2+
         3r0CS/GY04BjnzoTkwDshSjNacHfrzqTAtgB1IecGT9CGkoCbDX8Eu/Jhk0V9i/fgoh7
         M+jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769433885; x=1770038685;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=iQxwi2pFUZR+UAlToTQBrAAHIAjqCBSvDHQE8e6QSYI=;
        b=vEIvx8WJD+ztg6KhO/des26aO9N1CpOcYS3HDCsdhdSmh0V6ItTEBcrO9y2ESc/vRD
         3wJBZE1uoSFJ3ZjE5aN63HI0eMP+7220tQltDO2Jl2YtvwYzAucqGymd/ZLUNxK2SnGa
         /qbSFYQxE/O1gf6Jg8PdwAnMmE6Ck0xWcCMTF9rrl0zqXuJ8DcBBGeEVHCzL6Ba2iJY3
         u3aTzwrIjzSYFp+J3yexb0skK2A6wiTodBuM83GRslmuqzpLnkuiwERB4gFwxNG2mjub
         ZLM/06rF9X9GZ+tRiiqOaa6lA6iez0mUsyUCpaFb3EH6VDm2Hiuu3nlAE+gYVdQWc4J6
         g9rw==
X-Gm-Message-State: AOJu0Yzf2fI2Snjgdj2tCWpvsIWdsmDiEXDJ2USETfP5DJccnZbZSS8x
	w/4b8ZZfGkWxQaYw+vmK38VlsaAYym6Qs/Ld1p0MNqR6Ef4efwg1ZZETMEg2HUbE
X-Gm-Gg: AZuq6aJBeXVWlrGzfgxr24QZ5KCiLspKxTdyKcUfynzX4HS9sLs2zdlsKcXKYysOYqM
	6TesKKX9L6E+hN8X/XX9j6qbaXDzD3KPz5DnduEwEObAqfPnhCa/y9oJK/1LLoJSzPIoSZV1Tq9
	Y8twRdAs/H6bxdSrsYelY0O4GFo2LdPVeQzpaY27QjMDAsQqhnfjCpDu4Jq5X5//M0RBVY3j5zL
	6CDOG4iNTsHcxPfcn2gKBjkzNB8gYwhE12HwI33ebQehOXYUNqj7lSfb7JlWVygUCIuVy302PMh
	R+nS8wSgV1N9DKHuXARinsWo96zX92hsIGKdU7I+DnwgRAlb6hYBopzNj10pmmgl/p9WsfTgBBi
	lwUr9uU/wC2aZxyyA9SFcy0bppMEw7OAwOQ/uiH8ZiHqgB5heNfRQtq8eaqegLACNQHTWHzHgwj
	Y2Wim3ukC1W8bB5yTNSrw=
X-Received: by 2002:a05:6a00:22d3:b0:81f:4c37:7647 with SMTP id d2e1a72fcca58-823412dbea7mr4104835b3a.68.1769427926560;
        Mon, 26 Jan 2026 03:45:26 -0800 (PST)
Received: from soham-laptop.. ([103.182.158.109])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82318648dd7sm9086663b3a.3.2026.01.26.03.45.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Jan 2026 03:45:26 -0800 (PST)
From: Soham Metha <sohammetha01@gmail.com>
To: linux-kernel-mentees@lists.linuxfoundation.org
Cc: shuah@kernel.org,
	skhan@linuxfoundation.org,
	linux-kernel@vger.kernel.org,
	syzbot+619b9ef527f510a57cfc@syzkaller.appspotmail.com,
	syzkaller-bugs@googlegroups.com,
	andrii@kernel.org,
	ast@kernel.org,
	bpf@vger.kernel.org,
	daniel@iogearbox.net,
	eddyz87@gmail.com,
	haoluo@google.com,
	john.fastabend@gmail.com,
	jolsa@kernel.org,
	kpsingh@kernel.org,
	martin.lau@linux.dev,
	sdf@fomichev.me,
	song@kernel.org,
	yonghong.song@linux.dev,
	Soham Metha <sohammetha01@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Jason Xing <kernelxing@tencent.com>,
	Kuniyuki Iwashima <kuniyu@google.com>,
	Michal Luczaj <mhal@rbox.co>,
	Mina Almasry <almasrymina@google.com>,
	Eric Biggers <ebiggers@google.com>,
	Alexander Lobakin <aleksander.lobakin@intel.com>,
	netdev@vger.kernel.org
Subject: [PATCH v2] net: skbuff: fix uninitialized memory use in pskb_expand_head()
Date: Mon, 26 Jan 2026 17:13:30 +0530
Message-Id: <20260126114332.23955-1-sohammetha01@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <6954bc70.050a0220.a1b6.0310.GAE@google.com>
References: <6954bc70.050a0220.a1b6.0310.GAE@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

pskb_expand_head() allocates a new skb data buffer using
kmalloc_reserve(), which does not initialize memory. skb helpers may
later copy or move padding bytes from the buffer.

Initialize the newly allocated skb buffer to avoid propagating
uninitialized memory.

Reported-by: syzbot+619b9ef527f510a57cfc@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=619b9ef527f510a57cfc
Tested-by: syzbot+619b9ef527f510a57cfc@syzkaller.appspotmail.com
Signed-off-by: Soham Metha <sohammetha01@gmail.com>
---

v2:
- No code changes
- Resent to netdev list
- Added Closes tag
- Added Tested-by tag

 net/core/skbuff.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/net/core/skbuff.c b/net/core/skbuff.c
index a56133902c0d..b0f0d3a0310b 100644
--- a/net/core/skbuff.c
+++ b/net/core/skbuff.c
@@ -2282,6 +2282,9 @@ int pskb_expand_head(struct sk_buff *skb, int nhead, int ntail,
 	data = kmalloc_reserve(&size, gfp_mask, NUMA_NO_NODE, NULL);
 	if (!data)
 		goto nodata;
+
+	memset(data, 0, size);
+
 	size = SKB_WITH_OVERHEAD(size);
 
 	/* Copy only real data... and, alas, header. This should be
-- 
2.34.1

