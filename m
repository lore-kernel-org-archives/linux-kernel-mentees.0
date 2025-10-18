Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26EE822576E
	for <linux-kernel-mentees@lists.linux.dev>; Sat, 18 Oct 2025 18:12:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760811146; cv=none; b=H5AWZao7dSVrSGV65vEfJb7zzB3VU2ptGexi/p8VjjXvKiCnS0ziv/4EKGK3heDX6gZIwB9iBNcndngQr7f9FjIhfd9JwzYBQ45HzXTOsSLsjkPPXOp9YOGte+TrW9fSmNcp6pIY7W5BLDLP1zxuLhqaIdaVdseh+cq1K+jbqyM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760811146; c=relaxed/simple;
	bh=NbePi+IahQbSkjH9l4oUjZqDWZYGDLqO0mT3Tj52yNY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=oSNgey1wRLtqGY7QyNVRN8YAUH2tVcXImLaO/231aU3rx5ReH9jcxRJiwcF+7/hFP6FPIabHE1vZwzybHV/YtRzxhspz9sU+yYcT6GF/0G4nehaGNBIJgcOjnmd1L1IbCu3OY7OBAqdr4gwFlFkiVrHsOOK9gGvqvlkDBk3swc8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DjopgFJr; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DjopgFJr"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-27d4d6b7ab5so40471335ad.2
        for <linux-kernel-mentees@lists.linux.dev>; Sat, 18 Oct 2025 11:12:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760811144; x=1761415944; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=NNz7x8ijdaSKfJZxmVzdQGgD/aRBaTgM298y1Bdrq7s=;
        b=DjopgFJrLVX/MBA72nW1AijXON7q/VPuwDdLzwuE6vwva6lIZWr6conzE0/1D/0+6K
         NmXxqHpEGynNyA2NDR0J+PTrsjlnHiqB/lv+hyqcuG4OmX7FcfKELAF+2CvDhTUa8Vm8
         ofFPm3+VQvhGuJ+YKyRkcDurlv/1ISwHC9b4bhNvXHIx70M6LV4bBI7mzBdqbIQqiT8u
         ljHelZshxAjmDd1zGYu37F/GIST6Zv21P+j1++9pvL88So4udmDOZIq95hWSEoy47jDz
         cuYQ77FdtBF704BMLmEY07xnJlmhL9FHWjHiC2RL5Jq4A4hJMnzkMR+myYQR88W3ZxCj
         Jp3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760811144; x=1761415944;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NNz7x8ijdaSKfJZxmVzdQGgD/aRBaTgM298y1Bdrq7s=;
        b=Z0lq3854g/3QtSDyg4QBkqrw/o61MqgRjEYE2TdkTwFEmYh1bBMwG/OZGOgdV0o5yz
         9MnKUqmb5p0acBkwQqdojFjN7P8kZmD/Pbc4lZr/xiu+r1OudVhRqf/7hIYBAESMpLl0
         mrLLl+qYc9ZAB/Mgj48eiWps9HWynGsgN0TzNrwKdOGwdwEn+LYN0eJjBALPfJQw1fCD
         XFaCLLUvPXMY2JqOKybjk73uwvK4uYwJ4DpF0FRzamQDLUdSCJfJChnPpR1krCvo6j29
         5QUV82wrt83d0Jwv7VRrBjXxmGnD9BPZ1ku9tfdXudEPjKwilyoO6HveTIuQud5txho1
         GI6Q==
X-Forwarded-Encrypted: i=1; AJvYcCW/yZQj0Ka74YY3cCrP4gPhR6K8+m3rx6gEFQfTXGmm3C2LHSfn1W5I1HW45UUZffaOkuGcEAmYOUs0sUXE3+pBGSeOpQ==@lists.linux.dev
X-Gm-Message-State: AOJu0Yx9ua3Yn7ImOzSS2G2G3l1octdkC66wkzaei0s7EZCXIwnTffuY
	xcsU42RfoGi1P/IpdkX2XmYGl/kUZik9wmpHtwHj4Q9YQT+4M3dV6Ym/
X-Gm-Gg: ASbGncsJN8wqLjoq/Yj0bCL4LoB+Yk9QukA5yyD4vkhn0XrQvHgL58YRLlMxxCjVc8Y
	XqyBbeBRV5S73Qs7bfpbr4j11tnkm2x43dLW+uSq3zRSxoE4Jaq4WZMX8803UhVfX0hMJYzvxJD
	t6+EIYAU6o9mFTOe2lQFfJaQl02PrixbCeXQ9Fnh9POFnzkpQOahfR+kzeCCf7wUfosAqjloRNX
	UQDcbftT6wLrV4dck0uH+Xsp5Lv3c3HW4UfbHWVQyZ1cscPEokyjHaMBp8QZ1No7DAKFY+/m7qh
	zWrrxAXyv2V6jmd+UCJh+TLksozVbPFHnOWwvUjh0/CLxILIiQglW/NJhJWuJ/HznAUaucI+9KQ
	AtKooREXsI0D9U4QoGBnk23OBBcsYOz5b0ZRgVPZy5SubUwGzcUrLMhKSsAl7r6sn6HZsovjEz8
	DS0f5zGEo=
X-Google-Smtp-Source: AGHT+IEM2As5xd01T9MyhOsY7Jq/vUwDCLwwpWmhJm9mhyk+XJJ2oR4QOLSxSgbrOM2CG4/v7kn10g==
X-Received: by 2002:a17:903:46cd:b0:272:dee1:c133 with SMTP id d9443c01a7336-290c9cbc210mr90330765ad.22.1760811144160;
        Sat, 18 Oct 2025 11:12:24 -0700 (PDT)
Received: from fedora ([45.112.145.65])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-33d5deaed0csm3220410a91.22.2025.10.18.11.12.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Oct 2025 11:12:23 -0700 (PDT)
From: neqbal <nooraineqbal@gmail.com>
To: ast@kernel.org,
	andrii@kernel.org
Cc: daniel@iogearbox.net,
	martin.lau@linux.dev,
	eddyz87@gmail.com,
	song@kernel.org,
	yonghong.song@linux.dev,
	john.fastabend@gmail.com,
	kpsingh@kernel.org,
	sdf@fomichev.me,
	haoluo@google.com,
	jolsa@kernel.org,
	bpf@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	skhan@linuxfoundation.org,
	david.hunter@linuxfoundation.org,
	syzbot+2617fc732430968b45d2@syzkaller.appspotmail.com,
	linux-kernel-mentees@lists.linux.dev,
	neqbal <nooraineqbal@gmail.com>
Subject: [PATCH] bpf: sync pending IRQ work before freeing ring buffer
Date: Sat, 18 Oct 2025 23:41:56 +0530
Message-ID: <20251018181156.59907-1-nooraineqbal@gmail.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix a possible vmalloc out-of-bounds access caused by pending IRQ work
by ensuring all pending IRQ work completes before freeing.

Fixes: 457f44363a88 ("bpf: Implement BPF ring buffer and verifier support for it")
Reported-by: syzbot+2617fc732430968b45d2@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=2617fc732430968b45d2
Tested-by: syzbot+2617fc732430968b45d2@syzkaller.appspotmail.com
Signed-off-by: neqbal <nooraineqbal@gmail.com>
---
 kernel/bpf/ringbuf.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/kernel/bpf/ringbuf.c b/kernel/bpf/ringbuf.c
index 719d73299397..d706c4b7f532 100644
--- a/kernel/bpf/ringbuf.c
+++ b/kernel/bpf/ringbuf.c
@@ -216,6 +216,8 @@ static struct bpf_map *ringbuf_map_alloc(union bpf_attr *attr)
 
 static void bpf_ringbuf_free(struct bpf_ringbuf *rb)
 {
+	irq_work_sync(&rb->work);
+
 	/* copy pages pointer and nr_pages to local variable, as we are going
 	 * to unmap rb itself with vunmap() below
 	 */
-- 
2.51.0

