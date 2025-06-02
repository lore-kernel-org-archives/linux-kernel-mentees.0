Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC0A31E3772
	for <linux-kernel-mentees@lists.linux.dev>; Mon,  2 Jun 2025 13:59:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748872789; cv=none; b=PLK49+G4lIx470sIRsAXl4TjbZ+ntQKqUZGyAzzDKxw85zaiBhBjINCkNrvv8bMbwob68mtrs2io2f3ZG3EY/xWgdUb868W+4bG9AAF5afrIrcXLVwZx7cUrhFf6H0ZeAF4HyFxjmxRKJHlme6BXu+OfNkAn+lMpz6bB6tkMh/g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748872789; c=relaxed/simple;
	bh=510jMgMuVJgLONrJpYnhvGvMBIc9L3Cdb3rc79Pyu2Q=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=aYHmbd/4lxPHjWLqYZuAow7FQiSVcDNmAsyywok4hzzLIzt1Kn0IHjNFZaWhtJEQNY9G2m8dxONsWgtKQdAxCe/swbLGYj4dGPe9UjhJ12WEyz/TlUzSUqINnN6K2q6UTtajUFa7qoSjaJptSLODqqcnVTdcodVGTRalyQtB83I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XwScPmnO; arc=none smtp.client-ip=209.85.215.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XwScPmnO"
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-b2c3c689d20so3194934a12.3
        for <linux-kernel-mentees@lists.linux.dev>; Mon, 02 Jun 2025 06:59:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748872787; x=1749477587; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=2I9kHfTkQCdW1yuTkU7IIRkkfGeUty8kEfkKZcVJwRY=;
        b=XwScPmnO7kJiuU8OXxbETX1bVXt1LlnjVz4vi+Ft47NtU2lnNlcvEbrqAFZrgE9too
         GqgjU4MJ8MCsgQkFsBkO2JAxQjVzzu6lU3do9boaZoabELWT+Qvvej1DTStnlbS4ZyuW
         ivptU8ssEg0nv0nUeW4p3XCcwyOhyUyeE6RVnBXE3rMmfb/HmVWQSiSqoK1zu/SRQ8Rd
         IQz0xvMtJx4OD6HJt+eiFCIbPv+4P8DGuFnkzRxjM5jH9/MFpcLumXZxmljsoa4x5DuJ
         0jwPGeW4f1NMckyTE0YLYElMJz9twdYSkY2DTDSz1wHql53skkCRffTKG0mceni4BA7u
         k0Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748872787; x=1749477587;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2I9kHfTkQCdW1yuTkU7IIRkkfGeUty8kEfkKZcVJwRY=;
        b=IiAuLbrCaj5YOXyoQh/O8EdO0wP2nEvMZBYrXskVDp/hnvCyXqb/9YUKsZmSZclHLE
         KT4Zcx7rA+OGpzKqtUXyM6jpU2SmJoPkQjNJbbz6LcS9A/Gxme3u0mvIFlapks5q9Ku/
         7T350Y2CjV9Y6KsNf1eEP8wI5rQXNoYS/k9+V3VXc7fzdHvYK8giU5AHau5p7ulWfEgX
         FXhc9J85dA1dTERobQlEqK7jByOyfI2KCzyNX/tROcK80qAiXTyzrd2TZfz+Sq7Gfevf
         AwXqnhHrDX+HNGcozriSHVyRHzfGDssKZfbfbVhk3Jjtyv/gNBTUJskl9N0+qnqpAIPQ
         kLjQ==
X-Forwarded-Encrypted: i=1; AJvYcCUSMim0nIu9e1P3W8jj+qZbR6Q47GF86utQ36lwqBpxtTgzwTtGqIu54l18Bo80HOD6BdtDYYbewbTRxRsc1mzEnNDCjA==@lists.linux.dev
X-Gm-Message-State: AOJu0YwQnafAvvz7+qwvHcElCSOWyWXHk4bhbpsCbXx/5k0sGo5VkImU
	p5iAE8e9uLxibP8dZBmM9dvvFr2ARejI9sJgW0MUMwY+8YgxD44ylYtY
X-Gm-Gg: ASbGnctDgYRyCMcKTXlO06isjKWVdYJJoAAXF3t/wy9VeV/Bruxgq8sHikZCzv9SEEY
	uHU5y+A+oILaFABCnoQtrSjnTScEKQdus4roaaPG6EsuXG5Sin+eW6YDvy6Ylc2F5bBpTOja2a4
	QWldr4D/7EyyiR8eOryoKXnlrOZc3mGLMBTtpjx4Cxf7XsLDGjs8pT0acFa5uWBiON/eIb1O/B8
	ycpUyqCIVFTHnZOQ5XiLZM8nwlSi7aDa9B0/N4zXZDqmi0k8/znB8J7Atin4qM+9K9u+Deiwt5o
	cLJxes6qihSRT2MPosyKQEuLck1gyLWE2WE3UEvHEXY0mtNCck77FgmeSjS/4OY4ZckUp0g=
X-Google-Smtp-Source: AGHT+IFY51lSdo7zfzC13+wWkvAWgQEqDkxEkSXJntWB0/HrzcJFz1Qu6WVZNLxHhgpfVvxEFhR9/w==
X-Received: by 2002:a17:903:1c6:b0:234:ba37:879e with SMTP id d9443c01a7336-2355f781dadmr132895055ad.38.1748872786765;
        Mon, 02 Jun 2025 06:59:46 -0700 (PDT)
Received: from manjaro.domain.name ([2401:4900:1c66:a430:9007:9516:3e06:bd5d])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23506d14ddasm70988915ad.251.2025.06.02.06.59.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Jun 2025 06:59:46 -0700 (PDT)
From: Pranav Tyagi <pranav.tyagi03@gmail.com>
To: andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	keescook@chromium.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	skhan@linuxfoundation.org,
	linux-kernel-mentees@lists.linux.dev
Cc: Pranav Tyagi <pranav.tyagi03@gmail.com>
Subject: [PATCH] net: randomize layout of struct net_device
Date: Mon,  2 Jun 2025 19:29:32 +0530
Message-ID: <20250602135932.464194-1-pranav.tyagi03@gmail.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add __randomize_layout to struct net_device to support structure layout
randomization if CONFIG_RANDSTRUCT is enabled else the macro expands to
do nothing. This enhances kernel protection by making it harder to
predict the memory layout of this structure.

Link: https://github.com/KSPP/linux/issues/188
Signed-off-by: Pranav Tyagi <pranav.tyagi03@gmail.com>
---
 include/linux/netdevice.h | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/include/linux/netdevice.h b/include/linux/netdevice.h
index 7ea022750e4e..0caff664ef3a 100644
--- a/include/linux/netdevice.h
+++ b/include/linux/netdevice.h
@@ -2077,7 +2077,11 @@ enum netdev_reg_state {
  *	moves out.
  */
 
+#ifdef CONFIG_RANDSTRUCT
+struct __randomize_layout net_device {
+#else
 struct net_device {
+#endif
 	/* Cacheline organization can be found documented in
 	 * Documentation/networking/net_cachelines/net_device.rst.
 	 * Please update the document when adding new fields.
-- 
2.49.0

