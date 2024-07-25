Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3168719D887
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 25 Jul 2024 14:31:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721917885; cv=none; b=oXzw4Zkd0m1m3jauUnzzml7xv0DXdThBtrZPcEpkpOIEfOEAFd9iNxOkCL2t1Q/sW8aKsCBkWrhVEdmgfUTXGnzSkjf8n9CrZ2WAa8Nhk4i7ZrZmMAEGuPp0RHDlHKxq8DzyCSJfY158pyKzo/gnSrvqscHD4I4pAjBe5bYGrtc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721917885; c=relaxed/simple;
	bh=JGxU3zYS2VAatIWFlak0GhwLH1YG3baZvMJ6/Ky3+OE=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=uPrZjE2jsrtzSYomYbM40/jt3cX5Rq2w1TV4yhSUdqQoCFHi4qSRVoNFwqh7i9M5ORwY8vZiOI+MgZumUtviNXlMx5rBtyz85hcNAXiUOB13DwebzFJfIU4O0xpOX7Cey33QCcJ7cnyBkvMoA4vDg3tCXv27IwlR/VAaMjM9zSE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eaZZ4qN2; arc=none smtp.client-ip=140.211.166.136
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eaZZ4qN2"
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D75BB60A94
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 25 Jul 2024 14:31:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level:
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id htAnE2MT872y for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 25 Jul 2024 14:31:22 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a00:1450:4864:20::335; helo=mail-wm1-x335.google.com; envelope-from=sergio.collado@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org EA1EC605CA
Authentication-Results: smtp3.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EA1EC605CA
Authentication-Results: smtp3.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=eaZZ4qN2
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com [IPv6:2a00:1450:4864:20::335])
	by smtp3.osuosl.org (Postfix) with ESMTPS id EA1EC605CA
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 25 Jul 2024 14:31:21 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-4267345e746so7741735e9.0
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 25 Jul 2024 07:31:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1721917880; x=1722522680; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=k7AIVGS6bVIlfSdLvm/x/5ywZaxTAuJPsXGGOUWU4no=;
        b=eaZZ4qN2SPGcs1re1vNlB8be+BNZx2zfNxmCdeHom8q00OdV4e5XUpmKSc2cwTvAuF
         xYe82YjR5elasXliAyJKQX/6Uu0hmJ8HjueE6c7iyMaojQ5T5Pd+DY4blSkn5FIcLjUO
         Gz1AaT2Cj7fpLPvtN6yC7yA1xZVLnJqbPtMOxNWg7DwSqnaqpvU59/85IVzmrlc063fI
         rkH6VC3/7/VwVaXukLcAG3VxVEb+pUvDYfaDj+B8rkP9qOJCopzA58MS41HhqhgQQlwZ
         zZSzreYwMNUpRHvQcroo2pEmxrJfUY4ucRk1uwFa5Fr0EUoBnsHcMWJi/iJeDZmUeyoy
         KIag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721917880; x=1722522680;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=k7AIVGS6bVIlfSdLvm/x/5ywZaxTAuJPsXGGOUWU4no=;
        b=mc9EGsUeFEM5CARQg1iKGXkd6xq5ubfFxmlZib25MAbmk+6EGDvs7ZwBo3G5OS9VuO
         iJLyiAHvsvdeEZKEp2RIZ/AtSPVMRTO9QZZTt/LBvqWSp6UH+xxCxG3S5LcdFvVvh5gc
         2ARcKPcYa8A6/Iyzn0vC0gP9hgQrZ9BaEftDQTyQ0SQXohhwDWmBn7v1QDDEo7X9+cXh
         JChHn286/mHy0wI/kkuUPmkwjPcgoacycKfQE/5uu519wZps8mvBcjnL4ArjgJ6arLdo
         ZVEbG+IBoia8LPQgAZooTJD56qoE3V914PHM/V53esd8KVjIhNKybBBXH2ogdo+rLcDX
         gxtw==
X-Gm-Message-State: AOJu0YyTQkyz9NpV0GicCAxyB+d1VEWGa4s9/sbVFmYUTm69zF99LVf7
	vroT1LzGq9tJaWE+trGrobm4gTYNQPL4h2b6/w6guaHn7HWY9hy6
X-Google-Smtp-Source: AGHT+IEDpJ0o+L7Ka8jWtriRCeoBC1hhU9DFKm2E/d4+YYZU1ZYlk9eKCD27D+UE45PC2l+nOi515A==
X-Received: by 2002:a05:600c:5487:b0:426:5fe1:ec7a with SMTP id 5b1f17b1804b1-42806be7443mr16696735e9.31.1721917879517;
        Thu, 25 Jul 2024 07:31:19 -0700 (PDT)
Received: from laptop.home (83.50.134.37.dynamic.jazztel.es. [37.134.50.83])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42803c593aasm44004705e9.23.2024.07.25.07.31.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jul 2024 07:31:19 -0700 (PDT)
From: =?UTF-8?q?Sergio=20Gonz=C3=A1lez=20Collado?= <sergio.collado@gmail.com>
To: stable@vger.kernel.org
Cc: linux-kernel-mentees@lists.linuxfoundation.org,
	Jiri Olsa <jolsa@kernel.org>,
	Hao Sun <sunhao.th@gmail.com>,
	Yonghong Song <yhs@fb.com>,
	"Paul E . McKenney" <paulmck@kernel.org>,
	Martin KaFai Lau <martin.lau@kernel.org>,
	=?UTF-8?q?Sergio=20Gonz=C3=A1lez=20Collado?= <sergio.collado@gmail.com>,
	syzbot+08ba1e474d350b613604@syzkaller.appspotmail.com
Subject: [PATCH 6.1.y] bpf: Synchronize dispatcher update with bpf_dispatcher_xdp_func
Date: Thu, 25 Jul 2024 16:31:11 +0200
Message-Id: <20240725143111.222429-1-sergio.collado@gmail.com>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Jiri Olsa <jolsa@kernel.org>

[ Upstream commit 4121d4481b72501aa4d22680be4ea1096d69d133 ]

Hao Sun reported crash in dispatcher image [1].

Currently we don't have any sync between bpf_dispatcher_update and
bpf_dispatcher_xdp_func, so following race is possible:

 cpu 0:                               cpu 1:

 bpf_prog_run_xdp
   ...
   bpf_dispatcher_xdp_func
     in image at offset 0x0

                                      bpf_dispatcher_update
                                        update image at offset 0x800
                                      bpf_dispatcher_update
                                        update image at offset 0x0

     in image at offset 0x0 -> crash

Fixing this by synchronizing dispatcher image update (which is done
in bpf_dispatcher_update function) with bpf_dispatcher_xdp_func that
reads and execute the dispatcher image.

Calling synchronize_rcu after updating and installing new image ensures
that readers leave old image before it's changed in the next dispatcher
update. The update itself is locked with dispatcher's mutex.

The bpf_prog_run_xdp is called under local_bh_disable and synchronize_rcu
will wait for it to leave [2].

[1] https://lore.kernel.org/bpf/Y5SFho7ZYXr9ifRn@krava/T/#m00c29ece654bc9f332a17df493bbca33e702896c
[2] https://lore.kernel.org/bpf/0B62D35A-E695-4B7A-A0D4-774767544C1A@gmail.com/T/#mff43e2c003ae99f4a38f353c7969be4c7162e877

Reported-by: Hao Sun <sunhao.th@gmail.com>
Signed-off-by: Jiri Olsa <jolsa@kernel.org>
Acked-by: Yonghong Song <yhs@fb.com>
Acked-by: Paul E. McKenney <paulmck@kernel.org>
Link: https://lore.kernel.org/r/20221214123542.1389719-1-jolsa@kernel.org
Signed-off-by: Martin KaFai Lau <martin.lau@kernel.org>
(cherry picked from commit 4121d4481b72501aa4d22680be4ea1096d69d133)
Signed-off-by: Sergio González Collado <sergio.collado@gmail.com>
Reported-by: syzbot+08ba1e474d350b613604@syzkaller.appspotmail.com
---
 kernel/bpf/dispatcher.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/kernel/bpf/dispatcher.c b/kernel/bpf/dispatcher.c
index c19719f48ce0..fa3e9225aedc 100644
--- a/kernel/bpf/dispatcher.c
+++ b/kernel/bpf/dispatcher.c
@@ -125,6 +125,11 @@ static void bpf_dispatcher_update(struct bpf_dispatcher *d, int prev_num_progs)
 
 	__BPF_DISPATCHER_UPDATE(d, new ?: (void *)&bpf_dispatcher_nop_func);
 
+	/* Make sure all the callers executing the previous/old half of the
+	 * image leave it, so following update call can modify it safely.
+	 */
+	synchronize_rcu();
+
 	if (new)
 		d->image_off = noff;
 }
-- 
2.39.2

