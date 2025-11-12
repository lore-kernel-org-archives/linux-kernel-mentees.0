Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73EE72D0C9D
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 12 Nov 2025 20:30:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762979412; cv=none; b=VL3xXO0TCvuG9KCmvDwqkMM4+IDEa2RzWSAtyl8ckqX4CiKqq0NoPmOxpTpICdsicrmqyQ9HvQr3anbM3PhPZiqhBzmwfQPdNF4Gjf/E3kemhjkDIwZ4a8BBweRlgrz4U04uglvb0qTQOqypnDi4dAVm6+DuCOerDp3cjRAL+io=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762979412; c=relaxed/simple;
	bh=DtbSXMnbv13JS9DE85J2oaC+TTvxz/CxHMp+L2EbBis=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fkg/WxqDNy9NjdptXHtvmqz1DpxpibLpo0bEqcqVT24j6n8eEQNLgk+t2/sgVSDlHUbUuvxnS+tLLkZ1VmGXhgWsebuoKFd4O5/M3O8qD3XUokbtTs6/sxnkEx3P3ARoclmkZe7lNn4L96SOccmixRkk2MfXlpDEv2YIpVmEe+c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=C0itpN98; arc=none smtp.client-ip=140.211.166.138
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="C0itpN98"
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1019080DCA
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 12 Nov 2025 20:30:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level:
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ShQbMXykT7Co for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 12 Nov 2025 20:30:10 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::e29; helo=mail-vs1-xe29.google.com; envelope-from=kubik.bartlomiej@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 1FD1680F2C
Authentication-Results: smtp1.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1FD1680F2C
Authentication-Results: smtp1.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=C0itpN98
Received: from mail-vs1-xe29.google.com (mail-vs1-xe29.google.com [IPv6:2607:f8b0:4864:20::e29])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 1FD1680F2C
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 12 Nov 2025 20:30:09 +0000 (UTC)
Received: by mail-vs1-xe29.google.com with SMTP id ada2fe7eead31-5dfa9e34adbso81386137.0
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 12 Nov 2025 12:30:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762979408; x=1763584208; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vwZOhDKhg6nzefR9evpVQL7Ofqz3agKHaVIZRWUuIFQ=;
        b=C0itpN98ixdrp6zzqx7Un1kvwo3U3gPfYBgsVjdQg4hzj9AXH8BJ3nL3tXgbtCKwsb
         gMeeXsVO3nUlT7RmEWYA1QUuOlGNRyjhC9cqHk4WW9Y5Yr2Tp7touvW0rx+RK6IYoHh0
         ycCAu91vnyBko4q4NxNmCbXCYUxxozy3p+l3tZlJkmgBw8gibx7wqwV/MQBDjWhqrHSx
         f1iEJtv1nR8YMF5lIKHXfJ04bT5bdDY1+tP2pfs5wG+zUdS2dlWJ+X2fpEpVpeMdA2pX
         jhMqp6gCsl9mjb44jlFHQAL1eI9oNZPCLEvDU4JanVrueghjjrnFb8YtbAGmd0tyJAIP
         326A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762979408; x=1763584208;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=vwZOhDKhg6nzefR9evpVQL7Ofqz3agKHaVIZRWUuIFQ=;
        b=gpuQ9A3FSg+mFch1ZUI9YOLzLCfAR7PycgwhvnP/l2JmTZEmdGNI+ip/F4zaaelm0I
         muFHIhM/wNsgZA5Mv/hy5cvLat0Su5K0s09KI3urUKmyu9EWXhJVhTW7RDFfQBNWceRM
         km+RVDaku6qGXW/KWTngdKx9Rafrvu4a4sB0PfXWtXrKgKzXyFQz0/E9UIA/kjxrQr5x
         P63WxqvMwUGmBWNtPqadk0iM9OR2rDM0k3uOPapTgjdhQuFU7Zj33awAFQGgz70ghM6f
         SGRrLMO998IHfqSt2v+TjCmUozLPGcvsmR6fN/3hY9yI1/+ndHqGWMY4aBHwMqw+wOZL
         MlWA==
X-Forwarded-Encrypted: i=1; AJvYcCUaq6BvP7hO15utzPswTtBfNu1GvZUGJLBxhTm3nR0C2VTvvmNQ5grp7/QK6z9UA9qB4Y+QqX7zLny6kzHnc0yY7vyjwA==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0Yw4BhzlC07bBlMjbZ5vgnP1kxX9wbwbRJbU+JTf8HX6gEdFGins
	QG/zbG6mlcLSN+rK9bynYnPT8pAv3qJjBNnh0BbASjBFhAqhdRWk88CJ8jR3tLO6Ur7x1AU50gn
	H/FnVbUSyNDoJNkFRxBC5ppcKrWefW3E=
X-Gm-Gg: ASbGnctPcsbYyeX/T6F3cwvGDOtMUdiptKSV1U6IWpmEEFFL0yX+04chxj/4pTs/Egx
	fAnm7KbGq2QRchZ3W2mQaPTyG3H1DcfEG/l5noc26Xcqf+31lQyKbVlaS2sfwByBb//TVHWkNXG
	QClqQLELXU0P98TW1tqpjT+CqT3xtUwS8tjrAsxbyZ2ry82kFZR16OHe4D95j9k8I5e2PPuh+zm
	7cgnzo0HnQ6qx6iePaMKlpvylUQDUwAZnSrlDOjmgi8i5uObbEQc4MX+fy4H/jZVhV0Gm2O51b3
	JQJlYhP5hAbOmBI/2ergQB/EgvAqo4GR9alQpoJIYb0dKoo=
X-Google-Smtp-Source: AGHT+IFHYQYlB5H/vZO6pAE59Ra+lPGYc/9oEwXWmHHStsX1pd0NaLKAa+GMJ2VwQwjA/HrEVrmE3Ft6/3DaLcbhLUU=
X-Received: by 2002:a05:6102:441f:b0:5db:ee3e:860e with SMTP id
 ada2fe7eead31-5de07ceedcemr1597457137.1.1762979408635; Wed, 12 Nov 2025
 12:30:08 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251028145534.95457-1-kubik.bartlomiej@gmail.com>
In-Reply-To: <20251028145534.95457-1-kubik.bartlomiej@gmail.com>
From: =?UTF-8?Q?Bart=C5=82omiej_Kubik?= <kubik.bartlomiej@gmail.com>
Date: Wed, 12 Nov 2025 21:29:56 +0100
X-Gm-Features: AWmQ_bnLwOfcWQPWIKmUoND1n7tdM12UUbgDYcwxauU_Xcm3P8dYRzc2Y6PS87Y
Message-ID: <CAPqLRf2vo6pVbF6C4LtReBwH1VaMQzEGGyd2NuFxbLMZykqM1g@mail.gmail.com>
Subject: Re: [PATCH RFT v2] driver/scsi/mpi3mr: Fix build warning for mpi3mr_start_watchdog
To: sathya.prakash@broadcom.com, kashyap.desai@broadcom.com, 
	sumit.saxena@broadcom.com, sreekanth.reddy@broadcom.com
Cc: martin.petersen@oracle.com, mpi3mr-linuxdrv.pdl@broadcom.com, 
	linux-scsi@vger.kernel.org, skhan@linuxfoundation.org, khalid@kernel.org, 
	david.hunter.linux@gmail.com, linux-kernel-mentees@lists.linuxfoundation.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 28 Oct 2025 at 15:55, Bartlomiej Kubik
<kubik.bartlomiej@gmail.com> wrote:
>
> GCC warning:
> drivers/scsi/mpi3mr/mpi3mr_fw.c:2872:60: warning: =E2=80=98%s=E2=80=99 di=
rective
> output may be truncated writing up to 63 bytes into a region of size
> 41 [-Wformat-truncation=3D]
>
> Change MPI3MR_WATCHDOG_NAME_LENGTH define to properly clarify
> the required buffer size.
>
> The mrioc->watchdog_work_q_name buffer in
> the mpi3mr_start_watchdog() function no longer requires adding mrioc->id,
> since mrioc->name already includes it.
>
> mrioc->name is built using:
> sprintf(mrioc->name, "%s%d", mrioc->driver_name, mrioc->id)
>
> Signed-off-by: Bartlomiej Kubik <kubik.bartlomiej@gmail.com>
> ---
>
> I do not have the hardware to full tests it.
> Tests only built kernel without warning and run kernel.
>
> Changelog:
> Changes since v1:
> - Add define MPI3MR_WATCHDOG_NAME_LENGTH (MPI3MR_NAME_LENGTH + 15)
> - Change watchdog_work_q_name buffer from size 50 to MPI3MR_WATCHDOG_NAME=
_LENGTH
>
> Link to v1
> https://lore.kernel.org/all/20251002063038.552399-1-kubik.bartlomiej@gmai=
l.com/
>
>  drivers/scsi/mpi3mr/mpi3mr.h    | 3 ++-
>  drivers/scsi/mpi3mr/mpi3mr_fw.c | 3 +--
>  2 files changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/scsi/mpi3mr/mpi3mr.h b/drivers/scsi/mpi3mr/mpi3mr.h
> index 6742684e2990..be15d5ec8b58 100644
> --- a/drivers/scsi/mpi3mr/mpi3mr.h
> +++ b/drivers/scsi/mpi3mr/mpi3mr.h
> @@ -66,6 +66,7 @@ extern atomic64_t event_counter;
>
>  #define MPI3MR_NAME_LENGTH     64
>  #define IOCNAME                        "%s: "
> +#define MPI3MR_WATCHDOG_NAME_LENGTH (sizeof("watchdog_") + MPI3MR_NAME_L=
ENGTH + 1)
>
>  #define MPI3MR_DEFAULT_MAX_IO_SIZE     (1 * 1024 * 1024)
>
> @@ -1265,7 +1266,7 @@ struct mpi3mr_ioc {
>         spinlock_t fwevt_lock;
>         struct list_head fwevt_list;
>
> -       char watchdog_work_q_name[50];
> +       char watchdog_work_q_name[MPI3MR_WATCHDOG_NAME_LENGTH];
>         struct workqueue_struct *watchdog_work_q;
>         struct delayed_work watchdog_work;
>         spinlock_t watchdog_lock;
> diff --git a/drivers/scsi/mpi3mr/mpi3mr_fw.c b/drivers/scsi/mpi3mr/mpi3mr=
_fw.c
> index 8fe6e0bf342e..18b176e358c5 100644
> --- a/drivers/scsi/mpi3mr/mpi3mr_fw.c
> +++ b/drivers/scsi/mpi3mr/mpi3mr_fw.c
> @@ -2879,8 +2879,7 @@ void mpi3mr_start_watchdog(struct mpi3mr_ioc *mrioc=
)
>
>         INIT_DELAYED_WORK(&mrioc->watchdog_work, mpi3mr_watchdog_work);
>         snprintf(mrioc->watchdog_work_q_name,
> -           sizeof(mrioc->watchdog_work_q_name), "watchdog_%s%d", mrioc->=
name,
> -           mrioc->id);
> +           sizeof(mrioc->watchdog_work_q_name), "watchdog_%s", mrioc->na=
me);
>         mrioc->watchdog_work_q =3D alloc_ordered_workqueue(
>                 "%s", WQ_MEM_RECLAIM, mrioc->watchdog_work_q_name);
>         if (!mrioc->watchdog_work_q) {
> --
> 2.39.5
>

Hi,

I submitted this patch about two weeks ago but haven't received any
feedback yet.
I wanted to check if there are any concerns with the patch or if any
changes are needed.

Please let me know if you need any additional information.

Best regards
Bart=C5=82omiej Kubik
