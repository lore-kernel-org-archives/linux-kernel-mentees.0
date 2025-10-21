Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F7282D8362
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 21 Oct 2025 10:47:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761043655; cv=none; b=f1d2O91+Aw65hlcLAfWCzVc6somLgOvdLknUAYM+aRU08Dd7S78bbjnuNgzgz4RWq/xXBaWOOilQAoNg+I9+qqPb68au9hXl6SBqIia1LpnYC7XKLaWRfqqJhw9Bf1A0x0x6Y8AshM+4ZMxyio7bB43W+YMiTCK2XxgfriYtdBk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761043655; c=relaxed/simple;
	bh=u3x+mZ9WYaMzDykMD4wrOaaWSHSxUpyWrVYfEbgeV3s=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=fV5CYlSBOrsP9Z/D3RPl6/UEgLuooaiGeru/4NP5Ef05j5Evt4fT+wuEtYoTLhGRovZE3L5hbak43YWBCFe78mMfvagU0+Bi9rhbFJS6kesO1FZT32qheTl9UN1CiOQRv0IGt3BmlMshR3gLMVRaQywlseYkg11g7z51jXvRy50=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GiODScvc; arc=none smtp.client-ip=140.211.166.138
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GiODScvc"
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3889980F3C
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 21 Oct 2025 10:47:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level:
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xFjNaNEg7vXD for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 21 Oct 2025 10:47:33 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a00:1450:4864:20::629; helo=mail-ej1-x629.google.com; envelope-from=mehdi.benhadjkhelifa@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 15E9D80F38
Authentication-Results: smtp1.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 15E9D80F38
Authentication-Results: smtp1.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=GiODScvc
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com [IPv6:2a00:1450:4864:20::629])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 15E9D80F38
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 21 Oct 2025 10:47:32 +0000 (UTC)
Received: by mail-ej1-x629.google.com with SMTP id a640c23a62f3a-b3df81b1486so104256866b.2
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 21 Oct 2025 03:47:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761043651; x=1761648451; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=hYQSYXxT3vBEQ3060Gmkoau5FySMDvalsTXJ7MNV5UM=;
        b=GiODScvc2KwQt6aSE/3RFJp1mikYdJs/smIMFz7sKkWLKQBuuCrecQ2B6484ojlFd8
         YoTo9FwqSgsLM1xt28Z4Jhj/XpbLzSpcMQT1HP8hLIUMr5qcIa5vkMkrO86WdfWzIKv+
         ZaDhWlaA4fw1RfOCkWqJtt7SqCfUOUsk49odyZPv6PyBD8YbneByMsJbAkWTPMo7kWK9
         SiGDXphcfwQRzErhqfJ/izULZp3JOv1uoJNauHVbkCxsjDArCVTj1vr0plZOq0KT/Dao
         cmtJn7GNc0CCx3yUEryAggyXShORlH7LHJ21f3a+ZnHBwDNc7XOfpHDbdAq2nfJ/l+rm
         RI+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761043651; x=1761648451;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hYQSYXxT3vBEQ3060Gmkoau5FySMDvalsTXJ7MNV5UM=;
        b=eM25wH9jnb9gFm1FlW6duGqAf44cyz3diDHNB01BSfrApR3NKLRfwV+vAp0TvjWA/o
         hFbqzXD9Z/tZwi5f2XKTb4OisdQTQ87IUGkJtS86G5tkguGxA4EBIZKKE6eA4+VQzFJW
         igne3Lo/FfcqCTUe8XIbNOvvfX+43b/Byvygn485eaiCp/gYVgyYI6P1bYa7hY4dUGFu
         VTrRzcj0uJUB0JOmC0yKidf6kxIB0eCFJxZC+jfE3GDKyvEZc3butJv/nJzOJfzXO5XT
         SLWmYUM2rfHH0zLQXQVOe1bTM5NUbA+M5Ydg+3q0TcvMN0kYN5bzHoOwTOiEGs9MdEI7
         kkEg==
X-Forwarded-Encrypted: i=1; AJvYcCWim31wLbalQM/cyl8+Q3DGYHC1SmFlJXOhn/XQiLpdwzzEeTJWdg9wzRoiekMP9bYR/zq7/eR0KkYO/PwW8OWTN3Fogg==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0YwfwO+OxMpkeUuCtqeq7OlyPQMBlgtWS90Kderb3EgO2g8Naclx
	z2oxsfMpIC9F9NiH0ulFk0aoQrOubzDTnf6laqQ7ZUEC6BXNPO5ebtiO
X-Gm-Gg: ASbGncu8TCWjBFsbY5P00+BARnTM7rP0yFZhZQ8+Mz3FekMdFHiF+Z7iHYNV4lu24fR
	zP/ROtbunKRiW4xJjr1+uHfqe1NIWhA3RciADFnKwIRPL/T7CzmRdxuRoNQFJn4tbeJhYvf5Onb
	nnvKqt5yQfcsWkOMWMBCk3cKBOjrgCHhHAT3bUN7tvb4MQsSlUYTI8Qlr00uV4jw+6Vzhy92TwO
	urwvOEUg1hBC9GdopdZgyBhd9ifX2fbtXs6XuolluTsbMSYaP0ave3Ejq/mDqxcvtzo+uxLvd57
	J8JjE38oUcseUvXLH+Who/vdiA64B3Rd1Xv/y1TK+cM8cedDcadCGu/R3teImNFmuwNay+WEm/m
	cBgEsUft1aVE3VDXpQrVPRN+0nUFO4BErVGe8HRLK/ALgYboIYbGl4ASRn5PAp7qeRFi1yOTcAA
	sRewtWMcWa2Ll/
X-Google-Smtp-Source: AGHT+IEVgz7zYtsnpcehMAmhlB3OUMARV4++YtUV332nKXGeBC2HoEB9fppwF5GU/sp0jIUet5ebFg==
X-Received: by 2002:a17:906:4fd5:b0:afe:a7e3:522e with SMTP id a640c23a62f3a-b6c798e7a68mr191581266b.8.1761043650805;
        Tue, 21 Oct 2025 03:47:30 -0700 (PDT)
Received: from bhk ([165.50.73.64])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b65e7da2c5dsm1029123566b.15.2025.10.21.03.47.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Oct 2025 03:47:30 -0700 (PDT)
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
Subject: [PATCH bpf-next v3] bpf/cpumap.c: Remove unnecessary TODO comment
Date: Tue, 21 Oct 2025 12:41:24 +0100
Message-ID: <20251021114714.1757372-1-mehdi.benhadjkhelifa@gmail.com>
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

Changes from v2:

-Corrected the new comment

Link:https://lore.kernel.org/all/20251020170254.14622-1-mehdi.benhadjkhelifa@gmail.com/

Changes from v1:

-Added a comment to clarify that RX queue_index is lost after the frame
redirection.

Link:https://lore.kernel.org/bpf/d9819687-5b0d-4bfa-9aec-aef71b847383@gmail.com/T/#mcb6a0315f174d02db3c9bc4fa556cc939c87a706

 kernel/bpf/cpumap.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/kernel/bpf/cpumap.c b/kernel/bpf/cpumap.c
index 703e5df1f4ef..ee37186fea35 100644
--- a/kernel/bpf/cpumap.c
+++ b/kernel/bpf/cpumap.c
@@ -195,8 +195,10 @@ static int cpu_map_bpf_prog_run_xdp(struct bpf_cpu_map_entry *rcpu,
 
 		rxq.dev = xdpf->dev_rx;
 		rxq.mem.type = xdpf->mem_type;
-		/* TODO: report queue_index to xdp_rxq_info */
-
+		/* RX queue_index is not preserved after redirection.
+		 * If needed, the sender can embed it in XDP metadata
+		 * (via bpf_xdp_adjust_meta) for the remote program.
+		 */
 		xdp_convert_frame_to_buff(xdpf, &xdp);
 
 		act = bpf_prog_run_xdp(rcpu->prog, &xdp);
-- 
2.51.1.dirty

