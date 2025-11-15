Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21F4A296BC3
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sat, 15 Nov 2025 14:31:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763217075; cv=none; b=VeD37ZnlWiSYSzJk/SEJ2AA2uyQp6rIevExYWG9rM+Oik7US4xg61u6gVhLULhgK6cI4NVEOrGFxfs1pyilzT7gMM2P4m3rSrswRt14J7C3nWnENxzVIqdg/vovL47p1JHDrBqqydF022Jw67jTfCCW7R/vhuEy1/W6rMCP1Hwk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763217075; c=relaxed/simple;
	bh=HCh1AbItHBot1NefhnEc/xtCfs1nqqOG8nCz/nzyiIg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sVcNqYugU4iMU3mbAt1uMqsFKRCai+Htj6G7Kmo5Wm6LgMmqKQzITuemPAHgKjY57rwLsUjTbmJhQe9cqn/aMac+DtOYojITQNtlVLuh7D9JwPgv6XvkTLWqkch6ZOqnARDJbuP/qvqxV4uY2hhITKqzIgu51Vrq8RJjuIr9Mq0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MTNR6qpS; arc=none smtp.client-ip=140.211.166.138
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MTNR6qpS"
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B9E33841D0
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sat, 15 Nov 2025 14:31:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level:
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Dl2SBi4PDqrV for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 15 Nov 2025 14:31:13 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::e35; helo=mail-vs1-xe35.google.com; envelope-from=kubik.bartlomiej@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org C9D78841B7
Authentication-Results: smtp1.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C9D78841B7
Authentication-Results: smtp1.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=MTNR6qpS
Received: from mail-vs1-xe35.google.com (mail-vs1-xe35.google.com [IPv6:2607:f8b0:4864:20::e35])
	by smtp1.osuosl.org (Postfix) with ESMTPS id C9D78841B7
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sat, 15 Nov 2025 14:31:12 +0000 (UTC)
Received: by mail-vs1-xe35.google.com with SMTP id ada2fe7eead31-5dbe6304b79so1076231137.3
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Sat, 15 Nov 2025 06:31:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763217071; x=1763821871; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=L/zsgxjumAghjp5NTUgp2Dj0RhDrX5umNkGyHZM347g=;
        b=MTNR6qpSrcBoRfIEVpQ4mY1jJtgy3/E62WOLkltIFRvNjgLN9exU4eRRdPRb4nZlZv
         aXARlQiZB5h34xixtXgCxdVcb3PP83TzZvF38wyYGJAb/qmuYetYvspjB5MdVIQuLMZo
         RNuYmeWAFutp+qzl31ugw5EVlm1N/QkKAYGuRIWpGTCtiGbuUUh+8Gwa7BTR74tqrzU8
         gy9pm+mJLRyOEjH7vFyL9z9jL7IZLNBDE8D14kczPxbzLj0JqGsRstX1lDr4fdYUhBH/
         oL+1dVgMrHWNFQOsk7f2VmwTeuBFS35KA35GOFPfs9wYo1VvO4WU5sBEIq8kQ7Gu4Owz
         I6Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763217071; x=1763821871;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=L/zsgxjumAghjp5NTUgp2Dj0RhDrX5umNkGyHZM347g=;
        b=O1C6kqNB2MJ0OsD2lMBjTES/L5jHNQUn5heyUZlTSOcW65haRdApaxkQFFA+YvF3UY
         h5z3q6KpT5WT9ApYf9tB+2ZS85o7yWf7QCyxgSJb+2CknQ3QtakUZf3VTi4eycTKOwIp
         eGa/qYLPL6or7qctf1uhXbykKIbOvteaE5IsmsE5mZOAqBhQ1Y0b39rMgrRRxssQtJKv
         vGUbLLSnwd9DFMpp/N4mK2h2fyeI2FejUejpCyl+sTjH0q6EffE9oChkMOXyQORsYa5n
         BVjihRWHEL29jOz8kKe8Knaw80S+BnBYLil+QKMSq5OavJK8E6ld+33RP+jixvSEzPMC
         4vyg==
X-Forwarded-Encrypted: i=1; AJvYcCVcXLpiMcU4SGgZF5izUKseoNlmyaKWoeIdS4b4YfR8nmj0FnfX52w7MnKWkVqpSoj+RT2h84RoEYamXadUf84aVaZxAA==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0Yyc1xGznaGdz7SVFSsFaY66FWzwywuulPYYWriyOJSWBNQrWJpb
	raNH1XVr6I7jr2IMTt0kT8UWipMWshKI/PCU10vSkyDGHYIqj8bDKcnAElq8xxCSB6zDt84OtlH
	XJ9uufh0j0/51j9Q7ZRKl9eaXN1GHhwA=
X-Gm-Gg: ASbGncsc3Z5h2gf/jFhtbzenecXLHllL8F33jGXLyGbBsLETgekpYRdJqOnkqQbC5tF
	SYKLGtEhbNnD1bPeBc5BHT7Uz38rtzzTYeXCRNi1O3dA5FxJd+XJyI4HOwI045MbjBfp+Z6H0z6
	sLUlDTKmrlGPiU3MFAcyy7XqdKIKeOhQCSrvDvyk+O+iK1Fts/WVYwauS4VV/4km3gMhApqKpZI
	3RC7e0ze+9ApIeJWRAo6pp8ggUhGp/f9keBfd8L3skhVAL1RL/quqMaR5AyBXbdQNI6Egr2+k9u
	5Iyw3iaY8RjKaHCR7F09HZvO0ytPWR8NfSXXWdcb0qQvDK7iZGmdZv3E1g==
X-Google-Smtp-Source: AGHT+IEqXthhXr4xd8zhDNKcc8uuAbcCd1a0DH0E8A483J5NHlU1YyQoSY6GhKMrR09mqYLXqhzbYM6XzukHMCRB13Q=
X-Received: by 2002:a05:6102:374e:b0:5db:a6c1:5b13 with SMTP id
 ada2fe7eead31-5dfc5b9e406mr2471341137.33.1763217071323; Sat, 15 Nov 2025
 06:31:11 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251028145534.95457-1-kubik.bartlomiej@gmail.com>
 <562fa035-c732-4bfc-8439-2279d029f72a@acm.org> <CAPqLRf1-zb3v2hMDexM4zCtAtr+yzwQdeSrkzssfo0rkmLo=mA@mail.gmail.com>
In-Reply-To: <CAPqLRf1-zb3v2hMDexM4zCtAtr+yzwQdeSrkzssfo0rkmLo=mA@mail.gmail.com>
From: =?UTF-8?Q?Bart=C5=82omiej_Kubik?= <kubik.bartlomiej@gmail.com>
Date: Sat, 15 Nov 2025 15:31:00 +0100
X-Gm-Features: AWmQ_bnQWhJkFitrpJackQLV__jZ-yjP9nqpKYf6SwLg52eMCuK1zIXwP1iCp9s
Message-ID: <CAPqLRf2eyK2bRess785AB6C2+Mj4U1CGyT6n4spkJy+_gNc9-A@mail.gmail.com>
Subject: Re: [PATCH RFT v2] driver/scsi/mpi3mr: Fix build warning for mpi3mr_start_watchdog
To: Bart Van Assche <bvanassche@acm.org>
Cc: sathya.prakash@broadcom.com, kashyap.desai@broadcom.com, 
	sumit.saxena@broadcom.com, sreekanth.reddy@broadcom.com, 
	martin.petersen@oracle.com, mpi3mr-linuxdrv.pdl@broadcom.com, 
	linux-scsi@vger.kernel.org, skhan@linuxfoundation.org, khalid@kernel.org, 
	david.hunter.linux@gmail.com, linux-kernel-mentees@lists.linuxfoundation.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

Apologies for my previous email - I mistakenly hit send before completing
my full response.

Thanks for your time and review.

On Wed, 12 Nov 2025 at 21:55, Bart Van Assche <bvanassche@acm.org> wrote:
>
> On 10/28/25 7:55 AM, Bartlomiej Kubik wrote:
> > -     char watchdog_work_q_name[50];
> > +     char watchdog_work_q_name[MPI3MR_WATCHDOG_NAME_LENGTH];
>
>  From include/linux/workqueue.h:
>
>         WQ_NAME_LEN             =3D 32,
>
>         char                    name[WQ_NAME_LEN]; /* I: workqueue name *=
/
>
> In other words, increasing the workqueue name length beyond 32
> characters is not useful because it will get truncated to 32 characters
> anyway. The workqueue implementation complains about longer names as one
> can see in kernel/workqueue.c:
>
>         if (name_len >=3D WQ_NAME_LEN)
>                 pr_warn_once("workqueue: name exceeds WQ_NAME_LEN. Trunca=
ting to: %s\n",
>                              wq->name);

Yes. My mistake: I did not see this before. I walked through the path
where watchdog_work_q_name is used, but I did not go too deep.
I found this when building the kernel and GCC returned a warning.
I saw a couple of months ago that the watchdog_work_q_name size was
increased from 20 to 50, and MPI3MR_NAME_LENGTH was also changed
from 32 to 64.

> > diff --git a/drivers/scsi/mpi3mr/mpi3mr_fw.c b/drivers/scsi/mpi3mr/mpi3=
mr_fw.c
> > index 8fe6e0bf342e..18b176e358c5 100644
> > --- a/drivers/scsi/mpi3mr/mpi3mr_fw.c
> > +++ b/drivers/scsi/mpi3mr/mpi3mr_fw.c
> > @@ -2879,8 +2879,7 @@ void mpi3mr_start_watchdog(struct mpi3mr_ioc *mri=
oc)
> >
> >       INIT_DELAYED_WORK(&mrioc->watchdog_work, mpi3mr_watchdog_work);
> >       snprintf(mrioc->watchdog_work_q_name,
> > -         sizeof(mrioc->watchdog_work_q_name), "watchdog_%s%d", mrioc->=
name,
> > -         mrioc->id);
> > +         sizeof(mrioc->watchdog_work_q_name), "watchdog_%s", mrioc->na=
me);
> >       mrioc->watchdog_work_q =3D alloc_ordered_workqueue(
> >               "%s", WQ_MEM_RECLAIM, mrioc->watchdog_work_q_name);
> >       if (!mrioc->watchdog_work_q) {
> Leaving out mrioc->id from the workqueue name seems like an unacceptable
> behavior change to me.

Add twice the same ID one after one. Is it not a mistake ??
If mrioc->name has that same ID at the end.

sprintf(mrioc->name, "%s%d", mrioc->driver_name, mrioc->id)

watchdog_work_q_name is built from mrioc->name which has this ID at the end=
.
If I see correctly, if mrioc->id will be 1 then  watchdog_work_q_name
will look like
watchdog_mpi3mr11, but I think it should be watchdog_mpi3mr1, or am I missi=
ng
something??

> Please consider replacing the proposed changed with this untested patch:

You are correct. I've sent this patch as an RFT because I don't have the
hardware to test this. I would appreciate it if someone could test the prop=
osed
patch for me.

> diff --git a/drivers/scsi/mpi3mr/mpi3mr.h b/drivers/scsi/mpi3mr/mpi3mr.h
> index 6742684e2990..050dcf111a4c 100644
> --- a/drivers/scsi/mpi3mr/mpi3mr.h
> +++ b/drivers/scsi/mpi3mr/mpi3mr.h
> @@ -1076,7 +1076,6 @@ struct scmd_priv {
>    * @fwevt_worker_thread: Firmware event worker thread
>    * @fwevt_lock: Firmware event lock
>    * @fwevt_list: Firmware event list
> - * @watchdog_work_q_name: Fault watchdog worker thread name
>    * @watchdog_work_q: Fault watchdog worker thread
>    * @watchdog_work: Fault watchdog work
>    * @watchdog_lock: Fault watchdog lock
> @@ -1265,7 +1264,6 @@ struct mpi3mr_ioc {
>         spinlock_t fwevt_lock;
>         struct list_head fwevt_list;
>
> -       char watchdog_work_q_name[50];
>         struct workqueue_struct *watchdog_work_q;
>         struct delayed_work watchdog_work;
>         spinlock_t watchdog_lock;
> diff --git a/drivers/scsi/mpi3mr/mpi3mr_fw.c
> b/drivers/scsi/mpi3mr/mpi3mr_fw.c
> index 8fe6e0bf342e..b564fe5980a6 100644
> --- a/drivers/scsi/mpi3mr/mpi3mr_fw.c
> +++ b/drivers/scsi/mpi3mr/mpi3mr_fw.c
> @@ -2878,11 +2878,8 @@ void mpi3mr_start_watchdog(struct mpi3mr_ioc *mrio=
c)
>                 return;
>
>         INIT_DELAYED_WORK(&mrioc->watchdog_work, mpi3mr_watchdog_work);
> -       snprintf(mrioc->watchdog_work_q_name,
> -           sizeof(mrioc->watchdog_work_q_name), "watchdog_%s%d", mrioc->=
name,
> -           mrioc->id);
>         mrioc->watchdog_work_q =3D alloc_ordered_workqueue(
> -               "%s", WQ_MEM_RECLAIM, mrioc->watchdog_work_q_name);
> +               "watchdog_%s%d", WQ_MEM_RECLAIM, mrioc->name, mrioc->id);
>         if (!mrioc->watchdog_work_q) {
>                 ioc_err(mrioc, "%s: failed (line=3D%d)\n", __func__, __LI=
NE__);
>                 return;
>
> Thanks,
>
> Bart.

Best regards
Bart=C5=82omiej Kubik
