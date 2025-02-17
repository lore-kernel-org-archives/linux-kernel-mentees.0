Received: from mail-oi1-f170.google.com (mail-oi1-f170.google.com [209.85.167.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F50E226168
	for <linux-kernel-mentees@lists.linux.dev>; Mon, 17 Feb 2025 16:54:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739811256; cv=none; b=mp8aGVvYwdd04XcIjblqG229x3JdoB2Xixbc2HpN27GZvi3H6kKalzEAyzK5o+zL9z6ZPMbU8NuaGn117pkJWAIUQvQpFgm6wRqJTjGmfyl7Ne5yY8W9Bk/zOOqWPwwXxRP8/o2vSfiK23315KlyKeq7fOTH5uSHJ+5t1u7ruu4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739811256; c=relaxed/simple;
	bh=5D/fG4ZjzKd3+HWvMQKBTbyUXZfiHa7kNagq5sB0SaA=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=Z1hCF4zMveGfR9trOl+2Ng6Xbi2H3jBXnO5qEFBKmEmnmOK2PfKGYdAtMwCLWbbFw2O1r1vaQ2oOi6IE7wcYSwdIRdztLRQorwE4j7bjKJuCJpqZuOZVKqPfiJcuKZ3s+OKuoB5i+QRV+hLYTU8+EEL7q9IzmFH/9LIQsDsTnZs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=S6k5NrY1; arc=none smtp.client-ip=209.85.167.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="S6k5NrY1"
Received: by mail-oi1-f170.google.com with SMTP id 5614622812f47-3f3d9321dccso2742232b6e.3
        for <linux-kernel-mentees@lists.linux.dev>; Mon, 17 Feb 2025 08:54:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739811254; x=1740416054; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=XfkHaioxJkT7EUDNRCAMw8vIe1lKe4biHbzBWeQ03dE=;
        b=S6k5NrY1SxeJMUvhY3OYSF+VfcIQ14mTqDDrJr961S/sRipphKd0U5/FEwJPqeTbiX
         0cUxJjgrCB5G8g0gGeF++/dk97YClCdz1t2LDoOD1CVP1mdBOZFe+0CJCdvYzNCW+FqH
         cbMCVcxa26Luwg1oI9YAaeq4NW25YQ9NbX4elvu8K5kOKSd0kMoJusgkykVdl70giy2y
         NwQr8FOo4spv4URGO47xVkcTQ0yT99fY3tZVFFoFoWicfYSvYja5lq+wYJy0dvbi37WX
         Yq4DIZX95ExiWhYfKCJXlSvn/CYcBnUeNanmZJJV6IpKuYWyV8L+wAPBxuBKABNVJVTX
         t14A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739811254; x=1740416054;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XfkHaioxJkT7EUDNRCAMw8vIe1lKe4biHbzBWeQ03dE=;
        b=IVXR6gT6bdpzYpg5WnF0p9zMvYxNk/XbW6MtcuGKqYba4GSFo3zohW9HbIvaEB7UgI
         ssh0QtWoqlW7n2YdEzQj+cMT8xHfTt3lvAl3dMdctfSlfzLI/e+sQoPChPsPTqAFMrWZ
         xr4W15+lMgDQ/9+RhIlTbuyf35IU17PCGw51fbZo0KhjllCGuqPZlhesVwE0gGt8SSLc
         vH4dh3jfudreNV3ak1UtCQF2YXX4yhyvjB0v7vdV3Jix0COvO/gLxtTaJaXVZ7wal7Nm
         TVwKOFzA00fIADry5qWGH7XTDx1WDpl60ByVnCzGoIN/WXppOEalSnbHBSDx1gNKIO83
         p7vA==
X-Forwarded-Encrypted: i=1; AJvYcCVnaP8qSOMn6NeSFv6LO/CPambaneYON42BtTp03HYY2qlKNMaokmn808VM1oNyxhI1AywHrUAPj+rKoF3MvZ6OFCHeyQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YylslFiMHUL1D3Ef6zsLhQtm4XLn4mP0jP2OB071845bdnp35ZN
	WOM0MyYSn1Fp2qIuGDjJE5xIFcDz2raPU8tv7MIou0z80BibRf72qm2LKl/8WF04ZyWlVc8lx0z
	DUVteCBdextJEve0VseoPlcYcpxI=
X-Gm-Gg: ASbGncuvZ7mn6cF6KqgYASroJU/x/+UYiO4g3BI93C6S0FZrokGde4uFX1UcTSWEEu9
	RQFHNyjRMNaTOxfgUSI/JzY5LNbc2RJz7B9O+6od+VEG179Ok0X2EgT0fpvYF3s81QA+Xhe0=
X-Google-Smtp-Source: AGHT+IFjuJOL5PoNWhsga7Pb5rKsRqndy3lYvUnfhP6yMunEXDlb4VnolyLJdIOIy+/tKfm6SZy19JOq/XYQ/TENPgA=
X-Received: by 2002:a05:6808:3195:b0:3ea:f809:44d0 with SMTP id
 5614622812f47-3f3eb158d93mr7508443b6e.35.1739811254077; Mon, 17 Feb 2025
 08:54:14 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Suchit K <suchitkarunakaran@gmail.com>
Date: Mon, 17 Feb 2025 22:24:03 +0530
X-Gm-Features: AWEUYZn6JKqZSJ7ECKNJ35xDHo17HDqJBr83XFL6hIs-ZrQ4R901HdJ44r7L4z0
Message-ID: <CAO9wTFgtDGMxgE0QFu7CjhsMzqOm0ydV548j4ZjYz+SCgcRY3Q@mail.gmail.com>
Subject: [PATCH] net: dev_addr_list: add address length validation in
 __hw_addr_insert function
To: netdev@vger.kernel.org
Cc: davem@davemloft.net, edumazet@google.com, horms@kernel.org, 
	skhan@linuxfoundation.org, linux-kernel@vger.kernel.org, 
	linux-kernel-mentees@lists.linux.dev, Suchit K <suchitkarunakaran@gmail.com>
Content-Type: text/plain; charset="UTF-8"

Add validation checks for hardware address length in
__hw_addr_insert() to prevent problems with invalid lengths.

Signed-off-by: Suchit Karunakaran <suchitkarunakaran@gmail.com>
---
 net/core/dev_addr_lists.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/net/core/dev_addr_lists.c b/net/core/dev_addr_lists.c
index 90716bd73..b6b906b2a 100644
--- a/net/core/dev_addr_lists.c
+++ b/net/core/dev_addr_lists.c
@@ -21,6 +21,9 @@
 static int __hw_addr_insert(struct netdev_hw_addr_list *list,
      struct netdev_hw_addr *new, int addr_len)
 {
+ if (!list || !new || addr_len <= 0 || addr_len > MAX_ADDR_LEN)
+ return -EINVAL;
+
  struct rb_node **ins_point = &list->tree.rb_node, *parent = NULL;
  struct netdev_hw_addr *ha;

-- 
2.48.1
