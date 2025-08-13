Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 325B22BE020
	for <linux-kernel-mentees@lists.linux.dev>; Wed, 13 Aug 2025 07:53:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755071581; cv=none; b=TrSokoLzVfm6/PZ9mzvBu3cKuUBlvd/Njd9jPdKilDF4So2tfCPtzbXS+B9BxfyvlWf6FlqJw0xXpCV6OQ4JDzWkpOlkAbUP2C7/OlUA6CG/XI47WIRes7f4ijYPXXiWtipK6u355VN5M+Qj04tNHjg3vslA5Ldn3ak5Z+wDHuQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755071581; c=relaxed/simple;
	bh=f+S3gOFqwImEsJEICH99lenwE5M99OUKlgRH1xjj/Co=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=eD23rG9sfo1FQ2DcI1krMfDMezvTFW1yqoXRwcmBrxlj2HmbTF5umBIv9zxsh8Pgz1sLwengavMuu+m8xwOv2ut3daUS/HQ+CsGj++4X5p19zc8JjcxL89rtNY3+hQ/lWL95oA77KMQkVcUaHBvVILMcbMnFHAgen6Zj3oQuQgs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cc28IphW; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cc28IphW"
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-55b93104888so8061171e87.1
        for <linux-kernel-mentees@lists.linux.dev>; Wed, 13 Aug 2025 00:53:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755071578; x=1755676378; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iuNYhnn6aytC/r+EF2G2jA7FOCcxkDKpQ1Ff1dFxDJo=;
        b=cc28IphWePYH91p8D+u4XTzh+x5UwUjBon5EqJwAVWKYftDGcN2ym4LzT/rkFR4Oj5
         OtV1ASaen4zDUEBA9Jf+tmH/oO3PW8422wBl9pmLuAT7kPslLZHbw1lxKnTtWUrYFr87
         lsFC43J1N58xH4DysmyTo+IBPZNqJ5casNnRtlKRYllwSKoyFLkDb58J0/I46ev6KxZR
         5+rlKV0bd/FELUFSErfIU+rh0MKJy6dXVgYwusDA3eheDkm6oodc9xx1Y1OZlYSt/Ynl
         H4sHtnECSifuPj/Br9JEhD1wcoWebRZbhg4ajzySEYvRE4DN63fAqcz/SQMKherhr2XA
         T/Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755071578; x=1755676378;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iuNYhnn6aytC/r+EF2G2jA7FOCcxkDKpQ1Ff1dFxDJo=;
        b=q3ey/ZulmjD7l41NepVrrMOT1y1LzH+Q2CbtWk9ajUDsqfsCkH+kauS1SaYcKJz+OD
         luTO8yoiCem0uphBovAmo/qlvQqYP/T1Qx3J/61sVB87pk+syve5pJZlEbe3+QUMfZJU
         +jboY6ruoAzzOCE4kws4abpfwvE1NcOEA54V+vuJhOVRi2bMqeDXRx2wAjSSNRE6HKvg
         3b6+cddKJiSMVXRCaE7lZ/6QY7As24vTJoskaLvuvXHxqT3wUWDBGyXhYt3FAOV/fqR6
         K5iHe/5jpi9m8rdS/IR4eoWgGLsFEnZjoEpLx539ugXoM/zVljgz7/ZuEbRqjNgGRiOl
         HNGw==
X-Forwarded-Encrypted: i=1; AJvYcCUlPsaJSpNSSyeRH4OpSvuYn8h+rrMol8kgtR1f/PNKRGkdCrGR232OUgc1/bLV78JP4Fzd1qrwcCsaZamq5SGAfbk+kA==@lists.linux.dev
X-Gm-Message-State: AOJu0Yx7sMkSR7LkbzK7UlBrDGKZeTQ/mvTBOpZMWLYNjk4poFI5//zZ
	OvAbPdfarXmZaM/08FIZYK4txjWuMF/qe0K/ojhh8+l8HGbstRTLwls6Fa7m4FXObBS7YdyaaP9
	03Fto7nyGftinIZXynEVcOfTZRgXSwCs=
X-Gm-Gg: ASbGncu53zXWGVKhjxJ5QPP46qvyk2pBmxWykw2k79qd1MTHIr9v9207qViCTPIg5Uh
	SXKRA3k9I3k+ZlDlqOsLgPkolRjTfS6b0zcJ70dG1gkOKyKHBl1AlnOQm27zHOKj6xrtK5hCSEf
	980fSzBPG0t/11Gs6As7NT6xKFEt9FWRI/632Cz24MyPIt4Fsgm/JrdnG1L88DytCAEf/9+/l6h
	OeO9h5MjNEh4qAJe7VOuuCrKFiwN27r6ZcQW6Pcbg==
X-Google-Smtp-Source: AGHT+IGFeq7PPC0eDOedQvgcpVbMujIUP3t7+BvdzV2tK5S5ebK463DvsDG3mCmLv5tGlRuKsDUgiKS8yfPokoH4RbQ=
X-Received: by 2002:a05:6512:b2a:b0:55c:ad2a:aa85 with SMTP id
 2adb3069b0e04-55ce03ee417mr558298e87.42.1755071578069; Wed, 13 Aug 2025
 00:52:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250805154725.22031-1-pranav.tyagi03@gmail.com> <871pppfnjy.ffs@tglx>
In-Reply-To: <871pppfnjy.ffs@tglx>
From: Pranav Tyagi <pranav.tyagi03@gmail.com>
Date: Wed, 13 Aug 2025 13:22:46 +0530
X-Gm-Features: Ac12FXzxt4da2HYC4FFx3-Q0XE9aXKct1tIAwbLc7mv9ge5_lOj4D9vnXeJrQjY
Message-ID: <CAH4c4jKEx4w3LobdSbixXBK4NaSdfa993YjNF_j_pZoqjieBOQ@mail.gmail.com>
Subject: Re: [PATCH v3] futex: don't leak robust_list pointer on exec race
To: Thomas Gleixner <tglx@linutronix.de>
Cc: mingo@redhat.com, peterz@infradead.org, dvhart@infradead.org, 
	dave@stgolabs.net, andrealmeid@igalia.com, linux-kernel@vger.kernel.org, 
	jann@thejh.net, keescook@chromium.org, skhan@linuxfoundation.org, 
	linux-kernel-mentees@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 6, 2025 at 3:17=E2=80=AFAM Thomas Gleixner <tglx@linutronix.de>=
 wrote:
>
> On Tue, Aug 05 2025 at 21:17, Pranav Tyagi wrote:
> > +
> > +     if (IS_ENABLED(CONFIG_COMPAT) && compat)
> > +             head =3D p->compat_robust_list;
>
> This still does not compile because the dead code elimination comes
> _after_ the compiler decodes this line. I don't even need to fire up a
> compiler to predict the error emitted when CONFIG_COMPAT=3Dn:
>
>   error: =E2=80=98struct task_struct=E2=80=99 has no member named =E2=80=
=98compat_robust_list=E2=80=99
>
> No?
>
> There is a reason why I suggested you to use that helper function.
>
> You are obviously free to ignore me, but then please make sure that the
> stuff you submit compiles _AND_ works. Otherwise if you are not sure,
> why I told you, ask.
>
> Please take your time and stop rushing out half baken crap, which wastes
> everybodys time. I don't care about your time wasted, but I pretty much
> care about mine.
>
> To be clear: I don't want to see this in my inbox again before next week
> and then it better be correct.
>
> Thanks,
>
>         tglx
>
>
>

Hello Sir,

There is no question of ignoring you. It is my privilege to be
communicating with you.
Your guidance in the course of this specific patch has only enhanced
my understanding.
I always try to respect everyone's time and agree that I hurried the last o=
ne as
time of my mentorship program is closing fast. My apologies.

I have again sent the reworked patch (v4) duly corrected based on your
observations.
I have compiled and checked it with CONFIG_COMPAT=3Dn. And to the extent
my little wisdom
allowed, I have tested it using the following custom testing code on a
virtual machine:

#define _GNU_SOURCE
#include <unistd.h>
#include <sys/syscall.h>
#include <linux/futex.h>
#include <linux/unistd.h>
#include <stdio.h>

int main() {
    pid_t pid =3D 0;  // 0 =3D self
    struct robust_list_head *head;
    size_t len;
    long ret;

    ret =3D syscall(SYS_get_robust_list, pid, &head, &len);
    if (ret =3D=3D -1) {
        perror("get_robust_list");
        return 1;
    }

    printf("Robust list head: %p, length: %zu\n", head, len);
    return 0;
}

Regards
Pranav Tyagi
