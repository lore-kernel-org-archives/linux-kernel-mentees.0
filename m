Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C7962D8782
	for <linux-kernel-mentees@lists.linux.dev>; Wed, 20 Aug 2025 15:44:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755704645; cv=none; b=CZExUKowmFiQCTKq6flf8NdbKxuY5kcXwn1kL+dxANA4ts24R0kKHvW4gC3FAN9JEc4Gkc0ORmn0AV9NarFxlT+C/kNxLhci7WsoiIrAoOV7EhtQpYQIUuYxzncSEh5Iw/WuXYwyWdrkmZPdqIftoZJWy2I103C0l63tGEA0AVc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755704645; c=relaxed/simple;
	bh=ksVrbv0ANSstCuaUNpZ6lY5WdHlGllFDmru27C7xkrE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=PZV9UFm0noDfm+mfa+Si27mWiG/eTGtatRvNN/RM+qEhoWVVHlwsht/ia4QQmtvi5BUuItnVJvrbosZVV3tZx3GkXkAKqbtccTfiydY4/ESJBEz+zVDGJmiL/yqFZPC0nS+Ft8FPePfRfSZR/DTrbmt1uAFI/nRznuraXoUpcwE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Nx3xQTj2; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Nx3xQTj2"
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-32326bd4f4dso28830a91.1
        for <linux-kernel-mentees@lists.linux.dev>; Wed, 20 Aug 2025 08:44:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755704643; x=1756309443; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=bKzYlK8zQ8ggkStKH3hXym6+TYxzBzWA/D1b6WG96R0=;
        b=Nx3xQTj2/xTPO30ESMd4RLmpFFsZeeEUYYoyf8MJsa6hlnm0RvoS/THJ6cOx//hXgv
         yRTSOVeAkzm6FleqvSCh2UA2t+0/O0DtKn/HoV5OBDqrjJvaZXADk0hicTFEnb3mjLwT
         PUCKYC4qFFldmkRZpLZia9zEu4JTBtyu5T0jI9RvIoxuZDfwEpaJMs0sv+CgkCjpmcDD
         8uXHgkd9N8mtpAQmBPnJJkVtmpy7waErkuNMkR0POVMX7AfAyfGEgVrQ9/66j4ieXZw0
         6LldJuYuJUhoGpQy2RYipMwmGQtRCchANeGoDJycyF67YmkDE6eG4C4BaX8FmGvKONDE
         c8XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755704643; x=1756309443;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bKzYlK8zQ8ggkStKH3hXym6+TYxzBzWA/D1b6WG96R0=;
        b=LLZ4uXP3eqxhx5jAhb5yd2Klt1f44SV5MDL44+aoMrXUGn3n4AUYk8XdLwd2K6a2EF
         EGbcFEYIp9Ey/mnr3pz47yo0v1bIPZYbgLqAVqqozuW/C4YB1mT+56B+gxRqgB8bU64A
         L/K9JQ3Il7ttx21R0JL7Yz8jaQT93+spXdWeqQMce5wj5tT1+fDKLCSLEq5ggQ+O6Xan
         7nymJ9Tp9CWSvWpJW3Zs874HeZL+OUJ2SxeEa7EnXG/H43Ey0GX2Q2rQ3W6qogs9ybVZ
         53P7GcrNXOWGKHDi24M68m/AJG6PkOAHBbCVUl5K/Fb3ZO0pb306wJSzExC3OQJEcDss
         R2/w==
X-Gm-Message-State: AOJu0YxEmyNbWYJw1kdW/kdHwnDbd13hjtk4/anjnXEugQS2u3Yp7V2L
	BW9WeXelgC+B6YDJBsPfjqZh8OMrcDcX3wLOlgR9O1saqFJsJzVkkK8BL4mFOxhpY9k=
X-Gm-Gg: ASbGnct1xUbTCFzPWYi+BtlfKoPIKOdMQJWhlfzFMxDg4flnQ6aGE+VC4UdQwMxqY6J
	Zai3NR2mgcl3ydHB5XmXEu897je2CHGQt/XI3919SJ2WxwBOFe+x9DvpRPETWZlzj10xj592Euc
	eyGTEfur0+IfuOdPjPaueUh9KSa7rV4saKSP1pebdNkLWBh2z1iKXDy+yca+c02N2zt3S6oouDw
	Iw+pY46Nc0O4U78zVBkWm372eXhByuEJSmqzjxp7Vp0R5g7kXY0m7DFEmsqRJkub1y+/tW4xqW9
	jyWdMqMZRZrGEXhvuuu0X6FNoiRsdFquKJU6ESgoVdeN4aSRKrAuchzDHtnHPWB0QzfZ0QCo1tq
	iUw9Pdd8TovOC6GkrWw1Zfjeu9pBviW50vgmGPpWw/OoMvvUS8A==
X-Google-Smtp-Source: AGHT+IEoK3LgcqM2J5L6HXT4MC6WDaOmGnQgjZAHypS37Lz0UAIZ1bbDVcpUZ0pnm0v2X4bZSb9tAw==
X-Received: by 2002:a17:90b:4c11:b0:30a:3e8e:ea30 with SMTP id 98e67ed59e1d1-324eb9de67dmr39919a91.11.1755704642819;
        Wed, 20 Aug 2025 08:44:02 -0700 (PDT)
Received: from localhost.localdomain ([202.164.136.133])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-324e254ca61sm2719944a91.15.2025.08.20.08.43.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Aug 2025 08:44:02 -0700 (PDT)
Received: (nullmailer pid 70722 invoked by uid 1000);
	Wed, 20 Aug 2025 15:42:37 -0000
From: Kathara Sasikumar <katharasasikumar007@gmail.com>
To: skhan@linuxfoundation.org, linux-kselftest@vger.kernel.org
Cc: linux-kernel-mentees@lists.linux.dev, linux-kernel@vger.kernel.org, katharasasikumar007@gmail.com
Subject: [PATCH] selftests/netfilter: fix typo in comment
Date: Wed, 20 Aug 2025 15:41:10 +0000
Message-ID: <20250820154109.70598-2-katharasasikumar007@gmail.com>
X-Mailer: git-send-email 2.47.2
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Correct spelling of address in conntrack_icmp_related.sh comment. This
patch fixes a minor typo in the selftest script for netfilter.

Signed-off-by: Kathara Sasikumar <katharasasikumar007@gmail.com>
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
2.47.2

