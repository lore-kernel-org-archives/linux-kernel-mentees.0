Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 489F42EA72C
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 25 Sep 2025 09:36:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758792978; cv=none; b=lnJ0VUVuj3pP4tTGSX62tZOBdI0DbONPB40ir+bWvYP84lGUM30ZxqE5YxRnJftRmFFm/NVd1/un+eqPgYQKbJ7bgtsBpeVNvhwQ1GGg9dtuAoEznvqBwKgBM7Jk8utACdFpH3/5ZuCC7/C9rDim+ptLw93q/YeFi1ZhIlZfZIo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758792978; c=relaxed/simple;
	bh=kGgcaZ5dSflruy84oMfsVc6mcKHnV9Yn/tYcBzKlk6E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GFegkd5GXgbfONI1qQm6zFSA+DrYF7IQZixamQxT3axJjNT9EZhm5gwrcKT1BA59I6GG4SdB1oc4HkJmJKMp03yzzL22UTp/OfWESaBCHL+uMtir38/0Iulv9beCUANl/Hn/jPgPQAI6h3v28V3/79IxwUAvQ85Yzy+GHJwuFOI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LWde1LOR; arc=none smtp.client-ip=140.211.166.133
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LWde1LOR"
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id ED54340BE3
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 25 Sep 2025 09:36:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level:
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3iXZcRmGmw67 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 25 Sep 2025 09:36:16 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a00:1450:4864:20::52b; helo=mail-ed1-x52b.google.com; envelope-from=mehdi.benhadjkhelifa@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org C442540BAE
Authentication-Results: smtp2.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C442540BAE
Authentication-Results: smtp2.osuosl.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=LWde1LOR
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com [IPv6:2a00:1450:4864:20::52b])
	by smtp2.osuosl.org (Postfix) with ESMTPS id C442540BAE
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 25 Sep 2025 09:36:15 +0000 (UTC)
Received: by mail-ed1-x52b.google.com with SMTP id 4fb4d7f45d1cf-63483420e3dso125971a12.2
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 25 Sep 2025 02:36:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758792974; x=1759397774; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HYrzRC+Mc8HpR/NxS7zdVfXYo8jUCkc291LCyvTTrB8=;
        b=LWde1LOR8xAoV2lF6ubVmGdmUyb2TPOveQcH60OrkhRQZ/IYHLHnpeUBWDuZ+3s17t
         8wAc3Vf3U7QQfGXlv9DEpuNt4snSbfqz1FnF4wEyWxkKZpUvcuv9Xrhek9yC+P45ZqFg
         IJcLr4iWZ+CW7Daw9iAPr2YNiLoeNUfiYPOa9GJ3Ciydk5mYIo//L3sxgSmUyg9Ilo97
         zKVemYO7wbZfQjEPt19uELd0RUsByDTZy39VunSy00lf2BT+nVj5KbfO9KK6usCKbvZh
         TniDGuV3bulACEd/v1e1WX18eP0DWoeVpj5nUmD5SntLb3O5vdKAEMkJYilqr58Z/rHR
         YwFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758792974; x=1759397774;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HYrzRC+Mc8HpR/NxS7zdVfXYo8jUCkc291LCyvTTrB8=;
        b=h+kipa6vFRnYyx8RGyG2/YbVqzN4OHfHmwj8ou91XVfS94Ket1JVNCvLr8pYPob/yM
         CtNyXZC+jMmPqT5U1XA+gjTQWgWFIjhENlbue+4xpH1V2rrUsqQrZfFvWfV9ILGNnhBr
         SBKrJi7Jr2p4puMlI8GMEcYN4elCIsTnJBslvJ/unz1g3CsLM7a9FA9DxjThWeyOKStj
         OCcy48Em4PHE9sagcHkkOALNg4xmNXvWjCA001zmcLx+WyDOjwwuHM0q4knP2BFChE2W
         n+8UCXNqt6aemOmfAz4zmA+dmCZNEje1BvuYkLn8kEQ8CS5+MafpFd8L1CBtpCQ29iOo
         88Aw==
X-Forwarded-Encrypted: i=1; AJvYcCXaFxNpOnoen8ogWWbk7qdZVKZVe62NJy7RhrFNrrVm87P8QjFUJy0gkcVYr224VBsq5/abuxJYNDj+QyYs3fcKQdSGlg==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0YwFsijmNFVSdIBKyrO5iOglaoxmRaiPZ0y/7C2/z+akqAhTPsiB
	OUVDcHmNMP8v03oBxuJTrbrIpxnB72rN5uXFtOrKc3cAHJlKI5TShsM1
X-Gm-Gg: ASbGncvxM/3KDX8PxmQNynYvKCwQ9U0WL9zF7tM9zyay1UBl2aOBbJ4QWhXO3M+bygl
	PIJVtyvxVXGpZKh+2jfe/uTrRsgwfm82YkHLN0Y3Ce+vq0sHKZT4LEzM/SaknxOh4foKjiayZjl
	p/jjyz9XV0NKZB89fr+Jysp0gUDD2hJE6MiBkI9JtvhTi65F0LF18VQf94mnogUSofSVItJCTAX
	5dYhjW8ggnnQyO9/siNlkZI7wwHIMDnxIwqPI3fQyONAcX4aDqCu57XIEtN+oIpepWGO+piIw0b
	XqGC8dE3KPFzecDTyhNkjeAKoLKfslvFgVZ8UwLQXbLRfQHMY0b2OrZu9SI4Fs3vjSnJuoPmhSf
	2HDwvIToJ9L1W4NZAkdS4Vgd7DG9CrEHFWBEZdA==
X-Google-Smtp-Source: AGHT+IEneqUbInPckHU+/2ODBYNyktvBg1Q4FEg/iNx5A55j1JRc7HsQFyzgpGys7+XvMH0c6D/9kA==
X-Received: by 2002:a50:8d89:0:b0:62c:dfae:ab96 with SMTP id 4fb4d7f45d1cf-6349fac9c10mr931863a12.7.1758792973580;
        Thu, 25 Sep 2025 02:36:13 -0700 (PDT)
Received: from bhk ([165.50.112.244])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-634a3ae321csm941225a12.24.2025.09.25.02.36.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Sep 2025 02:36:13 -0700 (PDT)
From: Mehdi Ben Hadj Khelifa <mehdi.benhadjkhelifa@gmail.com>
To: andrii@kernel.org,
	eddyz87@gmail.com,
	ast@kernel.org,
	daniel@iogearbox.net,
	martin.lau@linux.dev,
	song@kernel.org,
	yonghong.song@linux.dev,
	john.fastabend@gmail.com,
	kpsingh@kernel.org,
	sdf@fomichev.me,
	haoluo@google.com,
	jolsa@kernel.org,
	shuah@kernel.org,
	matttbe@kernel.org,
	martineau@kernel.org,
	geliang@kernel.org,
	davem@davemloft.net,
	kuba@kernel.org,
	hawk@kernel.org,
	linux@jordanrome.com,
	ameryhung@gmail.com,
	toke@redhat.com,
	houtao1@huawei.com,
	emil@etsalapatis.com,
	yatsenko@meta.com,
	isolodrai@meta.com,
	a.s.protopopov@gmail.com,
	dxu@dxuuu.xyz,
	memxor@gmail.com,
	vmalik@redhat.com,
	bigeasy@linutronix.de,
	tj@kernel.org,
	gregkh@linuxfoundation.org,
	paul@paul-moore.com,
	bboscaccy@linux.microsoft.com,
	James.Bottomley@HansenPartnership.com,
	mrpre@163.com,
	jakub@cloudflare.com
Cc: bpf@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	netdev@vger.kernel.org,
	mptcp@lists.linux.dev,
	linux-kernel-mentees@lists.linuxfoundation.org,
	skhan@linuxfoundation.org,
	david.hunter.linux@gmail.com,
	Mehdi Ben Hadj Khelifa <mehdi.benhadjkhelifa@gmail.com>
Subject: [PATCH v3 1/3] selftests/bpf: Prepare to add -Wsign-compare for bpf tests
Date: Thu, 25 Sep 2025 11:35:39 +0100
Message-ID: <20250925103559.14876-2-mehdi.benhadjkhelifa@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250925103559.14876-1-mehdi.benhadjkhelifa@gmail.com>
References: <20250925103559.14876-1-mehdi.benhadjkhelifa@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

-Change only variable types for correct sign comparisons

Signed-off-by: Mehdi Ben Hadj Khelifa <mehdi.benhadjkhelifa@gmail.com>
---
 tools/testing/selftests/bpf/progs/test_global_func11.c     | 2 +-
 tools/testing/selftests/bpf/progs/test_global_func12.c     | 2 +-
 tools/testing/selftests/bpf/progs/test_global_func13.c     | 2 +-
 tools/testing/selftests/bpf/progs/test_global_func9.c      | 2 +-
 tools/testing/selftests/bpf/progs/test_map_init.c          | 2 +-
 tools/testing/selftests/bpf/progs/test_parse_tcp_hdr_opt.c | 2 +-
 6 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/tools/testing/selftests/bpf/progs/test_global_func11.c b/tools/testing/selftests/bpf/progs/test_global_func11.c
index 283e036dc401..2ad72bf0e07b 100644
--- a/tools/testing/selftests/bpf/progs/test_global_func11.c
+++ b/tools/testing/selftests/bpf/progs/test_global_func11.c
@@ -5,7 +5,7 @@
 #include "bpf_misc.h"
 
 struct S {
-	int x;
+	__u32 x;
 };
 
 __noinline int foo(const struct S *s)
diff --git a/tools/testing/selftests/bpf/progs/test_global_func12.c b/tools/testing/selftests/bpf/progs/test_global_func12.c
index 6e03d42519a6..53eab8ec6772 100644
--- a/tools/testing/selftests/bpf/progs/test_global_func12.c
+++ b/tools/testing/selftests/bpf/progs/test_global_func12.c
@@ -5,7 +5,7 @@
 #include "bpf_misc.h"
 
 struct S {
-	int x;
+	__u32 x;
 };
 
 __noinline int foo(const struct S *s)
diff --git a/tools/testing/selftests/bpf/progs/test_global_func13.c b/tools/testing/selftests/bpf/progs/test_global_func13.c
index 02ea80da75b5..c4afdfc9d92e 100644
--- a/tools/testing/selftests/bpf/progs/test_global_func13.c
+++ b/tools/testing/selftests/bpf/progs/test_global_func13.c
@@ -5,7 +5,7 @@
 #include "bpf_misc.h"
 
 struct S {
-	int x;
+	__u32 x;
 };
 
 __noinline int foo(const struct S *s)
diff --git a/tools/testing/selftests/bpf/progs/test_global_func9.c b/tools/testing/selftests/bpf/progs/test_global_func9.c
index 1f2cb0159b8d..9138d9bd08fc 100644
--- a/tools/testing/selftests/bpf/progs/test_global_func9.c
+++ b/tools/testing/selftests/bpf/progs/test_global_func9.c
@@ -5,7 +5,7 @@
 #include "bpf_misc.h"
 
 struct S {
-	int x;
+	__u32 x;
 };
 
 struct C {
diff --git a/tools/testing/selftests/bpf/progs/test_map_init.c b/tools/testing/selftests/bpf/progs/test_map_init.c
index c89d28ead673..311e6ac64588 100644
--- a/tools/testing/selftests/bpf/progs/test_map_init.c
+++ b/tools/testing/selftests/bpf/progs/test_map_init.c
@@ -22,7 +22,7 @@ int sysenter_getpgid(const void *ctx)
 	/* Just do it for once, when called from our own test prog. This
 	 * ensures the map value is only updated for a single CPU.
 	 */
-	int cur_pid = bpf_get_current_pid_tgid() >> 32;
+	__u32 cur_pid = bpf_get_current_pid_tgid() >> 32;
 
 	if (cur_pid == inPid)
 		bpf_map_update_elem(&hashmap1, &inKey, &inValue, BPF_NOEXIST);
diff --git a/tools/testing/selftests/bpf/progs/test_parse_tcp_hdr_opt.c b/tools/testing/selftests/bpf/progs/test_parse_tcp_hdr_opt.c
index d9b2ba7ac340..4b8ab8716246 100644
--- a/tools/testing/selftests/bpf/progs/test_parse_tcp_hdr_opt.c
+++ b/tools/testing/selftests/bpf/progs/test_parse_tcp_hdr_opt.c
@@ -102,7 +102,7 @@ int xdp_ingress_v6(struct xdp_md *xdp)
 	opt_state.byte_offset = sizeof(struct tcphdr) + tcp_offset;
 
 	/* max number of bytes of options in tcp header is 40 bytes */
-	for (int i = 0; i < tcp_hdr_opt_max_opt_checks; i++) {
+	for (__u32 i = 0; i < tcp_hdr_opt_max_opt_checks; i++) {
 		err = parse_hdr_opt(xdp, &opt_state);
 
 		if (err || !opt_state.hdr_bytes_remaining)
-- 
2.51.0

