Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 821F22BEC23
	for <linux-kernel-mentees@lists.linux.dev>; Mon, 20 Oct 2025 18:06:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760983567; cv=none; b=QWcAXpAvF3/lPhoFuLQH5jwJQ2F8prp+SSUOLaGYICu75kDskJbKZMPREu1gLi0WGptfSingwgmlZPCYkbBfpTPXkTyZmiCOR+LcEd9ra6mTaYWXANFR5ODjijgG9LPmJSJFyi7enmBExB3xVFXOE6WYhLxtnxIRgCPwQA4CIow=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760983567; c=relaxed/simple;
	bh=7KTD0uaFcyyq2og31+9WBkzgxxC3y7RTURPIR1fnqTM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kFBUItN3k1vn57HbQkz5QgqMbMbBeEu65Q/j3puXMw3KQIMIIfGbmY6dc7hiqe87MB68zTKevXusDnvLH5gfhWJFsJGYRQgQO6dxcR3DXpFlPGH5Sdk/g8fTkKMIT9RtXlfoadAvLlY135qlto5i3o8auw4YtN5BtOEaQzd6kjk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LJoPaHVe; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LJoPaHVe"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-330b4739538so4376403a91.3
        for <linux-kernel-mentees@lists.linux.dev>; Mon, 20 Oct 2025 11:06:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760983565; x=1761588365; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ScPigvONXCfVvbrizpOVQT4h67dphCjzneWDHaO1018=;
        b=LJoPaHVeU6r2UyKXhtNUq0dSVhc06uyee2lr8RAK44EGJ+WmfIkybZNv73RbHpEnwV
         UdM7ynxJggr4j447hrk9b009NNJm4BFUVkjVzagVBnYu5Q2vKsj3ICKuq2scd019Qx3y
         3B1xGcGVlD/g24KaF07FyJfgiw/ap0tYhZwyACBlViOnNmgFyMGqn289scN8OcfORsx8
         kuy1PF/qDnUCCAkPgjKgCHL6Kskzg0ftIkcq5d0qmkAFBTVB5K+rdK7NSyGtwhMnl+bl
         4OtuFDvZVLCAVMK4xIWIUkg8R/SUTPYFjO3q7saxVtYqYE/eiQK3ay0VjI4Ibh9epOMT
         lhrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760983565; x=1761588365;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ScPigvONXCfVvbrizpOVQT4h67dphCjzneWDHaO1018=;
        b=n2G7qAJDmqqgrhhGaeq12QnYSURLrk+pGW/EHgk5Sgj4Ryf3knzx3O0bfLP8pYBuuV
         FosQiIb/B7RKZo1MO3DdMNUgx8yQABfTsOrvAMBi1R/nxr9oT1FGDeX5FWyqRKrV1i+z
         LbPwrrShuZ2nbFSIMJsSA2f0QIs7ukXp5SsN9yGWHOghuwveGplH7d+kAmcCr8AAEFg7
         sq+T+r6NODKf5biuqnIIozcdLTsLYyqH0/f+gF1ZTajUnrg5EtPwwWGD/Szw4/Oz5mxQ
         2TjWhx5CBwqNId3Vm8lMpUOcRk8iHTAPTfyvetmr9qtuy6R20ccmbLLqMiGg+FkkIWC0
         rzcw==
X-Forwarded-Encrypted: i=1; AJvYcCVB7z0zLhj6nHMPVKXVFOAmcFARO+q1IbqeYedOziLl9Vfthhj5syZsUjENjHj1gJ43CmidfwYM4uhchhj7US3grWyOsA==@lists.linux.dev
X-Gm-Message-State: AOJu0YwhZFFv4EPw+LiELP44R1VopmPzvH2xPXTtMyuxv88BbejRc7BV
	h0FHCrgJqcESTg3rXV2l9OheE44a1FEoyiMuYx+IEZiU491pLo+cxnNN
X-Gm-Gg: ASbGncsUCHvDBhG7C8O98P8AumSbThq3gZuezPpqeEEu2QyItJvrGSkRIL8lhj/NdFY
	VyAtm/YdTjl3bTg4B/qIjoly8GYHae6a+GjGajOtomlCxlVja7Ja2IZpNAFQX12YrS59sg6C9Fb
	z17hXkpEQhc8rkO9wDHOZmVVtDi/qWS27DNPmcGk5x6xlOdRv1z33IDEx3+oO34QRaeBxIHW97p
	KHd3fwSL0ZOh9IEXSEshKJdQ9+gzfm9cGzq4m1WaNPK/BsNzQasrfyPiolny6864Z7f4aZAtezh
	OaaHAXdGIk7G+zXFzanJwkVo1IviApJ7LG0pLxRl2lToNQ+DmSCADwlT9Si3Rkb4X3tQcoNJDRz
	Pqwykbh5ZWTxuj/cpdxrl7gA92fDnqq5N4eWEsJ0gYpXuhOjQQ2EExUhq3sUip3GF8RTO8i/J
X-Google-Smtp-Source: AGHT+IGjGOh6awkg0N9FtQOWt/ipEbBqpahFD36PjVlo+wHCIz1HFIb1Ur9JR7ZLvNFYBniOl20qkg==
X-Received: by 2002:a17:90b:54cc:b0:33b:dbdc:65f2 with SMTP id 98e67ed59e1d1-33bdbdc660bmr16924225a91.22.1760983564445;
        Mon, 20 Oct 2025 11:06:04 -0700 (PDT)
Received: from fedora ([45.112.145.77])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-33d5de14becsm8681623a91.10.2025.10.20.11.05.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Oct 2025 11:06:03 -0700 (PDT)
From: Noorain Eqbal <nooraineqbal@gmail.com>
To: andrii.nakryiko@gmail.com
Cc: alexei.starovoitov@gmail.com,
	andrii@kernel.org,
	ast@kernel.org,
	bpf@vger.kernel.org,
	daniel@iogearbox.net,
	david.hunter@linuxfoundation.org,
	eddyz87@gmail.com,
	haoluo@google.com,
	john.fastabend@gmail.com,
	jolsa@kernel.org,
	kpsingh@kernel.org,
	linux-kernel-mentees@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	martin.lau@linux.dev,
	nooraineqbal@gmail.com,
	sdf@fomichev.me,
	skhan@linuxfoundation.org,
	song@kernel.org,
	syzbot+2617fc732430968b45d2@syzkaller.appspotmail.com,
	yonghong.song@linux.dev
Subject: [PATCH v2] bpf: sync pending IRQ work before freeing ring buffer
Date: Mon, 20 Oct 2025 23:33:01 +0530
Message-ID: <20251020180301.103366-1-nooraineqbal@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <CAEf4BzbtzHsa8DASzOg-Xqp8_-vG5ekC7JXhwuyZqPhrckU1hA@mail.gmail.com>
References: <CAEf4BzbtzHsa8DASzOg-Xqp8_-vG5ekC7JXhwuyZqPhrckU1hA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix a race where irq_work can be queued in bpf_ringbuf_commit()
but the ring buffer is freed before the work executes.
In the syzbot reproducer, a BPF program attached to sched_switch
triggers bpf_ringbuf_commit(), queuing an irq_work. If the ring buffer
is freed before this work executes, the irq_work thread may accesses
freed memory.
Calling `irq_work_sync(&rb->work)` ensures that all pending irq_work
complete before freeing the buffer

Fixes: 457f44363a88 ("bpf: Implement BPF ring buffer and verifier support for it")
Reported-by: syzbot+2617fc732430968b45d2@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=2617fc732430968b45d2
Tested-by: syzbot+2617fc732430968b45d2@syzkaller.appspotmail.com
Signed-off-by: Noorain Eqbal <nooraineqbal@gmail.com>
---
v2: Updated the commit message for clarity.
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

