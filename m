Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB4592DE1E1
	for <linux-kernel-mentees@lists.linux.dev>; Tue, 17 Jun 2025 12:35:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750163749; cv=none; b=Zqm2my9bZ/21CfvvGZwWVgjGFCzSaE3M+nE7MnZD2zhLufDMT9KMIiCrup4Ep2E8H4IzmgIkPohjtR0GCoDNqSL+/vobFCcNon+ysBHEw7jDdSSpmANTU7K7BRYH4vldkja4btX3IZD0mTV4vArvQGpydsmnWtRtWGllcnuI1es=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750163749; c=relaxed/simple;
	bh=nWRYgfaKlsF505nHtld/MVEDNx9upmVyjOrnhDtYlE4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=AXdTY3QsCPUaMVPetNbiddEsTyeodDbFsjTce2xux8NLDnz2H7qUpZfqlyMhGd9zIF8CYjtXP5OyHfqzBUD8D1DTirJW58E3m7MVZapOzvDDlOlIaJBhyjyJi+BiTAKWOcUhF+cTkxasBpI3g/RjA+qOm9VfdPi8iuxGmUZMB4Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iKbUJkjB; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iKbUJkjB"
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-742c7a52e97so4683057b3a.3
        for <linux-kernel-mentees@lists.linux.dev>; Tue, 17 Jun 2025 05:35:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750163747; x=1750768547; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=rPdLItsX7RHmXg4yVyLzvYJu8Fzx16jAp/CJmZOuNrc=;
        b=iKbUJkjBBk+SP7+NGWtZGIR/s515ZdE5n51BgxenUjT9fBTGhO5NJJeBR+cgyldvSA
         8N9VNw5lzYwLURJLFiB7semyUxwPjMmqZZ4bekNy5hcOYd1XDejtVm8IyJI/dNgp5PZ0
         o68zM636toRX/n1XuhD8UIH5g99Rb9ccBddpeNZ+ohhxeq2DSbenGk9GXX7mCEQEgJh1
         mYEKlc6ZIBEoU4U7SrqLepwodUlIVMd9OCfShq09AVQnOgPW8HJ3feAR4BZ1jNvuBftu
         Q7Z/dwz1/xW1JzdAVXM1RIX3/d9tRRppDnDsHA12SRRzmb4JpLBHbsZIZL45KhKubXwa
         oGQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750163747; x=1750768547;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rPdLItsX7RHmXg4yVyLzvYJu8Fzx16jAp/CJmZOuNrc=;
        b=qdl3FkNg/JvurJfzmDAkm2gBES1EhGaeJ1zfcKlkZosAvj2x0N7uq3X8us/+WxX/Re
         jFVPGRttyi4psqOztnks2+Vh3WhGAVFhCgGsEqndgWKRHk6heE01x+Tunr0oiVIJgi0z
         zeymur3ry5dus8SV66TublPKjm4tTPLWQG1sf2Wa/I3cDxNFspxz9Ni8e6PSPrc3fvph
         p1x99emkQqLYmqhO2FKZqbdwqKYFXmrVsMGsRnqIBDYdPzHbr7wnImtRnIUNxuHlP4LL
         NWHbxhn5YDwmHk0MxRGbE27yRZUtBmufTDU3jMRVy2wf8UmggRDq/0yuScduPi2YEvHk
         BV7w==
X-Forwarded-Encrypted: i=1; AJvYcCVULX1eNaAW8gpM3ftfRi14VKzqYf2asSl06H2OHK9slg+qSqJ1KwORCDHN28GoMScbFBwaFBiysfFp4sa2hNjRndf1mQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YxsyZA4Ul/p5h4txb7tP6P2Lck4xId19aYfLj53y4T8bVZ5JUh4
	2sFBV54BKs3TJa0UsAHqrf+hQiMQfqGo00eWlafs5GA5u+UMSSQFdJ4PcCqgVs8r
X-Gm-Gg: ASbGnctW28k68NKVpHhwoRJeWI0aVfNO/pYv2zU2hB8EG/k+mm3Lw1B4iAyruEwbqOo
	T1i1BTuzz762Y5T0/q5oKCjzAfDq1xKACNPn+zS7YhvqThs5VobDcP0pbfLpBAnCyyC6QR7WvXL
	w8VZH3tu6eHLI7+Nym6zie9e7DYyGzFdAmNzqfVMJg3Cs6TTPMpcmMCOAy9C7hFKoFpt/lv+8nN
	8QahV7QwELq9Y3jxQ8OWp0/xfCjNboAjWCuFVryGp1vzrE1hkIuwe97k8SIwyzBIWwSpaBo4mFp
	Vb4d1J0x95VC0wiFS7SXATsDbcl33h+/+Va9XPicbiH6AIWbt6zVCg6fAcFeIG8RNNjTsFJ2C5c
	G+4LDpy0=
X-Google-Smtp-Source: AGHT+IFYdZkwNqRYC3dNff02C5ous/zkB5D1vK+ftcPom4E7DbGsbzTemLZYAS6JOCz8DlVgk7S7fg==
X-Received: by 2002:a05:6a00:1994:b0:725:96f2:9e63 with SMTP id d2e1a72fcca58-7489d050f48mr20902995b3a.24.1750163746791;
        Tue, 17 Jun 2025 05:35:46 -0700 (PDT)
Received: from manjaro.domain.name ([2401:4900:1c68:884c:5800:7324:c411:408d])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-748900b2c1asm8944267b3a.143.2025.06.17.05.35.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Jun 2025 05:35:46 -0700 (PDT)
From: Pranav Tyagi <pranav.tyagi03@gmail.com>
To: jhs@mojatatu.com,
	xiyou.wangcong@gmail.com,
	jiri@resnulli.us
Cc: davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	skhan@linuxfoundation.org,
	linux-kernel-mentees@lists.linux.dev,
	Pranav Tyagi <pranav.tyagi03@gmail.com>
Subject: [PATCH net-next] net/sched: replace strncpy with strscpy
Date: Tue, 17 Jun 2025 18:05:31 +0530
Message-ID: <20250617123531.23523-1-pranav.tyagi03@gmail.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace the deprecated strncpy() with strscpy() as the destination
buffer should be NUL-terminated and does not require any trailing
NUL-padding. Also, since NUL-termination is guaranteed,
use sizeof(conf.algo) in place of sizeof(conf.algo) - 1
as the size parameter.

Signed-off-by: Pranav Tyagi <pranav.tyagi03@gmail.com>
---
 net/sched/em_text.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/net/sched/em_text.c b/net/sched/em_text.c
index 420c66203b17..1d0debfd62e5 100644
--- a/net/sched/em_text.c
+++ b/net/sched/em_text.c
@@ -108,7 +108,7 @@ static int em_text_dump(struct sk_buff *skb, struct tcf_ematch *m)
 	struct text_match *tm = EM_TEXT_PRIV(m);
 	struct tcf_em_text conf;
 
-	strncpy(conf.algo, tm->config->ops->name, sizeof(conf.algo) - 1);
+	strscpy(conf.algo, tm->config->ops->name, sizeof(conf.algo));
 	conf.from_offset = tm->from_offset;
 	conf.to_offset = tm->to_offset;
 	conf.from_layer = tm->from_layer;
-- 
2.49.0

