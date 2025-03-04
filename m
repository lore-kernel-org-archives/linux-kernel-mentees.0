Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF2D9259C89
	for <linux-kernel-mentees@lists.linux.dev>; Tue,  4 Mar 2025 16:41:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741106512; cv=none; b=k1OvNZVLReiZYhQSNUh6eeNarQRlpRo8srO69RfruMb2Ziaio3W3c/nkM4pH94IMokG+9lBlUl4bzBSRZO78pAMcvUqwzcs+dESBytWQc+1XybjxjWaBS+53NAXTNb0bN2dEULNXzCnGNMs12YP2EfiQdstCUzZYhrpXV6NXZCQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741106512; c=relaxed/simple;
	bh=9/K+O+0tYHJFaa78bprTS8Tia1OXI2uQnSBiCDWvCBg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HECEwZLfTrB5qZT+u/J/JcHGSLN/RQw+OQrnO0XSUPHb0b66gW1sm1tbx93D4cj3cY7de7WnhQBkJD9H2fhm5Q6yr1catykPD/ZyduqMDCHQn3bwoCbCxhUTdimtYDBL0zbY94a6MGmJ/52IsKWHE8QESSCPtOcZzsa/wqgvnbM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Q3MCrpc4; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Q3MCrpc4"
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-abf628d653eso463406066b.0
        for <linux-kernel-mentees@lists.linux.dev>; Tue, 04 Mar 2025 08:41:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741106509; x=1741711309; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qFK6HmFdK7YWt3cfrSsa7kGT8my5O3BzbX19rAAqvNE=;
        b=Q3MCrpc4HjhDdEtiN8dKV8AbOezp8ZXde5nhbHG6elz8VwOvxyEDuBWFaAjmcSiFiO
         8MJIyMEgTfaKNgevuxYfcQ8v55PblBpBy23gFMarm/hwP5AzQ6jnV+IFkglK1mf4JVaW
         YPx9S3uvrQUDNYPE3Df0RGBJN9eOlPXxVh4S9UMRki+T+IXu7L5nxSko7LKnhLVMghR8
         ROIJ4mG5oOlTnIOM4BD+9TINK4v1VNJVb3HbnIpdvX/x0tJryDEeb/ajaNV1HpcRnoVn
         5KruhmoVV9jJ2qj2SqwxUrDbl+smzM/GIRFgygXfLcL3rh8rmai+vC3u2GGgikOaapUz
         Klkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741106509; x=1741711309;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qFK6HmFdK7YWt3cfrSsa7kGT8my5O3BzbX19rAAqvNE=;
        b=ag3aERV31BsANWyKB5N/0VFGG7laS+4xmRW9N25FthWIyDw/FZa+cZOjQCM4a8fxjH
         zFf1J+iyFV34AJRp3r5IpqRMId7BkxSFF73N+zdughxxGoiWSBbacucRPdJRzf8lB338
         bJUVOin7hQyzptjgxSc1I+ll9u3cwHQombF9Wv2PlbjsnyASYo+CFL06cVoG6CEFNLqm
         rsZKfbje5Y6G5d/0qULrIhXLhQQBifEDgVw9v6TrR4CXF/wHPdVAd86XH2QMJP6mfrCs
         fLFEIgpS9cN4hST+nPzETbljzX7nGECrSgr0yUPDGtIY6EJ73+K1bU6hmc2MIBIg+RFJ
         PL7Q==
X-Forwarded-Encrypted: i=1; AJvYcCW227p9xFAEJ1pAoSk+nVr0V6vpEjAFtfAtmzsnQCDIOetl5FhCvgeb1KQ4BnPIczOs4Urx66I4QG3t79kGfQxwDyLukA==@lists.linux.dev
X-Gm-Message-State: AOJu0YyE4M7nmuM63zI835Xgun7r8Oihty7KM/nppiA+ChUrt0k606gY
	jMTShIwJG3jEwS2HAydU6fEM9ueQFap3N4l7M8HNweKqDmpWP4D47y9QQHKzCy3f5hHZw6wZL58
	XOo8NzuDxaPBTewrU3ie8siCum9c=
X-Gm-Gg: ASbGncvSBla1WJQWCRVAs9pd0pCz6COgFCHSQntIwqNcoFGG1iIWo53s1tn2gX/FRMU
	LfKffG6kJLT4EUbk4tdGFK/R2W9sgzGPL9PPoo+NaP4MB9oL5BtatMvrAB1WR+NJJ46Ywtg7Wuk
	h6/icbMixNiL9hNmZxoahb92cM4g==
X-Google-Smtp-Source: AGHT+IHv6t+cLD+V3ssA5LRroWRPT1uibEDUIe1gnBMn2tlNGU55Tvv6m7lj75UwF+cJ/k/Via1POhPddp7RAOerXRc=
X-Received: by 2002:a17:907:94c7:b0:abf:6166:d0dd with SMTP id
 a640c23a62f3a-abf6166d509mr1180483966b.11.1741106508351; Tue, 04 Mar 2025
 08:41:48 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250304080044.7623-1-ImanDevel@gmail.com> <CAOQ4uxiaY9cZFpj4m65SrAVXm7MqB2OFSfyH5D03hEwmdtiBVQ@mail.gmail.com>
 <5tq33ajgtu62tvaiymf3st74ctkurgskq6xpx2ax53vdbayoce@jffpxkthro3u>
In-Reply-To: <5tq33ajgtu62tvaiymf3st74ctkurgskq6xpx2ax53vdbayoce@jffpxkthro3u>
From: Amir Goldstein <amir73il@gmail.com>
Date: Tue, 4 Mar 2025 17:41:35 +0100
X-Gm-Features: AQ5f1JoWR-4RdHqjGH7KpFM8_ss2VdkgWqsEirCCn9BEf8-lDtoqBJQ_1J5D-5A
Message-ID: <CAOQ4uxiZfJYHrYmE2k0vWrgbLLbDQ2LTrVggYwL3pv4FUyjctQ@mail.gmail.com>
Subject: Re: [PATCH] inotify: disallow watches on unsupported filesystems
To: Seyediman Seyedarab <imandevel@gmail.com>
Cc: jack@suse.cz, linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-kernel-mentees@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 4, 2025 at 5:05=E2=80=AFPM Seyediman Seyedarab <imandevel@gmail=
.com> wrote:
>
> On 25/03/04 12:57PM, Amir Goldstein wrote:
> > On Tue, Mar 4, 2025 at 8:59=E2=80=AFAM Seyediman Seyedarab <imandevel@g=
mail.com> wrote:
> > >
> > > currently, inotify_add_watch() allows adding watches on filesystems
> > > where inotify does not work correctly, without returning an explicit
> > > error. This behavior is misleading and can cause confusion for users
> > > expecting inotify to work on a certain filesystem.
> >
> > That maybe so, but it's not that inotify does not work at all,
> > in fact it probably works most of the time for those fs,
> > so there may be users setting inotify watches on those fs,
> > so it is not right to regress those users.
> >
> > >
> > > This patch explicitly rejects inotify usage on filesystems where it
> > > is known to be unreliable, such as sysfs, procfs, overlayfs, 9p, fuse=
,
> > > and others.
> >
> > Where did you get this list of fs from?
> > Why do you claim that inotify does not work on overlayfs?
> > Specifically, there are two LTP tests inotify07 and inotify08
> > that test inotify over overlayfs.
> >
> > This makes me question other fs on your list.
>
> Thanks for the review! I may have overlooked overlayfs, but these
> following discussions led me to include it in the blacklist:
> https://bugs.launchpad.net/ubuntu/+source/linux/+bug/882147
> https://github.com/libuv/libuv/issues/1201
> https://github.com/moby/moby/issues/11705
>
> Apparently, things have changed in v4.10, so I may have been wrong
> about overlayfs. I can test each filesystem and provide a response
> instead of blindly relying on various bug reports. However, let's
> first discuss whether the patch is necessary in the first place.
>
> > >
> > > By returning -EOPNOTSUPP, the limitation is made explicit, preventing
> > > users from making incorrect assumptions about inotify behavior.
> > >
> > > Signed-off-by: Seyediman Seyedarab <ImanDevel@gmail.com>
> > > ---
> > >  fs/notify/inotify/inotify_user.c | 22 ++++++++++++++++++++++
> > >  1 file changed, 22 insertions(+)
> > >
> > > diff --git a/fs/notify/inotify/inotify_user.c b/fs/notify/inotify/ino=
tify_user.c
> > > index b372fb2c56bd..9b96438f4d46 100644
> > > --- a/fs/notify/inotify/inotify_user.c
> > > +++ b/fs/notify/inotify/inotify_user.c
> > > @@ -87,6 +87,13 @@ static const struct ctl_table inotify_table[] =3D =
{
> > >         },
> > >  };
> > >
> > > +static const unsigned long unwatchable_fs[] =3D {
> > > +       PROC_SUPER_MAGIC,      SYSFS_MAGIC,       TRACEFS_MAGIC,
> > > +       DEBUGFS_MAGIC,        CGROUP_SUPER_MAGIC, SECURITYFS_MAGIC,
> > > +       RAMFS_MAGIC,          DEVPTS_SUPER_MAGIC, BPF_FS_MAGIC,
> > > +       OVERLAYFS_SUPER_MAGIC, FUSE_SUPER_MAGIC,   NFS_SUPER_MAGIC
> > > +};
> > > +
> > >  static void __init inotify_sysctls_init(void)
> > >  {
> > >         register_sysctl("fs/inotify", inotify_table);
> > > @@ -690,6 +697,14 @@ static struct fsnotify_group *inotify_new_group(=
unsigned int max_events)
> > >  }
> > >
> > >
> > > +static inline bool is_unwatchable_fs(struct inode *inode)
> > > +{
> > > +       for (int i =3D 0; i < ARRAY_SIZE(unwatchable_fs); i++)
> > > +               if (inode->i_sb->s_magic =3D=3D unwatchable_fs[i])
> > > +                       return true;
> > > +       return false;
> > > +}
> >
> > This is not a good practice for black listing fs.
> >
> > See commit 0b3b094ac9a7b ("fanotify: Disallow permission events
> > for proc filesystem") for a better practice, but again, we cannot just
> > stop supporting inotify on fs where it was supported.
>
> Following the same approach as 0b3b094ac9a7b ("fanotify: Disallow
> permission events for the proc filesystem") would require setting
> a specific flag for each fs that isn't supported by inotify. If this
> is more suitable, I can work on implementing it.
>
> I understand why it might seem like disallowing users from monitoring
> these filesystems could break userspace in some way. BUT, programs
> work incorrectly precisely because they do not receive any information
> from the kernel, so in other words they are already broken. There is no
> way for them to know if the fs is supported or not. I mean, even we are
> not sure at the moment, then how would they know.
>

Programs not knowing is a problem that could be fixed with a new API
or new init flag to fanotify/inotify.

Existing programs that would break due to this change is unacceptable.

> As an example, 'Waybar' is a userspace program affected by this patch.
> Since it relies on monitoring sysfs, it isn't working properly anyway.
> This is also due to the issue mentioned earlier... inotify_add_watch()
> returns without an error, so the developers haven't realized that
> inotify isn't actually supported on sysfs. There are over five
> discussions regarding this issue that you can find them here:
> https://github.com/Alexays/Waybar/pull/3474
>

You need to distinguish "inotify does not work"
from "inotify does not notify on 'remote' changes"
that is changes that happen on the network fs server or inside the
kernel (in sysfs case) vs. changes that happen via vfs syscalls
on the mounted fs, be it p9, cifs, sysfs.

There are several discussions about supporting "remote change"
notifications for network filesystems - this is a more complex problem.

In any case, I believe performing operations on the mounted fs
generated inotify events for all the fs that you listed and without
a claim that nobody is using this facility we cannot regress this
behavior without an opt-in from the application.

Thanks,
Amir.
