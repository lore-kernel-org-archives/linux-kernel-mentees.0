Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95ABF298CB2
	for <linux-kernel-mentees@lists.linux.dev>; Thu, 12 Jun 2025 16:30:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749745803; cv=none; b=g14F2JGVsQaRkYDrNnDN/1h4hK6Y6z4ewwgKpBKrjA3/dEtShOhVBGwKoVndAV93Ga5L7472vX7fE85Rufyv8mKUExCdf6qoqJpw6BTPkwZofQD2yNyEEXDlyL1H4tD7vhnzOW9kF/dkEOWkgf9gtjZuwWWDpT4oirjneIOkgs0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749745803; c=relaxed/simple;
	bh=xRD0XNGv85aotVRbw16G5ZDTuKLAnScw55C18SauZnY=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=rUeNldODlVA2tYotxLX8kx5ZZW0zWuHtPtKjn8ThrzG0wBJjmZTDF1t2uWPtmYcQYigBJa/8y0WdqYkv4ibtGslzV6goQJFxNtzA9P4N5DIIsOwNqg1/0++ISBbc/ahfwlSziljwSr53UbAS66WrZkXaK3Cmobh/9sxw3hnleb0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Bl8oMKZC; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Bl8oMKZC"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4531898b208so1150765e9.3
        for <linux-kernel-mentees@lists.linux.dev>; Thu, 12 Jun 2025 09:30:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749745800; x=1750350600; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=GYmM7ROZwgjsxl7AbAUfvpwIGRcnutttpIUnWXsbTAo=;
        b=Bl8oMKZCBuXrE2in1Bywp0ahOMo3LXj5WPc3QmypGUFE7BrHrpHQe+A3m4NsQv7BES
         DZp5rejkWV2vgH2DpUT8zw8gXAdDd0NlNjMwkBhawhKlds0QXz2zw1ngQKHVAqpFfg9y
         CBqHTlKkWs4vgZF2tnnWTKBC0P/qIUcI5OHtUrWhFiPCDZX+lbm7yL++GZDOkFzQekxq
         oYoR1Tlnz64xl4yCCX8AmL+gGt59DK2Jwt7DZFIlLG7cowWb2AyXUU/i5i7NeLagW0tb
         xko+gkwHNDLLovXNWLxcKQq3Tltez8j8uDKVZPBbLHI+FIaVfny+TUUjhw5bYlSE/XWO
         2V6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749745800; x=1750350600;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GYmM7ROZwgjsxl7AbAUfvpwIGRcnutttpIUnWXsbTAo=;
        b=WBnzRgm393Go8fsPddsx/to2jJqRSVZnoxp80O5jKOKTN8Zdxy8h3FPKzHQwAo/3OD
         R6Uu3oN3E58XScS01zj0U3kWlz4v1xLTfEy+valK8xLyo4btdg30PP4/8/sQMyK+SEIk
         9YkOkfaYTdwypSJmRdfBMKp/RvsY9DutBM1pk3oDDg3a4GUwJYOGkyk+l7FGij25YgUM
         Pn2xkltWgdS9q4qSitj1sBo+6+juFoJtJFcZdQPwJQb52coYH6E3YIMglKoM21khYmrv
         atnhs82HMnzqbI2c9wxYVU+AUQn8iaOll8Tmfm46QHx4vStUwQTHxQ/BKvN88F3G9x4M
         123g==
X-Forwarded-Encrypted: i=1; AJvYcCXl8xUX7bDchKLhoIaqk9rpT6BAuVb3QDLxCzeFwOnwikSVfJFp3VIVTrosgFDyXac1KV0a3iUpqpEFbkLjsdSWXBc6iw==@lists.linux.dev
X-Gm-Message-State: AOJu0YyjEH9dzitNzQmmN6/jPorEZrcNqIpUHytW3xNbbGr9aBdTmgUN
	raNaiuLWlK2xIuFk71wyhkhJ5u82fyJEjBoT9yUbqdTWySaAOZ/mjTSB
X-Gm-Gg: ASbGncuf+toE7M4FI23Wi3pz6MeQLysPwq6/0iWVmMlcBR/0RGmBB9xMihvroF9Kl8c
	xCw4klErrm772k1Nh561xxKv/tOogoXddZrAbjS9t2fmd2x6isxQTko0JLyrgd6EAON5XN0IQgE
	vJkb4qaH2coUOmZE0kED07Jccx/09lnEtX9fZ+cHDmJuuYbJxpyuGq+Pj6IWVImDty/qnH8UTYy
	O0JWI77sBssq5cCHwZjHJJzUEEJ2pqSQl4qhmTQEyzenKosWDkxhRh0n5yf0XTLV9K6YMH3ebex
	TUWZ2M6FAeWu6icCkjcc+FXOPvBKnIBoSzphj+IvIRTFQ6mxJ6SzblMATJZ+nDhWus8NEwKuXru
	KHLNKqJ1fCmSH8rucjy7I5A==
X-Google-Smtp-Source: AGHT+IH5CI6D1Rw9skPRSC6U0LsDjDtb7KLoh0huZys7vIw7B/GeKXl1l+08G9QXCebLxe4jzAvwpQ==
X-Received: by 2002:a05:600d:5:b0:441:c1ae:3340 with SMTP id 5b1f17b1804b1-45324875827mr21240375e9.1.1749745799735;
        Thu, 12 Jun 2025 09:29:59 -0700 (PDT)
Received: from localhost.localdomain ([102.40.66.223])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4532e24b0c8sm24872135e9.24.2025.06.12.09.29.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Jun 2025 09:29:59 -0700 (PDT)
From: Abdelrahman Fekry <abdelrahmanfekry375@gmail.com>
To: davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	corbet@lwn.net
Cc: netdev@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	skhan@linuxfoundation.com,
	linux-kernel-mentees@lists.linux.dev,
	Abdelrahman Fekry <abdelrahmanfekry375@gmail.com>
Subject: [PATCH 0/2] docs: net: sysctl documentation improvements
Date: Thu, 12 Jun 2025 19:29:52 +0300
Message-Id: <20250612162954.55843-1-abdelrahmanfekry375@gmail.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series cleans up and clarifies networking sysctl documentation,
specially the boolean parameters:

Patch 1: Fixes typos, adds missing defaults, and standardizes 
	boolean representation.
         
Patch 2: Adds value constraint clarifications for parameters with u8
	implementation details , fixes typos.


Abdelrahman Fekry (2):
  docs: net: sysctl documentation cleanup
  docs: net: clarify sysctl value constraints

 Documentation/networking/ip-sysctl.rst | 87 ++++++++++++++++++++++----
 1 file changed, 76 insertions(+), 11 deletions(-)

-- 
2.25.1

