Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C9B9239573
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue,  7 Oct 2025 20:06:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759867568; cv=none; b=UP1VhX9oYaHuHNEPgL8MoWIkt+81wabe98V7VitffVaCHldnvrnJmzNt+yVO/RvSa/wicBn0HziZc+QRw98fooXALpQUnHS6Z1d2jKL3TfkQDdri1G+C4oVVvGFYxYDHXoeKNgGWqZi5+Y9twkNz/ADFY4dXGGjSbqSixEkNVsI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759867568; c=relaxed/simple;
	bh=WJQxWT6wF/jboV9xo52lOonbbR/k8DBgj6cYsM2PTrc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BJHHXq4NaZIoJWODN13JzomYzI3+bk1ZoWQbYfMLDb4R5nPK8HkfP4VsCkHhagiNgI9qdwx6dauBPFvupGjMCV97BtK/t1UK7t6ZMOxWU96/14EhZfVZF454zmg0JPkmeTda53xQvBEqT5rAHj4ens7RZKkrp0WNDrzm6aPDHOo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kFNmuCNu; arc=none smtp.client-ip=140.211.166.138
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kFNmuCNu"
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C41078110C
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue,  7 Oct 2025 20:06:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level:
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nJe0R6QBKPyi for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  7 Oct 2025 20:06:02 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::e2d; helo=mail-vs1-xe2d.google.com; envelope-from=kubik.bartlomiej@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org EA10E81065
Authentication-Results: smtp1.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EA10E81065
Authentication-Results: smtp1.osuosl.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=kFNmuCNu
Received: from mail-vs1-xe2d.google.com (mail-vs1-xe2d.google.com [IPv6:2607:f8b0:4864:20::e2d])
	by smtp1.osuosl.org (Postfix) with ESMTPS id EA10E81065
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue,  7 Oct 2025 20:06:01 +0000 (UTC)
Received: by mail-vs1-xe2d.google.com with SMTP id ada2fe7eead31-5a2b3bb803bso3822693137.0
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 07 Oct 2025 13:06:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759867560; x=1760472360; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=U4dyxOrFlOFe4U6sjcUwMolCRd6l1aH8+4CTrd86ew0=;
        b=kFNmuCNudO49m+/5eayUMb+p1nquakREuuWkuU/or7O3NUFFQl14JEixfIQYOxN/kB
         ubMIQZlkwq2Vs+bpT7I4U/GHrA0poMULix9yk9qt+kKw2ek2muxJWfB5SeiaBRk61Jmz
         eR5llkAE82H2GT1Zr1/tK3goL9M7zMsq2Z/nVFE548O2zXId1PNv/j/qcEO91SU7a7Rq
         X+H6s1YMgIKfab4REDrWq4LSrWUiPBJ3PEhU9JHEI9vjssjNo02Wkj6/bQdbMyg1ardd
         VD1APvLA6mJ2hYFBrtAl+42FJ2QzaxTNBuhgnQEk0SanpiRcvYJV4fhnmZ6LPBLQmDJ1
         tSxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759867560; x=1760472360;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=U4dyxOrFlOFe4U6sjcUwMolCRd6l1aH8+4CTrd86ew0=;
        b=vO4KLzupyo1qBcN91iee8rQ/0DnUcEQC9PPvUsRj1/ifXLUHwY2dVXAS9Mx0VRibhV
         aEsWILJ9yLgnms6k/xh5ijE3mBi6qlkVDAOmnrAMK1i2CJztmkJLnlvS3tViExh1MK3O
         AWpeC/jm64bCdf1e7GT2iaMb4Jjpw4zWJW53BJEkDztMZU+sVJ+djBVxIlApnTJDTo5r
         ljYV43952Pm56XJEcEasJeJgtBZ5lGXjyngOqi+dsJCnLrFsAidnne9INu80vVuEvM49
         zOlyHWPkjOesGi9hSZgiKJBq0LIWoOoHbUzksfvNZuCeDWhF3PGNXpd5FV40jWGervGk
         MwlA==
X-Forwarded-Encrypted: i=1; AJvYcCWaxGmsWyEX3owHGsvudy7H//E9Kw4WWKenyKAodHSPbS3eJYTYISiAKeR10Ai0rNB/HGqx7Y2KKyQCZXYN397IjdMtxQ==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0YxlEkR21FRjK3bj1XKEpr28MP5ETQYzfIUZNocSZz6Xr6lvf6qq
	StK/jZzj3qF3IEI8HQmnLZlIYrG6Pkn1i7hkuNZTOZ6xgMWHa2IJrqZC5lJHblc1Q94XrCLOBRd
	qJ2QEkJCBimwQOIUUGZX4Btte6IietF8=
X-Gm-Gg: ASbGnctEqzZ0zI+OTPo28w2KwuU+T0vFdpIFlpoU6TDrf8FhQPfZ8JrtEqdvr58XUnk
	Yh2+F41qDq4kDlO0ni9iqtZZyIT6dLzEzPSMX24FteXlJL89Ojx/OEEJzmS77foz+P2VofvnjsS
	8qEde+8qXx+LjRRG/H/UUMgqusFF2WTDh5JQb4c/xH/V65iV08d68C9e07i+lXDzO2pyLN6EjMq
	ZZJbIzcypI17DMEHwqLVZg/PSoxDauI
X-Google-Smtp-Source: AGHT+IGITUrI/yR5IXL/mFkjQlTlGUw1hLwC1/R6yICe1J0nVa6DcOEdCLR2qa/KmQF3kTfOkWB+cDAc8og/Pna9xpA=
X-Received: by 2002:a05:6102:32c6:b0:5a4:69bc:a9e with SMTP id
 ada2fe7eead31-5d5e2347589mr387386137.22.1759867560499; Tue, 07 Oct 2025
 13:06:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251002063038.552399-1-kubik.bartlomiej@gmail.com> <yq1frbvforp.fsf@ca-mkp.ca.oracle.com>
In-Reply-To: <yq1frbvforp.fsf@ca-mkp.ca.oracle.com>
From: =?UTF-8?Q?Bart=C5=82omiej_Kubik?= <kubik.bartlomiej@gmail.com>
Date: Tue, 7 Oct 2025 22:05:49 +0200
X-Gm-Features: AS18NWAPKi7YsXhdeE2n6LOH1QCmcymNQDYp9uK4Va4qllY1OBre7oyhLDjL8DI
Message-ID: <CAPqLRf1GAFR=JAo8yuPZ5XRH2aXJrTk=_b78SUqw0jbv+9hLwQ@mail.gmail.com>
Subject: Re: [PATCH RESEND] driver/scsi/mpi3mr.h: Fix build warning for mpi3mr_start_watchdog
To: "Martin K. Petersen" <martin.petersen@oracle.com>
Cc: sathya.prakash@broadcom.com, kashyap.desai@broadcom.com, 
	sumit.saxena@broadcom.com, sreekanth.reddy@broadcom.com, 
	James.Bottomley@hansenpartnership.com, mpi3mr-linuxdrv.pdl@broadcom.com, 
	linux-scsi@vger.kernel.org, skhan@linuxfoundation.org, 
	david.hunter.linux@gmail.com, linux-kernel-mentees@lists.linuxfoundation.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Martin,

On Tue, 7 Oct 2025 at 04:25, Martin K. Petersen
<martin.petersen@oracle.com> wrote:
>
>
> Hi Bartlomiej!
>
> > Fix watchdog name truncation.
> >
> > In function mpi3mr_start_watchdog, watchdog_work_q_name is build
> > snprintf(mrioc->watchdog_work_q_name,
> >       sizeof(mrioc->watchdog_work_q_name), "watchdog_%s%d", mrioc->name=
,
> >       mrioc->id);
>
> > +#define MPI3MR_WATCHDOG_NAME_LENGTH  (MPI3MR_NAME_LENGTH + 15)
>
> Please document why 15 is the correct number and describe the code path
> which leads to the watchdog name being truncated.
>
> Also (and I guess this is a question for Broadcom since I don't have any
> mpi3mr hardware so I can't check), as far as I can tell, mrioc->name
> already includes mrioc->id so the id will be listed twice in the
> watchdog name? Or am I missing something?
>
> --
> Martin K. Petersen

GCC warn:
drivers/scsi/mpi3mr/mpi3mr_fw.c:2872:60: warning: =E2=80=98%s=E2=80=99 dire=
ctive
output may be truncated writing up to 63 bytes into a region of size
41 [-Wformat-truncation=3D]

In function mpi3mr_start_watchdog:

The mrioc->watchdog_work_q_name is built from the string "watchdog_" +
mrioc->name[64] and + mrioc->id.
Currently snprintf(...) will truncate this string to size
watchdog_work_q_name[50].

I changed watchdog_work_q_name size to:
-> "watchdog_" are 9 characters.
-> mrioc->name[64] up to 64 characters.
-> mrioc->id is u8 value, 3 characters.
-> plus three extra characters for safety.

Yes, as you suggested, mrioc->id is currently appended twice to the
watchdog_work_q_name, which is unnecessary and makes it harder to
read. I will prepare patch v2 to remove the second occurrence of
mrioc->id from watchdog_work_q_name.

Best regards
Bart=C5=82omiej Kubik
