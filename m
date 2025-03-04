Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AEC8209F5A
	for <linux-kernel-mentees@lists.linux.dev>; Tue,  4 Mar 2025 16:05:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741104316; cv=none; b=QITgvo2yCQkpoZr91zJbK+rn9+MrAt6cQ9bfiUnR+PyiiNBXrRSn071OdIYRjJi0lCkYA+8IxTwXA6dnhqHRQWUfwLTlOGmi2qKTHuN5vEcbAIPqMS210W3GBJmFrVZ+YhkfZrVokJLOAu3rkBjbchs/nuCsXWWYs3ryH+Lv9Bk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741104316; c=relaxed/simple;
	bh=qmQU1T53T5GN1mtFIOy8ksUhihextoXGUdYB685VkTY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CSFHUTkcOaVNq2VRuW0bYxaT8qmVemzDnt+oBcA1wiga6OdKaqiTaPBbamib23f+jMO5zcTMUdK11YJzZnAN9VN6auMHsH6Jl2/zbhFcdoUi83boT80THTUERaV8IMYmJAH3WOUwzBBNBHEEk4h+Q08edkd7EA5zdNxvmhnZhNQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QS5dfVL3; arc=none smtp.client-ip=209.85.160.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QS5dfVL3"
Received: by mail-qt1-f182.google.com with SMTP id d75a77b69052e-472180fec01so57717241cf.0
        for <linux-kernel-mentees@lists.linux.dev>; Tue, 04 Mar 2025 08:05:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741104313; x=1741709113; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=zHCrioKP3hV6WLvKxknIWG69k/+ZiS+ZbIOOInmoRPo=;
        b=QS5dfVL3br0X5kkp6yfnS0kaZdPT9+wgnQwOa8nA4sNqdvXPgfdqT5rY0sRw1aRec/
         ewb9M5qDBCidgZzu36gRk+CJZ+JSsaLGuIanpZZ+utri4w0KCI331ZKx1H/A5/PNbFhs
         Ssfh/GlqQAMf80uJ+jXp9X4g8ghuzVtGujilUFwh6qD4ib0FH/cTc3P48fvMNAtH19IB
         DgVy4QIIYL7FPm6kvQZ4710ugilmw+cHgv/+lRmt3JHxf5abeq6YZ2v5tTkcM18VpiDt
         s+supvKH9pCa7KyZUOxo8+hysTIvlxk4k+JFfUueqzQkHXtaDTwTjYvewZ9zoI6nI/W4
         4zwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741104313; x=1741709113;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zHCrioKP3hV6WLvKxknIWG69k/+ZiS+ZbIOOInmoRPo=;
        b=VIBVLPq1uYKD+YiEXO9jeJiAbLfYdkXetU2F2AiSt2lHD6e5CJhGpmgkkHJDVofYg6
         L/+XJK5qNMn86Vh+CamFwWQ5/1gyZfG37zcZh/u+hmZCneWAdgls74HH0USZix4dan1c
         8QZOVrn2g9moYvkcaHizU6VnUZjOvchPjzRKi2HL7CaYLMdilOLyTZqr4j3qgZNFdY2u
         QtH8MHH3WFnFD8zrLbGQeBjuqkiR+h/Rm8TmUY6oNikJwCyOrtlZ4YmxmVOwAAKFC9U5
         gZr+PzqE0XtRfVUP4ew2iCr2o5U3JmDP5MFgIsg7UW0AsjCBoflzown5hKhVUaPELB53
         Ka8w==
X-Forwarded-Encrypted: i=1; AJvYcCWT//XFsg7P9PPTpGtisetSlMbk/VolS9+f50arSbd42KEUHGqnGDynCuXUdDycbrKB67dpKIiUwI53jnXyRuuzPmke0A==@lists.linux.dev
X-Gm-Message-State: AOJu0YzvkFGSlEf6+d0CFlrqHLrz4poTPcN+cJqxUpjbGi8bGcs4cJU5
	0NQhfPYG0tC5gYIlp1WkWD4E6MyTQ3ZfIntGtezdyeuCdXZjyHfX
X-Gm-Gg: ASbGncuxI2WQ7XdHejzVj6Z3UaSE4AO2lDLIz07YAxZeapVjeMsKjYPn95ujosPxXTF
	eMGbwa0cWgWUVBsSwTxCChOVb3ls6rOKcZtNRxHW7V7y6sc4wGqBtlo3s0X/pUCU3piNsYaA1Ln
	WtFUrIBFifKR38IWPSh5frIktQCTPv3B8dJ/feTbRVCD2+zvll6RvFOu+8YHCfMZYZfWtq+0pw4
	Rh9YJBv5PjFa5o8Dh0HaRjCtTC/KC4we/II1gwo0Bhj+TJl/GITlpot1GlFSM9gPWwasXHBCzg6
	WaG1wWY0kVDjafjmsTG0dGg9FUxd4I/1QJPraIPrPw==
X-Google-Smtp-Source: AGHT+IHlsy8d354nRDfX1iDbacGcnaO0gtBTcVsAexKDeKh/I2DJ7g4vsACHZxjcd5VKjgw8sRBPNg==
X-Received: by 2002:a05:622a:48:b0:474:efa8:3612 with SMTP id d75a77b69052e-474efa83796mr113699481cf.11.1741104312371;
        Tue, 04 Mar 2025 08:05:12 -0800 (PST)
Received: from localhost ([184.148.73.125])
        by smtp.gmail.com with UTF8SMTPSA id d75a77b69052e-475083eabcdsm2592811cf.13.2025.03.04.08.05.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Mar 2025 08:05:12 -0800 (PST)
Date: Tue, 4 Mar 2025 11:06:12 -0500
From: Seyediman Seyedarab <imandevel@gmail.com>
To: Amir Goldstein <amir73il@gmail.com>
Cc: jack@suse.cz, linux-fsdevel@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-kernel-mentees@lists.linux.dev
Subject: Re: [PATCH] inotify: disallow watches on unsupported filesystems
Message-ID: <5tq33ajgtu62tvaiymf3st74ctkurgskq6xpx2ax53vdbayoce@jffpxkthro3u>
References: <20250304080044.7623-1-ImanDevel@gmail.com>
 <CAOQ4uxiaY9cZFpj4m65SrAVXm7MqB2OFSfyH5D03hEwmdtiBVQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAOQ4uxiaY9cZFpj4m65SrAVXm7MqB2OFSfyH5D03hEwmdtiBVQ@mail.gmail.com>

On 25/03/04 12:57PM, Amir Goldstein wrote:
> On Tue, Mar 4, 2025 at 8:59 AM Seyediman Seyedarab <imandevel@gmail.com> wrote:
> >
> > currently, inotify_add_watch() allows adding watches on filesystems
> > where inotify does not work correctly, without returning an explicit
> > error. This behavior is misleading and can cause confusion for users
> > expecting inotify to work on a certain filesystem.
> 
> That maybe so, but it's not that inotify does not work at all,
> in fact it probably works most of the time for those fs,
> so there may be users setting inotify watches on those fs,
> so it is not right to regress those users.
> 
> >
> > This patch explicitly rejects inotify usage on filesystems where it
> > is known to be unreliable, such as sysfs, procfs, overlayfs, 9p, fuse,
> > and others.
> 
> Where did you get this list of fs from?
> Why do you claim that inotify does not work on overlayfs?
> Specifically, there are two LTP tests inotify07 and inotify08
> that test inotify over overlayfs.
> 
> This makes me question other fs on your list.

Thanks for the review! I may have overlooked overlayfs, but these
following discussions led me to include it in the blacklist:
https://bugs.launchpad.net/ubuntu/+source/linux/+bug/882147
https://github.com/libuv/libuv/issues/1201
https://github.com/moby/moby/issues/11705

Apparently, things have changed in v4.10, so I may have been wrong
about overlayfs. I can test each filesystem and provide a response
instead of blindly relying on various bug reports. However, let's
first discuss whether the patch is necessary in the first place.

> >
> > By returning -EOPNOTSUPP, the limitation is made explicit, preventing
> > users from making incorrect assumptions about inotify behavior.
> >
> > Signed-off-by: Seyediman Seyedarab <ImanDevel@gmail.com>
> > ---
> >  fs/notify/inotify/inotify_user.c | 22 ++++++++++++++++++++++
> >  1 file changed, 22 insertions(+)
> >
> > diff --git a/fs/notify/inotify/inotify_user.c b/fs/notify/inotify/inotify_user.c
> > index b372fb2c56bd..9b96438f4d46 100644
> > --- a/fs/notify/inotify/inotify_user.c
> > +++ b/fs/notify/inotify/inotify_user.c
> > @@ -87,6 +87,13 @@ static const struct ctl_table inotify_table[] = {
> >         },
> >  };
> >
> > +static const unsigned long unwatchable_fs[] = {
> > +       PROC_SUPER_MAGIC,      SYSFS_MAGIC,       TRACEFS_MAGIC,
> > +       DEBUGFS_MAGIC,        CGROUP_SUPER_MAGIC, SECURITYFS_MAGIC,
> > +       RAMFS_MAGIC,          DEVPTS_SUPER_MAGIC, BPF_FS_MAGIC,
> > +       OVERLAYFS_SUPER_MAGIC, FUSE_SUPER_MAGIC,   NFS_SUPER_MAGIC
> > +};
> > +
> >  static void __init inotify_sysctls_init(void)
> >  {
> >         register_sysctl("fs/inotify", inotify_table);
> > @@ -690,6 +697,14 @@ static struct fsnotify_group *inotify_new_group(unsigned int max_events)
> >  }
> >
> >
> > +static inline bool is_unwatchable_fs(struct inode *inode)
> > +{
> > +       for (int i = 0; i < ARRAY_SIZE(unwatchable_fs); i++)
> > +               if (inode->i_sb->s_magic == unwatchable_fs[i])
> > +                       return true;
> > +       return false;
> > +}
> 
> This is not a good practice for black listing fs.
> 
> See commit 0b3b094ac9a7b ("fanotify: Disallow permission events
> for proc filesystem") for a better practice, but again, we cannot just
> stop supporting inotify on fs where it was supported.

Following the same approach as 0b3b094ac9a7b ("fanotify: Disallow
permission events for the proc filesystem") would require setting
a specific flag for each fs that isn't supported by inotify. If this
is more suitable, I can work on implementing it.

I understand why it might seem like disallowing users from monitoring
these filesystems could break userspace in some way. BUT, programs
work incorrectly precisely because they do not receive any information
from the kernel, so in other words they are already broken. There is no
way for them to know if the fs is supported or not. I mean, even we are
not sure at the moment, then how would they know.

As an example, 'Waybar' is a userspace program affected by this patch.
Since it relies on monitoring sysfs, it isn't working properly anyway.
This is also due to the issue mentioned earlier... inotify_add_watch()
returns without an error, so the developers haven't realized that
inotify isn't actually supported on sysfs. There are over five
discussions regarding this issue that you can find them here:
https://github.com/Alexays/Waybar/pull/3474

That said, I understand if this isn't the approach you're looking for.

Kindest Regards,
Seyediman
