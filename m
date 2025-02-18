Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAB567E1
	for <linux-kernel-mentees@lists.linux.dev>; Tue, 18 Feb 2025 07:29:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739863742; cv=none; b=uwiV35j4VuYAX0My754lwApFfVXC0MCHXHAn7Gtk8Jc+jcEJYXCbAgHGb/Quglw+pPqvi0hnhkAdLPiYgMP74EDKRnGFofa0kiPA+agEzzJV3Tp15AQuUT4HS5rWH6v9hfVSOw573dqwYE00viMIjzs01oJwBLbMk1/Cxn1NKe8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739863742; c=relaxed/simple;
	bh=QJ42PfnIyZtd/E4FCdA7rGKy2tClUkTb5RVyCcC+XPI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Jbjkyr8DfCfWMcHevkneUpEHnrvnKxTdWp/qIg8bAYhKleGv91gGvqlg9i2a4+kyGUCE4k6u1pVbhBwt4Lf8m0DhOPZJhJora3kLvlirmWjmyX3TXokBEZNXgumVWyM+jboAD1J95NW2qi4eeCxeznYA6mKsZUlBvtGLxWAbCO4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=POW2U2lc; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="POW2U2lc"
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-2fc29ac55b5so949998a91.2
        for <linux-kernel-mentees@lists.linux.dev>; Mon, 17 Feb 2025 23:29:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739863740; x=1740468540; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=VF217HMsP0EaV73/D5yPINv1JqTHlL6uJbUiEmkq1c8=;
        b=POW2U2lcvivB4u1erOV5KKZ4d3SdD29Us385Qg8//ktdzGQ/bDL4qr3cGfvaZkhrYd
         cc1ELQBbduZRmU92ZhS15rY/frYgOIpi3sY9zITnV3uJmZLnY5pNMHH8WLU8Kdpqzlhr
         8tmo+cOGlmEkSPUMifizjWwodMMkCoSz3VXLPgwcO10JTtQf41iioT9kPfpTJiiA44dR
         MXv6CUhrGHTrFqJcusxi5i9IwgQfdfTEoUf0TdBuncjfAkwk/QCAT/akmG7GmIneufVy
         LuZHD1ccW4CA8gVZ9fzit0fDIxmJ0HQ8vXuCZqt1h2e8lFAOnSheFNoqlBpj/+zLa+5A
         jQSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739863740; x=1740468540;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VF217HMsP0EaV73/D5yPINv1JqTHlL6uJbUiEmkq1c8=;
        b=ElsysntJmDYpk3LmkatH5t9XFrCrgR077zQwavGt0IH8TgqsM+9/1kXbiI9G42SrSA
         hEi9dhsEqJ1iJPS4iFNt3xxpE7qA68f7ikOuCsnhsFAN98QHxTcyVeCo4zXAWk2Hsr5U
         n4WVzueU0cqKOFybMVmwxym1ksIISizBjvFmMBCadmDAkhEfS5ipRZlUW8tWUhByaFZj
         drP30d+6JrT+K6IzoxHMUHGPeYOLS90ecGxxBJ/9s9E0nDmsUfsFblFAHPEQeSY+NWuj
         Oi1ZjJTci9Kypt7+H0K8OV0o8DbySgpBPov8s6FybmnB/bTj0QtwHX3xYJaXiDIzPiyG
         pHxg==
X-Gm-Message-State: AOJu0YwG5NcKhjMbjPmaxAUYKIjId6Dc2H6uP49I//R/u1TOiHogGV2z
	7eeYWi+LOEHdyhek1v/YIsT+KMcHpU9zG7iForlXm7T5X3KbIqef
X-Gm-Gg: ASbGncuJgDArm+8j2+3JprnPXASqRIwMhfJ6RrTRTNjBsvXMItK9mWAiHsLDvcClQ44
	/3ytK/nxV0XqeyuwlNOS0EKjdyGXhUaLSnft7RHdtrhHs+Q6tXL9szy9l6StbTvV3EZKfppQ81V
	UIXjx+ve2uR46KJ2jrjyLLhSiTlm/cy3NumXAx8qmJ9FKxfxv1XKkeoZhCix47G1rftH7Yfm/Zj
	mlOBF9xhMbqW/toCsfIS3owcTVjFrVTowNRKrL9PNSmO7fSlj8jeWRQHaDkvy37KDQsjFrIp1Ba
	M5k+kazdopu+upiHyk0PK0zdVOLX9bPySfjE7+hzHJ79RE+5tUNSgaHOtAClznuZ/dlUOGR8eFo
	WTijRTo7HxjJM+xh/bs3Z
X-Google-Smtp-Source: AGHT+IFDPTSiuSRBwX/10B3wCvyL4ya12C79bWE/+p33UPDhSYDzD15/MXkfjbptZZQSfrx6GyfveA==
X-Received: by 2002:a17:90b:4c07:b0:2ee:948b:72d3 with SMTP id 98e67ed59e1d1-2fc40d124bbmr7731156a91.1.1739863739919;
        Mon, 17 Feb 2025 23:28:59 -0800 (PST)
Received: from codespaces-977d69.2t4prynt4dlezbzls5ze3dxsqg.rx.internal.cloudapp.net ([13.71.3.101])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2fc13ad2d00sm9323486a91.21.2025.02.17.23.28.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Feb 2025 23:28:58 -0800 (PST)
From: Marvin Murithi <murithimarvin09@gmail.com>
To: skhan@linuxfoundation.org
Cc: linux-kernel-mentees@lists.linux.dev,
	Marvin Murithi <50557936+rimubytes@users.noreply.github.com>
Subject: [PATCH] selftests: Fix spelling mistake in documentation
Date: Tue, 18 Feb 2025 07:28:49 +0000
Message-ID: <20250218072849.23752-1-murithimarvin09@gmail.com>
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

