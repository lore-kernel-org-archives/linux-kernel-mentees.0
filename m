Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59DDF7E1
	for <linux-kernel-mentees@lists.linux.dev>; Tue, 18 Feb 2025 07:20:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739863213; cv=none; b=Adlr5lJ9L1zj58kcC7zrAoD5RiZsKClktucEsnwaBEYnK0ZTIbFe7M5H7EcoZNLuWDDramnXlB82d/jXp8cyyKRNRmMQJI2nkTVT4dOml5YqCEdzKq2GyxmV2UhN2y+O+iqXoOnVfk3TC9v8a6GExBUDjc7yrpRNgvQNWC342lg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739863213; c=relaxed/simple;
	bh=QJ42PfnIyZtd/E4FCdA7rGKy2tClUkTb5RVyCcC+XPI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=dzsk6ZD4j1lUbkyUIMwbEejhSsYcw8mxWQVBAYyUJ3sbSAdRtxGmsgkvGEZlsOmoEF+tbo3V/smMIfhHvjAqkCAsvdK7I+4kzD2Gg8D2M35xADWYUS43FG/ni7D2Ox7s2Kx5aEcc36YRisoSlJ6q+3fyYA7D9cF0hYddPws7Pus=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZG27HQgE; arc=none smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZG27HQgE"
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-2fc0ab102e2so1183651a91.1
        for <linux-kernel-mentees@lists.linux.dev>; Mon, 17 Feb 2025 23:20:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739863212; x=1740468012; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=VF217HMsP0EaV73/D5yPINv1JqTHlL6uJbUiEmkq1c8=;
        b=ZG27HQgE+85+1o65LkcZGwqTsY6OMq3rRK9hgDpjUk0LDpAoE13UaH7pnP/49IM07N
         5vWzzLqzWBB33DKZd8R4flKX9owjrfRsthrzJfL2sX2zBvlG7a96TbieW+oLt/4kWlqZ
         6qLcJ5fGSAeiFw37L+JG/YbF1v482/TBbCtPNGG+itbL9XU/lu+QUxmXo8iyEq85LJO1
         xsvutb3XOKxRKp6rUHVqn2/XuAIbkmMlriKVwos7ZFGM15b/HrOO1BqE7+xcSbZdIwy1
         erkvwEfZxGC7LDwoD1Y7GQzDyqWxSiiMPXj6gEb7MufbHReYQ1bxnkm6SEHQO8jOotxO
         R1Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739863212; x=1740468012;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VF217HMsP0EaV73/D5yPINv1JqTHlL6uJbUiEmkq1c8=;
        b=LvVog7z5VIqwoNDBN+uaOOssuq0SyquFkABk9oCiHMfO+aDzynTXnPcwtcfzPJa6Gn
         6+D19+Bwt8Kbqjxy2mo2tXwjk72yjzJOq9HKNHWPbiaKvjEERiJLoXNKeP8UxyYgzEIG
         WNBf9NR2OBnZQyzRbqlCQ4jAL4O4Nm74z4ex4lzI9D15swK2gYDgTQ1/erMCTElPXLUo
         thwch3XiUeMB2C0RjVtttbhLAKtYlQp1X+MRmKD63DNGnrB1+R0wzBqgYZ3y9Q8yL9qg
         Hji9LkCLx1rzDhEmmFbJFZQLNvC1B0YVxro+CQzvz0gxZQfl9PlVwiH1ELO6ZrMtQS/x
         YpOg==
X-Gm-Message-State: AOJu0Yx5hoBm9mlkDNvgaGHIbTJ+cVnw3MusfNwtgoE6KK8y3ViKyPCa
	2DtNGLb+79eXAnIYHQV1Rq3WptnDR1aLRaob6VV5B2WLZieAX8sb
X-Gm-Gg: ASbGnct5vbyOsHMpLCZPukoNIzyjpjt+Gfn+897l7kdqNlg3WQi7/R6eJGnLNxujBeX
	o6aHtFgHoPSCGEeDhfo9mDWedyBRXJffRVh2U8pRmzgWBdlHZn3YR61FD6E/y0QCcMeI36BKMdQ
	k9YCj3/BgPPXsVfnfdsYvs68JuISX+0tnkFBPBAnNJ9BNTbuiO+p1gwJrd0WsPeKDLuO4WRciQ5
	9mSsB0SgyLVRQLuUOIlQUefI3V8BS4y35zpHwsRTKqtfNtovgdKe3UGXfXVivycz3It+Pj0AFPA
	fElbfl7Ywtt8ZMScS3tzooJ7lOXKcqnJ4JtspwiXx3x3b1GgVaID7/LDQtA2FveOgxIKW59/ZSH
	oWtqFiQY0nPtQapBoZCu8
X-Google-Smtp-Source: AGHT+IGIiGS0uPHRmcKfDtMPTDXzwZJxSu6wzrZmrjQKOVMYvWp3DtQ95Hv4y3t/IbEDFnpf4EQl7w==
X-Received: by 2002:a05:6a00:1a8f:b0:732:17d8:d1b6 with SMTP id d2e1a72fcca58-732618c0ca9mr6948471b3a.4.1739863211549;
        Mon, 17 Feb 2025 23:20:11 -0800 (PST)
Received: from codespaces-977d69.2t4prynt4dlezbzls5ze3dxsqg.rx.internal.cloudapp.net ([13.71.3.101])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-adda5be52f1sm4556957a12.34.2025.02.17.23.20.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Feb 2025 23:20:11 -0800 (PST)
From: Marvin Murithi <murithimarvin09@gmail.com>
To: skhan@linuxfoundation.org
Cc: linux-kernel-mentees@lists.linux.dev,
	Marvin Murithi <50557936+rimubytes@users.noreply.github.com>
Subject: [PATCH] selftests: Fix spelling mistake in documentation
Date: Tue, 18 Feb 2025 07:20:05 +0000
Message-ID: <20250218072005.19194-1-murithimarvin09@gmail.com>
X-Mailer: git-send-email 2.47.1
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Marvin Murithi <50557936+rimubytes@users.noreply.github.com>

---
 tools/testing/selftests/net/netfilter/conntrack_icmp_related.sh | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/testing/selftests/net/netfilter/conntrack_icmp_related.sh b/tools/testing/selftests/net/netfilter/conntrack_icmp_related.sh
index c63d840ead61..f63b7f12b36a 100755
--- a/tools/testing/selftests/net/netfilter/conntrack_icmp_related.sh
+++ b/tools/testing/selftests/net/netfilter/conntrack_icmp_related.sh
@@ -171,7 +171,7 @@ table inet filter {
 }
 EOF
 
-# make sure NAT core rewrites adress of icmp error if nat is used according to
+# make sure NAT core rewrites address of icmp error if nat is used according to
 # conntrack nat information (icmp error will be directed at nsrouter1 address,
 # but it needs to be routed to nsclient1 address).
 ip netns exec "$nsrouter1" nft -f - <<EOF
-- 
2.47.1

