Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C02C283C87
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 20 Oct 2025 16:03:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760976193; cv=none; b=LrG/qZO71Adg7v03BkLATq2yh5tpzNB0LH35/QFbUsrP4bDeea6hhN84DOhU1wKSU6y4z4SMxKX+KUy3snhoC728Flhrn09Wjlxgh2+8t+Imz6Ay2S2URWGQnYi2eUOdZZyxTjwiRctHhfV5edRd9Hx8VXIaUbtAeSrmTJb9fuk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760976193; c=relaxed/simple;
	bh=5p8QM8GiyJ3VdJu3v6HqAWTAumRdDRF9TVX5rxrWIhc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=foC99xB8Clq2O6/dYFV31Mtdr0YvZTFPpEdPVdcySndiW1N9yLgjj8bchybRyYnputym8/l+O7gntlxAGShDeiVJUA9YYWHwbn4gRVFUt4IQZc+hq3qId1wLkTpdKTPgEEq/G7rVLxOBIdZd365nfyR8Cw9HmvPGGxmKb8ny4+0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AcidpVck; arc=none smtp.client-ip=140.211.166.136
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AcidpVck"
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A33FB61229
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 20 Oct 2025 16:03:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level:
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Qv4KwxWIjOWp for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 20 Oct 2025 16:03:08 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a00:1450:4864:20::529; helo=mail-ed1-x529.google.com; envelope-from=mehdi.benhadjkhelifa@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 9FED66112A
Authentication-Results: smtp3.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9FED66112A
Authentication-Results: smtp3.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=AcidpVck
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com [IPv6:2a00:1450:4864:20::529])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 9FED66112A
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 20 Oct 2025 16:03:07 +0000 (UTC)
Received: by mail-ed1-x529.google.com with SMTP id 4fb4d7f45d1cf-63c0b633c7cso527362a12.0
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 20 Oct 2025 09:03:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760976185; x=1761580985; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=sEqKuO9xbs7T7mcjnW0UyAFwwa+u/P82jsf/ebmJ8is=;
        b=AcidpVckOmpVDY+e7WR+pH7UfTxk7FMevSx+OL/M8RVW2/xGkaI6UvTexLaSRsZ8C8
         T68lfFV18fQH8ij31luIFiLXbAhFtFoy29EfQ1ly0WT0ib2Kv6QqC6csErLQTJ919vYt
         hU/PdAXs88iRQDDyIJPVwq5sbHPxHH5psjXryEQtaa+bdyJXCNZAcTiu06cJ2hSd33qA
         HJCM2tLo2RXpSMppGYGlZGDLYp+klxxB5ZLKNmZnp/3eXpOYr9keAfUX5tCn8Wn+GQYh
         +795iEUT7QEMoHUbuFWoEalDfSNIqQ8YD6NPRHx1rZup2nNn+/YDW0pCOgzn6fK5Cnj5
         W7ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760976185; x=1761580985;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sEqKuO9xbs7T7mcjnW0UyAFwwa+u/P82jsf/ebmJ8is=;
        b=lgSt+5sVykYG7kbrUdKZMjr3ZvHpnHOYSqrGLy3jAVxnxL48xSWhZMZEenqBAef1JV
         nNvNGOY3dN05QkjWMrDNhW3qbJKJnYk30n3khTwIFAUChND9ZwNhMQgCB082vj9x6bei
         wr3MDX6mJ7WaKYg4nhQjscZwFkGJIpP2ik1d4RyivKedEHziESStCNDfLJiQq6Mq+/L/
         MN6IV9r800PGHOdODH6S8kQq1Zh4bmmW4/4J0oAUbdQVdRe7es+bhmD1jG1T20/jOdZ6
         4nyXcEZDqthI8Ic/aK1AaEI3uxpi54dT6PQ47ZoWy3vzi/5aZq9kW30T8Sz8p4LtfggM
         cUqw==
X-Forwarded-Encrypted: i=1; AJvYcCXjtboT79nPj8myy7YZqV6E7A/2SHFEVyjNjRMpSlvifTvUdauAsTXiZHt/TW7X+R8lAeXYrM92mCQGQvSpw4mNupkPug==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0YxHr8ksDLSe/shSK91bvYPm3pGV9rSo1ndp+VKPg+Zswu8vL19U
	PBbVJaSzQCfAdspRSiHLz14TVj7zJTWoDs2O/4dFq9RJlH7u6l4Uoc2Q
X-Gm-Gg: ASbGncvVi828819nvXS334MC7cOD3JB9yBJyaG41ZeGVOtWh5hX4Hfz7EN1D8Nn/q2S
	+PdqaxWJ6G61yY/Ov2PYSiI/hF3YGyfMS2Q24XWrSdUhKi/dha1Js0aH6cReSaqv+Iy8yHiIaKj
	My+zdRAmeATbRhkYUJh7HtU1AedkbZW2PjTPo+ZkBudIJdwwv19t6QixaY8oOn5SNdOvA3StjLo
	e6gS6AoiZ54bluHbCoeim6DDZ4xkOwNAxJku8HBSNxRJroyp16CoKES0cOpY9OWvEX4FfNkMirN
	eqY0R7Ujz9rexst6bgZ5O/OVLsT/zeVS8e0fEcOQNuhkX+1VjE/1a8ioyUbY00todhngUrovvrX
	StIHkls3NWFgoGwSfDea4wY48+KBRfhnOZNe0UU/vlZK6v9Jg/Hh3CQs2CQMf+tWVByDm/kPPgv
	7TLlMxCg+KrlV3ow==
X-Google-Smtp-Source: AGHT+IEAZ4aDtO0vMHq0WUMhe05mN+O1T+el3SwZMkFfF983mLEGTQdhOfy2UfAjoiXHE/Y4G+rEjQ==
X-Received: by 2002:a05:6402:274d:b0:63c:343:2493 with SMTP id 4fb4d7f45d1cf-63d1649c390mr29994a12.0.1760976185195;
        Mon, 20 Oct 2025 09:03:05 -0700 (PDT)
Received: from bhk ([165.50.86.146])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-63c4945f1ffsm7186665a12.31.2025.10.20.09.03.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Oct 2025 09:03:04 -0700 (PDT)
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
Subject: [PATCH bpf-next v2] bpf/cpumap.c: Remove unnecessary TODO comment
Date: Mon, 20 Oct 2025 18:02:37 +0100
Message-ID: <20251020170254.14622-1-mehdi.benhadjkhelifa@gmail.com>
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
Changelog:

Changes from v1:

-Added a comment to clarify that RX queue_index is lost after the frame
redirection.

Link:https://lore.kernel.org/bpf/d9819687-5b0d-4bfa-9aec-aef71b847383@gmail.com/T/#mcb6a0315f174d02db3c9bc4fa556cc939c87a706
 kernel/bpf/cpumap.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/kernel/bpf/cpumap.c b/kernel/bpf/cpumap.c
index 703e5df1f4ef..6856a4a67840 100644
--- a/kernel/bpf/cpumap.c
+++ b/kernel/bpf/cpumap.c
@@ -195,7 +195,10 @@ static int cpu_map_bpf_prog_run_xdp(struct bpf_cpu_map_entry *rcpu,
 
 		rxq.dev = xdpf->dev_rx;
 		rxq.mem.type = xdpf->mem_type;
-		/* TODO: report queue_index to xdp_rxq_info */
+		/* The NIC RX queue_index is lost after the frame redirection
+		 * but in case of need, it can be passed as a custom XDP
+		 * metadata via xdp_md struct to the remote XDP program
+		 */
 
 		xdp_convert_frame_to_buff(xdpf, &xdp);
 
-- 
2.51.1.dirty

