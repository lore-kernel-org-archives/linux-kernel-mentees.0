Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D84F0C00140
	for <linux-kernel-mentees@archiver.kernel.org>; Fri,  5 Aug 2022 07:49:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 629D36F935;
	Fri,  5 Aug 2022 07:49:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 629D36F935
Authentication-Results: smtp3.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=Ab4hS9bB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NmGjpyVbQ73B; Fri,  5 Aug 2022 07:49:16 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 6C59060D79;
	Fri,  5 Aug 2022 07:49:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6C59060D79
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 595F5C0033;
	Fri,  5 Aug 2022 07:49:16 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 543E2C002D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  5 Aug 2022 07:49:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 21C138290B
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  5 Aug 2022 07:49:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 21C138290B
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=Ab4hS9bB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GPwDJ3lRcI6r
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  5 Aug 2022 07:49:14 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 803FA82897
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com
 [IPv6:2607:f8b0:4864:20::1030])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 803FA82897
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  5 Aug 2022 07:49:14 +0000 (UTC)
Received: by mail-pj1-x1030.google.com with SMTP id
 15-20020a17090a098f00b001f305b453feso7548420pjo.1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 05 Aug 2022 00:49:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=E/vJaeCBGviaQ0hvzD8949Y30FhDcD4GWRiGcNZUjZ4=;
 b=Ab4hS9bBEcHP2rHNZUseHVF0Kw0e80Tj0eXSPOSDMaSQ3heN0Lqrkw4M52EpZyd3sz
 H9AEvm+73fn4pFMKyNCe0D7m7XhYsjeLiVYlvI+r0WhTQ/DUsXNg61ByHct2DBLbc9oc
 ewCUbcq9frRNV20oyoqTu8u41JDh+umV94wF+N9+9UEkxR/nGoJPM4G1EGXLoFWR860r
 fIPFpLycsY8kqzkAHDiyitnIQI/hitho4s7dx4+1EH+2TNpZUjB/R83HhmaLT+MgLuI6
 KHiq3EkjwE6QWABljF2bgdlGIj2IKOOOQcyAcsuQjR5rgW3YcnHOymJLiCN94q/lqtx4
 +CBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=E/vJaeCBGviaQ0hvzD8949Y30FhDcD4GWRiGcNZUjZ4=;
 b=0oHc7Q/4O8tPJYWwfPA7e8ZtoPzkrITI456z6MwwBjsWuhqxMabhSdUIjghmfmmg6M
 tlYauHTI9/7GFSzSodSfqjk7knt9Gc799+izGAo3VRVPpLvXnRia2b3n5UWtQtTPv6hK
 aT/PAJe+axdXdxyKuE5Y0ixelxm1IMbTGwP8bWnTdYz1Rw4a3WUQzlqqLpRx8KMkIbGK
 Ey+KspgJR7BZcrUsir3Iqkq+ezYxuKkLSES7/hwX9dTAWO7PYurhMAoIYoVenMEM3VxN
 fM9ZSmzv5/POsKz4y4Lcrrmf4J5tArr/OIAzcRVaPfP+G7YcCDlBG1QyyMybj4Drv7bo
 3Qzw==
X-Gm-Message-State: ACgBeo26m9lIA5W5g9r1nziwOC9De1hKoBLriLBEYvrROe6mtIiNHXlu
 aUi5QKPqEpqmxDndVoWJ3ag=
X-Google-Smtp-Source: AA6agR4RWYHTlCj4Uz5Gvo8snJllIK29/g1mtcBOELrWgSN3MOHqMmX6fls8W5al8Nbc/MsRyKi2yA==
X-Received: by 2002:a17:90a:e2cc:b0:1f3:1151:e0ff with SMTP id
 fr12-20020a17090ae2cc00b001f31151e0ffmr6512965pjb.50.1659685753937; 
 Fri, 05 Aug 2022 00:49:13 -0700 (PDT)
Received: from localhost ([117.136.0.155]) by smtp.gmail.com with ESMTPSA id
 z66-20020a626545000000b0052d3a442760sm2218418pfb.161.2022.08.05.00.49.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Aug 2022 00:49:13 -0700 (PDT)
From: Hawkins Jiawei <yin31149@gmail.com>
To: syzbot+5f26f85569bd179c18ce@syzkaller.appspotmail.com,
 Alexei Starovoitov <ast@kernel.org>,
 Daniel Borkmann <daniel@iogearbox.net>,
 Andrii Nakryiko <andrii@kernel.org>,
 Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>,
 Yonghong Song <yhs@fb.com>, John Fastabend <john.fastabend@gmail.com>,
 KP Singh <kpsingh@kernel.org>, Stanislav Fomichev <sdf@google.com>,
 Hao Luo <haoluo@google.com>, Jiri Olsa <jolsa@kernel.org>
Subject: [PATCH net v5 2/2] net: refactor bpf_sk_reuseport_detach()
Date: Fri,  5 Aug 2022 15:48:36 +0800
Message-Id: <68ea55d47f10ac8faa0d44e184a5ec00a9dd0409.1659676823.git.yin31149@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1659676823.git.yin31149@gmail.com>
References: <cover.1659676823.git.yin31149@gmail.com>
MIME-Version: 1.0
Cc: paskripkin@gmail.com, linux-kernel@vger.kernel.org,
 Hawkins Jiawei <yin31149@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 bpf@vger.kernel.org, linux-kernel-mentees@lists.linuxfoundation.org
X-BeenThere: linux-kernel-mentees@lists.linuxfoundation.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: <linux-kernel-mentees.lists.linuxfoundation.org>
List-Unsubscribe: <https://lists.linuxfoundation.org/mailman/options/linux-kernel-mentees>, 
 <mailto:linux-kernel-mentees-request@lists.linuxfoundation.org?subject=unsubscribe>
List-Archive: <http://lists.linuxfoundation.org/pipermail/linux-kernel-mentees/>
List-Post: <mailto:linux-kernel-mentees@lists.linuxfoundation.org>
List-Help: <mailto:linux-kernel-mentees-request@lists.linuxfoundation.org?subject=help>
List-Subscribe: <https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees>, 
 <mailto:linux-kernel-mentees-request@lists.linuxfoundation.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

Refactor sk_user_data dereference using more generic function
__rcu_dereference_sk_user_data_with_flags(), which improve its
maintainability

Suggested-by: Jakub Kicinski <kuba@kernel.org>
Signed-off-by: Hawkins Jiawei <yin31149@gmail.com>
---
 kernel/bpf/reuseport_array.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/kernel/bpf/reuseport_array.c b/kernel/bpf/reuseport_array.c
index e2618fb5870e..85fa9dbfa8bf 100644
--- a/kernel/bpf/reuseport_array.c
+++ b/kernel/bpf/reuseport_array.c
@@ -21,14 +21,11 @@ static struct reuseport_array *reuseport_array(struct bpf_map *map)
 /* The caller must hold the reuseport_lock */
 void bpf_sk_reuseport_detach(struct sock *sk)
 {
-	uintptr_t sk_user_data;
+	struct sock __rcu **socks;
 
 	write_lock_bh(&sk->sk_callback_lock);
-	sk_user_data = (uintptr_t)sk->sk_user_data;
-	if (sk_user_data & SK_USER_DATA_BPF) {
-		struct sock __rcu **socks;
-
-		socks = (void *)(sk_user_data & SK_USER_DATA_PTRMASK);
+	socks = __rcu_dereference_sk_user_data_with_flags(sk, SK_USER_DATA_BPF);
+	if (socks) {
 		WRITE_ONCE(sk->sk_user_data, NULL);
 		/*
 		 * Do not move this NULL assignment outside of
-- 
2.25.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
