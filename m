Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96FE6226533
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sat, 23 Aug 2025 09:18:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.137
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755940727; cv=none; b=dTb9yZB0gsJ15x7DrPO3TC+dx/4clIPk38Xc5GDR483xq13MuBHea5I0iw7e/n8HJucp8WZ3nbDZ/Bx/IUNqDI17darsCdwSy499I/DFyeuKARj87dqJ7XQojdsG5CE/vXMU4O8xMSPSdNhHqqCnBytN7VW5nh1mc+4HXGF4iNA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755940727; c=relaxed/simple;
	bh=qQKAUKGD8YCJSmr7dhdjzTfWFLwOspnZF7Vw50KWiWo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=kagISli3lqb4dIZhQip1upNO5/U7iSgoHnKoQWT2WOMC/IwhHp0iPHu+3ctLqbdP7jbd5jx07ceeCzlSRetpZZCtfO0bDcKy58QUfUF3ahJdjtk6co/WR0VmUie9fxWQbr0RtRqZJmTo+JkEwG8Uglbfa5eE5QZQ5BeKT66OBY4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JnfBt+mk; arc=none smtp.client-ip=140.211.166.137
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JnfBt+mk"
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3553C413AE
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sat, 23 Aug 2025 09:18:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -1.849
X-Spam-Level:
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Bq4bawlef9y3 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 23 Aug 2025 09:18:45 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::636; helo=mail-pl1-x636.google.com; envelope-from=rakuram.e96@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 944B441346
Authentication-Results: smtp4.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 944B441346
Authentication-Results: smtp4.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=JnfBt+mk
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com [IPv6:2607:f8b0:4864:20::636])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 944B441346
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sat, 23 Aug 2025 09:18:45 +0000 (UTC)
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-2467de5160eso1746535ad.0
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Sat, 23 Aug 2025 02:18:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755940725; x=1756545525; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AfNfBu1qWolJ9wIMXkd3bnXOtHy3GISGcVi04weSYTY=;
        b=JnfBt+mkNyBpcWpvEJf5qsvM69/ndADJIL6IYdcl4EfS9LrIiSmqLo7jQuvGjR0qau
         wsnpU2vW4JuejEq7vhHGwjPY145s9zeKuH6HghCynZthVvkaS0OaV/0yuWEQRR2OhGJ0
         gLdqgNMjGVz4tIgqU4uJ+QPc8b9fWpyOAIQ75BvKu4LZ8Zxmn3h7JjsPAmHpbgrj/dfr
         atpNGBNW6Ast6v/qnZqqw97b5luZxW9R5+RO+bhG834UgnQ1dpTo/6NNzTN6+H26TBOy
         W45y6lWgF3l3VoDuRBQU0Sepu7c84pjSNK38B1vkKlx3cvqBL1G8whoP7TMOVLlAcXEu
         TCYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755940725; x=1756545525;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AfNfBu1qWolJ9wIMXkd3bnXOtHy3GISGcVi04weSYTY=;
        b=X/ySPAxcX+SUGU55Ylm9gjXiiXuIWliLMmUoaxOIeAOfgqQ4m1lp3qTG/cDCtq+VBq
         Gxbv3/q8dsH7XjHYT8+Idti4BUVvSXwaVY1953ZFwHmJrsGNsoYvC8XzMwdUKT7SDSNQ
         O7hhgvi0lNcbSSKo9jtleOEjLWUtGYpZ6cC65Ie3AhCK7pwFFxCH8An1cOi2B6320sbZ
         YqBIMy8F2dsXpZysWdwSwJ6ROm6eCEGY+GnL0J/GYHfjevXJ2NvaSX2U4HyFC7CUh7qO
         wsbBK3ktRiFO9w0W/1sCjnNEW8TzjoZeRN7S55K+K3GDqu2B7Er6+CIZMBgJywimBcCX
         AQWQ==
X-Forwarded-Encrypted: i=1; AJvYcCUVs7tW/tFKUQq6wgCNDFR/XCa2Gp86jmxpxVREAd0R0QJnk74UFMVyLY4/F5jkRD9KJYC+omULA4OSLxBGlUW4FAWj6Q==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0YwRXgzGeRUtdeDjU+YKTrB0T6cv54FxtKM8BlJ+771dRGoYCt65
	PCjl/2pHma+k2qNKQdUxSDOTZo5U0sShgYmzYKn/mclPTRoANi9DHzP5
X-Gm-Gg: ASbGnctCs9FOMLtN2AbY1Yv5nL7IOvNTXlcJBgpJYAy/XAl71sasqV5gGegyyce9vvy
	+pW8km8rLjJVPzWPaoN3lbRSerXmMY3o+dX9qCCNVTO4ySLjAxojQOcnkWieeMt1ky8r46XcDAz
	FVyausWtp+JRwzBk6DnRfLW7hpRH8bX7Di0Y+ty3aGSvW5AwFPzDCMV6okCyG7edSDWiQQob9YI
	EMDsK+89AvNfkA8RBq0dkjyJwJCHKqrhj7xEPiN6FW1CVNixmR6Uo0TEvlC+t7qTzgf9Y/mtos+
	KWjBYdWlvlTxemcYlCT8fPq9QwJCq9JLE+UMtEJzh+UO+3da7ofzTcAVNvQZZVE0sdd7fzJtWBH
	925nVkf79Kx8Yy6jo3zji2Zvd9AR52R2G/igdq88bsyVllBP/NQcrnLe0kw==
X-Google-Smtp-Source: AGHT+IFDYWklpG7n/RCWVYe9fEt6cFZZCJhCfu1jBDgekkP0Uetb+/s+2CwZHMHpt7emWt1eZkWvMQ==
X-Received: by 2002:a17:902:d489:b0:244:9888:3a1c with SMTP id d9443c01a7336-2462ef1f1e4mr83311725ad.29.1755940724611;
        Sat, 23 Aug 2025 02:18:44 -0700 (PDT)
Received: from lkmp.. ([27.61.56.127])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2467a6f5489sm12509535ad.144.2025.08.23.02.18.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 23 Aug 2025 02:18:44 -0700 (PDT)
From: Rakuram Eswaran <rakuram.e96@gmail.com>
To: ebiggers@kernel.org
Cc: ardb@kernel.org,
	corbet@lwn.net,
	linux-crypto@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel-mentees@lists.linuxfoundation.org,
	rakuram.e96@gmail.com,
	skhan@linuxfoundation.org
Subject: Re: [PATCH] Documentation/staging: Fix typo and incorrect citation in crc32.rst 
Date: Sat, 23 Aug 2025 14:48:32 +0530
Message-ID: <20250823091837.5037-1-rakuram.e96@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250821035913.GG185832@quark>
References: <20250821035913.GG185832@quark>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit

Thanks for applying my patch!

I noticed your comment about the file being dated. 
I’d be interested in helping to update it to cover the more modern 
CRC implementations — things like carryless multiplication and 
hardware CRC instructions on x86, ARM, etc.

Since I’m not very familiar yet with these optimized approaches. 
Could you suggest a good starting point for exploring this in the kernel 
(or any references you recommend)? 

I was planning to look at lib/crc32.c and the arch-specific 
implementations, but would appreciate your guidance.

Best Regards,
Rakuram 
