Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 729D02CCC1
	for <linux-kernel-mentees@lists.linux.dev>; Fri, 16 May 2025 16:46:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747414017; cv=none; b=L3m6ScVuj3vfToYBymgjIVFU3YGP8bYYe8Al+Nf5PD/ePRES5y0ntsqXPGB4qqdpOYWOzsX5Y9K4B/GMsWBKhEw1z6/J2gYjMEEEgeTMJW6wMLFgsQKPz3RA7yH69a6IZKfgeUdGgIkXLBkOKsxMaHjUNa0Mh0oNGTUVtzy4Pzs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747414017; c=relaxed/simple;
	bh=GdgwDP/G2YbRSycSz415s/ivN3fJsMLeSCALtGmBj4s=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=hj5bMrEZWM+NvvfAJuVCartwhgERkawyA7tN+jVUuX6fAfZE35F9PNOCQbeNu1RS9gjSaAOAioZGilfy6z8MLez3afPbMYbT1pBMxdmHbdMb9SuB6A/Yhr2K8q/0GR6LmbY8k0DCuUilqL0j6M8/B7mm7it2MNFxnaoJr/JEnJQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TPLEm+/B; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TPLEm+/B"
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-74267c68c11so2337985b3a.0
        for <linux-kernel-mentees@lists.linux.dev>; Fri, 16 May 2025 09:46:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747414016; x=1748018816; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=YBuEoZux2UjBM1AWnVLvCpSSM8NTgAGMcC8oduqU5XA=;
        b=TPLEm+/BrghDXkWTvarGMRIrF3vHwtGp5jrd7j06+hW/XwGvScfIOXbMz6E11RXcuF
         BrTjzk01yJAhMIZt2FP6nhMh/uBwGfDA3VtK5PqXq0jDD51I0kktx/0HiymBNUnYk19X
         dUlN1orqmH6StV4PFxQJe0JE8JO47GNmrB9w4xM+CR1KUTC3tYMJj+eVFicCpeZD/+il
         iJs+IXRoybQpsgR1gmaNHBOj9B963Xr5Z0Ufw+HjKr+ITXEi75LB0XX2cqHEjuyte+2M
         dKlymiE+drfWA4bVTZgeu7wsyyae1KfFdq5P99RBqvnFY0m7z6VUujjRYkSdiAri/D2a
         3pTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747414016; x=1748018816;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YBuEoZux2UjBM1AWnVLvCpSSM8NTgAGMcC8oduqU5XA=;
        b=qXT+FVzGge9WDadvSlcBDHVHID8f4pNUaa+x7le215d6ryUgqKLijojBdwyKNj8hdv
         fq2EMNw1/GgvvP788ctmsBQNW2qtfg+LdwIikENvISBbxI96eFSBNj5w3g8XF8j7fXY4
         SQPrrirOhZcG3RZRR2RscfRFXaucZ5DZZreOx5ECZvnLUvNi+DFui8PiDU8X1N2Ua/eQ
         l4UPCZlATyjph91ajXFBEA4sW5m++WxEtwtvr9Zau6+y5XijuxN2QAF3nQkqPAA8oBxS
         BSueaA/ikRArM1QCuStL7d/EiN+/kLXIPmuvIX7MgvqVckX+lEtnUf/hXO84wFxAyvQg
         49PQ==
X-Forwarded-Encrypted: i=1; AJvYcCWjNL+t951ydEtZkwQYSXh3cgf9SlEl0yFzHcS+b01aC9Toa4+8wdBjGVODqx1VbPvug9otA6cIVzl+rBGayd6Q/TC82Q==@lists.linux.dev
X-Gm-Message-State: AOJu0Yysm9PThblcMXO9Px/qQh0WGE/TECQUYoCkGmEh7pGe1D1QZGVz
	xYhbF1ATfuTXVASlHUpiJdYm/5t+aeKtENPgWq1hUYWXIiMw0Wf6lGOC
X-Gm-Gg: ASbGnctFZpz2NU1xka82+KboOt4BVd/1lbkuO3CunH+IW2Gnwles1oUkHL7kBUBrRvW
	OlxHUuMzIKyAz8GpsYeCgoWhKv7htFCXhdd3muZ1DnTF793AmaeopNM/+GujNPqrl+gjH25Yr5j
	6aqiXLdEpOvewOOvfIlPuhwDi2ZQ8Xk2Ll/muER2Db+fddaAz1ECatDZamVAetdgVmRgRlix0Df
	Fhz+ZEoJh3jmc/wvj80nY7xw7ilaDpEn64UAEUhgLsFaSNvnyDwHw0NhAq535DbdSWn+8bgeB5d
	XXDhuM7siPW0+iGrxJN1tyJTwqR9vb6yo06U03G7f1C0Tl+PlG1u
X-Google-Smtp-Source: AGHT+IE7BWc1FIRYbVEI+k1bCx13USqZPfGcgw7ksFwL7J0sVNYerNVONgPi2LwWYbdG9vKS9dPfnQ==
X-Received: by 2002:a05:6a20:6a28:b0:201:4061:bd94 with SMTP id adf61e73a8af0-2170ccaf4e4mr4769760637.19.1747414015546;
        Fri, 16 May 2025 09:46:55 -0700 (PDT)
Received: from fedora.. ([103.102.144.172])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-742a98a32f8sm1791702b3a.173.2025.05.16.09.46.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 May 2025 09:46:55 -0700 (PDT)
From: Nidhish Chauhan <solemnsquire@gmail.com>
To: skhan@linuxfoundation.org
Cc: Nidhish Chauhan <solemnsquire@gmail.com>,
	linux-kernel-mentees@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH] docs: filesystems: removed repeated word
Date: Fri, 16 May 2025 22:16:43 +0530
Message-ID: <20250516164648.15396-1-solemnsquire@gmail.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Removed a repeated word 'at' from journalling.rst at line no. 96 in
filesystems directory.

Signed-off-by: Nidhish Chauhan <solemnsquire@gmail.com>
---
 Documentation/filesystems/journalling.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/filesystems/journalling.rst b/Documentation/filesystems/journalling.rst
index 863e93e623f7..2825f6c030c2 100644
--- a/Documentation/filesystems/journalling.rst
+++ b/Documentation/filesystems/journalling.rst
@@ -93,7 +93,7 @@ easily as on jbd2_journal_start().
 
 Try to reserve the right number of blocks the first time. ;-). This will
 be the maximum number of blocks you are going to touch in this
-transaction. I advise having a look at at least ext4_jbd.h to see the
+transaction. I advise having a look at least ext4_jbd.h to see the
 basis on which ext4 uses to make these decisions.
 
 Another wriggle to watch out for is your on-disk block allocation
-- 
2.49.0

