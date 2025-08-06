Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 986B619A
	for <linux-kernel-mentees@lists.linux.dev>; Wed,  6 Aug 2025 15:03:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754492634; cv=none; b=KItEtYAXlnj7DeOptomHB6xsfuMaKEDPPCaCfoGARO5+hFJcEs0kB/6UL5N5naWYrJjl/CiYqwZb8QyPKQA/ZJIAw2KRxzjKIRj7G5UCiwS9L2cTtXqa2Udz+aiydV/k5pGL+qPZng54qKoVECF2WwrSuJc36Rhmxg+rS+DCgIo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754492634; c=relaxed/simple;
	bh=584uXeN9jsBXBHMuwddffGCP8OVlQsZ+Xp3CN2antyQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CElfCHETl/+IcVeZ+DAJBEN/E0LbJMizxF86AcD8PYk8+R6FMnFkQ+wesCKN4hzilxZPCiENGd8uShXOzO1L30h2uTP1QpOrZxtWhZNXOYMMgP9UA1jP+mgpf/OtFTCpT9Jux167LYuP4dmEgxpAT2DftJxFY9nFB8w+abRvnvI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YIi0/cPE; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YIi0/cPE"
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-af95525bac4so870404166b.0
        for <linux-kernel-mentees@lists.linux.dev>; Wed, 06 Aug 2025 08:03:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754492631; x=1755097431; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ck5YtWxsbH5j6ULV7+hpajLj2ON81F2VLpNH+npiJkQ=;
        b=YIi0/cPE7T974KZ052tKMVefy+h36a1ZTqLcgzfbt2qNGTgFzCQ3G8gbd9VCDnCLhu
         tsLEOmLDlq5QoEZJ+BR9TpEccYaqXi7z71c7K6AlidbM1cLYXP4f+DOO2qIRaLdZjtcj
         QjPxMb58e4JbAs5j8nWr3TyEfknoQnsnAaU5nMgEjMT9vFsc65x+SIBrclCvQ1NaDyh1
         4e2OLoyv2dvKHF0GBOEI8QprqaFb7UJdgnkghnsWAdAveYJ4l9BYLM0TO7MerY/vyfVw
         /1pdzq2zIEmEfob7tq/fQwMo6BOgq4HVahR4ymgLItCFLLVfAWIJfU1IC5G3RbJHbIVn
         RO2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754492631; x=1755097431;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ck5YtWxsbH5j6ULV7+hpajLj2ON81F2VLpNH+npiJkQ=;
        b=foVs1u1Dftq62lTc0oFKRFq6AckFQXUGqJB6K/2BcXZ4f1+xvvt2tDIb70cfy5egjb
         kcgi0yA7TyPfihe17Z28CGUCCRFMV6bP1lRWCksfKpmITTvQmU3tgP59z3wf56Voh9rs
         VHS5/os3fpOpKaZFVDYgrR7IhflNr9dy5GTB2NxhTedf380iX+GFO2Ekz32yJWIte+k8
         CVsGyj/hDjIDO8nbn0/1Z/k1iESu5SQBeSqWFK+sBMxa2rOvhnpRq919pw6FrMdjN+cj
         KQJHqmTM8IbY1vGHfIoo1gmY0QRidHZsFNvdQPLpYmq9w/F+0a8+k1w2emfe582KzsrS
         OPUQ==
X-Forwarded-Encrypted: i=1; AJvYcCXUZL289fiUipNaqNrg0LZ+n6S+b03dC8cb+sASKm1e0jL0yl07nI7C9/JY3yy6GSjw0rFT4KF0cfsH/X18HXNQDjR8+A==@lists.linux.dev
X-Gm-Message-State: AOJu0YxAjkvOVrFTm6btKfd4BWzuvS+gF4gH0k6Q9kS7oOYC8Cq/3shm
	veXMda9wdtExI88gwZmq+JHUyF8JtP7RbzovVM/kot+X/UJ1BwT7lnT1w1OIvNXQpvXNlkexTW6
	xLNGbCa52UlMXTP1PdndLg+ruS07Jys0=
X-Gm-Gg: ASbGncv/HOvzXA6xeLd35ZLqSGZw8tlcQB53Az0SYgpMN9NVwokVl1CCQ6FVC4poGdY
	iqACWv1WZxxV2MlgeJLZUMGlJA9CelLe4ikxtkdhBBEbeSmD178poJyfj0Ualnesawgv13qd0xt
	HLkW+nbc5CgZCjIoLGcCdQeEdqODGSaie7h3Gyql/jn6llAv55MqDbsT4h4hs8rAAqOoeaMDG8K
	Gt+P77o7lX4tohffA75cTAr8QBe+nmI75XU
X-Google-Smtp-Source: AGHT+IFz4XsMafOE7B2cRECu6PsWWMxUp0yBdUzi6JtgASelC8/9mtyaERSLeB8R2LFMi4+R+vaDYy1LHdKJjr/ADtI=
X-Received: by 2002:a17:906:f58d:b0:af2:b9b5:1c06 with SMTP id
 a640c23a62f3a-af992aa4a38mr252953366b.14.1754492630424; Wed, 06 Aug 2025
 08:03:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250806110230.23949-1-pranav.tyagi03@gmail.com>
In-Reply-To: <20250806110230.23949-1-pranav.tyagi03@gmail.com>
From: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Date: Wed, 6 Aug 2025 08:03:15 -0700
X-Gm-Features: Ac12FXwMSvnTnW4mpFr34H5Rcz9AOXGEYUwrsVyBOhRLZUjpNGcPOgXLwZWKDDM
Message-ID: <CAADnVQJQV5Z_LsrBCa2=UwQ9NhPbkpNvZ9N7nf1sv-QunEj1FQ@mail.gmail.com>
Subject: Re: [PATCH] selftests/bpf/progs: use __auto_type in swap() macro
To: Pranav Tyagi <pranav.tyagi03@gmail.com>
Cc: Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	"David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, 
	Jesper Dangaard Brouer <hawk@kernel.org>, John Fastabend <john.fastabend@gmail.com>, 
	Andrii Nakryiko <andrii@kernel.org>, Eduard <eddyz87@gmail.com>, Shuah Khan <shuah@kernel.org>, 
	Stanislav Fomichev <sdf@fomichev.me>, Mykola Lysenko <mykolal@fb.com>, 
	Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, KP Singh <kpsingh@kernel.org>, 
	Hao Luo <haoluo@google.com>, Jiri Olsa <jolsa@kernel.org>, 
	Network Development <netdev@vger.kernel.org>, bpf <bpf@vger.kernel.org>, 
	"open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, 
	linux-kernel-mentees@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 6, 2025 at 4:02=E2=80=AFAM Pranav Tyagi <pranav.tyagi03@gmail.c=
om> wrote:
>
> Replace typeof() with __auto_type in xdp_synproxy_kern.c.
> __auto_type was introduced in GCC 4.9 and reduces the compile time for
> all compilers. No functional changes intended.
>
> Signed-off-by: Pranav Tyagi <pranav.tyagi03@gmail.com>
> ---
>  tools/testing/selftests/bpf/progs/xdp_synproxy_kern.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/tools/testing/selftests/bpf/progs/xdp_synproxy_kern.c b/tool=
s/testing/selftests/bpf/progs/xdp_synproxy_kern.c
> index 62b8e29ced9f..b08738f9a0e6 100644
> --- a/tools/testing/selftests/bpf/progs/xdp_synproxy_kern.c
> +++ b/tools/testing/selftests/bpf/progs/xdp_synproxy_kern.c
> @@ -58,7 +58,7 @@
>  #define MAX_PACKET_OFF 0xffff
>
>  #define swap(a, b) \
> -       do { typeof(a) __tmp =3D (a); (a) =3D (b); (b) =3D __tmp; } while=
 (0)
> +       do { __auto_type __tmp =3D (a); (a) =3D (b); (b) =3D __tmp; } whi=
le (0)

Sorry, not doing this churn. The code is fine as-is.

--
pw-bot: cr
