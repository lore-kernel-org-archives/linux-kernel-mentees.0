Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D22F3431FA
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 28 Oct 2025 16:09:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761667763; cv=none; b=pBMrZdRIsBAq5iN8UoVchk8oXA/pFoiNOW42RRnRGpuajO1jKIua93nM8AR3b+5kZRy7s8X+7s6nlRYtz1cuUXTZqCl8SCMcytRAoOGmQ4x2skokJhAsbbYo4rZzftUpc8J5rXp8V2n8GBlqJgXh5k15cdFm89R5/dfXZ+52pck=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761667763; c=relaxed/simple;
	bh=dDjULkuYxSeS0Y4oU4SV85womNCpNWdft//C4y9afh0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=L6bl8yLJ0q78/g3yQzgxc3C2A9TKC5czYohV7mDGZ/XlBFbVUU0XfecoZ1tTmqt5bu7ATrT/ud1gWPEIpewgvRdHK+ma4wSTBTH8H3gC9Z6w2JQ8pg05Vho9O9857Jpdo2n/UsT2CVxKUG/kIC2xdpV+En3bVeeEkQpRq3JoD3k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mxjnmj4v; arc=none smtp.client-ip=140.211.166.133
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mxjnmj4v"
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3989040084
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 28 Oct 2025 16:09:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level:
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xv0VjLcvxTnb for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 28 Oct 2025 16:09:20 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::1035; helo=mail-pj1-x1035.google.com; envelope-from=andrii.nakryiko@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 4B2864006A
Authentication-Results: smtp2.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4B2864006A
Authentication-Results: smtp2.osuosl.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=mxjnmj4v
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com [IPv6:2607:f8b0:4864:20::1035])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 4B2864006A
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 28 Oct 2025 16:09:20 +0000 (UTC)
Received: by mail-pj1-x1035.google.com with SMTP id 98e67ed59e1d1-33badfbbc48so7800786a91.2
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 28 Oct 2025 09:09:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761667759; x=1762272559; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nSbWUkP74jArjI30D0sAE5TvIq/zi84n0bjbO2j3uGY=;
        b=mxjnmj4vXaO83dYUG6G5PQG1HVGfLfJRqw61ojhsEchD6teBhaw7ZtZPfzGStZfCu+
         S23+qOKUc2xonU0+tBjrdaSx/a4+N3GgxRpg3rl/jxvR971xRJujhtu5qhei0LdhiemT
         jdT3/PjNjdByAMGtANcFTzz0NkxItppp4SAXXGyBWEk2OGoP9qZurwzZQMEPhCgZmrtu
         FnKVcLszmn4JTNxg4SD7/BpYRGc7Uo3ngE3zNhSuQb2vNVRlKbSfrvk+SWaQv5+ejK94
         Z3tqjPDvh0FHaUjk29qslwoLUJlNI06dyRSQGADzRP75TNUSpi3xIfKgVkgTJyOkovty
         n33A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761667759; x=1762272559;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nSbWUkP74jArjI30D0sAE5TvIq/zi84n0bjbO2j3uGY=;
        b=IOSu8anLdJecS3mk0a/V1u+Ef5dYJVARWQRWseKxqjjDgsyK0752dhAJQtsKMJiCR3
         Q0F3XxyRyOXcS6lzUe9CksESCIRvNMXb3IgQHuhDWtZ4uto4fGHxoOLjMdwlq09EFApM
         Qv91dZRBchRNAHFqdueIRacjZNjqeZMkqFftH/n2Nw2oDxyTxafnA+Vwub4VUR+siF8X
         ADLhYZZDVX+XaML6ElHZejTHQ3dDj+eBl9rXz4GSzjfdojntXFH1ePaAW8vhgsJAFj5Y
         AuUvs/40ytmuysYHamKsLm8P1OaleZAYiJL8PwkSv8HQcAytQyKMq3Oa8N0zMFPBv9Ea
         YX8g==
X-Forwarded-Encrypted: i=1; AJvYcCXw4IBKLmdV3EQ20nMh7CVeSnulZEQVMN+tnOkPgMeER6SLHrSEf2qAvfwzBt/9QrI20JhBaSqi0RbqMdRDiVJlWKX33A==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0YxKiqBPsHCzaThWXQKTeh3d/FeHg7C0bbYWD8OhqlIEP0mfwcjx
	5jeHRhKp9rVZrtEsLVm3QmYixeHHVyunlcZo4zk/DL93QzysKPgFjwF1nUKUFxHwUTySc4MXSE3
	tBAAQDnrwOMfw4wY1YJ35jA3Ziu0bBO4=
X-Gm-Gg: ASbGnctpkGEFysZYLVu9e42Tr9AKzPqzj2Z3Fi3iTWr2SxhbOiGt3hq+AqE4fRrV1V3
	GUL+U3VLgSKtfOT7FOt0JSzrMK9j0oEghNINk4pLZjUS04EH8cMGOBojSnjbRV29Bk4QZ+rBg4m
	4k/dcxJ85N1s6Bf6n6DErmkZxt2Dmb5AbUQ+299DMmV859g3z51N2taGSOpoEiBLl6P76z7JTA+
	0cVGlHrRA7UYGQNK480OKM1IqnZBmgamWGj0wgC5FOhdmjXssqXoR9ciDVLdwDMcy75UN/C9tdT
	1lwPHGkeUPk=
X-Google-Smtp-Source: AGHT+IEt+jRXWPKMfkUhwdIG0jbgXiTN2/FnXGOF7GpfKVMtHqrZWr/N2HWc4lHOxmE0NYBa1VyI3gYStNqF+DUuve8=
X-Received: by 2002:a17:902:d487:b0:290:ac36:2ed6 with SMTP id
 d9443c01a7336-294cb3a1287mr46576115ad.14.1761667759122; Tue, 28 Oct 2025
 09:09:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251020133156.215326-1-mehdi.benhadjkhelifa@gmail.com>
In-Reply-To: <20251020133156.215326-1-mehdi.benhadjkhelifa@gmail.com>
From: Andrii Nakryiko <andrii.nakryiko@gmail.com>
Date: Tue, 28 Oct 2025 09:09:03 -0700
X-Gm-Features: AWmQ_bldhatN_kMnTkdHZ30UbwaQsKb7ZNir1RyLFpFR6qqrh0QB8XA0s5EslnI
Message-ID: <CAEf4Bzb6hhyyiAyyZZAA2pUZRNmfjAw_63ES8owfGvT_QXMyTw@mail.gmail.com>
Subject: Re: [PATCH v4] selftests/bpf: Change variable types for -Wsign-compare
To: Mehdi Ben Hadj Khelifa <mehdi.benhadjkhelifa@gmail.com>
Cc: andrii@kernel.org, eddyz87@gmail.com, ast@kernel.org, daniel@iogearbox.net, 
	martin.lau@linux.dev, song@kernel.org, yonghong.song@linux.dev, 
	john.fastabend@gmail.com, kpsingh@kernel.org, sdf@fomichev.me, 
	haoluo@google.com, jolsa@kernel.org, shuah@kernel.org, nathan@kernel.org, 
	nick.desaulniers+lkml@gmail.com, morbo@google.com, justinstitt@google.com, 
	ameryhung@gmail.com, toke@redhat.com, bpf@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev, skhan@linuxfoundation.org, david.hunter.linux@gmail.com, 
	khalid@kernel.org, linux-kernel-mentees@lists.linuxfoundation.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 20, 2025 at 5:32=E2=80=AFAM Mehdi Ben Hadj Khelifa
<mehdi.benhadjkhelifa@gmail.com> wrote:
>
> This is a follow up patch for commit 495d2d8133fd("selftests/bpf: Attempt
> to build BPF programs with -Wsign-compare") from Alexei Starovoitov[1]
> to be able to enable -Wsign-compare C compilation flag for clang since
> -Wall doesn't add it and BPF programs are built with clang.This has the
> benefit to catch problematic comparisons in future tests as quoted from
> the commit message:"
>   int i =3D -1;
>   unsigned int j =3D 1;
>   if (i < j) // this is false.
>
>   long i =3D -1;
>   unsigned int j =3D 1;
>   if (i < j) // this is true.
>
> C standard for reference:
>
> - If either operand is unsigned long the other shall be converted to
> unsigned long.
>
> - Otherwise, if one operand is a long int and the other unsigned int,
> then if a long int can represent all the values of an unsigned int,
> the unsigned int shall be converted to a long int;
> otherwise both operands shall be converted to unsigned long int.
>
> - Otherwise, if either operand is long, the other shall be
> converted to long.
>
> - Otherwise, if either operand is unsigned, the other shall be
> converted to unsigned.
>
> Unfortunately clang's -Wsign-compare is very noisy.
> It complains about (s32)a =3D=3D (u32)b which is safe and doen't
> have surprising behavior."
>
> This specific patch supresses the following warnings when
> -Wsign-compare is enabled:
>
> 1 warning generated.
>
> progs/bpf_iter_bpf_percpu_array_map.c:35:16: warning: comparison of
> integers of different signs: 'int' and 'const volatile __u32'
> (aka 'const volatile unsigned int') [-Wsign-compare]
>    35 |         for (i =3D 0; i < num_cpus; i++) {
>       |                     ~ ^ ~~~~~~~~
>
> 1 warning generated.
>
> progs/bpf_qdisc_fifo.c:93:2: warning: comparison of integers of
> different signs: 'int' and '__u32'
> (aka 'unsigned int') [-Wsign-compare]
>    93 |         bpf_for(i, 0, sch->q.qlen) {
>       |         ^       ~     ~~~~~~~~~~~
>
> Should be noted that many more similar changes are still needed in order
> to be able to enable the -Wsign-compare flag since -Werror is enabled and
> would cause compilation of bpf selftests to fail.
>
> [1].
> Link:https://github.com/torvalds/linux/commit/495d2d8133fd1407519170a5238=
f455abbd9ec9b
>
> Signed-off-by: Mehdi Ben Hadj Khelifa <mehdi.benhadjkhelifa@gmail.com>
> ---
> Changelog:
>
> Changes from v3:
>
> -Downsized the patch as suggested by vivek yadav[2].
>
> -Changed the commit message as suggested by Daniel Borkmann[3].
>
> Link:https://lore.kernel.org/all/20250925103559.14876-1-mehdi.benhadjkhel=
ifa@gmail.com/#r
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
> [2]:https://lore.kernel.org/all/CABPSWR7_w3mxr74wCDEF=3DMYYuG2F_vMJeD-dqo=
tc8MDmaS_FpQ@mail.gmail.com/
> [3]:https://lore.kernel.org/all/5ad26663-a3cc-4bf4-9d6f-8213ac8e8ce6@ioge=
arbox.net/
>  .../testing/selftests/bpf/progs/bpf_iter_bpf_percpu_array_map.c | 2 +-
>  tools/testing/selftests/bpf/progs/bpf_qdisc_fifo.c              | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/tools/testing/selftests/bpf/progs/bpf_iter_bpf_percpu_array_=
map.c b/tools/testing/selftests/bpf/progs/bpf_iter_bpf_percpu_array_map.c
> index 9fdea8cd4c6f..0baf00463f35 100644
> --- a/tools/testing/selftests/bpf/progs/bpf_iter_bpf_percpu_array_map.c
> +++ b/tools/testing/selftests/bpf/progs/bpf_iter_bpf_percpu_array_map.c
> @@ -24,7 +24,7 @@ int dump_bpf_percpu_array_map(struct bpf_iter__bpf_map_=
elem *ctx)
>         __u32 *key =3D ctx->key;
>         void *pptr =3D ctx->value;
>         __u32 step;
> -       int i;
> +       __u32 i;
>
>         if (key =3D=3D (void *)0 || pptr =3D=3D (void *)0)
>                 return 0;
> diff --git a/tools/testing/selftests/bpf/progs/bpf_qdisc_fifo.c b/tools/t=
esting/selftests/bpf/progs/bpf_qdisc_fifo.c
> index 1de2be3e370b..7a639dcb23a9 100644
> --- a/tools/testing/selftests/bpf/progs/bpf_qdisc_fifo.c
> +++ b/tools/testing/selftests/bpf/progs/bpf_qdisc_fifo.c
> @@ -88,7 +88,7 @@ void BPF_PROG(bpf_fifo_reset, struct Qdisc *sch)
>  {
>         struct bpf_list_node *node;
>         struct skb_node *skbn;
> -       int i;
> +       __u32 i;
>

this is wrong, i is coming from bpf_for() and is signed int

I'd suggest dropping this patch altogether, it's not helpful and
doesn't fix any real bugs.

pw-bot: cr

>         bpf_for(i, 0, sch->q.qlen) {
>                 struct sk_buff *skb =3D NULL;
> --
> 2.51.1.dirty
>
