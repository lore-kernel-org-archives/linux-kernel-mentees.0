Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C54132BD015
	for <linux-kernel-mentees@lists.linux.dev>; Fri, 18 Jul 2025 10:27:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752834454; cv=none; b=hzer0jNBSF8ArqVE+yD00+Wlna4OI8jBdpJ4zHj2rdaxrQ4zQlLRnvgAYgmHCqlFewS1O3Od9HWAmiPNcJXwX8++xP57n8LNHYoFTD1HAPbGiq/UXPC9GrbceNR61CJBWpLS17R8ehvPq1EDLWC99F8ataxc/nbmxVQUTJh9LuY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752834454; c=relaxed/simple;
	bh=34kp88JqtvOHUN1Ruw4Qwe4Ve5+ySa4ozJpDYO/g4bQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ifByyIpR+CFjY+fqWQEhJdwyDFzsBbNp6rfON3vgTnw+yZaGyF7e8sLarl7+nNxaxvWda+v8kmEP6R9IPjKCcFpsIPP/+Nv2uvCTXKJKEayvfsO8tQ77ThkRhfwlEHtwrbgBufTOj6HQgnb+ACW1HHLKuMcFDyLdJzKZPrhuSOo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mlczYCWO; arc=none smtp.client-ip=209.85.128.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mlczYCWO"
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-718409593b9so19923147b3.3
        for <linux-kernel-mentees@lists.linux.dev>; Fri, 18 Jul 2025 03:27:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752834452; x=1753439252; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1x8KYMoPHOU/KGMTKlJp4QdTDljWUFg5i2cxTvc6SMc=;
        b=mlczYCWOUt9ncxnDhgYI59sMcPIruo6SGnVUzBJu6NHjFsGfYBoEZtyA9B1VVtK5Cw
         IJFb8rbuZLzIZPJOWA5PX+nIKJ9dwnb0gN7S6EOpicJJBhFdU0zShG99U7TvgiVuDNuP
         58MWvlomp4se85QTrWH9jmWyPYD/8xPKHaWd+x/K0OenftSlrwVBQIaLyfJ6sgMH6E1j
         MKTuR6RfwFd7eicAbdcTv04F4w1wZsvJ98AHKj0QQfFqiP4KSHgfwSxKRLdtTScBabre
         rFW9LQdVfpeUlRpihOrHOBomRNMQZUeOcLqv+jnpEvbUSQtNxEpMJmkuNOsvW1jEYzfr
         cqQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752834452; x=1753439252;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1x8KYMoPHOU/KGMTKlJp4QdTDljWUFg5i2cxTvc6SMc=;
        b=Yv7b7PIy3uZ73P3v++ciljURC7k1oqOmUWuHNxY+0DBrIUlPyAUa+kx8OSov2YT9du
         EuewAGlTb4qFQiMMc40dXkoMTgH8/zhhXlCpnRgXRgyehbPr9s8q9o87KO7KiR0VR8/w
         xx5AqrxA1MzUB+89sSRWEbA2Hm0XMEi8wg+voXo2Tf/RFYt4LKnGNbVBXOKuE665fk09
         Ijs5Bua2IInBqg07frA6XaV4FzQqHx2TuxGL14+r+7PvppQnWxrpiv9ndTFYXB1HZlbm
         c0jf2tL9gVgAT5Bjkn+wZD5Smk1FfNO7gbcCw3QJuEQGkr10bOgCib5VesxSX48hcNEg
         8ZDA==
X-Forwarded-Encrypted: i=1; AJvYcCUHCSmNApstG8SWS+KDjfWPeU29q99jTFCGZj4HACGseQUdDF6hLvbIElH0gBDRgCybRSGTBbkapX9WHmOQfsdwOVBvVQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YzYw3Fy73W14gwNCKI4X8so0ncofXJjodjxPlHdGMBZ0HLb6AiC
	xEc8Xrxqms5+5CCsUTpn5Rfp5xKTPhfx77qGPW+DyGgOyPTWuHJ4NXRTRDl3EHA5FumBt68vCbm
	O9W+EGRxOm6AG9P3gFg7YWMoMl3EYGps=
X-Gm-Gg: ASbGncu8ch4rhFnVD4UexZ2ONc+gNQc4Xd3cy4uHrKIl1oF2qRuU8N/0Juvt1ksi4or
	kvj92xVOJoVaPJ3MxJM5jMW05DjRWri4Ht3g5OtI/D2KFfYaFqevMphAXpnWyHYAj2lyOiK7TBz
	ODSF6UDYjzrjVuAf6zzPF3V7SbOuVlubL3m7GWZp4ZYsowHR020VPUDAEiy+srv96e6+QFbsg5i
	GwPEZke
X-Google-Smtp-Source: AGHT+IHbR0TgrZnHWoh6mc9uul5rXSlPg9jvMrr3O/Uj9MClMiXC9JDrYVKVApD3TRnHdcHCmHq6uDJ+bvpNQuMqzr4=
X-Received: by 2002:a05:690c:38b:b0:708:cd31:88a9 with SMTP id
 00721157ae682-71952350c3amr27819927b3.37.1752834451459; Fri, 18 Jul 2025
 03:27:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <aGjUpI1yNjEhSiAq@brak3rDesk>
In-Reply-To: <aGjUpI1yNjEhSiAq@brak3rDesk>
From: Rujra Bhatt <braker.noob.kernel@gmail.com>
Date: Fri, 18 Jul 2025 15:57:20 +0530
X-Gm-Features: Ac12FXxoU6aFudyIJiyv4FHEoGIyv9QfAgoxU9dgMhQNxFSC-pmiUNMnb69ONhU
Message-ID: <CAG+54DZQC+-6E-P3D4BUtVujNegL1qKpcB5SGh28+rX5hrHFiw@mail.gmail.com>
Subject: Re: [PATCH] arc:kernel:perf_event.c : replaced sprintf with sysfs_emit()
To: peterz@infradead.org, mingo@redhat.com, acme@kernel.org, 
	namhyung@kernel.org, mark.rutland@arm.com, alexander.shishkin@linux.intel.com, 
	jolsa@kernel.org, irogers@google.com, adrian.hunter@intel.com, 
	kan.liang@linux.intel.com, vgupta@kernel.org
Cc: linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-snps-arc@lists.infradead.org, skhan@linuxfoundation.org, 
	linux-kernel-mentees@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Sat, Jul 5, 2025 at 1:00=E2=80=AFPM Rujra Bhatt <braker.noob.kernel@gmai=
l.com> wrote:
>
> Replaced sprintf() with sysfs_emit() in sysfs*_show() function in
> perf_event.c file to follow the kernel's guidelines from
> documentation/filesystems/sysfs.rst
> This will improve consistency, safety, and makes it easier to maintain
> and update in future.
>
> Signed-off-by: Rujra Bhatt <braker.noob.kernel@gmail.com>
> ---
>  arch/arc/kernel/perf_event.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/arc/kernel/perf_event.c b/arch/arc/kernel/perf_event.c
> index ed6d4f0cd621..424ec072c441 100644
> --- a/arch/arc/kernel/perf_event.c
> +++ b/arch/arc/kernel/perf_event.c
> @@ -648,7 +648,7 @@ static ssize_t arc_pmu_events_sysfs_show(struct devic=
e *dev,
>         struct perf_pmu_events_attr *pmu_attr;
>
>         pmu_attr =3D container_of(attr, struct perf_pmu_events_attr, attr=
);
> -       return sprintf(page, "event=3D0x%04llx\n", pmu_attr->id);
> +       return sysfs_emit(page, "event=3D0x%04llx\n", pmu_attr->id);
>  }
>
>  /*
> --
> 2.43.0
>

Gentle reminder for the replacement of sprintf() with the sysfs_emit(), kin=
dly
review it.

Thanking you,
regards,
Rujra Bhatt
