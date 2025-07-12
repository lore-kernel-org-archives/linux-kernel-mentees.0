Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA9315258
	for <linux-kernel-mentees@lists.linux.dev>; Sat, 12 Jul 2025 17:12:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752340325; cv=none; b=P58+ePIkYP+gl9yKJdAWayEVPl1NjzQfafSLhKrYqQdEGY8/6pT13oJOr8HHoo9BgVq6PbZdEQ7GUfpyqWP9HyxGpYts8zQTEViprQtYjdYnx64XlpTd4JerSgN/a1Ig0iwAFbYmtrt943v4QHbti1MlNgFN31QBltnqwrqWrZU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752340325; c=relaxed/simple;
	bh=8aN8Lggjc+78El6nxcKpMhrfSv8uxqhToi/9AVMmQZ0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=omsVp5PGPDqUF/fl+NQ+41iryv+q/dfa4qOVpqiYqUXZjJLSSMTHDYodBh1ybF6yw3oxEYep87CSldzauMDn5uH/ZS25R4mqa8L4s0fYl4sUjXPi/S3MHhhFzccCf5od01fz9HAnUs7ta/u59okEPxhMOYh1ZSZ+/tG2NhNmFaQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Mda3CSMI; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Mda3CSMI"
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-553be4d2fbfso3506714e87.0
        for <linux-kernel-mentees@lists.linux.dev>; Sat, 12 Jul 2025 10:12:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752340322; x=1752945122; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZJVhCeS8COyKFGy1fiTAFuCQ8rCKhrZIJE4Iij87klY=;
        b=Mda3CSMIzqXxr4bng3EhHcaGVler76eHOInqxnyGmMR0mVWRBg6w7ewM714mWzH8c4
         7I8JeDzwIm0Fprzz+r9pJfWXhDw1vqke+hj5gNSWAcIwmgsNPyR62JNfIKOK1NZTw78M
         WisL3a5s032Nzk/0cM/HHvLJ6JzbZX/s2GPVkr/qWAZ8ZXe6tZwEBP/D4DFeok8AgOeV
         z3wmetz1gNQ3spmyU4/stWlnhstap3VsIhcTIUJ/s4c9zV/Lb9VpUsKyk1R5T6TUIyyD
         ccllbfgrBrtn3tGbHDLQaZ6bpqun4Xd3KjIarry+JAYFafZH39rv0swDrCFg2vfmuCWL
         /cBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752340322; x=1752945122;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZJVhCeS8COyKFGy1fiTAFuCQ8rCKhrZIJE4Iij87klY=;
        b=dXddxXkGzgKNTeSeIJsEP+3J3MrSkjvXFvIQVzxj5j2tBZv8CYcTEYE2bjB6iiAUW3
         17gOpRfPM14963I7os3q2uVAtOGAVNrKkDwbiNd1sVlz0p3cmP6V6kZ0UjrB2Ai1KfOZ
         ifHGTc77dariihV/BgXlYBsgH9OgW2pHI9HYIFB95C/ib49Z13aQyukVvctXSHawoKfa
         YXhq4tIdYJE6phQZ/RB8tDlsnXENWwRzdNwhi88+6kommL6bKLm53NWsUaAI37TqjPE+
         M/02Ny2vz+czeh0fHfRQgnE+8YGtbR62phPcKfNp1UOT39DUV4M0JAkhRvF6PndNt8h3
         8u2Q==
X-Forwarded-Encrypted: i=1; AJvYcCUz1ZWkQUVJC6spqOujiRXYiEVSE2Dmqk/AX/XkXu8xSKt61003236FK2ByPg6h+ftMW32ixcRSNHODLmon+myUKbM1tw==@lists.linux.dev
X-Gm-Message-State: AOJu0YzZZosnEbu3WhLdl7fEf+zk//YPhZVwbcqjjn5cMOd3QKbMQEbW
	maLS+jkCVbR1Gqzi69mx/IzQdizjiNwmHXLP5BDFLGECk7EqUNzTN90GPuPqGU/3t55WCYaqH0p
	bBKDr0RawM/fGbKKNs/crOyAK86T4kWQ=
X-Gm-Gg: ASbGncuvE/uOOu7uNQbXliscdm2Fo4kzDhNeAyIMgzSvSh8bgKF/W3McQKmvtvnJL1g
	4iJ1jy6ly74NplsvFTchWQAHX0h1tdCITwEBromDPJM+wfb6WuowoxqCFu843KRYjo14/cwcuNj
	+h47OGCYiYKvi5fsCu49oIs7lBIBHLstRbJ4duaBAoLbjbhXEO+23bFGHP4UnXRcG5LhMuCSANg
	41XPZ52Xi8ndR6l+dkNckCSztUYc7vCH6X6LfsM
X-Google-Smtp-Source: AGHT+IHBHk/tuoG0+PYXGt8N9d8SbJKla5JtPf2KgQeMTDOJSuW+Wn0RJ/uDlkqGD5wilalXrpQm9WXERIEwyIdgFks=
X-Received: by 2002:a05:6512:3094:b0:553:2767:e398 with SMTP id
 2adb3069b0e04-55a04634539mr2270254e87.39.1752340321712; Sat, 12 Jul 2025
 10:12:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250630083542.10121-1-pranav.tyagi03@gmail.com> <2025071245-snowsuit-pension-061d@gregkh>
In-Reply-To: <2025071245-snowsuit-pension-061d@gregkh>
From: Pranav Tyagi <pranav.tyagi03@gmail.com>
Date: Sat, 12 Jul 2025 22:41:50 +0530
X-Gm-Features: Ac12FXyzOTCSfI9zC6vRyqve_tIZJrwhdoSUM_hk5T3Og9T1ORDpCYIUbKwmYcU
Message-ID: <CAH4c4jKMvLhgT_-2z_LH9scGQbT3J2tgH-RUXAUJ-5c30251MA@mail.gmail.com>
Subject: Re: [PATCH 5.15.y] ocfs2: fix deadlock in ocfs2_get_system_file_inode
To: Greg KH <gregkh@linuxfoundation.org>
Cc: ocfs2-devel@oss.oracle.com, linux-kernel@vger.kernel.org, mark@fasheh.com, 
	jlbec@evilplan.org, joseph.qi@linux.alibaba.com, 
	pvmohammedanees2003@gmail.com, akpm@linux-foundation.org, sashal@kernel.org, 
	skhan@linuxfoundation.org, stable@vger.kernel.org, 
	linux-kernel-mentees@lists.linux.dev, 
	syzbot+e0055ea09f1f5e6fabdd@syzkaller.appspotmail.com, 
	Junxiao Bi <junxiao.bi@oracle.com>, Changwei Ge <gechangwei@live.cn>, Gang He <ghe@suse.com>, 
	Jun Piao <piaojun@huawei.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Jul 12, 2025 at 7:16=E2=80=AFPM Greg KH <gregkh@linuxfoundation.org=
> wrote:
>
> On Mon, Jun 30, 2025 at 02:05:42PM +0530, Pranav Tyagi wrote:
> > From: Mohammed Anees <pvmohammedanees2003@gmail.com>
> >
> > [ Upstream commit 7bf1823e010e8db2fb649c790bd1b449a75f52d8 ]
> >
> > syzbot has found a possible deadlock in ocfs2_get_system_file_inode [1]=
.
> >
> > The scenario is depicted here,
> >
> >       CPU0                                    CPU1
> > lock(&ocfs2_file_ip_alloc_sem_key);
> >                                lock(&osb->system_file_mutex);
> >                                lock(&ocfs2_file_ip_alloc_sem_key);
> > lock(&osb->system_file_mutex);
> >
> > The function calls which could lead to this are:
> >
> > CPU0
> > ocfs2_mknod - lock(&ocfs2_file_ip_alloc_sem_key);
> > .
> > .
> > .
> > ocfs2_get_system_file_inode - lock(&osb->system_file_mutex);
> >
> > CPU1 -
> > ocfs2_fill_super - lock(&osb->system_file_mutex);
> > .
> > .
> > .
> > ocfs2_read_virt_blocks - lock(&ocfs2_file_ip_alloc_sem_key);
> >
> > This issue can be resolved by making the down_read -> down_read_try
> > in the ocfs2_read_virt_blocks.
> >
> > [1] https://syzkaller.appspot.com/bug?extid=3De0055ea09f1f5e6fabdd
> >
> > [ Backport to 5.15: context cleanly applied with no semantic changes.
> > Build-tested. ]
>
> We can't take a 5.15.y version, without it being in 6.1.y first, sorry
> :(
>

Hi,

Thanks for pointing that out. I wasn=E2=80=99t aware of the 6.1.y prerequis=
ite
for 5.15.y backports. Learned something new today. I=E2=80=99ll make sure t=
o get
it into 6.1.y first.

Regards
Pranav Tyagi
