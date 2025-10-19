Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D8002EBBB7
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sun, 19 Oct 2025 15:59:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760889579; cv=none; b=GeJWLqXSrkCgjCaTmqlyK1enJdmpEqR8sezzVlliH684VRLRULU1rMSYm42KRWBJhRP/wOoW7zU+Tv7nKkPRi7JA59wLXScJDlcN/52A4F9E+iYEENwYgeAFJZELhKqkOWUnjFij7D/jy74xRtHsrQaHNgwQnmXfl2pYLv7+W84=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760889579; c=relaxed/simple;
	bh=iUiqK81uM8PaPVQxTA7XtGIXzW7e9qwdKERuYe+D6p0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=N1xRIuXLE7GvtjimpJIosCCVjNExp1r/bWEWksiLeJLbry4PPT7h+C+eD1qbFBi13fOWkHVcOD6rhqBpbhHESgNFESrCA3lBlZGGLxoAio4+KG/THt0az8IGIdje3fWvqwaza4VBId0I51wsYXg6GNBzG0Z9NwvKh+VzwHuAKWA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Z+tKuVeO; arc=none smtp.client-ip=140.211.166.136
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Z+tKuVeO"
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B234A61132
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sun, 19 Oct 2025 15:59:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level:
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nXQkGeqWNcrj for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 19 Oct 2025 15:59:37 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a00:1450:4864:20::62d; helo=mail-ej1-x62d.google.com; envelope-from=mehdi.benhadjkhelifa@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org A85D96111B
Authentication-Results: smtp3.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A85D96111B
Authentication-Results: smtp3.osuosl.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Z+tKuVeO
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com [IPv6:2a00:1450:4864:20::62d])
	by smtp3.osuosl.org (Postfix) with ESMTPS id A85D96111B
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sun, 19 Oct 2025 15:59:36 +0000 (UTC)
Received: by mail-ej1-x62d.google.com with SMTP id a640c23a62f3a-b3f8d2180feso57823466b.1
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Sun, 19 Oct 2025 08:59:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760889574; x=1761494374; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=vTFzpahmqTTHRcTI1T2SzZtl71JkvLUoqnEeOyK8S18=;
        b=Z+tKuVeOTMle5A+eVLrBBtFlmUs4rj6CrHKVfhzpYr3eb1+oBLwaZWsF5KnQ62s5yt
         j2NM+BpSVd3NB1t1SUmZKh+5EAcgKfP7zqi/xA0ZItpDF87Saimu3kXkcaEhzvxsQt+o
         UKJ13/4GsOpHVVishjgGmmexJec6yVrVBhNOmdm844ag+vAzfqrWQafnh/qmdKv5+ZZL
         EYRjbezfW7djpn8q74OscmoHE2KMzErTdvw1TxTmQa7sntAwkrVhYh8WU+OpUV/7HsJa
         E/+KVSZpuxHtCGcB+GUoVLhraNa++ReZBxgbu5RkEDYsMQqCribiUJRhTdi8G3GbCBMr
         xDDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760889574; x=1761494374;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vTFzpahmqTTHRcTI1T2SzZtl71JkvLUoqnEeOyK8S18=;
        b=m28s8dtqkYUjqWkl9uPLEFM0ynf5zb9nfX2zeQ5XiUqXuxix0Y3PQcyn2cflyZeVgz
         3NsMmFfp1YdLMMaacdvDZtuipnaS8gs8Do5pY0rWtTpooKCy6jEE1wC5jURf24KC5nHS
         b8+kAphijCWyb2mQ6bW8gK2VcRi4S+Kf1jYIVr5knvFkM3Ham9up8sgqS7wA9ZDJp+h7
         gUYqNOsQosP0VygEPsiq/t4Zli+Qwwqf2mc1nDTQ1yoT2U6CSahDM2NehgHJr0z/oHZf
         JZtHeyniYPwjDsXsL0oPLy6MvFk6Yn0SCYXzwH8GeCEpikvQPJaztzq2U+AmO6E/24WI
         NDOA==
X-Forwarded-Encrypted: i=1; AJvYcCX7MpQWsse1RFf/cxfBrBlVC+dOspGXb1nULAy51b4wxptXE4XApat5MnN+/vz1P+Mg1RCfli1ffNrM783xFkaGZzu/kQ==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0YyzlzkI6A1tT5cRc8nBhqgNPiZZM55GDJMCZtfm2TX5EIKvLvMP
	8Pd9505K/6Ovs72/OnGFOiQOfpoBI1DrwZv99oFTlOLisx+O/2ZSLikD
X-Gm-Gg: ASbGncvOf/GBu0kjeE/vgNCGeEJIF2vHMR/6A4aBH4jI6ksT3JLCTr21ER+mS05s6Fc
	hJUe70x/4n3oJIBqd4XOhIBYZhLWMjWeUUYmjiyrQstyFoORwnpsLsFhzdKgccW4hX1IG08iJK1
	N4kPB92BlqAoOnbF/47pLz0wrMr1Mp0GVQifZqz+/8kwAN67c9uD06tLg/8welAVa5B/8DZBB33
	NRjsx50KR5g6D8syeDz9Es5a8kSzYFIFsMrfjhy/tMg+4HZR0C7KAzUqOTXiBaHiiPWwpk8raFS
	D16X2t3lyutskqhTC5GV8HKiMymJBqLlsJ6bCXrwyzzFPmMgHwmYBjvlux4uk/XcrHJFrA8xlkq
	+mjlnENwSQWjezcJZn3JKpG6hZo/ei1KcQk3qnYYKiNJiHp9bj/hUevir1iHNh25Cgg0hOVSsI+
	32rAEVcS6KQuveoQo=
X-Google-Smtp-Source: AGHT+IEHxFRE2pa0L8rXNH1hFC+5I0ryoeM29tlY7gH4lN9MekBBWKyrE79bZEqtF6jDZEgGQtZo1g==
X-Received: by 2002:a17:907:3da9:b0:b2b:c145:ab8a with SMTP id a640c23a62f3a-b6472352847mr655876866b.3.1760889574232;
        Sun, 19 Oct 2025 08:59:34 -0700 (PDT)
Received: from bhk ([165.50.121.102])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b65eb036307sm531554766b.45.2025.10.19.08.59.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Oct 2025 08:59:33 -0700 (PDT)
From: Mehdi Ben Hadj Khelifa <mehdi.benhadjkhelifa@gmail.com>
To: ast@kernel.org,
	daniel@iogearbox.net,
	davem@davemloft.net,
	kuba@kernel.org,
	hawk@kernel.org,
	john.fastabend@gmail.com,
	sdf@fomichev.me,
	andrii@kernel.org,
	martin.lau@linux.dev,
	eddyz87@gmail.com,
	song@kernel.org,
	yonghong.song@linux.dev,
	kpsingh@kernel.org,
	haoluo@google.com,
	jolsa@kernel.org
Cc: netdev@vger.kernel.org,
	bpf@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	skhan@linuxfoundation.org,
	david.hunter.linux@gmail.com,
	khalid@kernel.org,
	linux-kernel-mentees@lists.linuxfoundation.org,
	Mehdi Ben Hadj Khelifa <mehdi.benhadjkhelifa@gmail.com>
Subject: [PATCH bpf-next] bpf/cpumap.c: Remove unnecessary TODO comment
Date: Sun, 19 Oct 2025 17:58:55 +0100
Message-ID: <20251019165923.199247-1-mehdi.benhadjkhelifa@gmail.com>
X-Mailer: git-send-email 2.51.1.dirty
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

After discussion with bpf maintainers[1], queue_index could
be propagated to the remote XDP program by the xdp_md struct[2]
which makes this todo a misguide for future effort.

[1]:https://lore.kernel.org/all/87y0q23j2w.fsf@cloudflare.com/
[2]:https://docs.ebpf.io/linux/helper-function/bpf_xdp_adjust_meta/

Signed-off-by: Mehdi Ben Hadj Khelifa <mehdi.benhadjkhelifa@gmail.com>
---
 kernel/bpf/cpumap.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/kernel/bpf/cpumap.c b/kernel/bpf/cpumap.c
index 703e5df1f4ef..3c05e96b7d2c 100644
--- a/kernel/bpf/cpumap.c
+++ b/kernel/bpf/cpumap.c
@@ -195,7 +195,6 @@ static int cpu_map_bpf_prog_run_xdp(struct bpf_cpu_map_entry *rcpu,
 
 		rxq.dev = xdpf->dev_rx;
 		rxq.mem.type = xdpf->mem_type;
-		/* TODO: report queue_index to xdp_rxq_info */
 
 		xdp_convert_frame_to_buff(xdpf, &xdp);
 
-- 
2.51.1.dirty

