Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40A9BC2BB41
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 16 Aug 2022 10:36:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B081060EA7;
	Tue, 16 Aug 2022 10:36:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B081060EA7
Authentication-Results: smtp3.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=i6P3O5ie
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mna_DZxBivKC; Tue, 16 Aug 2022 10:36:33 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 8B24A60E8A;
	Tue, 16 Aug 2022 10:36:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8B24A60E8A
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 60B33C0033;
	Tue, 16 Aug 2022 10:36:33 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 5E15CC002D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 16 Aug 2022 10:36:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2F8054088D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 16 Aug 2022 10:36:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2F8054088D
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=i6P3O5ie
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1rvytmnI3VNL
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 16 Aug 2022 10:36:31 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0D2D2404A5
Received: from mail-pg1-x52b.google.com (mail-pg1-x52b.google.com
 [IPv6:2607:f8b0:4864:20::52b])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0D2D2404A5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 16 Aug 2022 10:36:30 +0000 (UTC)
Received: by mail-pg1-x52b.google.com with SMTP id c24so8862723pgg.11
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 16 Aug 2022 03:36:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=5A5RtN/YS/4w7sXimiNz+39ndA1ngcqHQiad4s8fg4Q=;
 b=i6P3O5ievivOXk5mzbsJWm6wlAnJEdrEfilGpTvRGnyai46rxm0+Jxp11BbZf4IsKj
 qO97j0j41kC2x7RN6OHQ5vKhu3lUys1t4Y/+GkEuD9xgT/9qOQNr3CRdg6oE1xXIBPeJ
 ynhUqnRAtvl35XghDcmpU28lgm0ECn2J1dvMqcf3vlfFFhlWg1IRbPXGhMBWZoKhsFwa
 xQFqWuBeH0sO4xR/fjRkJWxPidM8yOpSI+msEzo9XfCYVIqj4/B4g4B0FcEESZHhcxV0
 /jObHO/tfzPys3En7Dz6pDXNkWxwZgmanen3mAEOEL3lgL110Iz6twsy/infxn/w03bi
 DfOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=5A5RtN/YS/4w7sXimiNz+39ndA1ngcqHQiad4s8fg4Q=;
 b=ROCEFv8OQKEK0YxL+LnJYa7qKUQPs6+aq0ijwSG47Q3GTjsP7RPQC+JsEbDNrBHWxO
 2Ob5+sgVL/scPW03uTjHE6wYZ6+hgsUWCACkhXjlJol5KLgCrxMP5oGuQ5sKAJwJneQW
 NACAt0MaiT7cCzqiYm4xH8dCcIUqzvgxcjAFTgLLgaxnqVepYsJI4N5nvIv/FaQz0hcr
 VrGDKfMTQAcOIiCsNHj2fDaKfVqjubOl5rkzs/44xgTqZ7sNAsaydoVEWbcBJMHQWRNU
 0N8khmgazQBYN2Cz8cuFPLI7j+8aPgkPx4t8kX9oOVL+XLoe6i6INHjNUKlmkpc//fcQ
 QZyw==
X-Gm-Message-State: ACgBeo2qrWQ5Ffo3hAk4WLXdPZ4DByyGuNTOp2joGBmGn6JSTeg2Meio
 zawjStCN3FBh7I9TnKFBJoE=
X-Google-Smtp-Source: AA6agR7VYoPwJ0fUKY7DGeSKdzzsM77Cgyq30uiP5ZbMuykBi4NKULWYUxSi8YlueLMCiucRw4dhxA==
X-Received: by 2002:a63:5620:0:b0:429:9ad7:b4f2 with SMTP id
 k32-20020a635620000000b004299ad7b4f2mr3326930pgb.162.1660646190469; 
 Tue, 16 Aug 2022 03:36:30 -0700 (PDT)
Received: from localhost ([36.112.86.8]) by smtp.gmail.com with ESMTPSA id
 a8-20020a170902ecc800b0016efbccf2c0sm8771705plh.56.2022.08.16.03.36.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Aug 2022 03:36:30 -0700 (PDT)
From: Hawkins Jiawei <yin31149@gmail.com>
To: dhowells@redhat.com, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Alexei Starovoitov <ast@kernel.org>,
 Daniel Borkmann <daniel@iogearbox.net>,
 Andrii Nakryiko <andrii@kernel.org>, Martin KaFai Lau <kafai@fb.com>,
 Song Liu <songliubraving@fb.com>, Yonghong Song <yhs@fb.com>,
 John Fastabend <john.fastabend@gmail.com>, KP Singh <kpsingh@kernel.org>
Subject: Re: [PATCH] net: Fix suspicious RCU usage in bpf_sk_reuseport_detach()
Date: Tue, 16 Aug 2022 18:34:52 +0800
Message-Id: <20220816103452.479281-1-yin31149@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <166064248071.3502205.10036394558814861778.stgit@warthog.procyon.org.uk>
References: <166064248071.3502205.10036394558814861778.stgit@warthog.procyon.org.uk>
MIME-Version: 1.0
Cc: netdev@vger.kernel.org, bpf@vger.kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org, linux-kernel@vger.kernel.org,
 yin31149@gmail.com
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

On Tue, 16 Aug 2022 at 17:34, David Howells <dhowells@redhat.com> wrote:
>
> Fix this by adding a new helper, __locked_read_sk_user_data_with_flags()
> that checks to see if sk->sk_callback_lock() is held and use that here
> instead.
Hi, I wonder if we make this more geniric, for I think maybe the future
code who use __rcu_dereference_sk_user_data_with_flags() may
also meet this bug.

To be more specific, maybe we can refactor
__rcu_dereference_sk_user_data_with_flags() to
__rcu_dereference_sk_user_data_with_flags_check(), like
rcu_dereference() and rcu_dereference_check(). Maybe:

diff --git a/include/net/sock.h b/include/net/sock.h
index 05a1bbdf5805..cf123954eab9 100644
--- a/include/net/sock.h
+++ b/include/net/sock.h
@@ -578,18 +578,27 @@ static inline bool sk_user_data_is_nocopy(const struct sock *sk)
 #define __sk_user_data(sk) ((*((void __rcu **)&(sk)->sk_user_data)))
 
 /**
- * __rcu_dereference_sk_user_data_with_flags - return the pointer
- * only if argument flags all has been set in sk_user_data. Otherwise
- * return NULL
+ * __rcu_dereference_sk_user_data_with_flags_check - return the pointer
+ * only if argument flags all has been set in sk_user_data, with debug
+ * checking. Otherwise return NULL
  *
- * @sk: socket
- * @flags: flag bits
+ * Do __rcu_dereference_sk_user_data_with_flags(), but check that the
+ * conditions under which the rcu dereference will take place are correct,
+ * which is a bit like rcu_dereference_check() and rcu_derefence().
+ *
+ * @sk		: socket
+ * @flags	: flag bits
+ * @condition	: the conditions under which the rcu dereference will
+ * take place
  */
 static inline void *
-__rcu_dereference_sk_user_data_with_flags(const struct sock *sk,
-					  uintptr_t flags)
+__rcu_dereference_sk_user_data_with_flags_check(const struct sock *sk,
+						uintptr_t flags, bool condition)
 {
-	uintptr_t sk_user_data = (uintptr_t)rcu_dereference(__sk_user_data(sk));
+	uintptr_t sk_user_data;
+
+	sk_user_data = (uintptr_t)rcu_dereference_check(__sk_user_data(sk),
+							condition);
 
 	WARN_ON_ONCE(flags & SK_USER_DATA_PTRMASK);
 
@@ -598,6 +607,8 @@ __rcu_dereference_sk_user_data_with_flags(const struct sock *sk,
 	return NULL;
 }
 
+#define __rcu_dereference_sk_user_data_with_flags(sk, flags) \
+	__rcu_dereference_sk_user_data_with_flags_check(sk, flags, 0)
 #define rcu_dereference_sk_user_data(sk)				\
 	__rcu_dereference_sk_user_data_with_flags(sk, 0)
 #define __rcu_assign_sk_user_data_with_flags(sk, ptr, flags)		\

> +/**
> + * __locked_read_sk_user_data_with_flags - return the pointer
> + * only if argument flags all has been set in sk_user_data. Otherwise
> + * return NULL
> + *
> +               (uintptr_t)rcu_dereference_check(__sk_user_data(sk),
> +                                                lockdep_is_held(&sk->sk_callback_lock));

> diff --git a/kernel/bpf/reuseport_array.c b/kernel/bpf/reuseport_array.c
> index 85fa9dbfa8bf..82c61612f382 100644
> --- a/kernel/bpf/reuseport_array.c
> +++ b/kernel/bpf/reuseport_array.c
> @@ -24,7 +24,7 @@ void bpf_sk_reuseport_detach(struct sock *sk)
>         struct sock __rcu **socks;
> 
>         write_lock_bh(&sk->sk_callback_lock);
> -       socks = __rcu_dereference_sk_user_data_with_flags(sk, SK_USER_DATA_BPF);
> +       socks = __locked_read_sk_user_data_with_flags(sk, SK_USER_DATA_BPF);
>         if (socks) {
>                 WRITE_ONCE(sk->sk_user_data, NULL);
>                 /*
Then, as you point out, we can pass
condition(lockdep_is_held(&sk->sk_callback_lock)) to
__rcu_dereference_sk_user_data_with_flags_check() in order to
make compiler happy as below:

diff --git a/kernel/bpf/reuseport_array.c b/kernel/bpf/reuseport_array.c
index 85fa9dbfa8bf..a772610987c5 100644
--- a/kernel/bpf/reuseport_array.c
+++ b/kernel/bpf/reuseport_array.c
@@ -24,7 +24,10 @@ void bpf_sk_reuseport_detach(struct sock *sk)
 	struct sock __rcu **socks;
 
 	write_lock_bh(&sk->sk_callback_lock);
-	socks = __rcu_dereference_sk_user_data_with_flags(sk, SK_USER_DATA_BPF);
+	socks = __rcu_dereference_sk_user_data_with_flags_check(
+			sk, SK_USER_DATA_BPF,
+			lockdep_is_held(&sk->sk_callback_lock));
+
 	if (socks) {
 		WRITE_ONCE(sk->sk_user_data, NULL);
 		/*
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
