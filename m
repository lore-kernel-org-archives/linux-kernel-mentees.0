Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF25A1FC7F8
	for <linux-kernel-mentees@lists.linux.dev>; Tue,  4 Mar 2025 11:57:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741089472; cv=none; b=Yc54taPOi6pfM7nkmML9xXRXdIt7F4NBUUGaU54WcSAhQmbg75f/jiqqCOPVWPrKUOs1ReQwkmCYPQPBi7CI+54YgDbdqw8E8hQiFFNCpzpwFEMhxWx+FP8ipZKt5prO0+cDjIHOiMfJe5g5m2qRhJVL5XvaOKx1ditenZFsV3E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741089472; c=relaxed/simple;
	bh=7ypZWnjPrV7w6TeeTckAB6eHJ6/xsg2qkTe/LybKhEs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NcTxkiiS3kUsuCCTOqAK2UZOLK2WyZ27apyPE2Za+XEjVZW2eWLNMnYStNEovkaGcuRANxaufqjeWyhsUioYFkihUFJltrPvjv/7nop44x7G7+3f7zJcmXpqDrIVZztunfDSZmuKDrjeB2AEe5JqcZp4ktSuR1apwReFk/PrRis=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NmTLblf2; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NmTLblf2"
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-abf45d8db04so514307266b.1
        for <linux-kernel-mentees@lists.linux.dev>; Tue, 04 Mar 2025 03:57:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741089469; x=1741694269; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oFfYVSo4B+UXub+GZI2qGn4jwqa9bMIxNlJj7fXOijE=;
        b=NmTLblf2gltWldmnR1TH0jxkE5TL4FuvTZ8WN61+q7ngbZyh101Y5H8JXfvehHXK3y
         Y+YODjM24HK6d5dSg06e53AhsnZ33QBuq7ApcSh7RakCwSZRBOELesOwkX65hpqYoTsw
         VhAQ0CLc6y+iF8U4nattGIPTnkC3iMh9A3daRn0dA0jCuKjoxackwhDorfXz7TwYO3Y3
         m+QAQX+RQr2d2PG6GL3rT5hFH52trYX/DEJTQVy4NmVl5Umq5BH/EPaphVFW1f1fthRa
         JKSnVdY5oKoZoxzX5OSbhJFFWQojhLQHrYPjGoPXFYPpY3gRm0yObeH16eyeY1psr8Ol
         t7IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741089469; x=1741694269;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oFfYVSo4B+UXub+GZI2qGn4jwqa9bMIxNlJj7fXOijE=;
        b=HXWzlJb/v44EeaPUExa/TkEAPUfujmFW3QpJ3wby17HqdAsdKoXVdPkd1MwdmuiheV
         +ZVOI/bfpKYrYA8GMNWG5lTafeJJaxHmpNLDjqwaLJ4k3GdLKbDd0jQQClLeHwVmdbi8
         GIYVpQ+0sFtm2PoYYPZO3EDnweNlGzF8FA1GMn5w8hWpGr7Jzz6ArZwZbqhpqUG5h1Rf
         o7/WmoC3yPkJY7PjV2Q6Z4PkG8N/c2dGG1cqSHKsUX8gZv2AcrdO6LsQByGLfLQFnAP5
         DdpxmxeB4+vfDgJrKWEkBWKKXVAMS/zqSJ3JXjACua6JWmKqFcEL+i+67z2+1EqRZBMW
         lWeA==
X-Forwarded-Encrypted: i=1; AJvYcCWrsgLzpz2kp7Gk4Yg5PEDljnfSCWXasH+5yGSGowe6voLPycV33YqnLcvXtYRKNb44bFgD2bWYqrzugFOXvA0Yu3dPiQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YyEsTUpzdKiPN/0hvbUIYAfduUjqQNVHuuSbTeu8KqUHcMiAphg
	+s6Ko9G++N09fy55hHnHBnA9U94HAhdtV+4nFdgrBqSVbZXkQADdSUjdT11DoAXLxHYgVbQDcZe
	AiXaCTX9z8td0R4vCeXTC/Lcj/wnBJUFWuE0=
X-Gm-Gg: ASbGncvrXuA8M32xwGWam8yD4kFXHvEq9sm1Fh1HEYpcExfO2PqZTe6JqEJPFkXN0L/
	l3C3Nn0r4+z83h53HFi15nPrkGgRl7VssxtttZkFNXLalO3h05UWpa532dvwmMpqSfo70C/WMug
	bhfHMVuFcq2VVG1hkiFxTT/fd4Ow==
X-Google-Smtp-Source: AGHT+IG/gH8xF2QSpMAqKv1eZxLbdC2fhOMhNMkCv6JUkbQ36wboE4Ypr1n30rVoJmN+b7m089jSauZwbUd5xsRhN3g=
X-Received: by 2002:a17:907:7fa6:b0:abf:615d:58c2 with SMTP id
 a640c23a62f3a-abf615d6016mr1192362066b.34.1741089468592; Tue, 04 Mar 2025
 03:57:48 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250304080044.7623-1-ImanDevel@gmail.com>
In-Reply-To: <20250304080044.7623-1-ImanDevel@gmail.com>
From: Amir Goldstein <amir73il@gmail.com>
Date: Tue, 4 Mar 2025 12:57:36 +0100
X-Gm-Features: AQ5f1JoU6Vvq5Hm7n116SaG8VrOOy_nKyTWmNXwcxfBElDzY3PzC1Sz2EnC7Mxc
Message-ID: <CAOQ4uxiaY9cZFpj4m65SrAVXm7MqB2OFSfyH5D03hEwmdtiBVQ@mail.gmail.com>
Subject: Re: [PATCH] inotify: disallow watches on unsupported filesystems
To: Seyediman Seyedarab <imandevel@gmail.com>
Cc: jack@suse.cz, linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-kernel-mentees@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 4, 2025 at 8:59=E2=80=AFAM Seyediman Seyedarab <imandevel@gmail=
.com> wrote:
>
> currently, inotify_add_watch() allows adding watches on filesystems
> where inotify does not work correctly, without returning an explicit
> error. This behavior is misleading and can cause confusion for users
> expecting inotify to work on a certain filesystem.

That maybe so, but it's not that inotify does not work at all,
in fact it probably works most of the time for those fs,
so there may be users setting inotify watches on those fs,
so it is not right to regress those users.

>
> This patch explicitly rejects inotify usage on filesystems where it
> is known to be unreliable, such as sysfs, procfs, overlayfs, 9p, fuse,
> and others.

Where did you get this list of fs from?
Why do you claim that inotify does not work on overlayfs?
Specifically, there are two LTP tests inotify07 and inotify08
that test inotify over overlayfs.

This makes me question other fs on your list.

>
> By returning -EOPNOTSUPP, the limitation is made explicit, preventing
> users from making incorrect assumptions about inotify behavior.
>
> Signed-off-by: Seyediman Seyedarab <ImanDevel@gmail.com>
> ---
>  fs/notify/inotify/inotify_user.c | 22 ++++++++++++++++++++++
>  1 file changed, 22 insertions(+)
>
> diff --git a/fs/notify/inotify/inotify_user.c b/fs/notify/inotify/inotify=
_user.c
> index b372fb2c56bd..9b96438f4d46 100644
> --- a/fs/notify/inotify/inotify_user.c
> +++ b/fs/notify/inotify/inotify_user.c
> @@ -87,6 +87,13 @@ static const struct ctl_table inotify_table[] =3D {
>         },
>  };
>
> +static const unsigned long unwatchable_fs[] =3D {
> +       PROC_SUPER_MAGIC,      SYSFS_MAGIC,       TRACEFS_MAGIC,
> +       DEBUGFS_MAGIC,        CGROUP_SUPER_MAGIC, SECURITYFS_MAGIC,
> +       RAMFS_MAGIC,          DEVPTS_SUPER_MAGIC, BPF_FS_MAGIC,
> +       OVERLAYFS_SUPER_MAGIC, FUSE_SUPER_MAGIC,   NFS_SUPER_MAGIC
> +};
> +
>  static void __init inotify_sysctls_init(void)
>  {
>         register_sysctl("fs/inotify", inotify_table);
> @@ -690,6 +697,14 @@ static struct fsnotify_group *inotify_new_group(unsi=
gned int max_events)
>  }
>
>
> +static inline bool is_unwatchable_fs(struct inode *inode)
> +{
> +       for (int i =3D 0; i < ARRAY_SIZE(unwatchable_fs); i++)
> +               if (inode->i_sb->s_magic =3D=3D unwatchable_fs[i])
> +                       return true;
> +       return false;
> +}

This is not a good practice for black listing fs.

See commit 0b3b094ac9a7b ("fanotify: Disallow permission events
for proc filesystem") for a better practice, but again, we cannot just
stop supporting inotify on fs where it was supported.

The assumption with the commit above was that setting permission
events on procfs is possible, but nobody (except for fuzzers) really does t=
hat
and if we have found out that there were actual users that do it, we
would have needed to revert that commit.

Thanks,
Amir.
