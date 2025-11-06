Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2280334FF47
	for <linux-kernel-mentees@lists.linux.dev>; Thu,  6 Nov 2025 19:24:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762457087; cv=none; b=LJhzAHdqO5a2367JAgi3OEi6laERcMCtOt0YHF8HwPALssYipG2rabO0XVSBVcEbSyxHjdmw6+WEHnHaBxjFG49aCL1oRXNTbvfaFihWiwKv3nbbikh4Nd0PKkREKZfb5a1MOQMXjz3SqTB7GzOS4dEMtinzbuGXy4q3sfxZtPQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762457087; c=relaxed/simple;
	bh=/8MHMjcZp40iywj2Jp6hNEOKJbwhIS2p+TLY8e5rxj4=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=UKEQ6+QxWhBwOhLgCDeTr0HktB8zZ9Ku5+I5WsqKfEltpEgnI+rIVPHr/DUIKR00A+OwWZwguRYJEEciRKIXLXCLHRsFmqOrQkGSjcf4i59ZrwcT15JGp6E7lEsN0MP0hVBPzQ/xAZY/xJQA2Jx2aXBvSqoED7Ih2+jd3rWlcVY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=POSnh/PU; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="POSnh/PU"
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-34339e4f66eso4003a91.1
        for <linux-kernel-mentees@lists.linux.dev>; Thu, 06 Nov 2025 11:24:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762457085; x=1763061885; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=NoGoAZXF1V/p8pqpha3Z5ljPEXFoXPfWyQqzTK9/QeA=;
        b=POSnh/PUJ2QhWEqTDvgbs0DaaDHFkqa33kEx8X1GJLThXGvatP63Kfe7DtioiHX8ee
         2Rx2VpCri99v9rshbpMKKW9PXulZh5SZMUBHRW0Zm/Loil9YeP2BJOHg5Ku1XvmuZ3rO
         duzk1dw4nK5oCCmE+/VTQHnH9Abnh6t0luCQOm9DQ4TDTBc3Bj7ukrqJvcUcP8ChCbuh
         BnW147hMwId6yAvlSzQ1a1Hu2vfB00lZMVqUJ6nJBp50DntXtO4/pnUtQFuKD+HZBRL2
         iXks61ZTOc+lIE/EPZPrBhUSyjCnfrWyGr0c9DVU5c46vFM4rH/HnjrfOLUdX85C0v2H
         RgYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762457085; x=1763061885;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NoGoAZXF1V/p8pqpha3Z5ljPEXFoXPfWyQqzTK9/QeA=;
        b=AX6ef8sHo02wh3oaDSch/MtstbW5cagbyegm6Slt3KHGv30WwOky+KiNmomxLc57uo
         4uVvKxI1+z2S5Inv4uZj3NYxcUgga6qXTGioKtblloCY+JiFpNm4LzppEbG8lYFZlNok
         9J0yDipIqBEY5kl1344LcqIIuGp+gkWLYT9UA2iEFLHZ8ddAefU76Q4ea3XemB9YCQlD
         aDRVS6r8+93awK1EmHDBp6ftlUTvookgiyvKM3eKHk7lOfXpJpHzx68brxTTfocbCjdr
         AV4mV+1EJ/Xy6QwgS2MaZfqXlcTUv+oFplAajwd1YH37T6VDNh5JjqVbYTMfteDGeC92
         Oh4g==
X-Forwarded-Encrypted: i=1; AJvYcCWxeBH1MLJDW8Cs/2ocFBWNkPXJKh95L+wuW7MhfhxMLdWl8O0rzFCQzDpjN1NhiG8PHpK7cO9U9FE3rbrboo+HTduq8g==@lists.linux.dev
X-Gm-Message-State: AOJu0YwuWceJypGGRCk3nzQ1rdSwo4tiemX6zJGAoEjSlQNPvXYTIICJ
	gKstxZDYa1ia2SjcQIQCCUOcA12mmxdOjdy+k8PWWCx5B/G/Ag1sKcDA
X-Gm-Gg: ASbGnctTh4m5qN1WIoA/RJiXpLRapxFlyFM0T9z2hvad6dZcebAHreycpV5kH25rzz7
	Se+zP3a9BCWhYZZH0zuWkxo6UmQbJ/uXb0E2c6yXoghsWYvpRzf6vgAhSyJbEjJWSJXxROUhnuw
	ZHJWLhoBZpw/i4F3igPYa5dPJBQSAB+OzMR+F3hL9tjMcunWF3Bl/vfwWfAZHLgcVVP4tRSE9kT
	ibckKdDxBKHS0jFHGR9GQqEfn8ni/WJA1j4sox632EZrGVvxBFOEbEiy/Bc4Hni2RiqmUBdBgwB
	Wcq+AJtnDRtjjJhRWwcS1+HIe6eM5Pf1O6ZDZylwUsoyFRSvjIpu9gnHmiq2QrvuVUC7fLdAh7f
	huJLxSbG7aKEpHTqnVRK+QT6fXhMLGcZuHHP47AIRNtKgi8U9ijaKSnP4t8HslOiV51qrTEm5Rb
	iuKWydY5ZwAY+ooAqDxDVPgWWn76Xd
X-Google-Smtp-Source: AGHT+IFsBPELqydba4uzpPfghv8+a5FHZ9eD5U/piy8KqflKlUwj0WVnszq4GjuKBbV4n8iz1qp8hA==
X-Received: by 2002:a17:90b:1c07:b0:330:7a32:3290 with SMTP id 98e67ed59e1d1-3434c5927femr318493a91.37.1762457085265;
        Thu, 06 Nov 2025 11:24:45 -0800 (PST)
Received: from localhost.localdomain ([111.125.210.187])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-341a68aa1edsm6945964a91.1.2025.11.06.11.24.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Nov 2025 11:24:44 -0800 (PST)
From: Prithvi Tambewagh <activprithvi@gmail.com>
To: davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	alexanderduyck@fb.com,
	chuck.lever@oracle.com,
	linyunsheng@huawei.com
Cc: netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	skhan@linuxfoundation.org,
	david.hunter.linux@gmail.com,
	khalid@kernel.org,
	linux-kernel-mentees@lists.linux.dev,
	Prithvi Tambewagh <activprithvi@gmail.com>,
	syzbot+4b8a1e4690e64b018227@syzkaller.appspotmail.com
Subject: [PATCH] net: core: Initialize new header to zero in pskb_expand_head
Date: Fri,  7 Nov 2025 00:54:23 +0530
Message-Id: <20251106192423.412977-1-activprithvi@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

KMSAN reports uninitialized value in can_receive(). The crash trace shows
the uninitialized value was created in pskb_expand_head(). This function
expands header of a socket buffer using kmalloc_reserve() which doesn't
zero-initialize the memory. When old packet data is copied to the new
buffer at an offset of data+nhead, new header area (first nhead bytes of
the new buffer) are left uninitialized. This is fixed by using memset()
to zero-initialize this header of the new buffer.

Reported-by: syzbot+4b8a1e4690e64b018227@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=4b8a1e4690e64b018227
Signed-off-by: Prithvi Tambewagh <activprithvi@gmail.com>
---
 net/core/skbuff.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/net/core/skbuff.c b/net/core/skbuff.c
index 6841e61a6bd0..3486271260ac 100644
--- a/net/core/skbuff.c
+++ b/net/core/skbuff.c
@@ -2282,6 +2282,8 @@ int pskb_expand_head(struct sk_buff *skb, int nhead, int ntail,
 	 */
 	memcpy(data + nhead, skb->head, skb_tail_pointer(skb) - skb->head);
 
+	memset(data, 0, size);
+
 	memcpy((struct skb_shared_info *)(data + size),
 	       skb_shinfo(skb),
 	       offsetof(struct skb_shared_info, frags[skb_shinfo(skb)->nr_frags]));
-- 
2.34.1

