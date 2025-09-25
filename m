Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE8E2189BB6
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 25 Sep 2025 23:32:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758843150; cv=none; b=e1gsLzAPAP/ANoEZ6JTkuSnJTDSmcni2/yv8WZx27QGvi+t9lJlhMhEfBEfswxiV7aDG61u82TSUNOtHfPgNEencWda8quQYbAPzsw3h8EAvBB00KJ7I4onabfzhlWeyYiPqMaaQfzI9bRyhEA2BadsXtWSnP+eAIsUBMo2ah6U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758843150; c=relaxed/simple;
	bh=l5LRunuTe/LqJ3h4k3fN0y4sQ6ZlASLvxnuyjT0c2dg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=O8f8wnV+sigcc9praI7NP6mxiBD/XJzQlNjkDk6gDwed72LAjNFyqIGe+W0XXxffZnsO22txk8EOcg3fwY8D6WsSRaWfICJFJEMEsqA7vBIK/VqOoFLL1GsexwWVqIBTEL1RB7ZZhKXArXk42PRBCalI1Te6mydDA5E78JdrmRc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Q7/yeK5G; arc=none smtp.client-ip=140.211.166.138
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Q7/yeK5G"
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8DF9C84664
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 25 Sep 2025 23:32:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level:
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CtnfI2x67x1x for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 25 Sep 2025 23:32:26 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::1034; helo=mail-pj1-x1034.google.com; envelope-from=andrii.nakryiko@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org AC47784677
Authentication-Results: smtp1.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AC47784677
Authentication-Results: smtp1.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Q7/yeK5G
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com [IPv6:2607:f8b0:4864:20::1034])
	by smtp1.osuosl.org (Postfix) with ESMTPS id AC47784677
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 25 Sep 2025 23:32:26 +0000 (UTC)
Received: by mail-pj1-x1034.google.com with SMTP id 98e67ed59e1d1-3304dd2f119so1237273a91.2
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 25 Sep 2025 16:32:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758843146; x=1759447946; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l8PWUy95/xwAeHXQlv9LwNQfamqkfSoV3CUxibqo+As=;
        b=Q7/yeK5G0IzTPPLibr9fAHz+o4xT0XHsqdD8GS7+KYTBpD0oqkED6Kn2Zd6V6V0m26
         mcHASV1w/iiPun6IQNSGeFORS5uQWt1u/1KbsSQABu2uS5IuX2CS9BsrOGqZg3w1cNfD
         mpKEoO5cGAULdEX1ZA93moRU59upTekF3RyuhP8jHgjVHGhm0mORM0V8f0TcRf5o53OG
         kqCuCprRr2ZCJ6qhoPIhneiKZmckRRwqyUjCTjCIKJdi2x8Djy/flCrycrRLZyUmnb/W
         rWBsgSNVFGzwhSduIO62GkL50sKZv9wl0gwLgOeC1BeAr2pNf5d9IxtoJadEGonc+zKs
         4luA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758843146; x=1759447946;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=l8PWUy95/xwAeHXQlv9LwNQfamqkfSoV3CUxibqo+As=;
        b=R6O/kPgapQ/vONInEO/It9kKujhVKjE1nhUA0Rldp3e+rA689vR/vBI5bxwlDFCDeQ
         y6Q4XgKvuHQ7djssiF8DVv7EBwqroINeZN/6gBYCD+Ck1ULHvqeMyHAY3JLXzVyQg1Yj
         +DFNBKutkxO7awDAoH6N1lBemtvg3s/reY62MaoFWIJ95dufCsby6qmBCw3iJGKI6qlw
         58qYXzGtC85moth6iLxMwXmgXVxtEVkB8dBEsHenTP+Wee2i4b9WofUVeReLZyTXL4QE
         oAphE6TTgRMT1XqPsts1lPqA3qoNpB2QNoCaMy8ouRytE8glPje8yfhoSfPoKXPdKx6l
         m8Xw==
X-Forwarded-Encrypted: i=1; AJvYcCVPTX9mH/6IOM5l/hXfBSwxbirDYObGzWXBYPJHwMoGAJzony4Z/DzhPZd2k30QDS0FovJ7cMVbpfngTxeBodBN1SVzlw==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0YyuZQM6Y0OTxkP3+pEUzcHdxKU6wButaN0RjKo5n8QfoloFbSbc
	tAAgd4hWDOWM3EeMOwngfm3cVzT9ByrDQaDNdAkzJV/9/workxlVmyBOSkLC7nX2GQT2bpe6dau
	UakwUL86JDknOFiIfc63rbAa3Pqb0sNY=
X-Gm-Gg: ASbGncvYgdj7AKbMKhReQoBX7JF9/xSkVe5Y2PBY3j40AlSmqvmoX1/++/knK0OUTuQ
	ALHEY9U8UN0CUFdsgeAyWZ9gRxkU9P1dEa7MShYAkD+HDIpyoHvyZ+WcDoFD0YChdrDrp6GRwH0
	UZfXLeSW5Gbo447o/zR8jeSoMTsDMZSzT4nyMJWiOHaHO1E3gar63nPTTG8tC9YeYEgrFKj4ZT9
	0w31qT0KvN6oE+fZL7Jy8VOk0moqAGiBw==
X-Google-Smtp-Source: AGHT+IFyG6lAkXqNECGf0CPqvA5WLNFwkWpmgIcJv7d6UG7Fy+qA0wGWEdL6nyUo+sCagqxDXc40BM4LYLvFPLy3JiY=
X-Received: by 2002:a17:90b:3ecc:b0:32e:7c34:70cf with SMTP id
 98e67ed59e1d1-3342a300aafmr5225649a91.36.1758843145829; Thu, 25 Sep 2025
 16:32:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250925103559.14876-1-mehdi.benhadjkhelifa@gmail.com>
In-Reply-To: <20250925103559.14876-1-mehdi.benhadjkhelifa@gmail.com>
From: Andrii Nakryiko <andrii.nakryiko@gmail.com>
Date: Thu, 25 Sep 2025 16:32:11 -0700
X-Gm-Features: AS18NWAPxbw3Q7HkczSi0SkphLUmd3YAUtjm9M5fUjRW3Bv2KTPZjdUhgqDqjkE
Message-ID: <CAEf4Bzaf81OYLTzpN6E4ths_mN2gP29rMYBmbp7P2GqSMj8FbA@mail.gmail.com>
Subject: Re: [PATCH v3 0/3] selftests/bpf: Prepare to add -Wsign-compare for
 bpf selftests
To: Mehdi Ben Hadj Khelifa <mehdi.benhadjkhelifa@gmail.com>
Cc: andrii@kernel.org, eddyz87@gmail.com, ast@kernel.org, daniel@iogearbox.net, 
	martin.lau@linux.dev, song@kernel.org, yonghong.song@linux.dev, 
	john.fastabend@gmail.com, kpsingh@kernel.org, sdf@fomichev.me, 
	haoluo@google.com, jolsa@kernel.org, shuah@kernel.org, matttbe@kernel.org, 
	martineau@kernel.org, geliang@kernel.org, davem@davemloft.net, 
	kuba@kernel.org, hawk@kernel.org, linux@jordanrome.com, ameryhung@gmail.com, 
	toke@redhat.com, houtao1@huawei.com, emil@etsalapatis.com, yatsenko@meta.com, 
	isolodrai@meta.com, a.s.protopopov@gmail.com, dxu@dxuuu.xyz, memxor@gmail.com, 
	vmalik@redhat.com, bigeasy@linutronix.de, tj@kernel.org, 
	gregkh@linuxfoundation.org, paul@paul-moore.com, 
	bboscaccy@linux.microsoft.com, James.Bottomley@hansenpartnership.com, 
	mrpre@163.com, jakub@cloudflare.com, bpf@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	netdev@vger.kernel.org, mptcp@lists.linux.dev, 
	linux-kernel-mentees@lists.linuxfoundation.org, skhan@linuxfoundation.org, 
	david.hunter.linux@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 25, 2025 at 2:36=E2=80=AFAM Mehdi Ben Hadj Khelifa
<mehdi.benhadjkhelifa@gmail.com> wrote:
>
> This series is preparing to add the -Wsign-compare C compilation flag to
> the Makefile for bpf selftests as requested by a TODO to help avoid
> implicit type conversions and have predictable behavior.
>
> Changelog:
>
> Changes from v2:
>
> -Split up the patch into a patch series as suggested by vivek
>
> -Include only changes to variable types with no casting by my mentor
> david
>
> -Removed the -Wsign-compare in Makefile to avoid compilation errors
> until adding casting for rest of comparisons.
>
> Link:https://lore.kernel.org/bpf/20250924195731.6374-1-mehdi.benhadjkheli=
fa@gmail.com/T/#u
>
> Changes from v1:
>
> - Fix CI failed builds where it failed due to do missing .c and
> .h files in my patch for working in mainline.
>
> Link:https://lore.kernel.org/bpf/20250924162408.815137-1-mehdi.benhadjkhe=
lifa@gmail.com/T/#u
>
> Mehdi Ben Hadj Khelifa (3):
>   selftests/bpf: Prepare to add -Wsign-compare for bpf tests
>   selftests/bpf: Prepare to add -Wsign-compare for bpf tests
>   selftests/bpf: Prepare to add -Wsign-compare for bpf tests
>

I see little value in these transformations. Did we catch any real
issue here? All this type casting and replacement is just churn.

I certainly don't want such churn in libbpf, and I'd leave BPF
selftests as is as well. int vs u64 can have subtle and non-obvious
implications for BPF code generation (for no-alu32 variants
especially), and I think BPF CI already exposed some of those already.

I think we can live without -Wsign-compare just fine.


>  tools/testing/selftests/bpf/progs/test_global_func11.c       | 2 +-
>  tools/testing/selftests/bpf/progs/test_global_func12.c       | 2 +-
>  tools/testing/selftests/bpf/progs/test_global_func13.c       | 2 +-
>  tools/testing/selftests/bpf/progs/test_global_func9.c        | 2 +-
>  tools/testing/selftests/bpf/progs/test_map_init.c            | 2 +-
>  tools/testing/selftests/bpf/progs/test_parse_tcp_hdr_opt.c   | 2 +-
>  .../selftests/bpf/progs/test_parse_tcp_hdr_opt_dynptr.c      | 2 +-
>  tools/testing/selftests/bpf/progs/test_skb_ctx.c             | 2 +-
>  tools/testing/selftests/bpf/progs/test_snprintf.c            | 2 +-
>  tools/testing/selftests/bpf/progs/test_sockmap_strp.c        | 2 +-
>  tools/testing/selftests/bpf/progs/test_tc_tunnel.c           | 2 +-
>  tools/testing/selftests/bpf/progs/test_xdp.c                 | 2 +-
>  tools/testing/selftests/bpf/progs/test_xdp_dynptr.c          | 2 +-
>  tools/testing/selftests/bpf/progs/test_xdp_loop.c            | 2 +-
>  tools/testing/selftests/bpf/progs/test_xdp_noinline.c        | 4 ++--
>  tools/testing/selftests/bpf/progs/uprobe_multi.c             | 4 ++--
>  .../selftests/bpf/progs/uprobe_multi_session_recursive.c     | 5 +++--
>  .../selftests/bpf/progs/verifier_iterating_callbacks.c       | 2 +-
>  18 files changed, 22 insertions(+), 21 deletions(-)
>
> --
> 2.51.0
>
