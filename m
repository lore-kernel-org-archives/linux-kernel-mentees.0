Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B29822E03F1
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 27 Oct 2025 07:34:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761550464; cv=none; b=f0gI5iDeTcis2xL2V4ENk2GwauzdXKfxsVi+6aYZv1iIg/TDr6fmjBo34b9omC4m5YfSmHMcTJSWygUF4eFALGoq/OPSCS5MO0l8rfml0ZJKz601jwTX+P9n3A+GZSe9YRsNF8XGzNNlb8cJT923y8FEFowg0rfETAsInUao0vU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761550464; c=relaxed/simple;
	bh=VLS73N+k0m8pm2jfMn0bQ+AxVZEGfiR67VwsmEn/FAk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=o7jKpCAjpu6qkef3NEX+PEOizMaOUTMlyQZsLxuPv88UOYIgV2OV021HbxRcGfct3hJ6tKm5gEwEOX1rMiFGwZ4nJtftODOLfQnQq5jNC8jH5n4uRTQUTzcpHg9GCYTsShF9BbTJRwWaRJE6BLX8nNHFQLxgD+o2o6sTH6Ag27U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mmUaU4Vd; arc=none smtp.client-ip=140.211.166.136
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mmUaU4Vd"
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 53F5A61253
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 27 Oct 2025 07:34:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level:
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iM0LNqUV0utn for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 27 Oct 2025 07:34:21 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::d2e; helo=mail-io1-xd2e.google.com; envelope-from=kerneljasonxing@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 8DF6160FE8
Authentication-Results: smtp3.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8DF6160FE8
Authentication-Results: smtp3.osuosl.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=mmUaU4Vd
Received: from mail-io1-xd2e.google.com (mail-io1-xd2e.google.com [IPv6:2607:f8b0:4864:20::d2e])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 8DF6160FE8
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 27 Oct 2025 07:34:21 +0000 (UTC)
Received: by mail-io1-xd2e.google.com with SMTP id ca18e2360f4ac-93e7d3648a8so172148939f.2
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 27 Oct 2025 00:34:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761550460; x=1762155260; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nLRKSCpsYmwhIoBpLKvnpHRYxz12yXBw9ZjyLu+9T0M=;
        b=mmUaU4VdprqkCvCZkUmRvPJkGZzn36ey5zH6jkwlMc/R6kbB0Kz1MVU7hVBJvSBzhC
         n7cD7EB14+LiPWC51BZ5/pcaz5cPAVEO+8s1hD/VyQ6ISHrpQHYKJZdkd3ntNHOHRlB4
         jD8a0NE2/skFJQY1vExMyATZw51e30va8bFskCC7eTczxrvahz1WF7/N+eUlvbfpNMUZ
         tYjxNzHzmw6szu/2e5ouBcTEpvSNNKh2Ts+x6+lDalflcX8WZvUq6QGLV9CZPI/cyp8O
         pXFvOsnH8kPvJzhuJ0Pi7fRTwyxnLUUc1xc4SiSB75sj3sBe+/gYDm+ffrsJKxt4tkpE
         3trw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761550460; x=1762155260;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nLRKSCpsYmwhIoBpLKvnpHRYxz12yXBw9ZjyLu+9T0M=;
        b=vJqt6h+/T7EyDmiEw1Mk1kj1K7Kw4bwcNcd/MdFGbbAaHBYxviJO6MptN1iKKV048I
         ah624/j78hidWjhSRCeEFJvbgeEfsAZAl/gbediEg0vUNvUN3jR144dNt5FYWUoQyzHB
         f63nRDfy0ktGK42C8mxGwepKh+LytscDMFI/sjxtpQ6cDu8JNEX+3vs2/T1vLyyC9UtA
         BJxyHGov29Gsj18Jms0DFRAqF29aGHccPCmne9AJoompgGpLylWOhLOtkZSA4PJlcKf8
         1nN/L3iqHzYdbqohmy0RZEuhnNS3MyzCMg9Bcbkfua4AdQSnFxfecUPmdQTkByax7Pl8
         8Wlw==
X-Forwarded-Encrypted: i=1; AJvYcCUVYEF1kbjmDYLq5ZCx+28Kr3d6lFg9ow5sjWvi5VhUdq936KNuabaUjl8DvRF7S+QgPiPazIJOvPJcuUJXV3Z8AZT3Ug==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0YxwBcJBkKf/YomJxUlEpt4U2mBeObgFD08W8gwOMSA1sezhwXfL
	NJdgCudMEsq5RjzZsP6+ybH/U5vNNiq2HNdi0yn/sa8c1pb3hrZ+R6IBwH8TQFizmxhNyDBp3IF
	RSmI6oQOiwWZjrXQbR4l53rtKlERcJJY=
X-Gm-Gg: ASbGncv0p1F0v6ji4HW3IY2DNEVY+jkwtPly134pRoWsyn9r6X3HRzstlaE39uHa8GA
	c2w7z52et9myBsNCRflCHQOy8yBR8sp9ghq6gHsq7Hb55psJqPWBFqNrVzU8qddCI2K1Bbx22bN
	N/uB5wKF0INSFeK+08shoCuPmOs3+qb2KLQslXyV5gdb0yTZFvIrdHhVxbha5OCLuhRQNeKwg3c
	CE5lwfIkozx60cA0dY/9vOZxFAjRXrag7fRMDX+becSdFdaCgaj1jKVfoI=
X-Google-Smtp-Source: AGHT+IE4yTFQB/Sz1Hvmf1eohFHURvb676RfwgjWsjq1mbVjiRUKXUxdP/I+N8rdBuajxo0qe5dILr2G07V8SzV/+rY=
X-Received: by 2002:a05:6e02:1c0c:b0:430:b787:1c7a with SMTP id
 e9e14a558f8ab-430c52b43b0mr510390015ab.17.1761550460332; Mon, 27 Oct 2025
 00:34:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251027053156.34368-1-ankitkhushwaha.linux@gmail.com>
In-Reply-To: <20251027053156.34368-1-ankitkhushwaha.linux@gmail.com>
From: Jason Xing <kerneljasonxing@gmail.com>
Date: Mon, 27 Oct 2025 15:33:43 +0800
X-Gm-Features: AWmQ_bmSUZhPR6p4SLQBN6A4GJHnkpFAQUKFPm5PcXL0KgaMnnMufzd-em_1cRE
Message-ID: <CAL+tcoANtVUp=tFD=JgR34_TvmrKVr7zz8gZMgoTKNDnjCzLTg@mail.gmail.com>
Subject: Re: [PATCH v2] selftest: net: fix variable sized type issue not at
 the end of a struct
To: Ankit Khushwaha <ankitkhushwaha.linux@gmail.com>
Cc: Steffen Klassert <steffen.klassert@secunet.com>, Herbert Xu <herbert@gondor.apana.org.au>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	Shuah Khan <shuah@kernel.org>, Willem de Bruijn <willemdebruijn.kernel@gmail.com>, 
	Jason Xing <kernelxing@tencent.com>, netdev@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-kernel-mentees@lists.linuxfoundation.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 27, 2025 at 1:32=E2=80=AFPM Ankit Khushwaha
<ankitkhushwaha.linux@gmail.com> wrote:
>
> Some network selftests defined variable-sized types variable at the middl=
e
> of struct causing -Wgnu-variable-sized-type-not-at-end warning.
>
> warning:
> timestamping.c:285:18: warning: field 'cm' with variable sized type
> 'struct cmsghdr' not at the end of a struct or class is a GNU
> extension [-Wgnu-variable-sized-type-not-at-end]
>   285 |                 struct cmsghdr cm;
>       |                                ^
>
> ipsec.c:835:5: warning: field 'u' with variable sized type 'union
> (unnamed union at ipsec.c:831:3)' not at the end of a struct or class
> is a GNU extension [-Wgnu-variable-sized-type-not-at-end]
>   835 |                 } u;
>       |                   ^
>
> This patch move these field at the end of struct to fix these warnings.
>
> Signed-off-by: Ankit Khushwaha <ankitkhushwaha.linux@gmail.com>
> ---
> Changelog:
> v2: https://lore.kernel.org/linux-kselftest/20251027050856.30270-1-ankitk=
hushwaha.linux@gmail.com/
> - fixed typos in the commit msg.
>
> ---
>  tools/testing/selftests/net/ipsec.c        | 2 +-
>  tools/testing/selftests/net/timestamping.c | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/tools/testing/selftests/net/ipsec.c b/tools/testing/selftest=
s/net/ipsec.c
> index 0ccf484b1d9d..36083c8f884f 100644
> --- a/tools/testing/selftests/net/ipsec.c
> +++ b/tools/testing/selftests/net/ipsec.c
> @@ -828,12 +828,12 @@ static int xfrm_state_pack_algo(struct nlmsghdr *nh=
, size_t req_sz,
>                 struct xfrm_desc *desc)
>  {
>         struct {
> +               char buf[XFRM_ALGO_KEY_BUF_SIZE];
>                 union {
>                         struct xfrm_algo        alg;
>                         struct xfrm_algo_aead   aead;
>                         struct xfrm_algo_auth   auth;
>                 } u;
> -               char buf[XFRM_ALGO_KEY_BUF_SIZE];
>         } alg =3D {};
>         size_t alen, elen, clen, aelen;
>         unsigned short type;
> diff --git a/tools/testing/selftests/net/timestamping.c b/tools/testing/s=
elftests/net/timestamping.c
> index 044bc0e9ed81..ad2be2143698 100644
> --- a/tools/testing/selftests/net/timestamping.c
> +++ b/tools/testing/selftests/net/timestamping.c
> @@ -282,8 +282,8 @@ static void recvpacket(int sock, int recvmsg_flags,
>         struct iovec entry;
>         struct sockaddr_in from_addr;
>         struct {
> -               struct cmsghdr cm;
>                 char control[512];
> +               struct cmsghdr cm;
>         } control;
>         int res;

For the timestamping part:

Reviewed-by: Jason Xing <kerneljasonxing@gmail.com>

Thanks,
Jason
