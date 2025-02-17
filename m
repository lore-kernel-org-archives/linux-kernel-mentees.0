Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D383139B
	for <linux-kernel-mentees@lists.linux.dev>; Mon, 17 Feb 2025 00:15:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739751312; cv=none; b=KkpcVv/RlOGbYCJDbMbbXfz+nNP9/nx1O98xIRYWiEeXFCLXzEsWGMcHNPJx9wJ3av/XNw1HoZP+gq/pqxoZ1EfDFETrZPENb0+FoCcEOnz1gC6pxQQ6U+C8KFH4kiiMFQ7E6fiBRfy+2/tAD6VWH1W4EDHQGZ9CNot9Zip96tA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739751312; c=relaxed/simple;
	bh=qYMV2ZvPOOQ1i4HZ7Hj50NCQSQmHDQ0fRzzPgQ7dF4s=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=s1egc5gf2NjWxoDqiBhATn71CJrcrDfxR8S8n7f8LBbpbezgD2HYnIt8J+ndiwSIMF5n0jZJ7ihKAYdKWFHMw2AEmC/ZrIyp+XrUEo7FD77H6pYGRh7hdIWoKsReajXjYFCG/hcrg+zKoqkDWztPgwOSpYGJ0V2zEUCv3S+xvVU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lylmC982; arc=none smtp.client-ip=209.85.128.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lylmC982"
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-6fb7d64908fso2471697b3.3
        for <linux-kernel-mentees@lists.linux.dev>; Sun, 16 Feb 2025 16:15:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739751309; x=1740356109; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=KliuYWTy5fHmrSLbuJtksd9qAx3y57Psdagf2PMtLNY=;
        b=lylmC982ekB6nv4cgnph5pinkMfz5NplUNGVPDjpFhIAH9WA7L587VyHDJP2umJCCb
         b/OjCIxyTexOORZVKDY99Vsm8JAgJY5aXJbQjT69qxAOz80Rbcy+ZAJfIuOx0h0Xy3l/
         RP5zxHiWlP/ol9WZ68UsDJRxHLtiBp0VIjws7PycCmH7jUd0/Q3DR8i3yf4jr4I7y+PE
         I8uc0Qy43HLGnE4qKCQ8ZDXNhf2HrylDQvOXskJGU/GtUlcdd7vewGecInIE39HXjy/4
         tnOHeWMdg90KFiKyMDBTQV4KKKvrcuWXq37SGNCPxDmgvQiN1seJuIu2JH3Mdjrnvd4I
         Ke0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739751309; x=1740356109;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KliuYWTy5fHmrSLbuJtksd9qAx3y57Psdagf2PMtLNY=;
        b=YcoYAXjmKcEDNcfF5nD+EgMWXL6gNaE/L08oZoR7Rcc/88GgsqgcGMbATAG61O2SSb
         tGy323RhGgygTO0UP3myBII2LDuyTqQu/Y0NvYLIFAybTrezFTVOPyd7Agp17/YasBxw
         VFzYlu4KuA1AXD75iE6bFaKuUTN4ahyPpz7IqThgV/nOuehSflPnJF5099n+NgmvC6q9
         B87DI5TyyFNExN/go7GWb3D6qZ0woCwgxKz2VM0aRuTRzWcICefLQx2MmN2nYtrLWS39
         nabxIJlvPgqERjQcDnkJ98kda7RztUZPwHmdyMz0MVzhX9ymyK4GVsiceqJ36GWMBH3Y
         d8NA==
X-Forwarded-Encrypted: i=1; AJvYcCVmH/IGNBXkLEQmqfbvt3bQ5X268hmNePpXvQ1jTsreWICwS9WQ/kDdFTElFgJ6+8NIbTQZNosOj9j+wom1P7NnwXR3Og==@lists.linux.dev
X-Gm-Message-State: AOJu0YxkQMhH2i2lImXqBQhcblShZqlGcysrmueYqQoe4FfMqJq2dVl+
	Yy8lZJFerHjmgSV9h9BVR51cuCn2NqB6ut0C7W+MiVU9Nd1lPDpY
X-Gm-Gg: ASbGncuI/tAMEle86ZocCXddy/xjdGgAw/0QcfDtAwGJf55saIm4XW0Lafg4Y4mOuW4
	r3rm3WEdVhjIqZC/vYyt73IJcs04StaMzFgsbClhNDN9LPl+c5+ALk3XL2S+gC+HKevylNphA3A
	93kvi64SheaCN5u/y8nNXeqhKdKJbzBmyg+fIiCgcndk2PTUnYcF7o5x9qZEK5wjkIUll4p4S0H
	6sV+YHLQRZKhKZcmxYxLkKAJ7I3zjMIb8ACglXFLZ4i0iPcFo7oe2qwzCuVz6pMwqpgqQl41EJK
	yOw9z4rIbhiSRG0c
X-Google-Smtp-Source: AGHT+IHbQZVUG3MMQr8+UQELHnaR0LEb5NGnJI/JDwskOCdeJ1/A9SAvdthvgTeCrHkzvYOlYs/tOA==
X-Received: by 2002:a05:690c:74c2:b0:6f9:ad48:a3c7 with SMTP id 00721157ae682-6fb582bb260mr60893877b3.21.1739751309357;
        Sun, 16 Feb 2025 16:15:09 -0800 (PST)
Received: from velo.. ([152.203.197.137])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6fb3619cabcsm18413577b3.74.2025.02.16.16.15.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Feb 2025 16:15:09 -0800 (PST)
From: Andres Urian Florez <andres.emb.sys@gmail.com>
To: pablo@netfilter.org,
	kadlec@netfilter.org,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	skhan@linuxfoundation.org
Cc: Andres Urian Florez <andres.emb.sys@gmail.com>,
	netfilter-devel@vger.kernel.org,
	coreteam@netfilter.org,
	netdev@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel-mentees@lists.linux.dev
Subject: [PATCH net-next] selftest:net: fixed spelling mistakes
Date: Sun, 16 Feb 2025 19:14:50 -0500
Message-ID: <20250217001452.29578-1-andres.emb.sys@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fixed spelling errors in test_redirect6() error message and
test_port_shadowing() comments

Signed-off-by: Andres Urian Florez <andres.emb.sys@gmail.com>
---
 tools/testing/selftests/net/netfilter/nft_nat.sh | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tools/testing/selftests/net/netfilter/nft_nat.sh b/tools/testing/selftests/net/netfilter/nft_nat.sh
index 9e39de26455f..8143b877ae7d 100755
--- a/tools/testing/selftests/net/netfilter/nft_nat.sh
+++ b/tools/testing/selftests/net/netfilter/nft_nat.sh
@@ -569,7 +569,7 @@ test_redirect6()
 	ip netns exec "$ns0" sysctl net.ipv6.conf.all.forwarding=1 > /dev/null
 
 	if ! ip netns exec "$ns2" ping -q -c 1 dead:1::99 > /dev/null;then
-		echo "ERROR: cannnot ping $ns1 from $ns2 via ipv6"
+		echo "ERROR: cannot ping $ns1 from $ns2 via ipv6"
 		lret=1
 	fi
 
@@ -859,7 +859,7 @@ EOF
 	# from router:service bypass connection tracking.
 	test_port_shadow_notrack "$family"
 
-	# test nat based mitigation: fowarded packets coming from service port
+	# test nat based mitigation: forwarded packets coming from service port
 	# are masqueraded with random highport.
 	test_port_shadow_pat "$family"
 
-- 
2.43.0

