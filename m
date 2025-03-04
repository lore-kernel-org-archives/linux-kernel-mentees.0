Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 012521F37C3
	for <linux-kernel-mentees@lists.linux.dev>; Tue,  4 Mar 2025 20:04:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741118658; cv=none; b=DnvBLw9tytwd2QBxzY3sClZMFGXorpB7phqve4F2sI56W/vg4JNIb/+NiD8k75Udt4rorK9AFuf8W5/Wg8mpKo02JSfsCraHIwZcQ6vypQwKRe/PmH0MvOgYGm1+xhIHXXDH5J+tgYURtjMRxNJZrYKV9DOSuAQJqjbUID4/3N4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741118658; c=relaxed/simple;
	bh=5tIe0IyXCFT1v9VsjkYN6XlZMXFWdn5tdAEB5l56lfI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nJ0ifxr0irbQ5siqOvKnWN5oclRuzYTwqxYyQDIsePbIGMTcAbfuC90QSCAA7HVxrtnxJRqhqNIKCDwuFHVllC8+IdbYoUmcKDin2wz8TGopfPbTdNUeb+yL0+04Fj3R9JhEw8aJd149UJV9rHABbjkHUW6NR1I9tOmvYrr4TOc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HkVqUD1T; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HkVqUD1T"
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-5e56b229d60so268879a12.0
        for <linux-kernel-mentees@lists.linux.dev>; Tue, 04 Mar 2025 12:04:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741118655; x=1741723455; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dxsG/d2n/TkC+Xf5bhwHHj/6aWgfnE8AgOcL4oHh3g4=;
        b=HkVqUD1TO5p5k0CQ6WsZ7A8O2B9DMgP7Bx1/gPlYX7cJbZfmR/2mBUlUStHww+fvUe
         4R5PnGol9BbsLwiQKGprEf3FqfCWHNfU/m8bXWZAbRrYTe+kGvgmr4rXIqih9W2N7zEO
         gPWfh3kVWQh1PF7C4YPkeROfCPXeQT1/aHBgDXKFcOQDuydk+EOTn8krhcLJQeWqeBzV
         akjzI/2l1Kc4+RzzZZEeg1uCp+cOFm8fWHRvk5o9ZUQB+rj55Bhu3ArkB7Ol+4lrkMK1
         Tvmo+lONx7o+6IDjFDZ3XB74gtxFxBHH6WxKQQEICoX0uFaiU9Cqyql4le389DKCiJ+P
         op4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741118655; x=1741723455;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dxsG/d2n/TkC+Xf5bhwHHj/6aWgfnE8AgOcL4oHh3g4=;
        b=s2l6vIXmw4NRfO9mxTTxy8e53J4GPvsmcSaDZk3dtLj4ZEqfScOTmvijbnEa+IjToI
         7KLFDS9G8L6RqTgjUOgbXp+1tAwFoV4TtfBD0yIhwk5LRAaw/l2cBoZ6Nu44qhN4qC0/
         cLhdA7nP+pTGsOWCtBRIxQf2NrRlySs3ft+cauag0zkS7+9wIKuNPbUApo0gDc4CCaBy
         hW08D3QtuXiVnJ4ke2XSX0IM83My900LQNuWSUYBdHMQofcUvou6FN/jwdHWU81VZxhk
         ejLWwMVJkqWCbpqe5GFP8cUgT+69gH0nG15O3XcTQvz5so1YJm4dpQrfL1ihZvVbpf34
         Xq0A==
X-Forwarded-Encrypted: i=1; AJvYcCUmgY4Yg5RKEJ7C16gVVTRVMzwycF+OIssehDNA0QSQThgpNWnWZgSvjPGsALs7oE8gyowxZkhkeVa1aeR+ABjtBK3hRQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YyuAeEzI3hsKEq81B/MRW08wsJpd0Za0qkhaeut0lZGe1VwBtwF
	zYffg06q9C51Ep7L1OeKm5VXIilDKObUuh1SLXGPR81vFVRxNDBbA9Mgt5U5ANJQe1ODjAOMesV
	kbZciw4weOIGCvTz9Zv8XjiX9Y+4=
X-Gm-Gg: ASbGncuunGse/F6z+auf8oDxlqcqcGc2Ys32qW9jPjTqoN7ik1Qpd3ylg+jR/1XE8NN
	Tuzrf4c1csO/+elefw1YvkJVFv2O/irsJNoV5DLkZHTjF0d5Yg/ihHSa73Z7GFuDX0UNpvI+r8Z
	HD1mxz0MDMZc/OBQliIc5VJQKu1w==
X-Google-Smtp-Source: AGHT+IHYMmPrgROSkTWDoFLum02/bGLwY+EEIYcEnAXiRkau60//2UzE7xMSSqxkkem3G5j00DMg6veI/dFxugXWaBY=
X-Received: by 2002:a17:906:7955:b0:abf:24f8:cc1e with SMTP id
 a640c23a62f3a-ac1f0e61fc1mr418237266b.2.1741118654663; Tue, 04 Mar 2025
 12:04:14 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250304080044.7623-1-ImanDevel@gmail.com> <CAOQ4uxiaY9cZFpj4m65SrAVXm7MqB2OFSfyH5D03hEwmdtiBVQ@mail.gmail.com>
 <5tq33ajgtu62tvaiymf3st74ctkurgskq6xpx2ax53vdbayoce@jffpxkthro3u>
 <CAOQ4uxiZfJYHrYmE2k0vWrgbLLbDQ2LTrVggYwL3pv4FUyjctQ@mail.gmail.com> <hg55e37tvfjnb76lvffuhnvozdwm4k6xuqq6nmvjgjaryjqmee@ppujm6t5y7ju>
In-Reply-To: <hg55e37tvfjnb76lvffuhnvozdwm4k6xuqq6nmvjgjaryjqmee@ppujm6t5y7ju>
From: Amir Goldstein <amir73il@gmail.com>
Date: Tue, 4 Mar 2025 21:04:03 +0100
X-Gm-Features: AQ5f1JqxXD23IIiCQolEcPLUx9BAAKF9sG_ptLmabj7Al6fKvVav1mmzaL21z7s
Message-ID: <CAOQ4uxha08PaYuEBWqtpQfwVqvW73LZFfKgS+XQ7YtD9ZzGZcA@mail.gmail.com>
Subject: Re: [PATCH] inotify: disallow watches on unsupported filesystems
To: Seyediman Seyedarab <imandevel@gmail.com>
Cc: jack@suse.cz, linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-kernel-mentees@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 4, 2025 at 8:06=E2=80=AFPM Seyediman Seyedarab <imandevel@gmail=
.com> wrote:
>
> On 25/03/04 05:41PM, Amir Goldstein wrote:
> > On Tue, Mar 4, 2025 at 5:05=E2=80=AFPM Seyediman Seyedarab <imandevel@g=
mail.com> wrote:
> > >
> > > On 25/03/04 12:57PM, Amir Goldstein wrote:
> > > > On Tue, Mar 4, 2025 at 8:59=E2=80=AFAM Seyediman Seyedarab <imandev=
el@gmail.com> wrote:
>
> > > I understand why it might seem like disallowing users from monitoring
> > > these filesystems could break userspace in some way. BUT, programs
> > > work incorrectly precisely because they do not receive any informatio=
n
> > > from the kernel, so in other words they are already broken. There is =
no
> > > way for them to know if the fs is supported or not. I mean, even we a=
re
> > > not sure at the moment, then how would they know.
> >
> > Programs not knowing is a problem that could be fixed with a new API
> > or new init flag to fanotify/inotify.
> >
> > Existing programs that would break due to this change is unacceptable.
> >
>
> Maybe something like IN_DISALLOW_REMOTE could work for now, at least
> until remote change notifications are properly implemented for those
> specific filesystems? Later, if needed, it could evolve into a new API,
> and the flag could become the default behavior when passed to that API.
>
> > > As an example, 'Waybar' is a userspace program affected by this patch=
.
> > > Since it relies on monitoring sysfs, it isn't working properly anyway=
.
> > > This is also due to the issue mentioned earlier... inotify_add_watch(=
)
> > > returns without an error, so the developers haven't realized that
> > > inotify isn't actually supported on sysfs. There are over five
> > > discussions regarding this issue that you can find them here:
> > > https://github.com/Alexays/Waybar/pull/3474
> > >
> >
> > You need to distinguish "inotify does not work"
> > from "inotify does not notify on 'remote' changes"
> > that is changes that happen on the network fs server or inside the
> > kernel (in sysfs case) vs. changes that happen via vfs syscalls
> > on the mounted fs, be it p9, cifs, sysfs.
> >
> > There are several discussions about supporting "remote change"
> > notifications for network filesystems - this is a more complex problem.
> >
> > In any case, I believe performing operations on the mounted fs
> > generated inotify events for all the fs that you listed and without
> > a claim that nobody is using this facility we cannot regress this
> > behavior without an opt-in from the application.
>
> Understood. So this is what I should work on (correct me if anything
> seems off):
> 1. Carefully list all filesystems where "remote" changes occur.
> 2. Introduce a flag like FS_DISALLOW_INOTIFY_REMOTE in fs_flags
>    for these filesystems.
> 3. Provide an option for userspace, such as IN_DISALLOW_REMOTE,
>    so applications can explicitly handle this behavior.
> 4. (Possibly later, if it makes sense) Introduce a new syscall where
>    FS_DISALLOW_INOTIFY_REMOTE is the default behavior.
>

Generally, this is a correct way to add new functionality,
but I would rather not extend the inotify API.
fanotify API is (mostly) a super set of inotify API, so any extension
of the API better be of fanotify.

If you try to use fanotify API with FAN_REPORT_FID and
FAN_MARK_FILESYSTEM, for example, by running the tool
fsnotifywait --filesystem, I think that you will find out that many of the =
fs
that you wanted to blacklist already return -EOPNOTSUPP, because they
do not support nfs export and some return -ENODEV (e.g. fuse)
because they do not have an fsid.
So essentially, you (almost) already have the new API that you wanted.

As a matter of fact, before commit a95aef69a740 ("fanotify: support
reporting non-decodeable file handles") in kernel v6.6, FAN_MARK_INODE
would also yield the same result (i.e. fsnotifywait without
--filesystem) and that
is more or less equivalent to inotifywait, because unlike fsnotifywait
--filesystem,
it does not require CAP_SYS_ADMIN.

Please see if fsnotifywait --filesystem is failing to watch the filesystems
that you are interested in blacklisting and list the filesystems that do no=
t
fail and you think should fail to watch.

If there are filesystems that do not fail (e.g. cifs) and you still want to
blacklist them, please argue your reasons.

If the behavior you get from fsnotifywait --filesystem is matching your
expectations and the only problem is that fsnotifywait without --filesystem
on recent kernel does not match your expectations, it would be easy
to add a fanotify_init flag like FAN_REPORT_DECODEABLE_FID,
which enforces the same strict requirements as --filesystem,
but does not require CAP_SYS_ADMIN.

But generally, the relation between the fs that you define as
"unreliable" to the fs that work with --filesystem is circumstantial.
A better way to identify fs that are remote fs is to check if they
implement the d_revalidate() operation.

It's easy to add an fanotify_init flag to disallow those remote fs,
but we really need to first better define what is the desired goal.
Exercise - try to write the man page of the proposed new flag
in a way that is clear to anyone who reads the description.
If you manage to do that, you are far more likely to argue your case.

Thanks,
Amir.
