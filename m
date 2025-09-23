Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 180E530B516
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 23 Sep 2025 20:00:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758657650; cv=none; b=oFYeVNwd7aFBdXmp1I0Po97uC9sMhB0jr86S9VAmf1Kp03qQmCBzDfOJLWzHy8YR7XmJqEIb+SHIM5sUnyCWoAdU17NEJWSn7acO6mbHFa/SV5r95Mi6GY3fufo1EXom4KBVYR9wDaweZqI6+lKy2G3dgWL8bxzK7WJvBS8ccxU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758657650; c=relaxed/simple;
	bh=yC887JdsZIuNAU3KH0iM0jpa/sF+QL795+nxAjAlvwo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=aQb7BILyXyRhJf3NICVwmPhuwNHbjRRwQ8KCn0Jd8LAc9/sKdYLLbV8M4jLubFCe4uSsmuTJyRp0pssLC9vvAu73Lh7/fIqPJTIp0wwrfNd4OaNZAo2Su+dgefmH37R7kdsPqioi9G+9ey2cBDHg8hOPNDP13fxAVsjOhzmlV8A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ezVOZyFx; arc=none smtp.client-ip=140.211.166.138
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ezVOZyFx"
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B1F9382479
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 23 Sep 2025 20:00:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level:
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ToZP0MNHeOJT for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 23 Sep 2025 20:00:47 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a00:1450:4864:20::636; helo=mail-ej1-x636.google.com; envelope-from=mehdi.benhadjkhelifa@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org AABA78246F
Authentication-Results: smtp1.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AABA78246F
Authentication-Results: smtp1.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=ezVOZyFx
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com [IPv6:2a00:1450:4864:20::636])
	by smtp1.osuosl.org (Postfix) with ESMTPS id AABA78246F
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 23 Sep 2025 20:00:46 +0000 (UTC)
Received: by mail-ej1-x636.google.com with SMTP id a640c23a62f3a-b2b8b6a1429so44646866b.1
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 23 Sep 2025 13:00:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758657644; x=1759262444; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9kxnKEunBUq6lbDqWLItziPs2zbuhFcil+VxDU1uLZ8=;
        b=ezVOZyFxGHkhtHxXjff41Dn6yQbJ4/UXgIVF8l3vGZrFPIaqHWh1x7Q4J3o3qsTXXi
         xs3ae/eesB2Oi0ikw5sfs+rf4X0ME3RaNA1dwvtNoSUhyUJj8yR3UwSJmt9viz8IWpgh
         VSD75cnxJMMwfqcLaOrQCowUFugk05hmaqonwDFkv3Lo07/063cD2WpeZYx6GVmpClQG
         nfahish1A7GVSiYGDClHdF2qGrRfEYrfqvWKrGOwvzInnFbAAds6KodRYmFSmMdkS1HW
         zsDjwpYp0A/I5N5a0VzqVwS9nH/yfIHHcHE7nSD2bWclPusfRFKcjEcLE0tE/Kn/5Nmi
         WG7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758657645; x=1759262445;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9kxnKEunBUq6lbDqWLItziPs2zbuhFcil+VxDU1uLZ8=;
        b=SHH/m1gG+iJhVlIkjFlwLwbWfbuhAM5fVKXlDcw+yDAPaTzyyNSa+I5fVUcNYxHMnb
         AZp3UG1l7qq5GgUWj9aNe6rHUPJkOdlQ5JNzzqnuE7PhHHimSdcLwZfma8u/BqkLncEB
         Z9GrCWe77bzg5V42qPuVQC7ZPFdy97qvI0rRPWGrNSmyWWCL+dijfnQn320zp/WleegT
         ZaTOUrMHAgKwP8yh3XXF65flIWip1OVMir54DxJz2uOYbIMWqsHS3+b9mBH6VLl7J2SV
         xZxs5G4gwfUslHXqDXg4PGqq4d8MY68myYfhRxNMneGy8DRclzescn4Dm/oxahO8nCf1
         +Biw==
X-Forwarded-Encrypted: i=1; AJvYcCWG4+TUak9wapHSvt2QySDVNbw2Kj4yqy+T550cdrEd830ZETVJ10CstRHV1VaicYkDIL7KtPEDt1h7RUQTF4FWEKZu2A==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0YzXQy4ZhXGU4nx2QmXguGs9+g5oOchnqOF19VPNpUSY/XbJUSoc
	rqjfnMkWWuHF+D4trcP4zJEYiRYIiZxoeYLRbZUOyQinh/yS2a+MpML4
X-Gm-Gg: ASbGncvEG7VzpJ88lszcCh/9s9xkqCXJhig5lMyJWMBYqHbPpyuJgsyIGibZEUWcwrT
	RleYVs3rlzQxo/28rTNUiWO/d60B750pmQKR97QyJ/hn8KNb77tgZq2hJbOFL0xzMB6Jmyiw6yk
	vo9zl43TsZ2riNUT/bI6bnTF5yUp7coUbvUuApEqjk2AsYcTEu2q9J65+ny0kFdgrmsOYW7QYEs
	r2oefRef5BRKQg83L14Ne8Dg02fmhHvgRqg3SoD3GvgqwPBzBDpRWBMC4FzBxr6gvywKtjcolr1
	MBOR4dQi6bBNl2awJbxW3i8pCLHHJhmkG5widQL2DhM4UwqOCue9ecgPTzheSFeFuqGQGKDQ/FQ
	Rjf7ewe9oIGYSz7TLUcaeoOiGwbed3URey5uyzx+MLHI=
X-Google-Smtp-Source: AGHT+IH0sk2UMFhq8ILkVNhalVb23fPwThZEi+o2vb0yPrbkfalsoc549TsjUa62bG1KSNKQmFvZBw==
X-Received: by 2002:a17:907:3ea1:b0:ad8:8c0c:bb3d with SMTP id a640c23a62f3a-b302745d8acmr203295566b.3.1758657644360;
        Tue, 23 Sep 2025 13:00:44 -0700 (PDT)
Received: from bhk ([165.50.1.144])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b2ac72dbe92sm672074066b.111.2025.09.23.13.00.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Sep 2025 13:00:44 -0700 (PDT)
From: Mehdi Ben Hadj Khelifa <mehdi.benhadjkhelifa@gmail.com>
To: davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	donald.hunter@gmail.com,
	andrew+netdev@lunn.ch,
	ast@kernel.org,
	daniel@iogearbox.net,
	hawk@kernel.org,
	john.fastabend@gmail.com,
	matttbe@kernel.org,
	chuck.lever@oracle.com,
	jdamato@fastly.com,
	skhawaja@google.com,
	dw@davidwei.uk,
	mkarsten@uwaterloo.ca,
	yoong.siang.song@intel.com,
	david.hunter.linux@gmail.com,
	skhan@linuxfoundation.org
Cc: horms@kernel.org,
	sdf@fomichev.me,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	bpf@vger.kernel.org,
	linux-kernel-mentees@lists.linuxfoundation.org,
	Mehdi Ben Hadj Khelifa <mehdi.benhadjkhelifa@gmail.com>
Subject: [PATCH RFC 1/4] netlink: specs: Add XDP RX queue index to XDP metadata
Date: Tue, 23 Sep 2025 22:00:12 +0100
Message-ID: <20250923210026.3870-2-mehdi.benhadjkhelifa@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250923210026.3870-1-mehdi.benhadjkhelifa@gmail.com>
References: <20250923210026.3870-1-mehdi.benhadjkhelifa@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Devices will be able to communicate received packets
queue index with bpf_xdp_metadata_rx_queue_index().

Signed-off-by: Mehdi Ben Hadj Khelifa <mehdi.benhadjkhelifa@gmail.com>
---
 Documentation/netlink/specs/netdev.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/netlink/specs/netdev.yaml b/Documentation/netlink/specs/netdev.yaml
index c035dc0f64fd..25fe17ea1625 100644
--- a/Documentation/netlink/specs/netdev.yaml
+++ b/Documentation/netlink/specs/netdev.yaml
@@ -61,6 +61,11 @@ definitions:
         doc: |
           Device is capable of exposing receive packet VLAN tag via
           bpf_xdp_metadata_rx_vlan_tag().
+      -
+        name: queue-index
+        doc: |
+          Device is capable of exposing receive packet queue index via
+          bpf_xdp_metadata_rx_queue_index().
   -
     type: flags
     name: xsk-flags
-- 
2.51.0

