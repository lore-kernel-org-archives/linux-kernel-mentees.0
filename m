Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE34AC43334
	for <linux-kernel-mentees@archiver.kernel.org>; Sat,  9 Jul 2022 02:47:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2936560675;
	Sat,  9 Jul 2022 02:47:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2936560675
Authentication-Results: smtp3.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=JykCDruT
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VokBuoSw-Il7; Sat,  9 Jul 2022 02:47:20 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp3.osuosl.org (Postfix) with ESMTPS id C70C2606EC;
	Sat,  9 Jul 2022 02:47:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C70C2606EC
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 9380AC0033;
	Sat,  9 Jul 2022 02:47:19 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id DE933C002D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat,  9 Jul 2022 02:47:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 11A54400F3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat,  9 Jul 2022 02:47:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 11A54400F3
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=JykCDruT
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Bh_ZLU6lJy4M
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat,  9 Jul 2022 02:47:17 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3CE2F400F1
Received: from mail-oa1-x33.google.com (mail-oa1-x33.google.com
 [IPv6:2001:4860:4864:20::33])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 3CE2F400F1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat,  9 Jul 2022 02:47:17 +0000 (UTC)
Received: by mail-oa1-x33.google.com with SMTP id
 586e51a60fabf-10bf634bc50so875306fac.3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 08 Jul 2022 19:47:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=6BGKZlQ2XgPXargm2Wo7BrmlFidyoAhj3y0XxGiXJm0=;
 b=JykCDruTogaWu6LLxNnu8Hd8UnhoJw4HRRvDIpLjJ3ArGe9cb7eNVrYGXxOlZhf9HH
 pNklBJZxZ9Gy29spJTJqCHrIDxvRTBr1RSvwrqhV9UE9qvzQsf6Z4GN885ZZHNiRFmmA
 fqLPZ4oaPvYSZINiq45OiSReXqi+isfQ/BkcqEqqNnRaFEqMj/H2x5c/dnWhmUS9UCjr
 XxUmLujFcDkNylO/H6/dwgjdP2R3DweSb3MShtbRT6m4DfROYxmJy0w9YxTlnic5PNKc
 C8UNMkn6QSIyAaxy9mHISrYyUojjBYxmmPBqNeMbgBpD/+Bbux/0oH011IRwfZae8dPq
 J04Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=6BGKZlQ2XgPXargm2Wo7BrmlFidyoAhj3y0XxGiXJm0=;
 b=v3+otZlsLhh1wTHLHy8rnnIzqmgqcSogjWzApVMbraJV6BS7HNPOq5qvrG5JxHMxrr
 +Xw5G7I8Vq9jAHbCb8pDFqm3hogL6wUXodSZ+Z9NfJ4RjLXnnCABUCb8QlKVtlNG1fib
 oIK5W1aCfYb+/tYd9vfHSfAqToFxy4QRhVHH2BRMiOwNi4jB2RMuiSRXsL9rKoij8SPb
 V3PLdz44xZ0xCxzbUpp4iBHNPcAaosQa6o9honj9eOl6mtXDdiuBoHSNKxTZM+IP6byb
 PdSgkVDtsxumUy8vXdNKXGw759upqWcNMXth/tlyharC9Baz2BC3g5SkRCLWBsnAtInP
 o3ig==
X-Gm-Message-State: AJIora9b0bFZ3r75/zbf1rlL5HcjaiDqhhrWygriZ52uvXh8f7nmuNIa
 nmHlk2RSEoj/ZTBWV1zwga4=
X-Google-Smtp-Source: AGRyM1vEOmXQ0e6DzN+O8R9g1l8g+u86gRu6KOjY6pNieru/kNk84RuiD7FmFu2uEYfiHCgH1y6KvA==
X-Received: by 2002:a05:6870:c0ce:b0:10c:4d83:8e15 with SMTP id
 e14-20020a056870c0ce00b0010c4d838e15mr1624440oad.137.1657334836236; 
 Fri, 08 Jul 2022 19:47:16 -0700 (PDT)
Received: from ubuntu.lan ([136.175.179.221]) by smtp.gmail.com with ESMTPSA id
 u65-20020acaab44000000b0032eb81e352asm274880oie.38.2022.07.08.19.47.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Jul 2022 19:47:15 -0700 (PDT)
From: Hawkins Jiawei <yin31149@gmail.com>
To: syzbot+5f26f85569bd179c18ce@syzkaller.appspotmail.com
Subject: [PATCH] smc: fix refcount bug in sk_psock_get (2)
Date: Sat,  9 Jul 2022 10:46:59 +0800
Message-Id: <20220709024659.6671-1-yin31149@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <00000000000026328205e08cdbeb@google.com>
References: <00000000000026328205e08cdbeb@google.com>
MIME-Version: 1.0
Cc: songliubraving@fb.com, ast@kernel.org, edumazet@google.com,
 daniel@iogearbox.net, davem@davemloft.net, borisp@nvidia.com,
 paskripkin@gmail.com, john.fastabend@gmail.com, andrii@kernel.org, yhs@fb.com,
 pabeni@redhat.com, linux-kernel-mentees@lists.linuxfoundation.org,
 syzkaller-bugs@googlegroups.com, kpsingh@kernel.org, kuba@kernel.org,
 yoshfuji@linux-ipv6.org, netdev@vger.kernel.org, dsahern@kernel.org,
 linux-kernel@vger.kernel.org, kgraul@linux.ibm.com, guwen@linux.alibaba.com,
 bpf@vger.kernel.org, kafai@fb.com
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

From: hawk <18801353760@163.com>

Syzkaller reportes refcount bug as follows:
------------[ cut here ]------------
refcount_t: saturated; leaking memory.
WARNING: CPU: 1 PID: 3605 at lib/refcount.c:19 refcount_warn_saturate+0xf4/0x1e0 lib/refcount.c:19
Modules linked in:
CPU: 1 PID: 3605 Comm: syz-executor208 Not tainted 5.18.0-syzkaller-03023-g7e062cda7d90 #0
...
Call Trace:
 <TASK>
 __refcount_add_not_zero include/linux/refcount.h:163 [inline]
 __refcount_inc_not_zero include/linux/refcount.h:227 [inline]
 refcount_inc_not_zero include/linux/refcount.h:245 [inline]
 sk_psock_get+0x3bc/0x410 include/linux/skmsg.h:439
 tls_data_ready+0x6d/0x1b0 net/tls/tls_sw.c:2091
 tcp_data_ready+0x106/0x520 net/ipv4/tcp_input.c:4983
 tcp_data_queue+0x25f2/0x4c90 net/ipv4/tcp_input.c:5057
 tcp_rcv_state_process+0x1774/0x4e80 net/ipv4/tcp_input.c:6659
 tcp_v4_do_rcv+0x339/0x980 net/ipv4/tcp_ipv4.c:1682
 sk_backlog_rcv include/net/sock.h:1061 [inline]
 __release_sock+0x134/0x3b0 net/core/sock.c:2849
 release_sock+0x54/0x1b0 net/core/sock.c:3404
 inet_shutdown+0x1e0/0x430 net/ipv4/af_inet.c:909
 __sys_shutdown_sock net/socket.c:2331 [inline]
 __sys_shutdown_sock net/socket.c:2325 [inline]
 __sys_shutdown+0xf1/0x1b0 net/socket.c:2343
 __do_sys_shutdown net/socket.c:2351 [inline]
 __se_sys_shutdown net/socket.c:2349 [inline]
 __x64_sys_shutdown+0x50/0x70 net/socket.c:2349
 do_syscall_x64 arch/x86/entry/common.c:50 [inline]
 do_syscall_64+0x35/0xb0 arch/x86/entry/common.c:80
 entry_SYSCALL_64_after_hwframe+0x46/0xb0
 </TASK>

syzbot is try to setup TLS on a SMC socket.

During SMC fallback process in connect syscall, kernel will sets the
smc->sk.sk_socket->file->private_data to smc->clcsock
in smc_switch_to_fallback(), and set smc->clcsock->sk_user_data
to origin smc in smc_fback_replace_callbacks().

When syzbot makes a setsockopt syscall, its argument sockfd
actually points to smc->clcsock, which is not a smc_sock type,
So it won't call smc_setsockopt() in setsockopt syscall,
instead it will call do_tcp_setsockopt() to setup TLS, which
bypasses the fixes 734942cc4ea6, its content is shown as below
> diff --git a/net/smc/af_smc.c b/net/smc/af_smc.c
> index be3e80b3e27f1..5eff7cccceffc 100644
> --- a/net/smc/af_smc.c
> +++ b/net/smc/af_smc.c
> @@ -2161,6 +2161,9 @@ static int smc_setsockopt(struct socket *sock,
> 			int level, int optname,
>  	struct smc_sock *smc;
>  	int val, rc;
>
> +	if (level == SOL_TCP && optname == TCP_ULP)
> +		return -EOPNOTSUPP;
> +
>  	smc = smc_sk(sk);
>
>  	/* generic setsockopts reaching us here always apply to the
> @@ -2185,7 +2188,6 @@ static int smc_setsockopt(struct socket *sock,
>			int level, int optname,
>  	if (rc || smc->use_fallback)
>  		goto out;
>  	switch (optname) {
> -	case TCP_ULP:
>  	case TCP_FASTOPEN:
>  	case TCP_FASTOPEN_CONNECT:
>  	case TCP_FASTOPEN_KEY:
> --

Later, sk_psock_get() will treat the smc->clcsock->sk_user_data
as sk_psock type, which triggers the refcnt warning.

So Just disallow this setup in do_tcp_setsockopt() is OK,
by checking whether sk_user_data points to a SMC socket.

Reported-and-tested-by: syzbot+5f26f85569bd179c18ce@syzkaller.appspotmail.com
Signed-off-by: hawk <18801353760@163.com>
---
 net/ipv4/tcp.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/net/ipv4/tcp.c b/net/ipv4/tcp.c
index 9984d23a7f3e..a1e6cab2c748 100644
--- a/net/ipv4/tcp.c
+++ b/net/ipv4/tcp.c
@@ -3395,10 +3395,23 @@ static int do_tcp_setsockopt(struct sock *sk, int level, int optname,
 	}
 	case TCP_ULP: {
 		char name[TCP_ULP_NAME_MAX];
+		struct sock *smc_sock;
 
 		if (optlen < 1)
 			return -EINVAL;
 
+		/* SMC sk_user_data may be treated as psock,
+		 * which triggers a refcnt warning.
+		 */
+		rcu_read_lock();
+		smc_sock = rcu_dereference_sk_user_data(sk);
+		if (level == SOL_TCP && smc_sock &&
+		    smc_sock->__sk_common.skc_family == AF_SMC) {
+			rcu_read_unlock();
+			return -EOPNOTSUPP;
+		}
+		rcu_read_unlock();
+
 		val = strncpy_from_sockptr(name, optval,
 					min_t(long, TCP_ULP_NAME_MAX - 1,
 					      optlen));
-- 
2.25.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
