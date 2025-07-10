Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0CFE2D978A
	for <linux-kernel-mentees@lists.linux.dev>; Thu, 10 Jul 2025 10:26:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752143176; cv=none; b=JCpi0gMUIvR6BKTimXshs+ejJAbcearBdkn8puzMEFfVb5xU44FR9d6z0/6AXh1vsDPlQnB8KrjhrUD346Ae7182e+16IZ/cRN/uTaKxnFBapVYgNnyJBa+PRingka7uqLLDL92D3WFtVl6NxYxTQjYJb9a6Fu1YkHnwsVyq8Ew=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752143176; c=relaxed/simple;
	bh=dNJ2BlI7nka+u3xFOW98qNIIsNrxtNUmHoEVzVrCpqI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=eBRPNqnrT0HmsJvuqN549A3Ffn7XgggpE5REoEb+yLA9+15gllugt1iOXqql/KzdRWfwijifQh7SN0xB7xZ0yD750m6AuWwVrYVHiZTNdo6DMUQ/VpM/TUYx2PBeI3ErP7+Mjc0Tn4ts3jPXA9pkGKM38dLCO4x3mVvvnOdOU0Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hnOf2O0p; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hnOf2O0p"
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-553d52cb80dso814700e87.1
        for <linux-kernel-mentees@lists.linux.dev>; Thu, 10 Jul 2025 03:26:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752143173; x=1752747973; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XiwExPst7XweTj0HPRw/VeccnikzVdQnHxSZ/nSW2RY=;
        b=hnOf2O0peL2QRUapHeYjB78JzC5gRSR6eHvWJ9UBKDKG4VweJ46l6hxRHLB/imyuFc
         YOZ8Z/cfPimGe/tACr4elM2v0NgKZdOasG8fNVSlDmE9tjvbkKlQ0IwI15YMJC3YzT6N
         EE4d5ATZs3JguQWGpIrXinsytsxsRCclqvfpGK/DNobcp0ramShaBKzwjP5lD6kET96s
         8xexKKDxjiruqxNiGu9XbPTLO3n1WcNhKsUn6R3QRrWiIcu0Kczo4kvK2+rMqj/NVlU1
         9vpdAV+kM2j4OHb1G4h91hIHHuKuEwPku0ke+X2hiIadzeFFkZXxpvm6MXhyxmKR+yk9
         uJHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752143173; x=1752747973;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XiwExPst7XweTj0HPRw/VeccnikzVdQnHxSZ/nSW2RY=;
        b=nbh9Pn7CsjIOD32CFeZhFlx2g12IotDv5B6wohppmylacx5FtLxkuTDpuLK2+IxTVD
         l4cWDi1Pw9qQKTsGSV2r/yuoSwlAFCRScp+TwsYDvxy/6FX2jGKjMSwauka2ox4GfcCg
         ITx1xxYa8LrrvXM9Ety9PsR2ZOAg1HgN7KEhNjcWqAtADH6MQ6+y1IPmBhn97sl9kZ4f
         zeRAvr3LXhIoHdG/G04lvv/vlM+8tbUHlFhkcdo4NNYcpH2M1mQZ99POUuHROyONq+2p
         Mn524UQ/ThcQ5grAVQNti0v0vcUJcKUUQUirM8r60pSS5/PshiWIlUzDGNgMg9C+bqp8
         FNIw==
X-Forwarded-Encrypted: i=1; AJvYcCVJGax+uvi6tDQ7hEO9crVRGgg3BTuu9tAeFexUHcc+klWpe6YTaCKnAiFg0DiIbp/QKn9e7bk7M0aXiHU6kjpibFHaUw==@lists.linux.dev
X-Gm-Message-State: AOJu0Yw6cIM101FdcuIP7rutuYftHkP1xYPIJCKJpohgzS6OsimwnyhA
	PqdctZIf9i06vwvaRxOjHy5OH8jkK2Go9zr4PfOaRLSvYvT1ifSLLG+8e7zsON6sB3yQ7kUvX21
	9xzc3L9o6pScVfa8+hJkh3PfFiFXSaHE=
X-Gm-Gg: ASbGncvxRuSBqXEazSlbNJn+XPB+LOCb8BJ0pkKMDQ9fN+dxpJHvt7elFVb003GDT53
	XqPqpxyHsMzbMQxjysReYh7dBhQZZPpv7S7M7YuZ8IDLiodosZ9ZfrTYFjVQZJSOCOLPyfbOGI4
	ngVedymPEZCQIO47EWNn9b9MKwAqK/hMwEFa9Rz1Y1K0iifuX/g2TWsu8r6PhQ5Xdve2lRG5uwR
	/38
X-Google-Smtp-Source: AGHT+IFidGHXl+2EEjCVlww/f/kyG374Q2YBQpzErMafktQNvPBNiIiW7AM3Qo4KbMeXfzQQanbGQft8qHovXPtWt6A=
X-Received: by 2002:a05:6512:4023:b0:553:ac0c:dce9 with SMTP id
 2adb3069b0e04-559007168eamr1015205e87.17.1752143172501; Thu, 10 Jul 2025
 03:26:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250704101250.24629-1-pranav.tyagi03@gmail.com>
In-Reply-To: <20250704101250.24629-1-pranav.tyagi03@gmail.com>
From: Pranav Tyagi <pranav.tyagi03@gmail.com>
Date: Thu, 10 Jul 2025 15:56:01 +0530
X-Gm-Features: Ac12FXwsF8ofN1uPqgzPPxs2ghXYYUrrumicdJlsv8eXTaje2HanDawqxzc7snM
Message-ID: <CAH4c4jLCyb3kF0G25GU2JpPVkOXrgMTtMF+NTWgJpXBoEUaA5w@mail.gmail.com>
Subject: Re: [PATCH v2] fs/xfs: replace strncpy with memtostr_pad()
To: linux-xfs@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: cem@kernel.org, djwong@kernel.org, skhan@linuxfoundation.org, 
	linux-kernel-mentees@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 4, 2025 at 3:42=E2=80=AFPM Pranav Tyagi <pranav.tyagi03@gmail.c=
om> wrote:
>
> Replace the deprecated strncpy() with memtostr_pad(). This also avoids
> the need for separate zeroing using memset(). Mark sb_fname buffer with
> __nonstring as its size is XFSLABEL_MAX and so no terminating NULL for
> sb_fname.
>
> Signed-off-by: Pranav Tyagi <pranav.tyagi03@gmail.com>
> ---
>  fs/xfs/libxfs/xfs_format.h | 2 +-
>  fs/xfs/xfs_ioctl.c         | 3 +--
>  2 files changed, 2 insertions(+), 3 deletions(-)
>
> diff --git a/fs/xfs/libxfs/xfs_format.h b/fs/xfs/libxfs/xfs_format.h
> index 9566a7623365..779dac59b1f3 100644
> --- a/fs/xfs/libxfs/xfs_format.h
> +++ b/fs/xfs/libxfs/xfs_format.h
> @@ -112,7 +112,7 @@ typedef struct xfs_sb {
>         uint16_t        sb_sectsize;    /* volume sector size, bytes */
>         uint16_t        sb_inodesize;   /* inode size, bytes */
>         uint16_t        sb_inopblock;   /* inodes per block */
> -       char            sb_fname[XFSLABEL_MAX]; /* file system name */
> +       char            sb_fname[XFSLABEL_MAX] __nonstring; /* file syste=
m name */
>         uint8_t         sb_blocklog;    /* log2 of sb_blocksize */
>         uint8_t         sb_sectlog;     /* log2 of sb_sectsize */
>         uint8_t         sb_inodelog;    /* log2 of sb_inodesize */
> diff --git a/fs/xfs/xfs_ioctl.c b/fs/xfs/xfs_ioctl.c
> index d250f7f74e3b..c3e8c5c1084f 100644
> --- a/fs/xfs/xfs_ioctl.c
> +++ b/fs/xfs/xfs_ioctl.c
> @@ -990,9 +990,8 @@ xfs_ioc_getlabel(
>         BUILD_BUG_ON(sizeof(sbp->sb_fname) > FSLABEL_MAX);
>
>         /* 1 larger than sb_fname, so this ensures a trailing NUL char */
> -       memset(label, 0, sizeof(label));
>         spin_lock(&mp->m_sb_lock);
> -       strncpy(label, sbp->sb_fname, XFSLABEL_MAX);
> +       memtostr_pad(label, sbp->sb_fname);
>         spin_unlock(&mp->m_sb_lock);
>
>         if (copy_to_user(user_label, label, sizeof(label)))
> --
> 2.49.0
>
Hi,

This is a gentle follow-up on this patch. I would like to
know if there is any update on its state.

Regards
Pranav Tyagi
