Received: from mail-yx1-f45.google.com (mail-yx1-f45.google.com [74.125.224.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04FED13AA2D
	for <linux-kernel-mentees@lists.linux.dev>; Sun, 23 Nov 2025 02:43:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763865785; cv=none; b=E1WNV4DbVsJVlToFwO+rThrVP/XCJxO/J3evb0llhBa02NmhUDQswfNJp07BQp2RKFN4YN+ty5yRcT81YgNHCuzyDP+L5rSwUY8NqBqLgg+0YHLUC2QMLsRG7Fh/QMpKn0P2K6sv5/TYj/7Cy0LPh88XftQXTJvubxNTZIRouQA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763865785; c=relaxed/simple;
	bh=QJNqamgrj/tPe4iVAA/P47iocBKgtzs1hDkRnlkMBLI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=C6m4bJI1ZvmA6fPWOVxryfCeK8Hle1fLU9B22U2fbEOSwzg3j3DdYn040HCvybVty+Fq9niqRy+tnJOmlFshIcknqUMfL+ylwe2FKIBxSXn+OaM/mei7AgckUkshv5H9zYF4orRsm+Tm6Lc3knHQwmSutId2O7l0Pev8ekr7JWE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ee.vjti.ac.in; spf=none smtp.mailfrom=ee.vjti.ac.in; dkim=pass (1024-bit key) header.d=vjti.ac.in header.i=@vjti.ac.in header.b=ci7UujcY; arc=none smtp.client-ip=74.125.224.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ee.vjti.ac.in
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ee.vjti.ac.in
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=vjti.ac.in header.i=@vjti.ac.in header.b="ci7UujcY"
Received: by mail-yx1-f45.google.com with SMTP id 956f58d0204a3-63f97c4eccaso2863993d50.2
        for <linux-kernel-mentees@lists.linux.dev>; Sat, 22 Nov 2025 18:43:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=vjti.ac.in; s=google; t=1763865781; x=1764470581; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Nhvna7XyABpz0y7IciVRtasd6k6MY2T7JOlNLRQKzHM=;
        b=ci7UujcYxnmJXX12/eUkYIIEZKxVTqh+ZTTiNLmSR5g204O4nFdiATkXi0k/7W3Pw2
         w+mTBcEKwF/1QCEp80uBmdNxHpVOGr4uHSFxA0j1HwZ1suiICjaeXkbxFlPrR7alAWlY
         omljStNra8H+DLljvidAZwaUvukHq2L/hP9ls=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763865781; x=1764470581;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Nhvna7XyABpz0y7IciVRtasd6k6MY2T7JOlNLRQKzHM=;
        b=w+1ETV61IYQtk7s8Ig+iN21pkpJRs0fFN8jASGM3maDXKWXWmxJJd48QWa0PbRmLsd
         BM/BL8y7reNxhccIdhKgoJJ5J05nzX8AQIscRBgRNfWNcLpIazq5F8K92CMM5tFEZMYX
         8J/LRs/knUDWFaSVd2/ckt3BSaKSIIrut7c5WMKHYc6G3YhKl4/VqDo64+2tp+0tzwBL
         /Emq00dojbxe66tGm8fQYsqn5hSqjNRY7oTNfTFllfwCIiRMvQt/hP7eHNI6A/WyIfru
         S+MXrUWA4WNd64DOSEDaEFtnG5pl8+7504ugFUlCbOcKRLKA7za72+ql5aHq1PJD2djG
         2wQw==
X-Forwarded-Encrypted: i=1; AJvYcCXmp1l5r2s0PDYrNppNpbfiCtPuFUoW+sFSjY8kohG3QFW+8IGK883LJegkhjv63ynh7IxNyjQohWq35OEWC/yrM7EVnw==@lists.linux.dev
X-Gm-Message-State: AOJu0YxdSYKVBGbVUHFZr0zmSDek3D7xkcVgCc7geA/xTLiFMpN4u/Qj
	bZnSsx6kl7LXFPuUnvRYIlNRV77To6fCZ00gADRsIg/t5dSBKLavVRDrhB9FiJFUMBvE/uFVFFx
	o+qINuVs6GUTBpneUt30SXzhd823AqhBAI6xngytuNA==
X-Gm-Gg: ASbGncviSGw0aHZAp7PpHfbNeRCHV/zisB1Lpo8DNT3+pU4UUxugw024njTksnqmk8p
	64tpVDXe39q/PwcPkdWkCKdIxHq4Vl54E/H7Zw8SW1FOYu2irCPiosDevk16VbZSXfTouvptGs1
	4ZLCWHRMowQ60nLVIow/9CClKCEcG6ychWZilQogrvRKaMkYEM5qaOvt3/DFSWBM/lvRVAAzXTn
	FtLqKT4HDtKt5yZl9ZmLMa2qn78RCA4x9FUhj/EPkJvv9RkaKSCOXF/HPUyeMWPAK+gy9xhm8nk
	OdkxP8X7GPrj52W5/XlAFa3xJ7gAdGw9+xBOdQ==
X-Google-Smtp-Source: AGHT+IFgrY980E9ZQyocO3aMJGUgJeNVFSms6jRM+b3NQsPdCBONY5tq34RGbAY8Nhr62GwkeQB9udkdlOIH8X4kvoo=
X-Received: by 2002:a05:690e:151a:b0:63e:1ee2:eb03 with SMTP id
 956f58d0204a3-64302af1600mr5089681d50.45.1763865780942; Sat, 22 Nov 2025
 18:43:00 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251108141834.46428-1-ssranevjti@gmail.com> <20251108141834.46428-2-ssranevjti@gmail.com>
In-Reply-To: <20251108141834.46428-2-ssranevjti@gmail.com>
From: SHAURYA RANE <ssrane_b23@ee.vjti.ac.in>
Date: Sun, 23 Nov 2025 08:12:49 +0530
X-Gm-Features: AWmQ_bnUQ9cqktRiIIylW1Y4-1ZWcYhGpz9uHU__v-2fKfpCX3dbdAfHmkK7RkM
Message-ID: <CANNWa05ecKo0MOQDUAusuDzNdyFH7gEpF-tS1-Z56Gpg_jWZ5A@mail.gmail.com>
Subject: Re: [PATCH v3] jfs: Initialize synclist in metapage allocation
To: shaggy@kernel.org
Cc: jfs-discussion@lists.sourceforge.net, linux-kernel@vger.kernel.org, 
	akpm@linux-foundation.org, dsterba@suse.com, david@redhat.com, 
	shivankg@amd.com, skhan@linuxfoundation.org, 
	linux-kernel-mentees@lists.linux.dev, david.hunter.linux@gmail.com, 
	khalid@kernel.org, syzbot+e87be72c9a6fe69996f5@syzkaller.appspotmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Pinging if missed

On Sat, Nov 8, 2025 at 7:48=E2=80=AFPM <ssrane_b23@ee.vjti.ac.in> wrote:
>
> From: Shaurya Rane <ssrane_b23@ee.vjti.ac.in>
>
> The synclist field in struct metapage was not being initialized during
> allocation in alloc_metapage(), leading to list corruption when the
> metapage is later added to a transaction's sync list.
>
> When diUpdatePMap() calls list_add(&mp->synclist, &tblk->synclist), if
> the synclist field contains stale data from a previous allocation (such
> as LIST_POISON values from a freed list node), the list debugging code
> detects the corruption and triggers a stack segment fault.
>
> This issue is intermittent because it only manifests when recycled
> memory happens to contain poison values in the synclist field. The bug
> was discovered by syzbot, which creates specific filesystem patterns
> that reliably trigger this uninitialized memory usage.
>
> Initialize the synclist field with INIT_LIST_HEAD() in alloc_metapage()
> to ensure it's in a valid state before being used in list operations.
> This is consistent with how the wait queue is initialized in the same
> function.
>
> Reported-by: syzbot+e87be72c9a6fe69996f5@syzkaller.appspotmail.com
> Closes: https://syzkaller.appspot.com/bug?extid=3De87be72c9a6fe69996f5
> Signed-off-by: Shaurya Rane <ssrane_b23@ee.vjti.ac.in>
>
> ---
> Tested:
>  - Tested locally with syzbot reproducer, no errors observed
> Changelog:
> - Correct bug link
> - Corrected patch format
>
>  fs/jfs/jfs_metapage.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/fs/jfs/jfs_metapage.c b/fs/jfs/jfs_metapage.c
> index 871cf4fb3636..77c512a0a42b 100644
> --- a/fs/jfs/jfs_metapage.c
> +++ b/fs/jfs/jfs_metapage.c
> @@ -269,6 +269,7 @@ static inline struct metapage *alloc_metapage(gfp_t g=
fp_mask)
>                 mp->data =3D NULL;
>                 mp->clsn =3D 0;
>                 mp->log =3D NULL;
> +               INIT_LIST_HEAD(&mp->synclist);
>                 init_waitqueue_head(&mp->wait);
>         }
>         return mp;
> --
> 2.34.1
>
