Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F4CB2877FA
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sat, 15 Nov 2025 13:47:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.137
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763214461; cv=none; b=dt7ed2Sq7IEmDuZOECBg4tvdnl25pJ09JBRx6ciJLqsyBKJb4dxDLczVSBxUxEb5pz6q7LL4F1mkzCTZH6z96Pof/zmexI1xHjHkxXUWeED4AMkngIyeDfDjQ9YWbqOmw94vVcu5nFSSkzySoHGUJfhmcfeeSMkR+cOSog08Epg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763214461; c=relaxed/simple;
	bh=EVgP9ExVkqCUenc9FH0HcoIhOGOFEP8rgqi5TP+s/v8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tTw3IQm6fQTBkB3oryZM1x4C/ipJ7xRaqFGpcLAWdxLW93GDWY8tXtsPC3ua7cIA7rAv0RAZ4myMaqLUmHIsv8b3cKGZmVvc9ArnFtR4dnH6glKu7H/F7dJfds1kpAi2Vrkbu2fcPmdN94B/gB+TvpE+2ptTtd9rq1vAF/S77d4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XBYvhpwL; arc=none smtp.client-ip=140.211.166.137
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XBYvhpwL"
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 34A7B41113
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sat, 15 Nov 2025 13:47:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level:
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0Xu7ycQ2K3MN for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 15 Nov 2025 13:47:39 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::e30; helo=mail-vs1-xe30.google.com; envelope-from=kubik.bartlomiej@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 518B441112
Authentication-Results: smtp4.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 518B441112
Authentication-Results: smtp4.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=XBYvhpwL
Received: from mail-vs1-xe30.google.com (mail-vs1-xe30.google.com [IPv6:2607:f8b0:4864:20::e30])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 518B441112
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sat, 15 Nov 2025 13:47:39 +0000 (UTC)
Received: by mail-vs1-xe30.google.com with SMTP id ada2fe7eead31-5dbe6304b79so1067275137.3
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Sat, 15 Nov 2025 05:47:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763214458; x=1763819258; darn=lists.linuxfoundation.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=m/gXBXAgqzLo5+JUCiKb5ya5AjR/z9Ngvy4LoMnAnlc=;
        b=XBYvhpwLreYD6r2q7kcFs31dQ0FqnS6Z10UT2AXTBauGrN3XF79lEoohH+za7NmCWb
         rVVqw7foAxgLsGQ+S+0c1Shyx6ink4x0a2alQhrpowkr/kYiN+LZG2JSqP3+kDYoEelF
         TwaRGgMThcpofDZ+h5tZFSSOwhUlhVmWOby9uiaQitWkFHkZR7s1mHuCusav4l8HDr81
         k11lXZdTj7Jxpf7A2YMAjjDf7DXAlZLzjYVBkA4NOrLtLrctMK6acGctWuhH5qPQ2ruM
         FTS9KO4LgqWaGEykYrVcThFKOtULSxQbcxEJrEwGmL3r9tElFT5fQC+EP0WGrmVZ1MOG
         vKlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763214458; x=1763819258;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=m/gXBXAgqzLo5+JUCiKb5ya5AjR/z9Ngvy4LoMnAnlc=;
        b=OEVqzrsXn8iXXSr0eKrddf+sr6WL0UaunQRF9ZLk+9oBnzB3YC1YUjjJUy5Zy9EuIH
         31uKv2HIMwRNpXWcf6wlsX2A211X9ltV4NHr5/s4zGMGA6oHW8/nzPQbGGrVJAX7Ogme
         YdFC6OM5pKAaF6DJmAWuHjVa4iYjOxmvwr+WhA3eKR9HvRI0nnUaQe2hBkLa3GKwHvJQ
         PIF52HaTcyiZXYdpBuedYRDgqBghyGIPTBi1fG2dJQJPyipOcL2ik2XPXWi4Fes9hTS1
         kkd3Q7J/RSVAAjQfPx4lRXx/X9C0OB6X1Z0W5jWvM8QGb97VuWJzo8BS9WEf8KEH9nto
         JV/Q==
X-Forwarded-Encrypted: i=1; AJvYcCXZDptAwg/5t0HzCB6ZLOreaoNPG5uVNBZ4LBtMpVLlxuOzYAgV5ArcRAwbZi2yN2hKo3bq42FArrrenz9Jha3qzihk0A==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0Yz1ftL/UZhjQ71bAlvzY2JzYmhTYFbestg9YMEgQxsbM/k//Ahg
	DZnnpiy2WAr/PZ9RWKrU6ztz4Fkn+OmLvtVmlEgjXJ8n2Zc/Uyb1hSnT1HaFGI7Sjj2MjTnwrQy
	EkAPo+RF+IvZH1tOdCK9RR1Uv507haoo=
X-Gm-Gg: ASbGncsqwg/gWdEvCrWVt0b3cpR3VIRcrYzLIW/kcGnmp429+lUbkmYnztf4s7LFzbP
	BCKAtHE7e+DU+NZtNd8S3SJKMNmuk9NrakHqBFLQ6RGiShq5RJzF6ZITlkMAi/uwT7ey5oNc6wo
	TAzpLr5NvcKQOzARexM1kP5/ZBh1AkMgrnngoJSrsXi3wHL28liEHckhLuXeiuaeS4uOaAVNNMl
	C0lAAKyLXYKiuAAglOrSaStpw9uVMwE4Yy9p01j8HA/aOaKE8CN2MDDMUFbcRsT7hxOokVgDCOV
	bOPrP7m0Dl9miJnQ0PtSHdG1koa3bCQLboiAEXN1k/gm2uQ=
X-Google-Smtp-Source: AGHT+IHWKU/4RdU4gvqjTx7OcBVkWnGkX4o4XGexGqQflsQR7RNiXUTmBdhLzKSVU5OxwWlzQHQEcUFRCkdt/uYGNiY=
X-Received: by 2002:a05:6102:15c6:b0:5dd:b2ee:c6ff with SMTP id
 ada2fe7eead31-5dfc554efc6mr1692122137.8.1763214457248; Sat, 15 Nov 2025
 05:47:37 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251028145534.95457-1-kubik.bartlomiej@gmail.com> <562fa035-c732-4bfc-8439-2279d029f72a@acm.org>
In-Reply-To: <562fa035-c732-4bfc-8439-2279d029f72a@acm.org>
From: =?UTF-8?Q?Bart=C5=82omiej_Kubik?= <kubik.bartlomiej@gmail.com>
Date: Sat, 15 Nov 2025 14:47:26 +0100
X-Gm-Features: AWmQ_bmOozScg0utOIPVx1HD9iuU9Npr5RrozIq1rF3X8kP6d0exCiltHGGVvX0
Message-ID: <CAPqLRf1-zb3v2hMDexM4zCtAtr+yzwQdeSrkzssfo0rkmLo=mA@mail.gmail.com>
Subject: Re: [PATCH RFT v2] driver/scsi/mpi3mr: Fix build warning for mpi3mr_start_watchdog
To: Bart Van Assche <bvanassche@acm.org>
Cc: sathya.prakash@broadcom.com, kashyap.desai@broadcom.com, 
	sumit.saxena@broadcom.com, sreekanth.reddy@broadcom.com, 
	martin.petersen@oracle.com, mpi3mr-linuxdrv.pdl@broadcom.com, 
	linux-scsi@vger.kernel.org, skhan@linuxfoundation.org, khalid@kernel.org, 
	david.hunter.linux@gmail.com, linux-kernel-mentees@lists.linuxfoundation.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi,

Thanks for your time and review.

On Wed, 12 Nov 2025 at 21:55, Bart Van Assche <bvanassche@acm.org> wrote:
>
> On 10/28/25 7:55 AM, Bartlomiej Kubik wrote:
> > -     char watchdog_work_q_name[50];
> > +     char watchdog_work_q_name[MPI3MR_WATCHDOG_NAME_LENGTH];
>
>  From include/linux/workqueue.h:
>
>         WQ_NAME_LEN             = 32,
>
>         char                    name[WQ_NAME_LEN]; /* I: workqueue name */
>
> In other words, increasing the workqueue name length beyond 32
> characters is not useful because it will get truncated to 32 characters
> anyway. The workqueue implementation complains about longer names as one
> can see in kernel/workqueue.c:
>
>         if (name_len >= WQ_NAME_LEN)
>                 pr_warn_once("workqueue: name exceeds WQ_NAME_LEN. Truncating to: %s\n",
>                              wq->name);
>

Yes. My mistake: I did not see this before. I walked through the path
where watchdog_work_q_name
is used, but I did not go too deep. I found this when building the
kernel and GCC returned a warning.
I saw a couple of months ago that the watchdog_work_q_name size was
increased from 20 to 50,
and MPI3MR_NAME_LENGTH was also changed from 32 to 64.

> > diff --git a/drivers/scsi/mpi3mr/mpi3mr_fw.c b/drivers/scsi/mpi3mr/mpi3mr_fw.c
> > index 8fe6e0bf342e..18b176e358c5 100644
> > --- a/drivers/scsi/mpi3mr/mpi3mr_fw.c
> > +++ b/drivers/scsi/mpi3mr/mpi3mr_fw.c
> > @@ -2879,8 +2879,7 @@ void mpi3mr_start_watchdog(struct mpi3mr_ioc *mrioc)
> >
> >       INIT_DELAYED_WORK(&mrioc->watchdog_work, mpi3mr_watchdog_work);
> >       snprintf(mrioc->watchdog_work_q_name,
> > -         sizeof(mrioc->watchdog_work_q_name), "watchdog_%s%d", mrioc->name,
> > -         mrioc->id);
> > +         sizeof(mrioc->watchdog_work_q_name), "watchdog_%s", mrioc->name);
> >       mrioc->watchdog_work_q = alloc_ordered_workqueue(
> >               "%s", WQ_MEM_RECLAIM, mrioc->watchdog_work_q_name);
> >       if (!mrioc->watchdog_work_q) {
> Leaving out mrioc->id from the workqueue name seems like an unacceptable
> behavior change to me.

Add twice the same ID one after one. Is it not a mistake ??
If mrioc->name has that same ID and the end.

sprintf(mrioc->name, "%s%d", mrioc->driver_name, mrioc->id)

We build watchdog_work_q_name from that and add twice the same ID.
At the end If I correct see watchdog_work_q_name will looks like
watchdog_mpi3mr11



> Please consider replacing the proposed changed with this untested patch:
>
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
> @@ -2878,11 +2878,8 @@ void mpi3mr_start_watchdog(struct mpi3mr_ioc *mrioc)
>                 return;
>
>         INIT_DELAYED_WORK(&mrioc->watchdog_work, mpi3mr_watchdog_work);
> -       snprintf(mrioc->watchdog_work_q_name,
> -           sizeof(mrioc->watchdog_work_q_name), "watchdog_%s%d", mrioc->name,
> -           mrioc->id);
>         mrioc->watchdog_work_q = alloc_ordered_workqueue(
> -               "%s", WQ_MEM_RECLAIM, mrioc->watchdog_work_q_name);
> +               "watchdog_%s%d", WQ_MEM_RECLAIM, mrioc->name, mrioc->id);
>         if (!mrioc->watchdog_work_q) {
>                 ioc_err(mrioc, "%s: failed (line=%d)\n", __func__, __LINE__);
>                 return;
>
> Thanks,
>
> Bart.
